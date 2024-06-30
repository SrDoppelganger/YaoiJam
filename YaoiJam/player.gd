extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var direction = Vector2(0,0);

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	
	direction = Vector2(0,0)
	
	
	if Input.is_action_pressed("direita"):
		direction.x = 1
	if Input.is_action_pressed("esquerda"):
		direction.x = -1
	if Input.is_action_pressed("cima"):
		direction.y = -1
	if Input.is_action_pressed("baixo"):
		direction.y = 1
	
	animation(direction)
	
	#normalized() evita que o jogador se mova mais rapido na diagonal
	velocity = direction.normalized() * SPEED
	
	move_and_slide()

#toca as animações de acordo com a direção do personagem
#talvez precise de umas modificações no futuro
func animation(direction):
	
	match direction:
		Vector2(1,0):
			animated_sprite.flip_h = true
			animated_sprite.play("side_walk")
		Vector2(-1,0):
			animated_sprite.flip_h = false
			animated_sprite.play("side_walk")
		Vector2(0,1):
			animated_sprite.play("down_walk")
		Vector2(0,-1):
			animated_sprite.play("up_walk")
		_:
			animated_sprite.play("idle")



