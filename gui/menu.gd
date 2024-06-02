extends Control


func _on_play_pressed():
	Transitions.transition()
	await Transitions.on_transition_finished
	get_tree().change_scene_to_file("res://levels/Level01.tscn") 


func _on_quit_pressed():
	get_tree().quit() 


func _on_options_pressed():
	Transitions.transition()
	await Transitions.on_transition_finished
	get_tree().change_scene_to_file("res://gui/settings.tscn") 
