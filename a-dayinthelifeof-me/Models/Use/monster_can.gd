extends Node3D
@onready var monsterCan = $RigidBody3D/MonsterCan/Cylinder
var MonsterColour :Color 
var MonsterColourName:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func init(newColor:Color,newName:String) -> void:
	#changes the material accordingly
	MonsterColour = newColor
	MonsterColourName = newName
	var material = monsterCan.get_surface_override_material(0).duplicate()
	material.albedo_color = MonsterColour
	monsterCan.set_surface_override_material(0, material)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func ReturnMonsterColourName() -> String:
	return MonsterColourName
