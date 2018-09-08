extends Node2D

var tile_size = Vector2(128, 128)
onready var texture = $Sprite.texture

func _ready():
	var tex_width = texture.get_width() / tile_size.x
	var tex_height = texture.get_height() / tile_size.y
	
	var tile_set = TileSet.new()
	
	for x in range(tex_width):
		for y in range(tex_height):
			var tile_region = Rect2(x * tile_size.x, y * tile_size.y, tile_size.x, tile_size.y)
			
			var tile_id = x + y * 10
			tile_set.create_tile(tile_id)
			tile_set.tile_set_texture(tile_id, texture)
			tile_set.tile_set_region(tile_id, tile_region)
	
	ResourceSaver.save("res://Assets/TileSets/TerrainTileSet.tres", tile_set)