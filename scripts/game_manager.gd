extends Node2D

const FISH = preload("res://scenes/fish.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.next_fish.connect(spawn_fish)
	spawn_fish()


func spawn_fish():
	var fish = FISH.instantiate()
	add_child(fish)
