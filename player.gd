extends CharacterBody2D
var movespeed=500

func _ready() -> void:
	pass
	
func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("left"):
		motion.x-=1
	if Input.is_action_pressed("right"):
		motion.x+=1
	if Input.is_action_pressed("up"):
		motion.y-=1
	if Input.is_action_pressed("down"):
		motion.y+=1
		
	motion=motion.normalized()
	velocity=motion*movespeed
	move_and_slide()
	look_at(get_global_mouse_position())
