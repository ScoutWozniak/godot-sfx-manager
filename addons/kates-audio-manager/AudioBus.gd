extends Node
class_name AudioBus

var activeEffects : Array[SoundEffect]

func _register_bus() -> void:
	var bus_name = name
	
	if AudioServer.get_bus_index(bus_name) == -1:
		var bus_count = AudioServer.bus_count
		AudioServer.add_bus(bus_count)
		AudioServer.set_bus_name(bus_count, bus_name)
		
		print("Registered audio bus " + bus_name +"! ^_^")

func _play_sound(sound : SfxResource) -> SoundEffect:
	var sfx = SoundEffect.new()
	_register_sfx(sfx, sound)
	
	sfx._play_sound()
	return sfx

func _play_sound_2D(sound : SfxResource, position : Vector2) -> SoundEffect2D:
	var sfx = SoundEffect2D.new()
	_register_sfx(sfx, sound)
	(sfx as SoundEffect2D)._set_world_position(position)
	
	sfx._play_sound()
	return sfx

func _play_sound_3D(sound : SfxResource, position : Vector3) -> SoundEffect3D:
	var sfx = SoundEffect3D.new()
	_register_sfx(sfx, sound)
	(sfx as SoundEffect3D)._set_world_position(position)
	
	sfx._play_sound()
	return sfx

func _register_sfx(soundEffect : SoundEffect, sound : SfxResource) -> void:
	soundEffect._register_sound(sound, self)
	activeEffects.append(soundEffect)

func _stop_all() -> void:
	var temp := activeEffects
	for sound in temp:
		sound._destroy()
		_remove_sound(sound)

func _process(delta: float) -> void:
	_check_queued_destruction()

func _check_queued_destruction() -> void:
	var temp := activeEffects
	for sound in temp:
		if sound.awaitingDestruction:
			_remove_sound(sound)

func _remove_sound(sound : SoundEffect) -> void:
	activeEffects.remove_at(activeEffects.find(sound))
	sound.free()
	
