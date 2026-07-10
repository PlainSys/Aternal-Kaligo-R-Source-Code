extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("text")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Start"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
		MusicController.mainMenuMusic()

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("")

func _on_theme_finished():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	MusicController.mainMenuMusic()
