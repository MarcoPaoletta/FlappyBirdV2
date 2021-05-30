extends CanvasLayer

func _ready():
	OS.window_fullscreen = true
	
func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_pressed("main_scene"):
		get_tree().change_scene("res://Lobby.tscn")
