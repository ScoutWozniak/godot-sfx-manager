@tool
extends EditorContextMenuPlugin
var icon := preload("res://addons/kates-audio-manager/Icons/KateSoundEffectPlayer3D.svg")

func _popup_menu(paths: PackedStringArray) -> void:
	for path in paths:
		var type := EditorInterface.get_resource_filesystem().get_file_type(path)
		if !ClassDB.is_parent_class(type, "AudioStream"):
			# Don't display context if we aren't a type of audio stream
			return
	
	add_context_menu_item("Convert audio", handle_conversion, icon)

func handle_conversion(paths : PackedStringArray) -> void:
	var path = paths[0]
	var folder = path.get_base_dir()
	var name = path.get_basename()
	
	if ResourceLoader.exists(name + ".tres"):
		print(name + ".tres already exists, skipping")
		return
	
	var newResource : SfxResource = SfxResource.new()
	newResource.resource_path = name + ".tres"
	newResource.audioClip = load(path)
	ResourceSaver.save(newResource)
