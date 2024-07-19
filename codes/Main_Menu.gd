extends Node2D

#JUMP TO CATEGORY SCENE ON PRESS

func _on_Start_Button_pressed():
	SoundEffects.play()
	Scores.resetGlobal()
	#print("initial player:" ,Scores.temp_name)
	get_tree().change_scene("res://Scenes/name_input.tscn")

#QUIT APPLICATION ON PRESS
func _on_Quit_Button_pressed():
	SoundEffects.play()
	get_tree().quit()
	pass


func _on_Leaderboard_Button_pressed():
	SoundEffects.play()
	get_tree().change_scene("res://leaderboards.tscn")
	pass
