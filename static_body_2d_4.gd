extends StaticBody2D

@onready var TempLabel: Label = $"../player/CanvasLayer/TempLabel"
@onready var TimerLabel: Label = $"../player/CanvasLayer/TimerLabel"
@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $"../player/CanvasLayer/ProgressBar"
@onready var camera_2d: Camera2D = $"../player/Camera2D"
@onready var alarm: AudioStreamPlayer2D = $"../player/Alarm"
@onready var bg: AudioStreamPlayer2D = $"../player/Bg"
@onready var danger_glow: Panel = $"../player/CanvasLayer/DangerGlow"
@onready var game_over_screen: Control = $"../player/CanvasLayer/GameOverScreen"
var total_rods:int=0

#variables
var current_temp :float = 750.0
const MELT_POINT :float = 2800.0 
var rods_inserted :int = 0
var base_heat_rate :float = 20.0
var player_ref: Node2D = null

func _process(delta: float)-> void:
	var current_heat_rate=base_heat_rate * (1.0 - (rods_inserted*0.4))
	var shake_intensity= max(0,current_temp-2000)/800
	if current_temp<MELT_POINT:
		current_temp+=current_heat_rate*delta
		
	var seconds_until_meltdown=(MELT_POINT-current_temp)/current_heat_rate
	TempLabel.text="Core Temp: " + str(int(current_temp)) + "°C"
	if current_heat_rate >0:
		TimerLabel.text="EST. TIME TO MELTDOWN: "+str(int(seconds_until_meltdown)) + "s"
	else:
		TimerLabel.text="REACTION STABILIZED"
	
	if timer.time_left>0:	
		progress_bar.visible=true
		progress_bar.value= (timer.wait_time - timer.time_left)/timer.wait_time * 100
	
	if shake_intensity>0 and shake_intensity<0.5:
		var shake_x=randf_range(-4,4)
		var shake_y=randf_range(-4,4)
		camera_2d.offset=Vector2(shake_x,shake_y)
	elif shake_intensity>0.5:
		var shake_x=randf_range(-15,15)
		var shake_y=randf_range(-15,15)
		camera_2d.offset=Vector2(shake_x,shake_y)
	else:
		camera_2d.offset=Vector2.ZERO
	
	if current_temp>=2800:
		get_tree().change_scene_to_file("res://EndScreen.tscn")
		current_temp=2000
		
	if current_temp>=2400:
		if not alarm.playing:
			alarm.play()
		if bg.playing:
			bg.stop()
			
		danger_glow.visible = true
		var pulse= 0.3 + abs(sin(Time.get_ticks_msec() * 0.005)) * 0.4
		danger_glow.self_modulate.a=pulse
		
	if total_rods==3:
		get_tree().change_scene_to_file("res://WinScene.tscn")
		
func _on_socket_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group") and body.has_boron_rod:
		player_ref=body
		timer.start()
	

func _on_socket_zone_body_exited(body: Node2D) -> void:
	if body == player_ref:
		timer.stop()
		progress_bar.visible=false
		player_ref=null

func _on_timer_timeout() -> void:
	if player_ref and player_ref.has_boron_rod:
		insert_rod(player_ref)		

func insert_rod(player):
	rods_inserted+=1
	player.has_boron_rod=false
	player_ref=null
	progress_bar.visible=false
	total_rods+=1
