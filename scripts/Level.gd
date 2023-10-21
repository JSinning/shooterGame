extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$BgMusic.play()
	$Background/ParallaxLayer.motion_mirroring.y=270
	$Cloud1/ParallaxLayer.motion_mirroring.y=250
	$Cloud2/ParallaxLayer.motion_mirroring.y=270

## physics about movito backgrund and cloud
func _physics_process(delta):
	get_node("Background").scroll_base_offset += Vector2(0,1) * 8 * delta
	get_node("Cloud1").scroll_base_offset += Vector2(0, 1) * 24 * delta
	get_node("Cloud2").scroll_base_offset += Vector2(0, 1) * 34 * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

