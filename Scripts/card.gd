extends Node2D

var value: int = 0
var suit: String = ""
var is_face_up: bool = false  # Kapalı mı açık mı kontrolü

@onready var sprite = $Sprite2D

# Kapalı kartın arka yüz görseli
var back_texture = preload("res://Assets/Cards/card_back.png")


func _ready():
    sprite.texture = back_texture


func set_card(v: int, s: String):
    value = v
    suit = s


func flip_card():
    if is_face_up:
        sprite.texture = back_texture
        is_face_up = false
    else:
        var value_str = str(value).pad_zeros(2)
        var texture_path = "res://Assets/Cards/card_%s_%s.png" % [suit.to_lower(), value_str]
        sprite.texture = load(texture_path)
        is_face_up = true


func _input_event(_viewport, event, _shape_idx):
    if event is InputEventMouseButton and event.pressed:
        flip_card()
        print("kart döndü")
