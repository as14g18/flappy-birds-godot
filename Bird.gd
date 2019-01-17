extends Area2D

signal hit

export (int) var speed
var screensize

func start(pos):
	position = pos
	show()

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	else:
		velocity.y += speed
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	$AnimatedSprite.play()

func _on_Bird_area_entered(area):
	hide()
	emit_signal("hit")