extends Node2D

var circuit = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageRnum = 3
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_body_entered(body):
	if body.name == "player":
		$door1/CollisionShape2D.set_deferred("disabled", true)
		$door1.hide()


func _on_btn_2_body_entered(body):
	if body.name == "player":
		$door3/CollisionShape2D.set_deferred("disabled", true)
		$door3.hide()

func _on_btntime_timeout():
	$door2/CollisionShape2D.set_deferred("disabled", true)
	$door2.hide()

func _on_btn_4_body_entered(body):
	if body.name == "player":
		$door4/CollisionShape2D.set_deferred("disabled", true)
		$door4.hide()


func _on_circuitthing_area_entered(area):
	if area.name == "sword1":
		circuit += 1
		#$hit.play()
		if circuit == 4:
			$door5/ColorRect.hide()
			$door5/CollisionShape2D.set_deferred("disabled", true)
			$water.show()


func _on_btn_5_body_entered(body):
	if body.name == "player":
		$door6/CollisionShape2D.set_deferred("disabled", true)
		$door6.hide()


func _on_exit_area_entered(area):
	pass
