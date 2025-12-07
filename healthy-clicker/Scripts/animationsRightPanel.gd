extends Panel

@onready var sanduiche_button: Button = $SanduicheButton
@onready var exercicios_button: Button = $ExerciciosButton

func _ready() -> void:
	sanduiche_button.pivot_offset = sanduiche_button.size / 2

func _on_sanduiche_button_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(sanduiche_button, "scale", Vector2(.9, .9), .1)


func _on_sanduiche_button_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(sanduiche_button, "scale", Vector2(1, 1), .1)
