extends Area2D

@export var player_marble:RigidBody2D

func _ready():
	body_entered.connect(on_player_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_player_entered():
	Transitions.transition()
	await Transitions.on_transition_finished
	get_tree().change_scene_to_file("res://gui/level_select_screen.tscn")

