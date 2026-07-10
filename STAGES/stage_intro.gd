extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/anim.play("anim")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("/root/Hud").stageDnum == 1:
		$CanvasLayer/stagenum.text = "Stage 1"
		$CanvasLayer/stagename.text = "On a train"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("4a5059"))
	if get_node("/root/Hud").stageDnum == 2:
		$CanvasLayer/stagenum.text = "Stage 2"
		$CanvasLayer/stagename.text = "Ghostly Fields"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("2ebf1b"))
	if get_node("/root/Hud").stageDnum == 3:
		$CanvasLayer/stagenum.text = "Stage 3"
		$CanvasLayer/stagename.text = "Break in"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("225c54"))
	if get_node("/root/Hud").stageDnum == 4:
		$CanvasLayer/stagenum.text = "Stage 4"
		$CanvasLayer/stagename.text = "Hidden Libary"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("9c3b2b"))
	if get_node("/root/Hud").stageDnum == 5:
		$CanvasLayer/stagenum.text = "Stage 5"
		$CanvasLayer/stagename.text = "Emperor's Throne"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("c90053"))
	if get_node("/root/Hud").stageDnum == 6:
		$CanvasLayer/stagenum.text = "Stage 6"
		$CanvasLayer/stagename.text = "Unyahzim"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("8c2bab"))
	
	if get_node("/root/Hud").stageRnum == 1:
		$CanvasLayer/stagenum.text = "Stage 1"
		$CanvasLayer/stagename.text = "Reaction Road"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("8c2bab"))
	if get_node("/root/Hud").stageRnum == 2:
		$CanvasLayer/stagenum.text = "Stage 2"
		$CanvasLayer/stagename.text = "Control Panel"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("b8002b"))
	if get_node("/root/Hud").stageRnum == 3:
		$CanvasLayer/stagenum.text = "Stage 3"
		$CanvasLayer/stagename.text = "Vents"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("b31a24"))
	if get_node("/root/Hud").stageRnum == 4:
		$CanvasLayer/stagenum.text = "Stage 4"
		$CanvasLayer/stagename.text = "Sewage Process"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("00714a"))
	if get_node("/root/Hud").stageRnum == 5:
		$CanvasLayer/stagenum.text = "Stage 5"
		$CanvasLayer/stagename.text = "Rooftop Rumble"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("0253d9"))
	if get_node("/root/Hud").stageRnum == 6:
		$CanvasLayer/stagenum.text = "Stage 6"
		$CanvasLayer/stagename.text = "Escaping"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("9986ff"))
		
	if get_node("/root/Hud").stageRnum == 7 || get_node("/root/Hud").stageDnum == 7:
		$CanvasLayer/stagenum.text = "Extra Stage"
		$CanvasLayer/stagename.text = "Mosaic Bridge"
		$CanvasLayer/stagename.add_theme_color_override("font_color", Color("0674CF"))
