extends Object
class_name SoundEffect
# Base class for sound effects
# Can inherit functionality allowing for easy positional sfx too

var audioPlayer : Node

var awaitingDestruction : bool = false

var looping : bool = false

func _register_sound(sound : SfxResource, bus : AudioBus) -> void:
	audioPlayer = _create_player()
	bus.add_child(audioPlayer)
	
	audioPlayer.bus = bus.name
	audioPlayer.stream = sound.audioClip
	audioPlayer.name = sound.audioClip.resource_path.get_basename()
	
	if sound.randomisePitch:
		audioPlayer.pitch_scale = randf_range(sound.randomiseBounds.x, sound.randomiseBounds.y)
	
	looping = sound.looping
	
	audioPlayer.finished.connect(_on_complete)


func _create_player() -> Node:
	return AudioStreamPlayer.new()

func _play_sound() -> void:
	audioPlayer.play(0)

func _on_complete() -> void:
	if !looping:
		_destroy()

func _destroy() -> void:
	audioPlayer.queue_free()
	awaitingDestruction = true

func _stop_sound() -> void:
	if audioPlayer == null:
		printerr("Attempting to stop non-existent sound on " + audioPlayer.name)
		return
	audioPlayer.stop()
	_destroy()
