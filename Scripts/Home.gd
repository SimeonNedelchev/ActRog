extends Node2D

@export var enemy_scene: PackedScene

func _on_quit_button_pressed():
	get_tree().quit()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")
	
func _on_enemy_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	
	var enemy_spawn_location = get_node("SpawnLocationGenerator")
	enemy_spawn_location.progress_ratio = randf()
	
	var player_position = $Player.position
	enemy.initialize(enemy_spawn_location.position, player_position)
	
	
	
