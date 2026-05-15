extends Node2D

# 1. Drag your enemy.tscn file from the folder into the " " below to get the path
var enemy_scene = preload("res://enemy.tscn")

func _ready():
	# We wait a tiny fraction of a second to make sure the "Tree" is ready
	await get_tree().process_frame
	spawn_enemies()

func spawn_enemies():
	# 2. Find the spots
	var spots = get_tree().get_nodes_in_group("enemy_spots")
	
	# Check if we actually found them so the game doesn't crash
	if spots.size() == 0:
		print("Error: I can't find any markers in the 'enemy_spots' group!")
		return
	
	# 3. Shuffle and Spawn
	spots.shuffle()
	
	for i in range(3):
		var e = enemy_scene.instantiate()
		add_child(e)
		e.global_position = spots[i].global_position
