extends Node3D

#number that calls this slot to do things
var numberForThisSlot:int
@export var MonsterScene:PackedScene
#chance for it to fail
var randomStuckChance: float


#color to see if it matches target
var monsterColour:Color
var monsterColourName:String
@onready var listOfSlots = [$Slot1,$Slot2,$Slot3,$Slot4]
@onready var numberText = $FrontPiece/Label3D
func _ready() -> void:
	pass # Replace with function body.

func init(mColourName:String,mColour:Color, numberForSlot):
	monsterColour = mColour
	monsterColourName = mColourName
	numberForThisSlot = numberForSlot
	randomStuckChance = randf()
	
	for slot in listOfSlots:
		var monster = MonsterScene.instantiate()
		add_child(monster)
		monster.transform = slot.transform
		monster.init(monsterColour,monsterColourName)
	
	numberText.text = str(numberForThisSlot)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func ReturnNumberForSlot() -> int:
	return numberForThisSlot

func InitiateVendingPush() -> void:
	#Initiates Tween Motion
	$FrontPiece.InitiateGoDown()
	
func ReturnIsStuck() -> bool:
	var out = randf() <= randomStuckChance
	print(out)
	return out
