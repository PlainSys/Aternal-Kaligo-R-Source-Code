extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$rng1.visible = false
	$rng2.visible = false
	$rng3.visible = false
	#$rng1.interactive = false
	#$rng2.interactive = false
	#$rng3.interactive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var random_float =  RandomNumberGenerator.new().randf_range(0, 1)

func _on_rng_timeout():
	$rng.stop()
	if random_float < 0.5:
		#$rng1.interactive = true
		$rng1.visible = true
		$rng2.visible = false
		#$rng2.interactive = false
		#$rng3.interactive = false
		$rng3.visible = false
	elif random_float < 0.7:
		#$rng2.interactive = true
		$rng2.visible = true
		$rng1.visible = false
		$rng3.visible = false
		#$rng3.interactive = false
		#$rng1.interactive = false
	else:
		#$rng3.interactive = true
		$rng3.visible = true
		$rng1.visible = false
		$rng3.visible = false
		#$rng2.interactive = false
		#$rng1.interactive = false
	#else:
	#	$rng1.is_layer_enabled(false)
	#	$rng2.is_layer_enabled(false)
	#	$rng3.is_layer_enabled(false)


func _on_death_timeout():
	$Dibs/death.stop()
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$CanvasLayer/Label.show()
	$theme.stop()
	$CanvasLayer/StageEnd/music.play()
