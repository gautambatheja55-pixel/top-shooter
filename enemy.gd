extends CharacterBody2D

@onready var player = get_tree().root.find_child("player", true, false)

func _physics_process(delta: float) -> void:
	if player:
		look_at(player.global_position)

		var direction = (player.global_position - global_position).normalized()
		
		velocity = direction * 150
		move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("bullet"):
		queue_free()
	
	if body.name == "player":
		get_tree().reload_current_scene()
