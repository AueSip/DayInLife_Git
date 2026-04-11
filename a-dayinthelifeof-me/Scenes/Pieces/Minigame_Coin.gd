extends Sprite2D

@export var MainMinigameManager:Node2D
signal Death
signal Won
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_collision_box_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("leftClick"):
		global_position = get_viewport().get_mouse_position()
	


func _on_deathy_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("DeathWall"):
		emit_signal("Death")
	if area.is_in_group("WinZone"):
		emit_signal("Won")
