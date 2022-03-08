extends KinematicBody2D
var rng = RandomNumberGenerator.new()
var x = position.x
var y = position.y
var objective = Vector2.ZERO
var length = Vector2.ZERO
var dowhat = 0
var state = WANDERX
var speed = 50
var time = load("res://ants/Area2D.gd").new()
var Fire = load("res://effect/Fire.tscn").instance()
enum {
	WANDERX,
	WANDERY,
	WANDERBACKX,
	WANDERBACKY,
	MOVE
}
onready var anim = $AnimationPlayer
func _ready():
	objective = position
	rng.randomize()

func _physics_process(delta):
	Fire.global_position = position
	if objective.x > 1024 || objective.x < 0:
		state = WANDERBACKX
	if objective.y > 600 || objective.y < 0:
		state = WANDERBACKY
	match state:
		WANDERX:
			anim.play("horizontal")
			objective.x += rngee(-200,200)
			length = objective - position
			objective.y = position.y
			dowhat = 1
			state = MOVE
		WANDERY:
			anim.play("vertical")
			objective.y += rngee(-200,200)
			length = objective - position
			objective.x = position.x
			dowhat = 2
			state = MOVE
		WANDERBACKX:
			if objective.x > 1024:
				objective.x = rngee(-100,-300)
			else:
				objective.x = rngee(100,300)
			state = MOVE
		WANDERBACKY:
			if objective.y > 600:
				objective.y = rngee(-100,-300)
			else:
				objective.y = rngee(100,300)
			state = MOVE
		MOVE:
			if length != Vector2.ZERO:
				length = objective - position
				position = position.move_toward(objective,delta*speed)
			else:
				if dowhat == 1:
					state = WANDERY
				else:
					state = WANDERX
			
func rngee(a,b):
	return rng.randf_range(a,b)



func _on_Area2D_chaos():
	self.add_child(Fire)
	Fire.global_position = position
	speed = 400
	
func _on_stats_burn():
	self.add_child(Fire)
	Fire.global_position = position
	speed = 400

	$DeathAnimationTimer.start()


func _on_DeathAnimationTimer_timeout():
	queue_free()
