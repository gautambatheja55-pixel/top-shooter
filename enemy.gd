extends CharacterBody2D

enum State {IDLE, SPOTTED, CHASING}
var current_state = State.IDLE
var alert_timer = 0.4
@onready var ray: RayCast2D = $RayCast2D
@onready var player: CharacterBody2D = $"../player"
@onready var danger_glow: Panel = $"../player/Camera2D/CanvasLayer/DangerGlow"
var speed = 150

func _physics_process(delta: float):
	if player and ray:
		ray.target_position = to_local(player.global_position)
		
		var can_see_player = false
		if ray.is_colliding():
			var thing_we_hit = ray.get_collider()
			if thing_we_hit == player:
				can_see_player = true

		match current_state:
			State.IDLE:
				var distance = global_position.distance_to(player.global_position)
				if distance < 450.0 and can_see_player:
					current_state = State.SPOTTED
					alert_timer = 0.4
					if danger_glow:
						danger_glow.visible = true
						
			State.SPOTTED:
				velocity = Vector2.ZERO
				alert_timer -= delta
				look_at(player.global_position)
				if alert_timer <= 0.0:
					current_state = State.CHASING
					
			State.CHASING:
				look_at(player.global_position)
				var direction = (player.global_position - global_position).normalized()
				velocity = direction * speed
				
				move_and_slide()
				
				var distance_to_player = global_position.distance_to(player.global_position)
				if distance_to_player < 25.0:
					get_tree().reload_current_scene()

		
