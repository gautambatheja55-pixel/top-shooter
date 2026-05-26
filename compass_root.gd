extends Node2D

@onready var reactor: StaticBody2D = $"../../../StaticBody2D4"
@onready var player: CharacterBody2D = $"../.."

func _process(delta):
	var direction = reactor.global_position - player.global_position
	rotation = direction.angle()
