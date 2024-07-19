extends Node2D

func _ready():
	$scorelabel.text = String(Scores.temp_score)
	$namelabel2.text = Scores.temp_name

#JUMP TO MAIN GAME ON PRESS
func _on_Play_Again_button_pressed():
	SoundEffects.play()
	get_tree().change_scene("res://Scenes/main_game_1.tscn")


#JUMP TO MAIN MENU ON PRESS
func _on_Exit_button_pressed():
	SoundEffects.play()
	Scores.add_score(Scores.temp_name, Scores.temp_score)
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
