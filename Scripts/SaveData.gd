extends Resource

const SAVE_GAME_PATH := "user://saveData.save"

var extraStageUnlocked = 0
var berzerk1cc = 0

func save():
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)
	file.store_var(extraStageUnlocked)
	file.store_var(berzerk1cc)

func load_data():
	if FileAccess.file_exists(SAVE_GAME_PATH):
		var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
		extraStageUnlocked = file.get_var(extraStageUnlocked)
		berzerk1cc = file.get_var(berzerk1cc)
	else:
		extraStageUnlocked = 0
		berzerk1cc = 0
