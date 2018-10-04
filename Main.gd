extends Spatial

onready var fps = get_node("fps")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	fps.set_text(str(Engine.get_frames_per_second()))
	if Input.is_action_just_pressed("quit_game"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reload_scene"):
		get_tree().reload_current_scene()
