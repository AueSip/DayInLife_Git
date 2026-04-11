extends Node3D

@export var PushPiece:Node3D
var defaultPushPosition:Vector3
@export var PositionNodes:Array[Node3D]
@export var UpDown:Array[Node3D]
var currentTimes = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defaultPushPosition = PushPiece.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func InitiateGoDown():
	$"../SlideSFX".play()
	if currentTimes > PositionNodes.size():
		currentTimes = 0
	currentTimes = currentTimes + 1
	print("Times Used " + str(currentTimes))
	var tween = create_tween()
	tween.tween_property(self, "position",UpDown[1].position , 1)
	tween.tween_callback(self.PushSlotForward)
	$StaticBody3D/CollisionShape3D.disabled = true

func PushSlotForward():
	var tween = create_tween()
	tween.tween_property(PushPiece, "position",PositionNodes[currentTimes].position , 0.6)
	tween.tween_callback(self.PushSlotBackward)
	
func PushSlotBackward():
	$"../SlideSFX".play()
	var tween = create_tween()
	tween.tween_property(PushPiece, "position",PositionNodes[currentTimes-1].position , 1)
	#increases distance for next time
	tween.tween_callback(self.InitiateGoUp)
	$StaticBody3D/CollisionShape3D.disabled = false
	
func InitiateGoUp():
	var tween = create_tween()
	tween.tween_property(self, "position",UpDown[0].position , 1)
