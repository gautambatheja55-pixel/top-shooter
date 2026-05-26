extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group"):
		body.has_key = true
		queue_free()
