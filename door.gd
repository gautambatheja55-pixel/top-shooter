extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.has_key==true:
		open_door()
			
func open_door():
	$CollisionShape2D2.set_deferred("disabled",true)
	hide()
