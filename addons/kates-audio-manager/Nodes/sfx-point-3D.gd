@icon("uid://b0wjgxpdvgd67")
extends Node3D
class_name SoundEffectPoint3D

@export var sfx : SfxResource

@export var play_on_start : bool = true
@export var stop_on_play : bool = true
@export var destroy_on_finish : bool = false

var _sound_handle : SoundEffect3D

func _ready() -> void:
	if play_on_start:
		play()

func _process(delta: float) -> void:
	if _sound_handle != null:
		_sound_handle._set_world_position(global_position)

func _on_finished() -> void:
	if destroy_on_finish:
		queue_free()

func play() -> void:
	if sfx == null:
		printerr("No sound provided!")
		return
	
	if stop_on_play and _sound_handle != null:
		stop()
	
	_sound_handle = AudioManager._play_sound_3D(sfx, global_position)
	_sound_handle.audioPlayer.finished.connect(_on_finished)

func stop() -> void:
	_sound_handle._stop_sound()
