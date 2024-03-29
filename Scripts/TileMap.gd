extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 32
var height = 32
var player

func _ready():
	player = get_node("../../Player/Player")
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()

func _process(delta):
	generate_chunk(player.position)
	
func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(tile_pos.x - width/2 + x, tile_pos.y - height/2 + y)
			var temp = temperature.get_noise_2d(tile_pos.x - width/2 + x, tile_pos.y - height/2 + y)
			var alt = altitude.get_noise_2d(tile_pos.x- width/2 + x, tile_pos.y - height/2 + y)
			set_cell(0, Vector2i(tile_pos.x - width/2 + x, tile_pos.y - height/2 + y), 0, Vector2i(3,12))
