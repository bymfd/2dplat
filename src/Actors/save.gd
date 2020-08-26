extends Node
var nedir=false
var level=""
var musicval =false
var data={"level":"0","canlar":1}
var can=1
var path="user://user.save"
func _init():
	var f = File.new()
	if f.file_exists(path):
		f.open(path, File.READ)
		data = f.get_var()
		f.close()
		level=data["level"]
		can=data["canlar"]
		return data
	else:
		yaz("0")

func music():
	musicval= !musicval
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), musicval)
func portal(ne):
	 nedir=ne
func candegis(durum):
	if durum==true:
		can+=1
	else:
		if can<=0:
			can=0
		else:
			can-=1
func yaz(levelkac):
	data["level"]=levelkac
	data["can"]=can
	var f = File.new()
	f.open(path, File.WRITE)
	f.store_var(data)
	level=data["level"]
	can=data["can"]
	f.close()
	
