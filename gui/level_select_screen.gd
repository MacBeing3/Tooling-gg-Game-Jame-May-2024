extends Control


func _on_button_pressed():
	Transitions.transition()
	await Transitions.on_transition_finished
	get_tree().change_scene_to_file("res://menu.tscn")
