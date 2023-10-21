extends Node2D

export (PackedScene) var Enemy


# Called when the node enters the scene tree for the first time.
func _ready():
	$BgMusic.play()
	$EnemyTimer.start()
	randomize()
	#$Background/ParallaxLayer.motion_mirroring.y=270
	#$Cloud1/ParallaxLayer.motion_mirroring.y=250
	#$Cloud2/ParallaxLayer.motion_mirroring.y=270

## physics about movito backgrund and cloud
func _physics_process(delta):
	get_node("Background").scroll_base_offset += Vector2(0,1) * 8 * delta
	get_node("Cloud1").scroll_base_offset += Vector2(0, 1) * 24 * delta
	get_node("Cloud2").scroll_base_offset += Vector2(0, 1) * 34 * delta



func _on_HUD_game_over():
	$BgMusic.stop()


func _on_EnemyTimer_timeout():
	get_node("EnemyPath/Enemyspawn").set_offset(randi())
	var enemigo = Enemy.instance()
	add_child(enemigo)
	enemigo.position = get_node("EnemyPath/Enemyspawn").position
	$EnemyTimer.wait_time = GOLBAL.ramdom(1, 3)
	$EnemyTimer.start()
