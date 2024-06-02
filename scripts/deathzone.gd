extends Area2D


func _ready():
	body_entered.connect(on_player_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_entered(body):
	Transitions.transition()
	await Transitions.on_transition_finished
	get_tree().change_scene_to_file("res://gui/level_select_screen.tscn")
