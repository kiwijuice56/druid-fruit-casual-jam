class_name Ark extends Interactable

@export var god_layer: GodLayer

func _ready() -> void:
	can_interact = true

func interact(player: Player) -> void:
	player.frozen = true
	play_music()
	await god_layer.talk()
	stop_music()
	Data.seeds += ceil(Data.fruits * 1.5)
	Data.fruits = 0
	player.frozen = false
	player.can_interact = true

func play_music() -> void:
	%Music.volume_db = -32
	var tween: Tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(%Music, "volume_db", 4, 0.5)
	tween.tween_property(Ref.music, "volume_db", -32, 0.5)
	tween.tween_property(Ref.nature, "volume_db", -64, 0.5)
	%Music.playing = true

func stop_music() -> void:
	%Music.volume_db = 0
	var tween: Tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(%Music, "volume_db", 0, 0.5)
	tween.tween_property(Ref.music, "volume_db", -8, 0.5)
	tween.tween_property(Ref.nature, "volume_db", -28, 0.5)
	tween.tween_property(%Music, "volume_db", -32, 0.5)
	await tween.finished
	%Music.playing = false

func interact_string() -> String:
	return "z: witness"
