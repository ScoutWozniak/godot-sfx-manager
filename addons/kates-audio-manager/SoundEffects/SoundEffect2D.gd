extends SoundEffect
class_name SoundEffect2D

func _create_player() -> Node:
	return AudioStreamPlayer2D.new()

func _set_world_position(position : Vector2):
	var audioPlayer2D = audioPlayer as AudioStreamPlayer2D
	audioPlayer2D.global_position = position
