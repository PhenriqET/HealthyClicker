extends Control

const save_path = "res://Save.save"
var healtyPoints = 0
var hp_per_second = 1
var amount_per_click = 1 #Quantidade de healty points por clique (inicial = 1)

signal healtyPointsChanged() 
signal hpPerSecondChanged() #so vai ser chamado quando eu utilizar upgrades

func _ready() -> void:
	$Timer.wait_time = 1.0
	$Timer.start()
	$Timer.autostart = true
#Apesar de ter funcoes para salvar os dados eu nao vou mexer muito nisso e deixar para mais tarde.



# Essa funcao faz com que o clique no persanagem gere mais healty points baseado no quanto ja tem mais
# o amount per click
func _on_click_button_button_down() -> void:
	healtyPoints += amount_per_click
	emit_signal("healtyPointsChanged", healtyPoints)


func _on_timer_timeout() -> void:
	healtyPoints += hp_per_second
	emit_signal("healtyPointsChanged", healtyPoints)

# Botao do upgrade do Sanduiche
func _on_sanduiche_button_button_down() -> void:
	if ( healtyPoints >= 100):
		amount_per_click += 1
		healtyPoints = healtyPoints - 100
		emit_signal("healtyPointsChanged", healtyPoints)
		
	else:
		print("Voce nao tem Healthy Points suficiente!!")

# Botao do upgrade dos Exercicios
func _on_exercicios_button_button_down() -> void:
	if ( healtyPoints >= 120):
		hp_per_second += 1
		healtyPoints = healtyPoints - 120
		emit_signal("healtyPointsChanged", healtyPoints)
		emit_signal("hpPerSecondChanged", hp_per_second)
	else:
		print("Voce nao tem Healthy Points suficiente!!")
