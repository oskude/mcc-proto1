extends KinematicBody

const UP = Vector3(0, 1, 0)
const GRAVITY = -9.8 * 6
const MAX_SPEED = 400
const ACCEL= 4
const DEACCEL= 8

var mouse_speed = 0.1
var yaw = 0
var pitch = 0
var velocity = Vector3()

func _input(event):
	if event is InputEventMouseMotion:
		$Head.rotate_y(deg2rad(-event.relative.x * mouse_speed))
		$Head/Camera.rotate_x(clamp(deg2rad(-event.relative.y * mouse_speed), -90, 90))

func _physics_process(delta):
	var direction = Vector3()
	var aim = $Head/Camera.get_global_transform().basis
	if Input.is_action_pressed("player_move_forward"):  direction -= aim.z
	if Input.is_action_pressed("player_move_backward"): direction += aim.z
	if Input.is_action_pressed("player_move_left"):     direction -= aim.x
	if Input.is_action_pressed("player_move_right"):    direction += aim.x
	direction = direction.normalized()
	
	var gravity = velocity.y
	if not is_on_floor():
		gravity += GRAVITY * delta
	
	var accel = DEACCEL if direction.length() > 0 else ACCEL
	velocity = velocity.linear_interpolate(direction * MAX_SPEED, accel * delta);
	velocity.y = gravity;
	
	var motion = velocity * delta
	motion = move_and_slide(motion, UP)
