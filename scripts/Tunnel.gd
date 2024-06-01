@tool
extends Node2D
class_name TunnelMaker

@export_enum("small","medium","large") var tunnel_size:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print($TopBody2D.position)
	

		
	print("topbody small tunnel (23, -42)")
	print("topbody med tunnel (31, -72)")
	print("topbody big tunnel (47, -103)")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if tunnel_size == 0:
		$TopBody2D.position = Vector2(23, -42)
	if tunnel_size == 1:
		$TopBody2D.position = Vector2(31, -72)
	if tunnel_size == 2:
		$TopBody2D.position = Vector2(47, -103)
