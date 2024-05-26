extends Area2D
class_name PlayerDetector

@export var play_animation:AnimationPlayer
@export var animation_name:String
# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(on_player_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_entered(body):
	play_animation.play(animation_name)
