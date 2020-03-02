extends Camera2D

var _decay_rate = 0.4
var _max_offset = 20

var _start_position
var _trauma

# Called when the node enters the scene tree for the first time.
func _ready():
	_start_position = position
	_trauma = 0.0

func add_trauma(amount):
	_trauma = min(_trauma + amount, 1)

func _process(delta):
	if _trauma > 0:
		_decay_trauma(delta)
		_apply_shake()

func _decay_trauma(delta):
	var change = _decay_rate  * delta
	_trauma
