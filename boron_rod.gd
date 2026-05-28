extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group"):
		if body.has_boron_rod==false:
			body.has_boron_rod=true
			queue_free()
