extends Area2D
@onready var pickup: AudioStreamPlayer2D = $Pickup

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group"):
		body.has_key = true
		pickup.play()
		$CollisionShape2D.set_deferred("disabled",true)
		hide()
