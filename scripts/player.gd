extends KinematicBody2D

export (PackedScene) var Shoot


# Declare member variables here for scene.
const SPEED = 100
onready var  motion = Vector2(0, 0) ## other use is Vector2.Zero
onready var can_shoot: bool= true
onready var screenSize = get_viewport_rect().size ## size Windows 


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play()

func _physics_process(delta):
	motion_ctrol()
	animation_ctrol()
	motion = move_and_collide(motion * delta)

func _input(event):
	if event.is_action_pressed("ui_accept") and can_shoot:
		shoot_ctrol()

func get_axis() ->Vector2:
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis

func motion_ctrol():
	if get_axis() == Vector2.ZERO:
		motion = Vector2.ZERO
	else:
		motion = get_axis().normalized() * SPEED
		
	## Move limit person	
	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)

func animation_ctrol():
	if get_axis().x == 1:
		$AnimatedSprite.animation = "horizontal"
		$AnimatedSprite.flip_h = true
	elif get_axis().x == -1:
		$AnimatedSprite.animation = "horizontal"
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.animation = "vertical"

func shoot_ctrol():
	var disparo = Shoot.instance()
	disparo.global_position = $shootSpawn.global_position
	get_tree().call_group("level", "add_child", disparo)
	
