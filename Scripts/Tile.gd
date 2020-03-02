extends StaticBody2D

var points = 10

onready var _target = position
onready var t = $Timer

func _ready():
	position.y = -30
	var time = rand_range(0, 2.5)
	t.set_wait_time(time)
	t.start()
	# do not do anything else in this scipt until this single tile has timeout
	yield(t, "timeout")
	# after timeout, interpolate tween on this one tile
	$Tween.interpolate_property(self, "position", position, _target, 2.0, Tween.TRANS_BOUNCE,Tween.EASE_OUT)
	$Tween.start()
