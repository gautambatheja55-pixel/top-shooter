var restarting = false

func _reload_scene_safe():

	if restarting:
		return

	restarting = true
	get_tree().reload_current_scene()
