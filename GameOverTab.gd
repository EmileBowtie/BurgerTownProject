extends CanvasLayer


func _ready():
	visible = false
	$Shadow.visible = false
	$Button.visible = false
# warning-ignore:return_value_discarded
	Global.connect("GameOver",self,"GameOver_handle")
	pass 

func GameOver_handle():
	$Shadow.visible = true
	visible = true
	$AnimationPlayer.play("GameOverRelease")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "GameOverRelease":
		$Button.visible = true


func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
