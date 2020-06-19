extends Node2D

func ses():
	if global.music:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		print_debug(global.music)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		print_debug(global.music)

func _on_touchpause_pressed():
		get_tree().paused = true
		get_node("CanvasLayer2/pause_ui").visible=true


func _on_resumebut_pressed():
	get_tree().paused = false
	get_node("CanvasLayer2/pause_ui").visible=false


func _on_musicbutton_pressed():
	print_debug("asdasdasdad")
	ses()
	global.music=!global.music
