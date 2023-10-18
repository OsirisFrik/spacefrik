extends Node2D

@onready var explosion: bool = false
@export var speed = 60

func _process(delta):
	if !explosion:
		global_position.x -= speed * delta

func explosion_ctrl() -> void:
	explosion = true
	$Area2D.queue_free()
	$Explosion.play("explosion")
	$Explosion/ExplosionAudio.play()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Shot"):
		explosion_ctrl()
		GLOBAL.score += 100

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		explosion_ctrl()
		body.queue_free()
		GLOBAL.lives -= 1


func _on_explosion_audio_finished():
	queue_free()

	if GLOBAL.lives <= 0:
		print("game over")
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
