extends Spatial

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	if Input.is_action_just_pressed("quit_game"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reload_scene"):
		get_tree().reload_current_scene()
	elif Input.is_action_just_pressed("capture_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif Input.is_action_just_pressed("confine_mouse"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
