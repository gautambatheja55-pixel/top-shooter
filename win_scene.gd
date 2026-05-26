extends Control
@onready var code_stream_label: Label = $CodeStreamLabel
@onready var ascii_success_label: Label = $AsciiSuccessLabel
@onready var temp_drop_label: Label = $TempDropLabel
@onready var terminal_timer: Timer = $TerminalTimer
@onready var menu_button: Button = $MenuButton
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var temp:float=2800.0

var terminal_lines=[
	">>Connecting to Facility Core Net...",
	">>Bypassing Backup Firewall... SUCCESS",
	">>Accessing Emergency Injectors...",
	">>Boron Density Maximized",
	">>Critical Override Execution Signed",
	">>Opening Cooling Vent Valves 1-4...",
	">>Flooding Reactor Chamber..."
]
var current_line:int= 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	code_stream_label.text=""
	temp_drop_label.text=""
	menu_button.hide()
	ascii_success_label.hide()
	temp_drop_label.text=""
	terminal_timer.start(0.2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_terminal_timer_timeout() -> void:
	if current_line<terminal_lines.size():
		code_stream_label.text+=terminal_lines[current_line] + "\n"
		current_line+=1
		audio_stream_player_2d.play()
		temp_drop_label.hide()
		terminal_timer.start(0.5)
		
	else:
		terminal_timer.start(5)
		code_stream_label.hide()
		ascii_success_label.show()
		terminal_timer.start(0.5)
		
	if temp>1200.0:
		temp-=randf_range(35.0,75.0)
		if temp<1200:
			temp=1200
		temp_drop_label.text="Core Temperature: " + str(int(temp)) + "°C / 2800°C [SAFE]"
		temp_drop_label.show()
	else:
		terminal_timer.stop()
		temp_drop_label.hide()
		menu_button.show()
		menu_button.grab_focus()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu.tscn")
