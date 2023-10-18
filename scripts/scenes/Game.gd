extends Node2D

@export var enemy: PackedScene

func _ready():
  GLOBAL.score = 0
  GLOBAL.lives = 1

func _process(delta: float) -> void:
  parallax_bg(delta)

  $Path2D/PathFollow2D.set_progress($Path2D/PathFollow2D.get_progress() + 80 * delta)

func parallax_bg(delta: float) -> void:
  $Bg/Back.scroll_base_offset -= Vector2(1, 0) * 8 * delta
  $Bg/Planet_1.scroll_base_offset -= Vector2(1, 0) * 24 * delta
  $Bg/Planet_2.scroll_base_offset -= Vector2(1, 0) * 24 * delta

func _on_timer_timeout():
  print("Timer timeout")
  var enemy_instance = enemy.instantiate()

  enemy_instance.global_position = $Path2D/PathFollow2D.global_position
  add_child(enemy_instance)
