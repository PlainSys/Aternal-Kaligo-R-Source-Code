extends Node2D

var completedoor = 0
var completedoor2 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageRnum = 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if completedoor == 1 && completedoor2 == 1:
		$door5/CollisionShape2D.set_deferred("disabled", true)
		$door5.hide()


func _on_btntimer_1_timeout():
	$door1/CollisionShape2D.set_deferred("disabled", true)
	$door1.hide()

func _on_btntimer_2_timeout():
	$door2/CollisionShape2D.set_deferred("disabled", true)
	$door2.hide()

func _on_btntimer_4_timeout():
	completedoor = 1
	$redting1.color = Color(0, 0.39, 0, 1)

func _on_btntimer_3_timeout():
	completedoor2 = 1
	$redting2.color = Color(0, 0.39, 0, 1)


func _on_btn_3_body_entered(body):
	if body.name == "player":
		$door3/CollisionShape2D.set_deferred("disabled", true)
		$door3.hide()

func _on_btntimer_5_timeout():
	$door4/CollisionShape2D.set_deferred("disabled", true)
	$door4.hide()

func _on_box_area_entered(area):
	$glass/CollisionShape2D.set_deferred("disabled", true)
	$glass.hide()


func _on_end_stage_area_entered(area):
	if area.name == "rhitbox":
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_2_boss.tscn")
