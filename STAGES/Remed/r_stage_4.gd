extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("/root/Hud").doorkills == 5:
		$Door/CollisionShape2D.set_deferred("disabled", true)
		$Door/ColorRect.hide()
	if get_node("/root/Hud").doorkills == 8:
		$Door4/CollisionShape2D.set_deferred("disabled", true)
		$Door4/ColorRect.hide()

var wheel = 0

func _on_circle_area_entered(area):
	if area.name == "sword1":
		wheel += 1
		$wheel.play()
		if wheel == 1:
			$water2.hide()
			$water3.show()
		if wheel == 2:
			$water3.hide()
			$Water/ColorRect.hide()
			$Water/CollisionShape2D.set_deferred("disabled", true)


func _on_button_area_entered(area):
	if area.name == "sword1":
		$btn.play()
		$Door5/CollisionShape2D.set_deferred("disabled", true)
		$Door5/ColorRect.hide()

func _on_button_2_area_entered(area):
	if area.name == "sword1":
		$btn.play()
		$Door7/CollisionShape2D.set_deferred("disabled", true)
		$Door7/ColorRect.hide()
		
func _on_button_3_area_entered(area):
	if area.name == "sword1":
		$btn.play()
		$Water2/CollisionShape2D.set_deferred("disabled", true)
		$Water2/ColorRect.hide()

func _on_button_4_area_entered(area):
	if area.name == "sword1":
		$btn.play()
		$Door8/CollisionShape2D.set_deferred("disabled", true)
		$Door8/ColorRect.hide()

func _on_button_5_area_entered(area):
	if area.name == "sword1":
		$btn.play()
		$Door6/CollisionShape2D.set_deferred("disabled", true)
		$Door6/ColorRect.hide()

func _on_pipe_body_entered(body):
	if body.name == "player":
		$Door9/ColorRect.hide()
		$Door9/CollisionShape2D.set_deferred("disabled", true)


func _on_exit_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_4_boss.tscn")
