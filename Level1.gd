extends Node2D

func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().quit()
	if Input.is_action_pressed("main_scene"):
		get_tree().change_scene("res://Lobby.tscn")

func _ready():
	OS.window_fullscreen = true

func deleate_obstacles():
	$ObstacleLevel.position.x = 1000
	$ObstacleLevel2.position.x = 1000
	$ObstacleLevel3.position.x = 1000
	$ObstacleLevel4.position.x = 1000
	$ObstacleLevel5.position.x = 1000
	
func hide_obstacles():
	$ObstacleLevel.hide()
	$ObstacleLevel2.hide()
	$ObstacleLevel3.hide()
	$ObstacleLevel4.hide()
	$ObstacleLevel5.hide()	
	
func show_go_message(texto):
	$LabelsRelated/GameOverLabel.text = texto
	$LabelsRelated/GameOverLabel.show()
	$LabelsRelated/TimerLabel.start()
	
func go_message():
	show_go_message("Game Over")
	yield($LabelsRelated/TimerLabel,"timeout")
	$LabelsRelated/GameOverLabel.show()
	get_tree().change_scene("res://Lobby.tscn")

func win_message():
	show_go_message("You Win!")
	yield($LabelsRelated/TimerLabel,"timeout")
	$LabelsRelated/WinLabel.show()
	get_tree().change_scene("res://Lobby.tscn")

func _on_DeathZone_body_entered(body):
	if body is Player:
		$Player/Hit.play()
		$Ground/AnimationPlayer.stop()
		$Player/AnimationPlayer.stop()
		$PlayingMusic.stop()
		deleate_obstacles()
		go_message()


func _on_Pipe_body_entered(body):
	if body is Player:
		deleate_obstacles()
		$Player/Hit.play()
		$Ground/AnimationPlayer.stop()
		$Player/AnimationPlayer.stop()
		$PlayingMusic.stop()
		hide_obstacles()
		go_message()
	


func _on_Line_body_entered(body):
	if body is Player:
		$Player/AnimationPlayer.stop()
		$Ground.queue_free()
		win_message()
