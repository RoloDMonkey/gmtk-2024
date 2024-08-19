extends Node2D


signal exit_level


func _on_area_2d_body_entered(body):
		exit_level.emit()
