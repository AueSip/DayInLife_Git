extends Node2D

var globalScript:Node3D

@export var minigameList:Array[Node2D]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func init(sceneScript:Node3D):
	globalScript = sceneScript

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func OnCompleteMinigame(won:bool):
	globalScript.HandleMinigameCompletion(won)


func _on_coin_death() -> void:
	print("DIED")
	OnCompleteMinigame(false)
	queue_free()
	
func _on_coin_won() -> void:
	print("WON")
	OnCompleteMinigame(true)
	queue_free()


func _on_tree_entered() -> void:
	minigameList.pick_random().visible = true
