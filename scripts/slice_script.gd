extends Area2D

var slicing = false
var accurate = false
@onready var slice_line = $Line2D
@onready var slice_point = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	slice_line.points[0].y = randf_range(-10, 10)
	slice_line.points[1].y = slice_line.points[0].y
	slice_point.position.y = slice_line.points[0].y

func _process(delta):
	if slicing == true and accurate == true:
		if slice_point.position.x <= get_local_mouse_position().x - 1:
			slice_line.points[0].x = get_local_mouse_position().x
			slice_point.position.x = get_local_mouse_position().x
	
	if slice_line.points[0].x >= slice_line.points[1].x:
		GlobalSignals.next_fish.emit()
		queue_free()

func _input(event):
	if Input.is_action_pressed("slice"):
		slicing = true
	if Input.is_action_just_released("slice"):
		slicing = false


func _on_mouse_entered():
	accurate = true


func _on_mouse_exited():
	accurate = false
