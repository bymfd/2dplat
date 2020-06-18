extends Actor
export var stomp_impulse := 1000.0
func _on_enemydetector_area_entered(area: Area2D)-> void:
	print_debug(area.name)
	_velocity = calculate_stomp_velocity(_velocity,stomp_impulse)


func _on_enemydetector_body_entered(body: PhysicsBody2D)-> void:
	queue_free()
	#print_debug(body.name)
	if body.name=="portal":
		global.nedir=true
		get_tree().change_scene("res://src/levels/gircikdemo.tscn")
	else:
		global.nedir=false
		get_tree().change_scene("res://src/levels/gircikdemo.tscn")

func _physics_process(delta: float) -> void :
	flip_h_control()
	var is_jump_interrupt := Input.is_action_just_released("jump") and _velocity.y <0.0
	var direction : = get_direction()
	_velocity = calculate_move_velocity(_velocity,speed,direction ,  is_jump_interrupt)
	_velocity= move_and_slide(_velocity,FLOOR_NORMAL)
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)
func calculate_move_velocity(
	linear_velocity : Vector2,
	speed:Vector2,
	direction:Vector2 ,
	is_jump_interrupt: bool) -> Vector2:
	var out := linear_velocity
	out.x = speed.x * direction.x 
	
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
	
		out.y= speed.y * direction.y
		
	if is_jump_interrupt:
		out.y= 0.0
	return out

func calculate_stomp_velocity(linear_velocity: Vector2,impulse:float)-> Vector2:
		var out := linear_velocity
		out.y =- impulse
		return out
func flip_h_control():
	if Input.is_action_just_pressed("jump"):
		
		get_node("player/botfire").emitting=true
	else: 
		get_node("player/botfire").emitting=false
		
	if Input.is_action_just_pressed("move_right"):
		get_node( "player" ).set_flip_h( false )
	elif Input.is_action_just_pressed("move_left"):
		get_node( "player" ).set_flip_h( true )
