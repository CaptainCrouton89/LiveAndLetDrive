extends VehicleBody

var basis = Basis()
var turn = 0
var speed = 5  # Distance from front to rear wheel
var steering_angle = 1  # Amount that front wheel turns, in degrees

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)


func _input(event):
	turn = 0
	if event.is_action_pressed("ui_left", true):
		turn += 1
	if event.is_action_pressed("ui_right", true):
		turn -= 1
	
	#self.rotate_y(steering_angle * turn)
	#self.transform.basis.y = self.transform.basis.y.linear_interpolate(Vector3(steering_angle * turn, 0, 0), .1)
	#rotate_object_local(Vector3(0, 1, 0), steering_angle * turn)

func _physics_process(delta):
	self.translate(Vector3(0, 0, speed*delta))
	calculate_steering(delta)
	
func calculate_steering(delta):
	#set_steering(steering_angle * turn)
	self.rotate_y(steering_angle * turn * delta)
