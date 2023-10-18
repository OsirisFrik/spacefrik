extends CharacterBody2D
class_name Player

@onready var screenSize = get_viewport_rect().size
@export var shot: PackedScene
@export var speed = 80

func _process(_delta):
	anim_ctrl()
	motion_ctrl()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		shot_ctrl()

func anim_ctrl() -> void:
	if GLOBAL.get_axis().y > 0:
		$SpaceShip.animation = "up"
	elif GLOBAL.get_axis().y < 0:
		$SpaceShip.animation = "down"
	else:
		$SpaceShip.animation = "idle"

func motion_ctrl() -> void:
	velocity.x = GLOBAL.get_axis().x * speed
	velocity.y = GLOBAL.get_axis().y * speed

	move_and_slide()

	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)

func shot_ctrl() -> void:
	$Flash.play("flash")
	$Settings/AudioShot.play()

	var shotInstance = shot.instantiate()

	shotInstance.global_position = $Settings/ShootSpawn.global_position
	get_tree().call_group("game", "add_child", shotInstance)
