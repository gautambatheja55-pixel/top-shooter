extends StaticBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Something entered the zone: ", body.name)
	if body.name=="Player":
		print("Player detected! Key status: ", body.has_key) #
	if body.has_key==true:
		open_door()
	else:
		print("No key found")
			
func open_door():
	$CollisionShape2D2.set_deferred("disabled",true)
	hide()
