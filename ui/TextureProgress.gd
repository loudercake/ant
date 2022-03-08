extends TextureProgress
onready var ant = get_parent()
var valueup = false
signal init

func _ready():
	value = max_value
	visible = false
func _process(delta):
	if value != max_value:
		visible = true
	else:
		visible = false





func _on_stats_health_update(healf):
	visible = true
	value = healf
