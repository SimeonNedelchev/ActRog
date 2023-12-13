extends Node2D
class_name Weapon

var player
var attack_damage := 10.0
var knockback_force := 100.0
var stun_time := 1.5
var projectile : Sprite2D

func _on_hitbox_body_entered(area):
	if area is HitboxComponent:
		var hitbox : HitboxComponent = area
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.knockback_force = knockback_force
		attack.attack_position = global_position
		hitbox.damage(attack)
		
var timer : Timer
var attack_time := 0.6
var attacking = false


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = $AttackTimer
	timer.timeout.connect(disable_attacking)
	disable_attacking()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	
func disable_attacking():
	attacking = false
