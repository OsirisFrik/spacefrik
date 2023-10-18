extends Node2D

@export var enemy: PackedScene
@export var timerRange: float = 0.10
@export var maxPointPerLvl: int = 5000
@export var speedPerLvl: float = 0.90
@export var enemies: Array[PackedScene] = []

var timers: Array[EnemyTimer] = []

func _ready():
	GLOBAL.score = 0
	GLOBAL.lives = 1
	GLOBAL.lvl = 1
	loadTimers()

func loadTimers() -> void:
	if timers.is_empty():
		var timer: EnemyTimer = $"EnemyTimer" as EnemyTimer

		timer.setup(
			speedPerLvl * GLOBAL.lvl,
			0
		)
		timer.connect("timeout", Callable(self, "_on_timer_timeout"))

		timers.append(timer)

func _process(delta: float) -> void:
	parallax_bg(delta)

	$Path2D/PathFollow2D.set_progress($Path2D/PathFollow2D.get_progress() + 80 * delta)



func parallax_bg(delta: float) -> void:
	$Bg/Back.scroll_base_offset -= Vector2(1, 0) * 8 * delta
	$Bg/Planet_1.scroll_base_offset -= Vector2(1, 0) * 24 * delta
	$Bg/Planet_2.scroll_base_offset -= Vector2(1, 0) * 24 * delta

func _on_timer_timeout(index: int):
	var enemy_instance = enemy.instantiate()

	if GLOBAL.score % 1000 == 0 && GLOBAL.score % maxPointPerLvl != 0:
		$Settings/Timer.wait_time = $Settings/Timer.wait_time - timerRange
		print("Timer")

	enemy_instance.global_position = $Path2D/PathFollow2D.global_position
	add_child(enemy_instance)
