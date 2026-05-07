extends CharacterBody2D

var motion =Vector2()
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var Player= get_parent().get_node("player")
	
	position += (Player.position - position)/50
	look_at(Player.position)
	move_and_collide(motion)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("I just touched : ", body.name)
	if body.is_in_group("bullet"):
		print("Confirmed")
		queue_free()
