extends Node2D

var list = []
var defin = []
var hints = []
var selected_word
var selected_def
var selected_hint
var selected_word_breakdown = []
var letters_needed
var hidden_word = []
var hangman_lives = 8
var secret_word
var word_list_file = "res://Database/Category_1.res"
var def_file = "res://Database/Category_1_def.res"
var hint_file = "res://Database/Category_1_Hints.res"
var seconds = 0
var minute = 0
var Dseconds = 30 #DEFAULT SECONDS
var Dminute = 1 #DEFAULT MINUTES


func _ready():
	
	$MarginContainer/Keyboard_Container/Hint_Container/Hint_button.disabled= true
	$MarginContainer/Keyboard_Container/Hint_Label.hide()
	randomize()
	load_word_list()
	load_def_list()
	load_hint_list()
	new_game()
	Reset_Timer()

#LOAD LIST OF WORDS
func load_word_list():
	var file = File.new()
	if file.file_exists(word_list_file) && file.open(word_list_file, File.READ) == OK:
		while !file.eof_reached():
			var line = file.get_line()
			if line != "":
				list.append(line)
		file.close()

#LOAD LIST OF DEFINITION
func load_def_list():
	var file1 = File.new()
	if file1.file_exists(def_file) && file1.open(def_file, File.READ) == OK:
		while !file1.eof_reached():
			var line = file1.get_line()
			if line != "":
				defin.append(line)
		file1.close()

#LOAD LIST OF HINTS
func load_hint_list():
	var file2 = File.new()
	if file2.file_exists(hint_file) && file2.open(hint_file, File.READ) == OK:
		while !file2.eof_reached():
			var line = file2.get_line()
			if line != "":
				hints.append(line)
		file2.close()

func save_word_list():
	var file = File.new()
	if file.open(file, File.WRITE) == OK:
		for word in list:
			file.put_line(word)
		file.close()

func new_game():
	choose_random_word()
	breakdown_random_word()
	prepare_hidden_word()
	convert_to_string()
	definition_print()

func choose_random_word():
	var identifier = randi() % list.size()
	selected_word = list[identifier]
	selected_def = defin[identifier]
	selected_hint = hints[identifier]
	print("SELECTED_WORD: ", selected_word)
	Scores.selected_def1 = selected_def
	print("SELECTED_DEF: ", selected_def)
	print("SELECTED_HINT: ", selected_hint)

func breakdown_random_word():
	for letters in selected_word:
		selected_word_breakdown.append(letters)

func prepare_hidden_word():
	for letters in selected_word:
		hidden_word.append("  _  ")

func check_word_for_letter(_single_letter):
	var count = 0
	var letter_found1 = false
	for i in selected_word_breakdown:
		if _single_letter == i:
			hidden_word[count] = i + " "
			letter_found1 = true
		count += 1
		convert_to_string()
	if !letter_found1:
		hangman_lives -= 1
		check_for_hangman()
	check_win_condition()

func convert_to_string():
	var secret_word = ""
	for i in hidden_word:
		secret_word += String(i)
	print("Secret_Word: ", secret_word)
	$MarginContainer/Label_Container/Hidden_Label_Container/VBoxContainer/Hidden_Word_Label.text = secret_word

func definition_print():
	pass


func check_win_condition():
	var secret_word = ""
	for i in hidden_word:
		secret_word += String(i)
	print("SECRET_WORD: ", secret_word)
	var word1 = secret_word
	var word2 = selected_word
	var word3 = []
	var word4 = ""
	for i in word1:
		if !i == " ":
			word3.append(i)
	
	for x in word3:
		word4 += String(x)
	if word4 == word2:
		Scores.temp_score += 10
		end_game()

func end_game():
	get_tree().change_scene("res://Scenes/win_game.tscn")
#	# Before changing to the next scene, create an instance of the scene
#	var next_scene = load("res://Scenes/win_game.tscn")
#	var next_scene_instance = next_scene.instance()
#	next_scene_instance.selected_def = selected_def  # Pass the variable value as an argument
#
## Add the instance to the scene tree
#	get_tree().get_root().add_child(next_scene_instance)
#
## Remove the current scene from the scene tree
#	queue_free()


