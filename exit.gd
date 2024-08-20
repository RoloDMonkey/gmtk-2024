extends Node2D


signal exit_level

@onready var sound_exit = $SoundExit

func _on_area_2d_body_entered(_body):
	sound_exit.play()
	exit_level.emit()
