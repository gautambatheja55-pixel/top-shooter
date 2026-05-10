extends CanvasLayer
@onready var time_label: Label = $TimeLabel
@onready var game_timer: Timer = $GameTimer

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time_left=game_timer.time_left
	var minutes=int(time_left)/60
	var seconds=int(time_left)%60
	time_label.text= "%02d:%02d" % [minutes,seconds]
	
	if time_left <=0:
		game_over()
		
func game_over():
	pass
