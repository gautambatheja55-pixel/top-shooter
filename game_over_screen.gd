extends Control
@onready var countdown_label: Label = $VBoxContainer/CountdownLabel
var time_left:float = 3.0

func _ready() -> void:
	process_mode=Node.PROCESS_MODE_ALWAYS
	hide()
	visible
func trigger_game_over():
	show()
	get_tree().paused=true
	time_left=3.0
	
func _process(delta: float) -> void:
	if visible and get_tree().paused:
		time_left-=delta
		if countdown_label:
			countdown_label.text=str(ceil(time_left))
		if time_left <= 0.0:
			get_tree().paused=false
			get_tree().reload_current_scene()
