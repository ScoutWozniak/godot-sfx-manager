# Godot SFX Manager
## Simple SFX library for Godot 4.x

An addon to help with SFX + Music playing for Godot.  Automatically handles setting up buses programmatically, as well as defining effects for SFX through resources.  SfxResources hold references to the sound file to play, as well as information such as looping, randomized pitch and the audio bus to play through (note that these can be overwritten when you choose to play the sound.  Through the AudioManager class these resources can be played at a defined position using a single function, skipping the boilerplate of setting up nodes.

### TO-DO
- Add ability to extend SFX resources to change behavior of sounds on play
- Add effects to the sound resource / helper functions to apply buses
