extends Node2D

#onready var leaderboardScript = get_node("res://codes/Scores.gd")
var defin = Scores.selected_def1 # Variable to receive the value passed from the previous scene

func _ready():
	# Display the received selected_def in the UI or perform any other actions
	print("Selected Definition:", defin)
	$Label.text = defin
	$scorelabel.text = String(Scores.temp_score)
	$namelabel2.text = Scores.temp_name
	
func _on_Exit_button_pressed():
	SoundEffects.play()
	#get_tree().quit()
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
	Scores.add_score(Scores.temp_name, Scores.temp_score)


func _on_Play_Again_button_pressed():
	SoundEffects.play()
	get_tree().change_scene("res://Scenes/main_game_1.tscn")
