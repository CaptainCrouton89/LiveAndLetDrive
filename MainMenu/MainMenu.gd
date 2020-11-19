extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var StartButton = $CanvasLayer/Start


# Called when the node enters the scene tree for the first time.
func _ready():
	StartButton.connect("pressed", self, "_button_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _button_pressed():
	print("pressed")
	var next_level_resource = load("res://level1/level1.tscn");
	var next_level = next_level_resource.instance()
	get_tree().root.call_deferred("add_child", next_level)
	queue_free()
