extends Timer
class_name EnemyTimer

var reduce_wait_in: float = 0
var enemy_index: int = 0

func setup(waitTime: float, enemyIndex: int, reduceWaitIn: float = 0):
	wait_time = waitTime
	reduce_wait_in = reduceWaitIn
	enemy_index = enemyIndex

func _change_wait_time():
	wait_time = wait_time - reduce_wait_in

func process_callback():
	print(true)

func _process(_delta):
	pass
