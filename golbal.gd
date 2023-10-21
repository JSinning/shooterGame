extends Node

onready var score: int
onready var rng: RandomNumberGenerator = RandomNumberGenerator.new()


func ramdom(num_max, num_min):
	rng.randomize()
	var rando = rng.randf_range(num_min, num_max)
	return rando
