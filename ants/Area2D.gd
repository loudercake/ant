extends Area2D
var hasitbeenpausedyet = false
export (int) var timeleft = 0
var chaos = false
onready var timer = $Timer
signal death
signal chaos

func _process(delta):
	timeleft = timer.get_time_left()
	if timeleft < 1.5 && timeleft != 0 && chaos == false:
		print(timeleft)
		death()

func _on_Area2D_area_entered(area):
	if chaos == false:
		timer.set_paused(false)
		timer.start()

func _on_Area2D_area_exited(area):
	if chaos == false:
		timer.start()
		timer.set_paused(true)


func _on_Timer_timeout():
	emit_signal("death")
func death():
	timer.set_paused(false)
	timer.start(2.0)
	print(timeleft)
	emit_signal("chaos")
	chaos = true
