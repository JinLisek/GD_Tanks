extends Node2D

var red_bar = preload("res://Assets/UI/barHorizontal_red_mid 200.png")
var green_bar = preload("res://Assets/UI/barHorizontal_green_mid 200.png")
var yellow_bar = preload("res://Assets/UI/barHorizontal_yellow_mid 200.png")

func _ready():
	for node in get_children():
		node.hide()
		
func update_healthbar(value):
	$HealthBar.texture_progress = green_bar
	
	if value < 25:
		$HealthBar.texture_progress = red_bar
	elif value < 60:
		$HealthBar.texture_progress = yellow_bar
	elif value < 100:
		$HealthBar.show()
	
	$HealthBar.value = value
	
func _process(delta):
	global_rotation = 0