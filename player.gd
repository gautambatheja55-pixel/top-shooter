extends CharacterBody2D
var movespeed=500
var bulletspeed=2000
var has_key: bool = false 
var has_boron_rod:bool = false
var bullet = preload("res://bullet.tscn")

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
	if Input.is_action_just_pressed("LMB"):
		fire()
		
func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position=get_global_position()
	bullet_instance.rotation_degrees=rotation_degrees
	bullet_instance.apply_impulse(Vector2(bulletspeed,0).rotated(rotation),Vector2())
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func kill():
	get_tree().call_deferred("reload_current_scene")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "enemy" in body.name:
		kill()


func _on_key_body_entered(body: Node2D) -> void:
	body.has_key=true
	queue_free()
