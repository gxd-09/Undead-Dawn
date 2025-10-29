extends Node2D

func _process(_delta):
	if $MainAudio.playing == false:
		$MainAudio.play()
