extends KinematicBody2D
var velocity = Vector2.ZERO
var normalvel = 8

func _physics_process(delta):

	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	position.y += input_vector.y*normalvel
	position.x += input_vector.x*normalvel

