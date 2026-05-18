extends RigidBody2D

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy") or body.name.contains("Enemy"):
		body.queue_free()
		queue_free()
