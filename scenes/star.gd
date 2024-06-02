extends Area2D


func _ready():
	body_entered.connect(on_player_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_player_entered():
	print("you won")
	Transitions.transition()
	await Transitions.on_transition_finished
	get_tree().change_scene_to_file("res://gui/level_select_screen.tscn")



func _on_body_entered(body):
	on_player_entered()
