extends Node2D

@onready var win = $Win

func _ready():
	win.hide()

func _on_exit_exit_level():
	win.show()
	get_tree().paused = true
