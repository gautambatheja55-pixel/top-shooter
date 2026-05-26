extends Control
@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var margin_container: MarginContainer = $MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")


func _on_button_2_pressed() -> void:
	margin_container.visible=true
	
