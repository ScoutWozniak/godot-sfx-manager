extends SoundEffect
class_name SoundEffect3D

func _create_player() -> Node:
	return AudioStreamPlayer3D.new()

func _set_world_position(position : Vector3):
	if audioPlayer == null:
		return
	
	var audioPlayer3D = audioPlayer as AudioStreamPlayer3D
	
	if audioPlayer3D == null:
		return
	
	audioPlayer3D.global_position = position
