extends Control
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var typing_label: Label = $BlackPage/TypingLabel
@onready var typing: AudioStreamPlayer2D = $BlackPage/Typing
@onready var black_page: ColorRect = $BlackPage
@onready var type_timer: Timer = $BlackPage/TypeTimer
@onready var vedio_end_timer: Timer = $BlackPage/VedioEndTimer


var current_character:int=0
var full_length: String= "WARNING: \nCore temperature has exceeded the critical melting point of 2800°C\nThermal Runaway initiated\nFacility evacuation failed\nConnection to Infiltrator lost..."

func _ready() -> void:
	black_page.visible=false
	typing_label.text=""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_vedio_end_timer_timeout() -> void:
	black_page.visible=true
	type_timer.start()
	video_stream_player.hide()


func _on_type_timer_timeout() -> void:
	if current_character<full_length.length():
		typing_label.text+=full_length[current_character]
		current_character+=1
		if not typing.playing:
			typing.play()
		


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu.tscn")
