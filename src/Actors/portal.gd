extends KinematicBody2D

class_name Portal

func _on_gircik_detector_body_entered(body:PhysicsBody2D) -> void:
	pass
	if body.global_position.y or body.global_position.x >= get_node("gircik_detector").global_position.y:
		return 
	get_node("CollisionShape2D").disabled = true


