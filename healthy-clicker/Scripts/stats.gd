extends VBoxContainer

@onready var healty_points_label: Label = $HealtyPointsLabel
@onready var healty_points_per_second: Label = $HealtyPointsPerSecond


func _on_game_healty_points_changed(amount) -> void:
	healty_points_label.text = str(amount) + " Healthy Points"

func _on_game_hp_per_second_changed(amount) -> void:
	healty_points_per_second.text = str(amount) + " Per Second"
