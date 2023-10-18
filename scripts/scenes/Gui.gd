extends CanvasLayer

func _process(_delta):
  %Lives.text = "Lives: " + str(GLOBAL.lives)
  %Score.text = "Score: " + str(GLOBAL.score)
