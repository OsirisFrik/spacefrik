extends Node2D

@export var timerRange: float = 0.10
@export var maxPointPerLvl: int = 1000
@export var speedPerLvl: float = 0.90
@export var enemies: Array[PackedScene] = []

var timers: Array[EnemyTimer] = []

func _ready():
	GLOBAL.score = 0
	GLOBAL.lives = 1
	GLOBAL.lvl = 1

func _process(delta: float) -> void:
	parallax_bg(delta)

	$Path2D/PathFollow2D.set_progress($Path2D/PathFollow2D.get_progress() + 80 * delta)

	if GLOBAL.score >= maxPointPerLvl:
		if GLOBAL.score == maxPointPerLvl:
			$Settings/lvl_2.start()
		elif GLOBAL.score >= maxPointPerLvl * 2 && $Settings/lvl_2.is_stopped():
			print("lvl 3")
			$Settings/lvl_3.start()



func parallax_bg(delta: float) -> void:
	$Bg/Back.scroll_base_offset -= Vector2(1, 0) * 8 * delta
	$Bg/Planet_1.scroll_base_offset -= Vector2(1, 0) * 24 * delta
	$Bg/Planet_2.scroll_base_offset -= Vector2(1, 0) * 24 * delta

func _on_enemy_spawn(enemy: PackedScene):
	print("enemy_spawn")
	var enemy_instance = enemy.instantiate()

	enemy_instance.global_position = $Path2D/PathFollow2D.global_position * GLOBAL.lvl

	add_child(enemy_instance)
