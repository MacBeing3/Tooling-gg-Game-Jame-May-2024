extends AnimatableBody2D

@onready var path_follow:= $Path2D/PathFollow2D


@export var player_marble:RigidBody2D
@export var detatch_launch_force: Vector2

var fling_speed := 800
func _ready():
	$CollisionShape2D.rotation_degrees = 0
	path_follow.progress_ratio = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var fling_accel = 100 * delta
	if player_marble.is_attached == true:
		fling_speed += fling_accel 
		path_follow.progress += fling_speed  * delta
		print("pathfollow ration  " ,path_follow.progress_ratio)
		if path_follow.progress >= 1350:
			_detatch_marble_from_path()
		
func _input(event):
	if event.is_action_pressed("ui_accept"):
#		_attach_marble_to_path()
		$AnimationPlayer.play("fling")
		
		

#		for node in travel_points_parent.get_child_count():
#			print(node)
#			var pos1:Vector2 = travel_points_parent.get_child(node).global_position
#			var pos2:Vector2
#			if node + 1 < travel_points_parent.get_child_count():
#				pos2= travel_points_parent.get_child(node+1).global_position
#
#			else: pos2= travel_points_parent.get_child(node).global_position
#			player_marble.position = lerp(pos1,pos2,0.2)


func _attach_marble_to_path():
	
	player_marble.is_attached = true
	player_marble.linear_velocity = Vector2.ZERO
	player_marble.angular_velocity = 5
	player_marble.node_attached_to = path_follow
	
	
func _detatch_marble_from_path():
	print("plz detach")
	player_marble.is_attached = false
	player_marble.apply_central_force(detatch_launch_force)
	path_follow.progress_ratio = 0.0
