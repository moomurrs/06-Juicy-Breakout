extends ColorRect


func _ready():
	color = Color(.5,.5,1,1)
	connect("paddleSignal", self, "paddle_signal_received")
	

func paddle_signal_received():
	 color = Color(1,1,1,1)
