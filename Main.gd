extends Node

export (PackedScene) var Pipe
var score

func _ready():
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.25 - window_size*0.25)
	
	randomize()
	new_game()
	
func game_over():
	$ScoreTimer.stop()
	$PipeTimer.stop()
	
func new_game():
	score = 0
	$HUD.update_score(score)
	$Bird.start($StartPosition.position)
	$PipeTimer.start()
	$ScoreTimer.start()

func _on_Bird_hit():
	for child in self.get_children():
		if (child.has_method("_on_Visibility_screen_exited")):
        child.queue_free();

	game_over()
	new_game()

func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_PipeTimer_timeout():
	$PipePath/PipeSpawnLocation.set_offset(randi())
	var pipe = Pipe.instance()
	add_child(pipe)
	pipe.position = $PipePath/PipeSpawnLocation.position