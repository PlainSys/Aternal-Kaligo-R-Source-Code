extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 5
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_col_1_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5.tscn")

func _on_col_2_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5.tscn")

func _on_btntimer_timeout():
	$door2.hide()
	$door2/CollisionShape2D.set_deferred("disabled", true)

func _on_ice_area_entered(area):
	if area.name == "Bullet":
		$Ice/CollisionShape2D.set_deferred("disabled", true)
		$Ice/ColorRect.hide()

func _on_btntimer_2_timeout():
	$door1.hide()
	$door1/CollisionShape2D.set_deferred("disabled", true)

func _on_btn_3_body_entered(body):
	if body.name == "player":
		$door3/CollisionShape2D.set_deferred("disabled", true)
		$door3.hide()
		$btn2.play()

func _on_btntimer_3_timeout():
	$bridge.show()
	$col1/CollisionShape2D.set_deferred("disabled", true)
	$col2/CollisionShape2D.set_deferred("disabled", false)


func _on_soulsand_3_area_entered(area):
	if area.name == "Bullet":
		$player.SPEED += 50

func _on_soulsand_body_entered(body):
	if body.name == "player":
		$player.SPEED = 218

func _on_soulsand_2_body_entered(body):
	if body.name == "player":
		$player.SPEED = 450


func _on_btn_5_body_entered(body):
	$door4.hide()
	$door4/CollisionShape2D.set_deferred("disabled", true)
	$btn2.play()


func _on_thing_area_entered(area):
	$col3/CollisionShape2D.set_deferred("disabled", true)

func _on_end_area_entered(area):
	if area.name == "phitbox":
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5_dialog.tscn")
