extends Node

var temp_name = ""
var temp_score = 10
var selected_def1
var seconds = 0
var minute = 0
var Dseconds = 30 # DEFAULT SECONDS
var Dminute = 1 # DEFAULT MINUTES

var leaderboard = []
var leaderboardFile = "res://Database/leaderboard.res"
var maxEntries = 10

func _ready() -> void:
	load_leaderboard()
	sort_leaderboard()
	save_leaderboard()

func add_score(name: String, score: int) -> void:
	leaderboard.append({"name": name, "score": score})
	sort_leaderboard()
	if leaderboard.size() > maxEntries:
		leaderboard.resize(maxEntries)
	save_leaderboard()

func sort_leaderboard() -> void:
	var leaderboardSize = leaderboard.size()
	for i in range(leaderboardSize - 1):
		for j in range(i + 1, leaderboardSize):
			var entryA = leaderboard[i]
			var entryB = leaderboard[j]
			if entryA["score"] < entryB["score"]:
				var tempEntry = entryA
				leaderboard[i] = entryB
				leaderboard[j] = tempEntry

func get_leaderboard() -> Array:
	return leaderboard

func print_leaderboard() -> void:
	var leaderboardData = get_leaderboard()
	var leaderboardText: String = ""
	leaderboardText = "Leaderboard:\n"

	for i in range(leaderboardData.size()):
		var entry = leaderboardData[i]
		leaderboardText += str(i + 1) + ". " + entry["name"] + ": " + str(entry["score"]) + "\n"

	print(leaderboardText)

func save_leaderboard() -> void:
	var file = File.new()
	if file.open(leaderboardFile, File.WRITE) == OK:
		for entry in leaderboard:
			file.store_line(entry["name"] + ":" + str(entry["score"]))

		file.close()

func load_leaderboard() -> void:
	var file = File.new()
	if file.file_exists(leaderboardFile):
		if file.open(leaderboardFile, File.READ) == OK:
			leaderboard.clear()

			while !file.eof_reached():
				var line = file.get_line().strip_edges()
				if line != "":
					var entryData = line.split(":")
					if entryData.size() == 2:
						var name = entryData[0].strip_edges()
						var score = entryData[1].strip_edges().to_int()
						leaderboard.append({"name": name, "score": score})

			file.close()

func clear_leaderboard() -> void:
	leaderboard.clear()
	save_leaderboard()

func resetGlobal() -> void:
	temp_name = ""
	temp_score = 10
