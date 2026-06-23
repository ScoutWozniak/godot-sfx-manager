@tool
extends EditorPlugin

var Plugin = preload("res://addons/kates-audio-manager/EditorHelper/AudioConverterContextMenu.gd")
var plugin : EditorContextMenuPlugin

func _enter_tree() -> void:
	plugin = Plugin.new()
	add_context_menu_plugin(EditorContextMenuPlugin.CONTEXT_SLOT_FILESYSTEM, plugin)

func _exit_tree() -> void:
	remove_context_menu_plugin(plugin)
