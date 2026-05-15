extends CharacterBody2D

@onready var player = get_tree().root.find_child("player", true, false)

func _physics_process(delta: float) -> void:
	if player:
		look_at(player.global_position)
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * 150
		move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("I touched: ", body.name) # This is our debugger
	
	# Check for the name "player" OR the group
	if body.name == "player" or body.is_in_group("player_group"):
		get_tree().reload_current_scene()
		
	if body.is_in_group("bullet") or body.name.contains("Bullet"):
		queue_free()
		
	
