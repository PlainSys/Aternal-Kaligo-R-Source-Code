extends Node

var unyahzimtheme = load("res://Assets/Music/S_14.wav")
var finalboss = load("res://Assets/Music/S_15.wav")
var mainMenu = load("res://Assets/Music/S_2.wav")

func play_lastsong():
	$song.stream = unyahzimtheme
	$song.play()
	
func finalbossMusic():
	$song.stream = finalboss
	$song.play()

func mainMenuMusic():
	$song.stream = mainMenu
	$song.play()

func stopSong():
	$song.stop()

func _process(_delta):
	if get_tree().current_scene.name == "gameover":
		pass
