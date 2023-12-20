extends CharacterBody3D


const SPEED = 5.0
const CAM_SPEED = 1
const JUMP_VELOCITY = 7.5

var camera

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 15

@onready var pivot = $CamOrigin
@onready var player = $"."
@export var sens = 0.2

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * sens))
		pivot.rotate_x(deg_to_rad(-event.relative.y * sens))
		pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-40), deg_to_rad(40))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#Get the input direction and handle the movement/deceleration.
	#As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
		
		
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

	move_and_slide()
