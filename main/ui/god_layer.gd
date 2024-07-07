class_name GodLayer extends CanvasLayer

@export var initial_lines: Array[String]
@export var initial_clips: Array[AudioStream]

@export var exchange_lines: Array[String]
@export var exchange_clips: Array[AudioStream]

@export var final_lines: Array[String]
@export var final_clips: Array[AudioStream]

@export var empty_lines: Array[String]
@export var empty_clips: Array[AudioStream]

var first_talk: bool = true
var fruit_target: int = 30

func talk() -> void:
	visible = true
	await get_tree().create_timer(2.0).timeout
	
	if first_talk:
		first_talk = false
		await convo(initial_lines, initial_clips)
	elif Data.fed + Data.fruits >= fruit_target:
		await convo(final_lines, final_clips)
	elif Data.fruits > 0:
		await convo(exchange_lines, exchange_clips)
	elif Data.fruits == 0:
		await convo(empty_lines, empty_clips)
	
	await get_tree().create_timer(2.0).timeout
	
	Data.fed += Data.fruits
	Data.seeds += ceil(Data.fruits * 1.5)
	Data.fruits = 0
	
	visible = false

func convo(lines: Array[String], clips: Array[AudioStream]) -> void:
	for i in range(len(lines)):
		%Text.text = "[center][shake]" + lines[i].to_upper()
		%Voice.stream = clips[i]
		%Voice.playing = true
		await %Voice.finished
		await get_tree().create_timer(0.9).timeout
