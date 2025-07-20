extends Node2D

var card_scene = preload("res://Scenes/Card.tscn")
var suits = ["Hearts", "Diamonds", "Clubs", "Spades"]

func _process(_delta):
    if Input.is_action_just_pressed("draw_cards"):
        clear_cards()
        draw_all_cards()


func draw_all_cards():
    for row in range(suits.size()):
        var suit = suits[row]
        for value in range(1, 14):
            var card = card_scene.instantiate()
            add_child(card)

            var pos_x = 100 + value * 80
            var pos_y = 100 + row * 120
            card.position = Vector2(pos_x, pos_y)

            card.set_card(value, suit)

func clear_cards():
    for child in get_children():
        if child is Node2D and child.has_method("set_card"):
            remove_child(child)
            child.queue_free()
