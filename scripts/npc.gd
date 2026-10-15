extends Node2D
## NPC con el que el jugador puede hablar presionando E (acción "interact").
## Cuando el jugador entra al InteractiveArea y presiona E, se muestra
## el panel de diálogo. Al alejarse, el panel se oculta.

@export var npc_name: String = "Profesor"
@export_multiline var dialog_text: String = "¡Hola, guardián! Los cristales están protegidos por los guardias. Recupera los 3 cristales y vuelve conmigo."

@onready var interactive_area: Area2D = $InteractiveArea

var player_in_range: bool = false


func _ready() -> void:
	interactive_area.body_entered.connect(_on_body_entered)
	interactive_area.body_exited.connect(_on_body_exited)


func _unhandled_input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
		var dialog_box := get_tree().get_first_node_in_group("dialog_box")
		if dialog_box:
			dialog_box.show_dialog(npc_name, dialog_text)
		get_viewport().set_input_as_handled()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		var dialog_box := get_tree().get_first_node_in_group("dialog_box")
		if dialog_box:
			dialog_box.hide_dialog()
