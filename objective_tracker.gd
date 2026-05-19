extends Marker2D
@onready var reactor: StaticBody2D = $"../../../../StaticBody2D4"


func _ready():
	top_level = true
	
func _process(delta):
	if reactor == null:
		return
	global_rotation = (
		reactor.global_position - global_position
	).angle()
	print(global_rotation)
	print(rotation)
	print(global_position)
