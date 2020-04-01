extends Node2D


func _on_touchpause_pressed():
		get_tree().paused = true
		get_node("CanvasLayer2/pause_ui").visible=true


func _on_resumebut_pressed():
	get_tree().paused = false
	get_node("CanvasLayer2/pause_ui").visible=false
