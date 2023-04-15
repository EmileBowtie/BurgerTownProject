extends Sprite

func _ready():
# warning-ignore:return_value_discarded
	Global.connect("GameOver",self,"_on_GameOver")
	randomize()
# warning-ignore:return_value_discarded
	Global.connect("RightCONT",self,"RightCONT_handle_c")
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("game_start"):
		$AnimationPlayer.play("Entering")

func _on_GameOver():
	frame = 1

func RightCONT_handle_c():
	$AnimationPlayer.play("Exiting")

func skin_change():
	randomize()
	var a = int(rand_range(1,15))
	texture = load("res://PersonRegularSkins/PersonR%s.png"%str(a))

func _again():
	$AnimationPlayer.play("Entering")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Entering":
		$AnimationPlayer.play("OrderCloudAppear")
	if anim_name == "Exiting":
		$AnimationPlayer.play("OrderCloudReset")
		skin_change()
	if anim_name == "OrderCloudReset":
		_again()
