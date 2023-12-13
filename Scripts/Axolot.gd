extends CharacterBody2D

var MAX_HEALTH := 20.0
var health
var speed := 50.0
var taking_damage := false
var current_stun_time := 0.0
var player

func damage(attack: Attack):
	health -= attack.attack_damage
	
	if health <= 0:
		queue_free()
		
	taking_damage = true
	
	current_stun_time = attack.stun_time
	velocity = (global_position - attack.attack_position).normalized()*attack.knockback_force
	
		
func _ready():
	player = get_node("../../Player/Player")
	health = MAX_HEALTH
	
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print(player.global_position)

func _physics_process(delta):
	if player:
		velocity = global_position.direction_to(player.global_position)
		move_and_collide(velocity * speed * delta)
		
