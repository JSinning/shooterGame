extends Control



## Changed scene
func _on_Start_pressed():
	get_tree().change_scene("res://scene/Level.tscn")

## exit Game
func _on_exit_pressed():
	get_tree().quit()
