extends Node2D

var soundEffect: AudioStreamSample

func _ready():
	# Preload the sound effect
	soundEffect = preload("res://click.wav")

	# Other initialization code...

func play():
	# Create an AudioStreamPlayer node
	var audioPlayer = AudioStreamPlayer.new()

	# Assign the preloaded sound effect to the player
	audioPlayer.stream = soundEffect

	# Add the player to the scene tree
	add_child(audioPlayer)

	# Play the sound effect
	audioPlayer.play()
