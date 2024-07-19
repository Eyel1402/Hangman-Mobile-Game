extends Node

var richTextLabel: RichTextLabel
var leaderboard = []

func _ready():
	richTextLabel = $leader_label
	print_leaderboard()

func print_leaderboard() -> void:
	var leaderboardData = Scores.get_leaderboard()
	var leaderboardText: String = "[center]Leaderboard:[/center]\n"

	for i in range(leaderboardData.size()):
		var entry = leaderboardData[i]
		leaderboardText += str(i + 1) + ". " + entry["name"] + ": " + str(entry["score"]) + "\n"

	set_leaderboard_text(leaderboardText)

func set_leaderboard_text(text: String) -> void:
	if richTextLabel:
		richTextLabel.bbcode_text = text
	else:
		print("RichTextLabel node not found.")

func _on_Back_button_pressed():
	$clicks.play()
	$clicks.stop()
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
