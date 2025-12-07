extends MarginContainer

@onready var click_button: TextureButton = $CenterContainer/ClickButton

@export var swing_angle: float = 5.0 #angulo do balancar
@export var swing_duration: float = 1.0 #duracao do balancar
@export var swing_count: int = -1 #nao entendi direito mas e para fazer um loop infinito


func _ready() -> void:
	#aqui estou fazendo com que ao iniciar o jogo ele defina o centro do personagem para fazer a escala de 
	#diminuir e aumentar nas animaçoes, ao inves de  utilizar o topo esquerdo
	#em caso de duvida desativa isso e ve como que fica
	click_button.pivot_offset = click_button.size / 2
	
	start_swing()

func start_swing():
	var tween = create_tween()
	
	if swing_count > 0:
		tween.set_loops(swing_count)
	else:
		tween.set_loops() #loop infinito, nunca entra no if
		
	#montando a sequencia de balanco
	tween.tween_property(click_button, "rotation_degrees", 
		-swing_angle, swing_duration / 2).set_trans(Tween.TRANS_SINE)
	tween.tween_property(click_button, "rotation_degrees",
		swing_angle, swing_duration).set_trans(Tween.TRANS_SINE)
	tween.tween_property(click_button, "rotation_degrees",
	0, swing_duration / 2).set_trans(Tween.TRANS_SINE)

#aqui estou fazendo uma animacao de quanddo clica e de quando solta o personagem
func _on_click_button_button_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(click_button, "scale", Vector2(.9, .9), .1)


func _on_click_button_button_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(click_button, "scale", Vector2(1, 1), .1)
