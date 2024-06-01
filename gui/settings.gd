extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Transitions.transition()
	await Transitions.on_transition_finished
	get_tree().change_scene_to_file("res://gui/menu.tscn")


func _on_font_pressed():
	OS.shell_open("https://www.dafont.com/04b-30.font")


func _on_mac_pressed():
	pass
	#OS.shell_open("")


func _on_ori_pressed():
	pass
	#OS.shell_open("")


func _on_grime_pressed():
	pass
	#OS.shell_open("")
