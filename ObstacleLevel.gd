extends Node2D
var Vector = Vector2()
func _process(_delta):
	position += Vector2(-4,0)
	if position.x < -300:
		queue_free()


func _on_ScoreArea_body_exited(body):
	if body is Player:
		$Point.play()

