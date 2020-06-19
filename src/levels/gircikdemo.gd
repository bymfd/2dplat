extends Control
var data={"level":"0"}
var path="user://user.save"


func _ready():
	if global.nedir:
		get_node("Button2").visible=true
	else:
		get_node("Button2").visible=false
		
	if global.music:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)

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
	data["level"]=levelkac
	var f = File.new()
	f.open(path, File.WRITE)
	f.store_var(data)
	f.close()
	oku()	

	
func _on_Button_pressed():
	get_tree().change_scene("res://src/levels/level"+global.level+".tscn")


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
		global.music=!global.music
		
	


func _on_Button3_pressed():
	get_node("WindowDialog").visible=true
	
