extends Node3D

@export var label:Label3D
var startNumber
var number = 0
var labelNumber:String
@onready var stuck = $CanvasLayer/Stuck
var coinCount = 10;
@export var time:float = 200
var requestColor
@export var titleScreen = false
var requestList:Array[String]

#Effect Stuff
@onready var slots = $Slots
@onready var vendingMachine = $VendingMachine2


@export var scoreAdded = 100
var CountScore = 0
var scoreMulti = 1
var monstersCollected = 0
var colorList = {
	"Red":Color(1.0, 0.0, 0.0, 1.0),
	"Orange":Color(0.775, 0.44, 0.0, 1.0),
	"Yellow":Color(0.973, 1.0, 0.0, 1.0),
	"Green":Color(0.0, 0.581, 0.107, 1.0),
	"Blue":Color(0.0, 0.554, 0.906, 1.0),
	"Pink":Color(1.0, 0.557, 0.826, 1.0),
	"Purple":Color(0.647, 0.0, 0.54, 1.0),
	"White":Color(1.0, 1.0, 1.0, 1.0),
	"Black":Color(0.061, 0.061, 0.061, 1.0)
}

var VendingSlotStuck:bool = false

@export var Minigame:PackedScene

var targetSlot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startNumber = randi_range(0,999)
	number = startNumber
	for slot in slots.get_children():
		var colorName = colorList.keys().pick_random()
		slot.init(colorName,colorList[colorName],number)
		number+= 1
		if !requestList.has(colorName):
			requestList.append(colorName)
	InitiateRequest()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (titleScreen):
		return
	time -= delta
	UpdateTimeText(time)
	
func InitiateRequest():
	requestColor = requestList.pick_random()
	var formatString = "I Want A %s Monster!"
	$CanvasLayer/Request.text = formatString % requestColor
	
func UpdateLabelText():
	label.text = labelNumber

func UpdateTimeText(time:float):
	$CanvasLayer/TimeCount.text = str(snappedf((time),0.01))
	if (time <= 0):
		HandleEnd()
		
func UpdateCoinCount(coins:int):
	coinCount = coins
	if (coinCount <= 0):
		HandleEnd()
	$CanvasLayer/CoinCount.text = str(coinCount)

func ButtonPressed(buttonVal:String):
	match buttonVal:
		"DEL":
			RemoveNumberFromLabel()
		"ACC":
			CheckMatchingCanNumber()
		_:
			UpdateLabelValue(buttonVal)

func UpdateLabelValue(val:String):
	if labelNumber.length() >= 4:
		$IncorrectSound.play()
		return
	SetLabelNumber(labelNumber + val)

func SetLabelValue(val:String):
	SetLabelNumber(val)

func SetLabelNumber(val:String):
	labelNumber = val
	$ButtonClick.play()
	UpdateLabelText()
	
func RemoveNumberFromLabel():
	#EARLY RETURN TO KEEP CONSISTENT
	print("REMOVED")
	if (labelNumber.length() == 0):
		return
	var labelArray:Array[String]
	SetLabelNumber(labelNumber.erase(labelNumber.length()-1))
	
	
func CheckMatchingCanNumber():
	var isCorrect = false
	for slot in slots.get_children():
		if (slot.ReturnNumberForSlot() == labelNumber.to_int()):
			print("Correct!")
			targetSlot = slot
			InitiateCoinMinigame()
			SetLabelValue("")
			$CorrectSound.play()
			isCorrect = true
			break;
	if !isCorrect:
		$IncorrectSound.play()
		print("IncorrectValue")
		
func InitiateCoinMinigame():
	var min = Minigame.instantiate()
	min.init(self)
	add_child(min)
	#hides request
	$CanvasLayer/Request.visible = false;
func HandleShakeVendingMachine():	
	VendingSlotStuck = true
	stuck.visible = true
	
func _input(event: InputEvent) -> void:
	if (!VendingSlotStuck):
		return
	if Input.is_action_just_pressed("Left"):
		HandleMinigameCompletion(true)
		ShakeAnim()
	if Input.is_action_just_pressed("Right"):
		HandleMinigameCompletion(true)
		ShakeAnim()
	
	
func HandleMinigameCompletion(won:bool):
	print("SUCCEEDED MINIGAME")
	$CanvasLayer/Request.visible = true;
	if (!won):
		UpdateCoinCount(coinCount - 1)
		$CoinDrop.play()
		return
	if (targetSlot.ReturnIsStuck()):
		HandleShakeVendingMachine()
		return
	targetSlot.InitiateVendingPush()
	stuck.visible = false
	VendingSlotStuck = false
	
func UpdateScore(obj:Node3D):
	monstersCollected += 1
	if obj.get_parent().ReturnMonsterColourName() == requestColor:
		scoreMulti += 1
	else:
		scoreMulti -= 0.25
	$CanOpen.play()
	CountScore += scoreAdded * scoreMulti
	UpdateScoreLabel(CountScore)
	InitiateRequest()

func UpdateScoreLabel(score:int):
	$CanvasLayer/ScoreCount.text = str(score)

func HandleEnd():
	if (CountScore >= GV.score):
		GV.coins = coinCount
		GV.score = CountScore
		GV.MonstersCollected = monstersCollected;
	get_tree().change_scene_to_file("res://Scenes/StartScreen.tscn.tscn")
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if (body.is_in_group("Monster")):
		UpdateScore(body)

func ShakeAnim():
	$AnimationPlayer.play("Shake")
	
