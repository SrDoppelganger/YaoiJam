extends CharacterBody2D

@onready var tilemap = $"../TileMap"

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
	var currTile:Vector2i = tilemap.local_to_map() 
	
	#pegar o tile-alvo (proximo tile)
	
	
	#verificar se o jogador pode andar no tile-alvo
