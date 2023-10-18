extends Area2D

@export var speed = 296

func _process(delta):
  global_position.x += speed * delta

func _on_screen_exited():
  queue_free()

func _on_area_entered(area):
  if area.is_in_group("Enemy"):
    queue_free()
