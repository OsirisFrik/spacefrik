extends Timer
class_name EnemyTimer

@export var enemy: PackedScene

signal enemy_spawn(enemy: PackedScene)

func _init():
	connect("timeout", Callable(self, "on_timeout"))

func on_timeout():
	emit_signal("enemy_spawn", enemy)

func process_callback():
	print(true)

func _process(_delta):
	pass
