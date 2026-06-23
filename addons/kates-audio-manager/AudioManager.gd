extends Node

@export var audio_bus_holder : Node 

func _ready():
	_setup_buses()

func _setup_buses() -> void:
	for bus in audio_bus_holder.get_children():
		if bus as AudioBus == null:
			printerr("Invalid child in bus holder")
			continue
		bus._register_bus()

func _play_sound(sound : SfxResource) -> SoundEffect:
	var bus = get_bus(sound.defaultBus)
	
	if bus == null:
		printerr("INVALID BUS ON " + sound.resource_path)
		return
	
	return bus._play_sound(sound)

func _play_sound_2D(sound : SfxResource, position : Vector2) -> SoundEffect2D:
	var bus = get_bus(sound.defaultBus)
	
	if bus == null:
		printerr("INVALID BUS ON " + sound.resource_path)
		return
	
	return bus._play_sound_2D(sound, position)

func _play_sound_3D(sound : SfxResource, position : Vector3) -> SoundEffect3D:
	var bus = get_bus(sound.defaultBus)
	
	if bus == null:
		printerr("INVALID BUS ON " + sound.resource_path)
		return
	
	return bus._play_sound_3D(sound, position)

func stop_all_on_bus(bus_name: String):
	var bus = get_bus(bus_name)
	if bus == null:
		return
	bus._stop_all()

func set_bus_volume(bus_name: String, value: float):
	var bus_index = AudioServer.get_bus_index(bus_name)
	if bus_index != -1:
		# Assuming slider is 0.0 to 1.0 (or adjust the /10.0 logic to fit your needs)
		var db_value = linear_to_db(value)
		AudioServer.set_bus_volume_db(bus_index, db_value)

func get_bus(bus_name : String) -> AudioBus:
	return audio_bus_holder.find_child(bus_name, false)
