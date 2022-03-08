extends TextureProgress
onready var ant = get_parent()
var valueup = false
signal init

func _ready():
	visible = true






func _on_stats_health_update(healf):
	value = healf
