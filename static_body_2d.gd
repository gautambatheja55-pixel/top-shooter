extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group"):
		if body.has_key==true:
			open_the_door()
func open_the_door():
	$WallCollision.set_deferred("disabled",true)
	$Door_image/StaticBody2D/CollisionPolygon2D.set_deferred("disabled",true)
	hide()
