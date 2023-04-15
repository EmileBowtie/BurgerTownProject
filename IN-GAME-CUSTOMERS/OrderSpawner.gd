extends Node2D

var BottomBun = preload("res://IN-GAME-INGREDIENTS/BottomBun.tscn")
var Patty = preload("res://IN-GAME-INGREDIENTS/Patty.tscn")
var Cheese = preload("res://IN-GAME-INGREDIENTS/Cheese.tscn")
var Tomato = preload("res://IN-GAME-INGREDIENTS/Tomato.tscn")
var Onion = preload("res://IN-GAME-INGREDIENTS/Onion.tscn")
var Pickles = preload("res://IN-GAME-INGREDIENTS/Pickles.tscn")
var TopBun = preload("res://IN-GAME-INGREDIENTS/TopBun.tscn")

var Order_Layer_1 = null
var Order_Layer_2 = null
var Order_Layer_3 = null
var Order_Layer_4 = null
var Order_Layer_5 = null
var Order_Layer_6 = null

var OL1_MADE = false
var OL2_MADE = false
var OL3_MADE = false
var OL4_MADE = false
var OL5_MADE = false
var OL6_MADE = false

var GENERAL_INGREDIENTS = [Patty,Cheese,Tomato,Onion,Pickles,TopBun]
var INGREDIENTS_FOR_4 = [Patty,Cheese,Tomato,Onion,Pickles]

func _ready():
	randomize()

func order_creation():
	randomize()
	if !OL1_MADE:
		Order_Layer_1 = BottomBun.instance()
		Order_Layer_1.position = Vector2(243,263)
		add_child(Order_Layer_1)
		if Order_Layer_1 == BottomBun:
			Global.OL1_NUMBER = 0
		OL1_MADE = true
	if !OL2_MADE:
		var Layer2 = GENERAL_INGREDIENTS[randi()%GENERAL_INGREDIENTS.size()]
		Order_Layer_2 = Layer2.instance()
		if Layer2 == TopBun:
			Order_Layer_2.position = Vector2(243,195)
			Global.OL2_NUMBER = 6
			OL3_MADE = true
			OL4_MADE = true
			OL5_MADE = true
			OL6_MADE = true
		if Layer2 == Patty:
			Order_Layer_2.position = Vector2(243,220)
			Global.OL2_NUMBER = 1
		if Layer2 == Cheese:
			Order_Layer_2.position = Vector2(243,226)
			Global.OL2_NUMBER = 2
		if Layer2 == Tomato:
			Order_Layer_2.position = Vector2(243,225)
			Global.OL2_NUMBER = 3
		if Layer2 == Onion:
			Order_Layer_2.position = Vector2(243,224)
			Global.OL2_NUMBER = 4
		if Layer2 == Pickles:
			Order_Layer_2.position = Vector2(243,225)
			Global.OL2_NUMBER = 5
		add_child(Order_Layer_2)
		OL2_MADE = true
	if !OL3_MADE:
		var Layer3 = GENERAL_INGREDIENTS[randi()%GENERAL_INGREDIENTS.size()]
		Order_Layer_3 = Layer3.instance()
		if Layer3 == TopBun:
			Order_Layer_3.position = Vector2(254,160)
			Global.OL3_NUMBER = 6
			OL4_MADE = true
			OL5_MADE = true
			OL6_MADE = true
		if Layer3 == Patty:
			Order_Layer_3.position = Vector2(254,186)
			Global.OL3_NUMBER = 1
		if Layer3 == Cheese:
			Order_Layer_3.position = Vector2(254,192)
			Global.OL3_NUMBER = 2
		if Layer3 == Tomato:
			Order_Layer_3.position = Vector2(254,191)
			Global.OL3_NUMBER = 3
		if Layer3 == Onion:
			Order_Layer_3.position = Vector2(254,191)
			Global.OL3_NUMBER = 4
		if Layer3 == Pickles:
			Order_Layer_3.position = Vector2(254,191)
			Global.OL3_NUMBER = 5
		add_child(Order_Layer_3)
		OL3_MADE = true
	if !OL4_MADE:
		var Layer4 = INGREDIENTS_FOR_4[randi()%INGREDIENTS_FOR_4.size()]
		Order_Layer_4 = Layer4.instance()
		if Layer4 == TopBun:
			Order_Layer_4.position = Vector2(254,125)
			Global.OL4_NUMBER = 6
			OL5_MADE = true
			OL6_MADE = true
		if Layer4 == Tomato:
			Order_Layer_4.position = Vector2(254,156)
			Global.OL4_NUMBER = 3
		if Layer4 == Onion:
			Order_Layer_4.position = Vector2(254,156)
			Global.OL4_NUMBER = 4
		if Layer4 == Cheese:
			Order_Layer_4.position = Vector2(254,157)
			Global.OL4_NUMBER = 2
		if Layer4 == Patty:
			Order_Layer_4.position = Vector2(254,151)
			Global.OL4_NUMBER = 1
		if Layer4 == Pickles:
			Order_Layer_4.position = Vector2(254,156)
			Global.OL4_NUMBER = 5
		add_child(Order_Layer_4)
		OL4_MADE = true
	if !OL5_MADE:
		var Layer5 = GENERAL_INGREDIENTS[randi()%GENERAL_INGREDIENTS.size()]
		Order_Layer_5 = Layer5.instance()
		if Layer5 == TopBun:
			Order_Layer_5.position = Vector2(254,90)
			Global.OL5_NUMBER = 6
			OL6_MADE = true
		if Layer5 == Tomato:
			Order_Layer_5.position = Vector2(254,121)
			Global.OL5_NUMBER = 3
		if Layer5 == Onion:
			Order_Layer_5.position = Vector2(254,121)
			Global.OL5_NUMBER = 4
		if Layer5 == Patty:
			Order_Layer_5.position = Vector2(254,116)
			Global.OL5_NUMBER = 1
		if Layer5 == Cheese:
			Order_Layer_5.position = Vector2(254,122)
			Global.OL5_NUMBER = 2
		if Layer5 == Pickles:
			Order_Layer_5.position = Vector2(254,121)
			Global.OL5_NUMBER = 5
		add_child(Order_Layer_5)
		OL5_MADE = true
	if !OL6_MADE:
		Order_Layer_6 = TopBun.instance()
		Order_Layer_6.position = Vector2(254,77)
		Global.OL6_NUMBER = 6
		add_child(Order_Layer_6)
		OL6_MADE = true
	reset_order()
	pass

func reset_order():
	OL1_MADE = false
	OL2_MADE = false
	OL3_MADE = false
	OL4_MADE = false
	OL5_MADE = false
	OL6_MADE = false
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "OrderCloudAppear":
		order_creation()
