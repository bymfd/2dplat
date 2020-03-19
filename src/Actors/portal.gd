extends KinematicBody2D
class_name Portal




func _on_gircik_detector_body_entered(body:PhysicsBody2D) -> void:
	if body.global_position.y <= get_node("gircik_detector").global_position.y:
		return 
	#get_node("CollisionShape2D").disabled = true
	get_tree().change_scene("res://src/levels/gircikdemo.tscn")
