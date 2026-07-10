extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_2_timeout():
	$CanvasLayer/StageEnd.show()
	$Theme.stop()
	$CanvasLayer/StageEnd/music.play()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$player.SPEED = 0
	$player.invis = true
