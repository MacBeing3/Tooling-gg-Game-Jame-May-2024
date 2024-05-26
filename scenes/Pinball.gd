extends AnimatableBody2D

@onready var travel_points_parent = get_node("TravelPoints")

@export var player_marble:RigidBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.rotation_degrees = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action_pressed("ui_accept"):
		
		$AnimationPlayer.play("fling")

		for node in travel_points_parent.get_child_count():
			print(node)
			var pos1:Vector2 = travel_points_parent.get_child(node).global_position
			var pos2:Vector2
			if node + 1 < travel_points_parent.get_child_count():
				pos2= travel_points_parent.get_child(node+1).global_position
				
			else: pos2= travel_points_parent.get_child(node).global_position
			player_marble.position = lerp(pos1,pos2,0.2)
