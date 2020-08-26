extends Control
var data={"level":"0","can":0}
var path="user://user.save"
onready var Admoba = get_node("AdMob")

func _ready():
	get_node("Button2").visible=global.nedir
	Admoba.load_rewarded_video()



func oku():
	var f = File.new()
	if f.file_exists(path):
		f.open(path, File.READ)
		data = f.get_var()
		f.close()
		return data
	else:
		yaz("0")

func yaz(levelkac):
	data["can"]=global.can
	data["level"]=levelkac
	var f = File.new()
	f.open(path, File.WRITE)
	f.store_var(data)
	f.close()
	oku()

func _on_Button_pressed():
	get_tree().change_scene("res://src/levels/level"+global.level+".tscn")
	get_node("RichTextLabel").text=global.level




func _on_Button2_pressed():

	var f = File.new()
	var next_level="res://src/levels/level"+str(int(global.level)+1)+".tscn"
	if (f.file_exists(next_level)):
		yaz(str(int(global.level)+1))
		global.level=str(int(global.level)+1)
		get_tree().change_scene(next_level)	
	else:
		get_tree().change_scene("res://src/levels/final.tscn")


func _on_CheckButton_toggled(button_pressed):
	global.music()



func _on_Button3_pressed():
	get_node("WindowDialog").visible=true
	Admoba.show_rewarded_video()



func _on_resetlevel_pressed():
	global.level="0"
	yaz("0")


