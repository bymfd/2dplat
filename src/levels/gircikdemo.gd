extends Control
var data={"level":"0"}
var path="user://user.save"


func _ready():
	if global.nedir:
		get_node("Button2").visible=true
	else:
		get_node("Button2").visible=false

func oku():
	var f = File.new()
	if f.file_exists(path):
		f.open(path, File.READ)
		data = f.get_var()
		f.close()
		return data
	else:
		yaz(0)

func yaz(levelkac):
	data["level"]=levelkac
	var f = File.new()
	f.open(path, File.WRITE)
	f.store_var(data)
	f.close()
	oku()	

	
func _on_Button_pressed():
	get_tree().change_scene("res://src/levels/level"+data["level"]+".tscn")


func _on_Button2_pressed():
	if global.nedir:
		var f = File.new()
		var next_level="res://src/levels/level"+str(int(data["level"])+1)+".tscn"
		print_debug(next_level)
		if f.file_exists(next_level):
			yaz(str(int(data["level"])+1))
			get_tree().change_scene(next_level)	
		else:
			get_tree().change_scene("res://src/levels/final.tscn")
