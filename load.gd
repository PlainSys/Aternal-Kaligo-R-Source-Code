extends CanvasLayer

@onready var loading_scene = preload("res://load.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func load_scene(current_scene, next_scene):
	var loading_scene_instance = loading_scene.instance()
	get_tree().get_root().call_deferred("add_child", loading_scene_instance)
	
	var loader = ResourceLoader.load_threaded_request(next_scene)
	
	if loader == null:
		pass
		
	current_scene.queue_free()
	
	#await(get_tree().create_timer(0.5),"timeout")
