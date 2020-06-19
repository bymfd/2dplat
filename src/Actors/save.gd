extends Node
var nedir=false
var level=""
var music =false
var data={"level":"0"}
var path="user://user.save"
func _init():
	var f = File.new()
	if f.file_exists(path):
		f.open(path, File.READ)
		data = f.get_var()
		f.close()
		level=data["level"]
		return data
	else:
		yaz("0")



func yaz(levelkac):
	data["level"]=levelkac
	var f = File.new()
	f.open(path, File.WRITE)
	f.store_var(data)
	level=data["level"]
	f.close()
	
