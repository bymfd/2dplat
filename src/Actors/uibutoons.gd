extends Node2D
onready var Admoba=get_node("AdMob")

func _ready():
	Admoba.load_rewarded_video()
	kontrol()


func _on_touchpause_pressed():
		get_tree().paused = true
		get_node("CanvasLayer2/pause_ui").visible=true


func _on_resumebut_pressed():
	get_tree().paused = false
	get_node("CanvasLayer2/pause_ui").visible=false


func _on_musicbutton_pressed():
	global.music()

func kontrol():
	get_node("CanvasLayer2/upui/cantxt").text=str(global.can)

func _on_Timer_timeout():
	kontrol()


func _on_AdMob_rewarded_video_loaded():
	get_node("CanvasLayer2/upui/Button").visible=true


func _on_Button_pressed():
	Admoba.show_rewarded_video()


func _on_AdMob_rewarded_video_left_application():
	get_tree().paused = false
	get_node("CanvasLayer2/upui/Button").visible=false
	


func _on_AdMob_rewarded(currency, ammount):
	global.candegis(true)
	get_tree().paused = false
	get_node("CanvasLayer2/upui/Button").visible=false


func _on_AdMob_rewarded_video_opened():
	get_tree().paused = true
	get_node("CanvasLayer2/upui/Button").visible=false


func _on_AdMob_rewarded_video_closed():
	get_tree().paused = false
