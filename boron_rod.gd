extends Area2D
@onready var boron_label: Label = $"../player/CanvasLayer/BoronLabel"
@onready var timer: Timer = $"../player/CanvasLayer/BoronLabel/Timer"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group"):
		if body.has_boron_rod==false:
			body.has_boron_rod=true
			timer.start()
			boron_label.text="Picked up"
			boron_label.visible=true
			body.has_boron_rod=true
			set_deferred("monitoring",false)
			set_deferred("collision_layer",false)
			visible=false
			
		elif body.has_boron_rod==true:
			timer.start()
			if boron_label:
				boron_label.text="You can't pick up more than one rod at a time"
				boron_label.visible=true
			
func _on_timer_timeout() -> void:
	boron_label.visible=false

func _on_timer_2_timeout() -> void:
	boron_label.visible=false
