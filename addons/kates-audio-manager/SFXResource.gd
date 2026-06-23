extends Resource
class_name SfxResource

@export var audioClip : AudioStream
@export var defaultBus : String = "SFX"

@export var looping : bool = false

@export var randomisePitch : bool
@export var randomiseBounds : Vector2 = Vector2(0.9,1)
