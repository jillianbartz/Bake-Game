extends Node2D

var up1: bool = true
var up2: bool = true
var up3: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start(.05)
	$BigKnife1.rotation = deg_to_rad(-12)

func _process(delta: float) -> void:
	$BigKnife1.global_position.x -= .8
	$BigKnife2.global_position.x -= .8
	$MedKnife1.global_position.x -= .8
	$MedKnife2.global_position.x -= .8
	$SmallKnife1.global_position.x -= .8
	$SmallKnife2.global_position.x -= .8
	$Butter.global_position.x -= .8

func area1_rotation():
	if(up1):
		if($BigKnife1.rotation >= deg_to_rad(15)):
			up1 = false
		$BigKnife1.rotation += deg_to_rad(1)
		$BigKnife2.rotation += deg_to_rad(1)
		
	else:
		if($BigKnife1.rotation <= deg_to_rad(-15)):
			up1 = true
			$Knife.play()
		$BigKnife1.rotation -= deg_to_rad(1)
		$BigKnife2.rotation -= deg_to_rad(1)

func area2_rotation():
	if(up2):
		if($MedKnife1.rotation >= deg_to_rad(10)):
			up2 = false
			$Knife.play()
		$MedKnife1.rotation += deg_to_rad(1.3)
		$MedKnife2.rotation += deg_to_rad(1.3)
		
	else:
		if($MedKnife1.rotation <= deg_to_rad(-10)):
			up2 = true
		$MedKnife1.rotation -= deg_to_rad(1.3)
		$MedKnife2.rotation -= deg_to_rad(1.3)
		

func area3_rotation():
	if(up3):
		if($SmallKnife1.rotation >= deg_to_rad(12)):
			up3 = false
		$SmallKnife1.rotation += deg_to_rad(2)
		$SmallKnife2.rotation += deg_to_rad(2)
		
	else:
		if($SmallKnife1.rotation <= deg_to_rad(-12)):
			up3 = true
			$Knife.play()
		$SmallKnife1.rotation -= deg_to_rad(2)
		$SmallKnife2.rotation -= deg_to_rad(2)
		

func _on_timer_timeout() -> void:
	area1_rotation()
	area2_rotation()
	area3_rotation()
	$Timer.start(.05)


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://menus/cinnamon-roll-menu.tscn")


func _on_butter_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Boundary")):
		Global.butter_amount_missed += 1
	if(body.is_in_group("Chef")):
		Global.butter_score = 1
		print("game end")
