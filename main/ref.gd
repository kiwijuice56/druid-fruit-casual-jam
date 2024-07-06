extends Node

@onready var player: Player = get_tree().get_root().get_node("Main/%Player")
@onready var interact_label: InteractLabel = get_tree().get_root().get_node("Main/%InteractLabel")
@onready var music: AudioStreamPlayer = get_tree().get_root().get_node("Main/MusicPlayer")
@onready var nature: AudioStreamPlayer = get_tree().get_root().get_node("Main/NaturePlayer")
