extends StaticBody2D

var points = 10

onready var _target = position
onready var t = $Timer

var _dying = 0.0
var _dying_delta = 0.1
var _dying_color_delta = .05
var _dying_rotate = 0.0
var _dying_rotate_delta = rand_range(-.03, .03)
var _dying_threshold = 10

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


func _process(delta):
	if _dying > 0:
		_dying += _dying_delta
		position.y += _dying
		rotate(_dying_rotate)
		_dying_rotate += _dying_rotate_delta
		$ColorRect.color = $ColorRect.color.linear_interpolate(Color(0,0,0,0), _dying_color_delta)
	
	if _dying > _dying_threshold:
		queue_free()

func kill():
	_dying += _dying_delta
	$CollisionShape2D.queue_free()
