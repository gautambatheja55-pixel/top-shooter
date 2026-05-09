extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
