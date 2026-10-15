extends Control
## Cuadro de diálogo que usa la imagen assets/ui/47_panel_dialogo.png
## como fondo. Por ahora solo se muestra y se oculta (sin avanzar texto).

@onready var name_label: Label = $Panel/NameLabel
@onready var text_label: Label = $Panel/TextLabel


func _ready() -> void:
	add_to_group("dialog_box")
	hide()


func show_dialog(speaker: String, text: String) -> void:
	name_label.text = speaker
	text_label.text = text
	show()


func hide_dialog() -> void:
	hide()
