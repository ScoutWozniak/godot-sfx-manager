@tool
extends EditorPlugin
class_name KatesAudioManager

const PLUGIN_NAME = "kates-audio-manager"

const AUTOLOAD_NAME = "AudioManager"


func _enable_plugin():
	# The autoload can be a scene or script file.
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/kates-audio-manager/AudioManager.tscn")
	EditorInterface.set_plugin_enabled(PLUGIN_NAME + "/EditorHelper", true)

func _disable_plugin():
	remove_autoload_singleton(AUTOLOAD_NAME)
	EditorInterface.set_plugin_enabled(PLUGIN_NAME + "/EditorHelper", false)
