extends Area2D

export (int) var speed

func _on_Visibility_screen_exited():
    queue_free()

func _process(delta):
	position.x -= speed