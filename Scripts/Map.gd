extends Node2D

func _ready():
	set_camera_limits()
	
func set_camera_limits():
	var map_limits = $GroundTileMap.get_used_rect()
	var map_cell_size = $GroundTileMap.cell_size
	
	$PlayerTank/Camera2D.limit_left = map_limits.position.x * map_cell_size.x
	$PlayerTank/Camera2D.limit_right = map_limits.end.x * map_cell_size.x
	$PlayerTank/Camera2D.limit_top = map_limits.position.y * map_cell_size.y
	$PlayerTank/Camera2D.limit_bottom = map_limits.end.y * map_cell_size.y