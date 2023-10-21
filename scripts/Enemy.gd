extends Area2D

export (PackedScene) var Explotion

var SPEED

func _ready():
	$AnimatedSprite.play()
	SPEED = GOLBAL.ramdom(32,42)


func _physics_process(delta):
	position.y += SPEED * delta
	
	



func death_enemy():
	queue_free()
	explotion_ctrol()


func explotion_ctrol():
	var esplosion = Explotion.instance()
	esplosion.global_position = $ExplotationSpaw.global_position
	get_tree().call_group("level", "add_child", esplosion)


func _on_Enemy_area_entered(area):
	if area.is_in_group("shoot"):
		death_enemy()
		GOLBAL.score += 10


func _on_Enemy_body_entered(body):
	if body.is_in_group("player"):
		death_enemy()
		body.queue_free()




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
