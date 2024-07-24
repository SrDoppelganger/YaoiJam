extends Node2D

var tween = get_tree().create_tween()

@export var pushable = true
@export var slideSpeed = 4.0
var sliding = false
var tileMap:TileMap

func initialize(_tile_map:TileMap):
	tileMap = _tile_map
	position = calculate_destination(Vector2())
	
	
#define se o objeto pode ser puxado
func push(velocity:Vector2):
	if sliding:
		return
	var move = calculate_destination(velocity.normalized())
	if can_move(move):
		tween.interpolate_prop
	
#define para onde o objeto será empurrado
func calculate_destination(direction:Vector2):
	pass

func can_move(move:Vector2):
	if !pushable:
		return false
