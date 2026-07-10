extends Control

var path = "../folderB" 
var scene = ResourceLoader.load("../d_stage_2.tscn") 

# Called when the node enters the scene tree for the first time.
#func _ready():
	#scene = scene.instantiate()
	#add_child(scene)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_line_edit_text_submitted(new_text):
	get_tree().change_scene_to_file("res://Maps/" + $LineEdit.text)
	#get_tree().change_scene_to_file("E:\\PCUSER\\Documents\\SAWEBA-1\\Maps\\d_stage_2.tscn")
	#testfunc()

func testfunc():
	ProjectSettings.load_resource_pack("E:\\PCUSER\\Documents\\SAWEBA-1\\Maps\\d_stage_2.tscn")

func _your_function():
	# This could fail if, for example, mod.pck cannot be found.
	var success = ProjectSettings.load_resource_pack("res://mod.pck")

	if success:
		# Now one can use the assets as if they had them in the project from the start.
		var imported_scene = load("res://mod_scene.tscn")

func _on_button_pressed():
	scene
