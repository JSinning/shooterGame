extends Node2D


func _ready():
	$AnimatedSprite.play()
	$ExplotionSound.play()
	


func _on_ExplotionSound_finished():
	queue_free()
