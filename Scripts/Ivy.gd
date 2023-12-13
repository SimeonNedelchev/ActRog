extends Weapon
#var item = preload("res://Scenes/Item.tscn")
#var drop = preload("res://Ivy.tres")
var res =  preload("res://Ivy.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	#var base_item_instance = item.instantiate()
	#base_item_instance = drop
	#get_node("res://Player/Player").add_child(item)
	print("f")
	get_parent().get_node("Player/Player").add_child($Ivy)
	$Sprite2D.set_visible(false)
	attacking = true
