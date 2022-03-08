extends TextureProgress
onready var ant = get_parent()
var valueup = false
signal init

func _ready():
	value = max_value
	visible = false
	
func _process(delta):
	visible = value > 0 and value < max_value

func _on_stats_health_update(healf):
	visible = true
	value = healf
