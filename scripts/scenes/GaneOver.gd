extends Control

func _ready():
  %FinalScore.text = "YOUR SCORE: " + str(GLOBAL.score)

func _on_start_pressed() -> void:
  get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_exit_pressed() -> void:
  get_tree().quit()
