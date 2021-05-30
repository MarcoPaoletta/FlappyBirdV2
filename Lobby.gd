extends CanvasLayer

func _ready():
	OS.window_fullscreen = true
	
func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func _on_Infinite_pressed():
	get_tree().change_scene("res://Infinite.tscn")

func _on_Level_pressed():
	get_tree().change_scene("res://Level1.tscn")

func _on_Quit_pressed():
	get_tree().quit()
	
func _on_Help_pressed():
	get_tree().change_scene("res://Help.tscn")
		
