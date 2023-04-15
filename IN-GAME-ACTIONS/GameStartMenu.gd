extends CanvasLayer



func _ready():
	visible = true
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("game_start"):
		visible = false

