extends StaticBody2D
@onready var TempLabel: Label = $"../player/Camera2D/CanvasLayer/TempLabel"
@onready var TimerLabel: Label = $"../player/Camera2D/CanvasLayer/TimerLabel"


#variables
var current_temp :float = 800.0
const MELT_POINT :float = 2800.0 
var rods_inserted :int = 0
var base_heat_rate :float = 25.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_heat_rate=base_heat_rate * (1.0 - (rods_inserted*0.4))
	
	if current_temp<MELT_POINT:
		current_temp+=current_heat_rate*delta
		
	var seconds_until_meltdown=(MELT_POINT-current_temp)/current_heat_rate
	TempLabel.text="Core Temp: " + str(int(current_temp)) + "°C"
	if current_heat_rate >0:
		TimerLabel.text="EST. TIME TO MELTDOWN: "+str(int(seconds_until_meltdown)) + "s"
	else:
		TimerLabel.text="REACTION STABILIZED"
		

func _on_socket_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player_group") and body.has_boron_rod:
		insert_rod(body)

func insert_rod(player):
	rods_inserted+=1
	player.has_boron_rod=false
	print("Control rod slot: ",rods_inserted, " Locked.")
