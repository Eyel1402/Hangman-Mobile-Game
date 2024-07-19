extends Node2D

onready var instructionsLabel = $instruction_label
onready var submitButton = $MarginContainer2/Keyboard_Container/Keyboard_Container/submit/Submit_button

var playerName = ""

func _ready():
	clear_name_input()
	submitButton.disabled = true

func _on_Button_pressed(button):
	var buttonText = button.text

	if buttonText == "Backspace":
		playerName = playerName.substr(0, playerName.length() - 1)
	else:
		playerName += buttonText

	submitButton.disabled = playerName.empty()

func _on_Submit_button_pressed():
	SoundEffects.play()
	if playerName.empty():
		return

	# Perform the desired actions with the player name
	print("Player name:", playerName)
	#$name_line.text = playerName
	Scores.temp_name += playerName
	get_tree().change_scene("res://Scenes/main_game_1.tscn")

func clear_name_input():
	playerName = ""
	submitButton.disabled = true


## KEYBOARD BUTTONS ##

func _on_Q_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("Q")

func _on_W_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("W")

func _on_E_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("E")

func _on_R_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("R")

func _on_T_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("T")

func _on_Y_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("Y")


func _on_U_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("U")

func _on_I_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("I")


func _on_O_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("O")


func _on_P_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("P")


func _on_A_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("A")


func _on_S_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("S")


func _on_D_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("D")


func _on_F_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("F")


func _on_G_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("G")


func _on_H_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("H")


func _on_J_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("J")


func _on_K_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("K")

func _on_L_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("L")


func _on_Z_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("Z")


func _on_X_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("X")


func _on_C_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("C")


func _on_V_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("V")


func _on_B_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("B")


func _on_N_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("N")


func _on_M_button_pressed():
	SoundEffects.play()
	handle_keyboard_input("M")

func _on_space_button_pressed():
	SoundEffects.play()
	handle_keyboard_input(" ")

func _on_back_button_pressed():
	SoundEffects.play()
	if playerName.length() > 0:
		playerName = playerName.substr(0, playerName.length() - 1)
		submitButton.disabled = playerName.empty()
		$name_label.text = playerName

func handle_keyboard_input(key):
	SoundEffects.play()
	playerName += key
	submitButton.disabled = playerName.empty()
	$name_label.text = playerName
	print(playerName)

func _on_backward_button_pressed():
	SoundEffects.play()
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
