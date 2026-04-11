extends MeshInstance3D
@onready var this = $"."
var originalPosition:Vector3
@export var buttonVal:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label3D.text = buttonVal
	originalPosition = this.position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func returnButtonValue() -> String:
	var tween = create_tween()
	tween.tween_property(this, "position",Vector3(originalPosition[0],originalPosition[1],originalPosition[2] + 0.25) , 0.05)
	tween.tween_property(this, "position",Vector3(originalPosition[0],originalPosition[1],originalPosition[2]) , 0.05)
	return buttonVal
	

func _on_area_3d_area_entered(area: Area3D) -> void:
	print(returnButtonValue())
	
	