func lose_game():
	print("LIVES: ", hangman_lives)
	print("LOSE")
	
	get_tree().change_scene("res://Scenes/lose_game.tscn")

func check_for_hangman():
	print("LIVES: ", hangman_lives)
	if hangman_lives == 4:
		$MarginContainer/Keyboard_Container/Hint_Container/Hint_button.disabled = false
	elif hangman_lives <= 0:
		lose_game()

#BUTTON PRESS=================
func _on_Q_button_pressed():
	check_word_for_letter("q")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/Q_button.disabled = true
func _on_W_button_pressed():
	check_word_for_letter("w")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/W_button.disabled = true
func _on_E_button_pressed():
	check_word_for_letter("e")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/E_button.disabled = true
func _on_R_button_pressed():
	check_word_for_letter("r")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/R_button.disabled = true
func _on_T_button_pressed():
	check_word_for_letter("t")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/T_button.disabled = true
func _on_Y_button_pressed():
	check_word_for_letter("y")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/Y_button.disabled = true
func _on_U_button_pressed():
	check_word_for_letter("u")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/U_button.disabled = true
func _on_I_button_pressed():
	check_word_for_letter("i")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/I_button.disabled = true
func _on_O_button_pressed():
	check_word_for_letter("o")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/O_button.disabled = true
func _on_P_button_pressed():
	check_word_for_letter("p")
	$MarginContainer/Keyboard_Container/Keyboard_Container_1/P_button.disabled = true
func _on_A_button_pressed():
	check_word_for_letter("a")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/A_button.disabled = true
func _on_S_button_pressed():
	check_word_for_letter("s")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/S_button.disabled = true
func _on_D_button_pressed():
	check_word_for_letter("d")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/D_button.disabled = true
func _on_F_button_pressed():
	check_word_for_letter("f")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/F_button.disabled = true
func _on_G_button_pressed():
	check_word_for_letter("g")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/G_button.disabled = true
func _on_H_button_pressed():
	check_word_for_letter("h")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/H_button.disabled = true
func _on_J_button_pressed():
	check_word_for_letter("j")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/J_button.disabled = true
func _on_K_button_pressed():
	check_word_for_letter("k")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/K_button.disabled = true
func _on_L_button_pressed():
	check_word_for_letter("l")
	$MarginContainer/Keyboard_Container/Keyboard_Container_2/L_button.disabled = true
func _on_Z_button_pressed():
	check_word_for_letter("z")
	$MarginContainer/Keyboard_Container/Keyboard_Container_3/Z_button.disabled = true
func _on_X_button_pressed():
	check_word_for_letter("x")
	$MarginContainer/Keyboard_Container/Keyboard_Container_3/X_button.disabled = true
func _on_C_button_pressed():
	check_word_for_letter("c")
	$MarginContainer/Keyboard_Container/Keyboard_Container_3/C_button.disabled = true
func _on_V_button_pressed():
	check_word_for_letter("v")
	$MarginContainer/Keyboard_Container/Keyboard_Container_3/V_button.disabled = true
func _on_B_button_pressed():
	check_word_for_letter("b")
	$MarginContainer/Keyboard_Container/Keyboard_Container_3/B_button.disabled = true
func _on_N_button_pressed():
	check_word_for_letter("n")
	$MarginContainer/Keyboard_Container/Keyboard_Container_3/N_button.disabled = true
func _on_M_button_pressed():
	check_word_for_letter("m")
	$MarginContainer/Keyboard_Container/Keyboard_Container_3/M_button.disabled = true
func _on_Hint_button_pressed():
	$MarginContainer/Keyboard_Container/Hint_Label.show()
	$MarginContainer/Keyboard_Container/Hint_Label.text = selected_hint


func _on_Timer_timeout():
	
	if seconds == 0:
		if minute > 0:
			minute -= 1
			seconds = 60
		seconds -= 1
	
	$timer_label.text = String(minute) + ":" + String(seconds)
	pass # Replace with function body.
	
func Reset_Timer():
	seconds = 0 #seconds
	minute = 0 #minutes
