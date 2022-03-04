extends TextureProgress
onready var ant = get_parent()
var valueup = false
signal init

func _ready():
	visible = false
func _process(delta):
	if valueup == true:
		value = ant.get_node("Area2D/Timer").get_time_left()
		print(value)

func _on_Area2D_chaos():
	visible = true
	valueup = true
