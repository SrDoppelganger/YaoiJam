extends CharacterBody2D

@onready var tilemap = $"../TileMap"
@onready var grid_player = $"."

var isMoving = false

func _physics_process(delta):
	if Input.is_action_just_pressed("cima"):
		move(Vector2.UP)
	if Input.is_action_just_pressed("baixo"):
		move(Vector2.DOWN)
	if Input.is_action_just_pressed("direita"):
		move(Vector2.RIGHT)
	if Input.is_action_just_pressed("esquerda"):
		move(Vector2.LEFT)

func move(direction:Vector2):
	# pegar tile atual
	var currTile:Vector2i = tilemap.local_to_map(global_position) 
	
	#pegar o tile-alvo (proximo tile)
	#combina a posição do tile atual com a do tile-alvo para mover o jogador
	var targetTile:Vector2i = Vector2i(
		currTile.x + direction.x,
		currTile.y + direction.y
	)
	
	print(currTile)
	print(targetTile)
	
	#verificar se o jogador pode andar no tile-alvo
	var tileData:TileData = tilemap.get_cell_tile_data(0, targetTile)
	
	if tileData.get_custom_data("Walkable") == false:
		return
		
	#move o jogador
	isMoving = true 
	global_position = tilemap.map_to_local(targetTile)
	
