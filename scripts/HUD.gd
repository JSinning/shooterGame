extends CanvasLayer

signal game_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GOLBAL.score = 0


func _physics_process(delta):
	$ScoreContiner/HBoxContainer/point.text = str(GOLBAL.score)

func gameOver():
	emit_signal("game_over")
	$GO.visible = true
	$BGMusic.play()

func _on_Restar_pressed():
	get_tree().call_deferred("reload_current_scene")


func _on_exit_pressed():
	get_tree().quit()
	
	


func _on_player_tree_exiting():
	gameOver()
