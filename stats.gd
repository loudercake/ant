extends Node
var is_health_lose = false
var is_health_recover = false
var is_ant_on_fire = false
export (float) var losehp = 0.3
export (float) var gainhp = 0.2
onready var timer = $Timer
export (float) var defaulthealth = 100
var health = defaulthealth
signal health_update(healf)
signal health_recover
signal death
signal burn
func _ready():
	timer.connect("timeout",self,"timeouteh")

func _process(delta):
	if is_health_lose == true:
		health -= losehp
		emit_signal("health_update",health)
		print(health)
	if is_health_recover == true:
		if health < defaulthealth:
			health += gainhp
			emit_signal("health_update",health)
		else:
			health = defaulthealth
	if health == 0 || health < 0:
		emit_signal("death")
	if health == defaulthealth / 2 || health < defaulthealth / 2:
		emit_signal("burn")
		is_health_lose = true
		is_ant_on_fire = true
func health_lose():
	print("a")


func _on_Area2D_health_lose():
	if is_ant_on_fire == false:
		is_health_lose = true
		is_health_recover = false


func _on_Area2D_health_not_lose():
	is_health_lose = false
	timer.start(5)
	print(timer.get_time_left())
func timeouteh():
	is_health_recover = true
	print('timeout')
