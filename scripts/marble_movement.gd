extends RigidBody2D

#_integrate_forces(state: PhysicsDirectBodyState2D) virtual
@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Sprite2D


#● void apply_central_force(force: Vector2)
#Applies a directional force without affecting rotation. A force is time dependent and meant to be applied every physics update.
#This is equivalent to using apply_force() at the body's center of mass.

enum size {small, normal, big}

var current_size: int = 1

func _physics_process(delta):
	#						Speed, Gravity
#	apply_central_force(Vector2(200,-20))
	match current_size:
		size.small: 
			collision_shape_2d.set_scale(Vector2(0.5,0.5))
			sprite_2d.set_scale(Vector2(0.5,0.5))
		size.normal: 
			collision_shape_2d.set_scale(Vector2(1,1))
			sprite_2d.set_scale(Vector2(1,1))
		
		size.big:
			collision_shape_2d.set_scale(Vector2(1.25,1.25))
			sprite_2d.set_scale(Vector2(1.25,1.25))
		
		
		
	
	
	if current_size == size.big:
		set_scale(Vector2(2,2))
	
func _input(event):

	if event.is_action_pressed("Grow") and current_size != 2: current_size += 1

	if event.is_action_pressed("Shrink") and current_size != 0: current_size -= 1

