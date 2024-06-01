extends Sprite2D


# Called when the node enters the scene tree for the first time


func _on_child_entered_tree(node):
	get_tree().change_scene_to_file("res://gui/level_select_screen.tscn")
