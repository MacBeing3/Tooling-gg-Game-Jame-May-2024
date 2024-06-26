extends RigidBody2D

#_integrate_forces(state: PhysicsDirectBodyState2D) virtual
@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Sprite2D
@export var starting_point:Node2D

@export var extra_h_speed:int



enum size {small, normal, big}


var is_attached:bool=false
var node_attached_to:Node2D
var current_size: int = 1

func _ready():
		global_position = starting_point.global_position

func _process(delta):
	if is_attached:
		freeze
		global_position = node_attached_to.global_position

func _physics_process(delta):

	if get_linear_velocity().y <= 0  and get_linear_velocity().x >= -1 and abs(get_linear_velocity().x) <= 50:
	#						Speed, Gravity
		apply_central_force(Vector2(extra_h_speed if get_linear_velocity().x > 0 else (-1* extra_h_speed),4000))
		
		
	match current_size:
		size.small: 
			collision_shape_2d.set_scale(Vector2(0.5,0.5))
			sprite_2d.set_scale(Vector2(0.5,0.5))
		size.normal: 
			collision_shape_2d.set_scale(Vector2(1,1))
			sprite_2d.set_scale(Vector2(1,1))
		
		size.big:
			collision_shape_2d.set_scale(Vector2(1.25,1.25))
			sprite_2d.set_scale(Vector2(1.75,1.75))
		
		
#	if is_attached:
#		freeze
#		global_position = node_attached_to.global_position

	_reset_level()
	

#
func _unhandled_input(event):

	if event.is_action_pressed("Restart"):
		global_position = starting_point.global_position
		linear_velocity = Vector2(0,0)
		angular_velocity = 0
		current_size = size.normal

	if event.is_action_pressed("Grow") and current_size != 2: current_size += 1

	if event.is_action_pressed("Shrink") and current_size != 0: current_size -= 1

#	if event.is_action_pressed("ui_accept"):
#		set_linear_velocity(Vector2(0,0))

func _reset_level():
	if Input.is_action_pressed("Restart"):
		global_position = starting_point.global_position
		linear_velocity = Vector2(0,0)
		angular_velocity = 0
		current_size = size.normal

