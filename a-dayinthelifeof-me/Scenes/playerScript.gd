extends Camera3D
@onready var mainScript = $".."
var length = 999
var stuck = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("leftClick"):
		var space_state = get_world_3d().direct_space_state
		var cam = self
		var mousepos = get_viewport().get_mouse_position()
		var origin = cam.project_ray_origin(mousepos)
		var end = origin + cam.project_ray_normal(mousepos) * length
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true
		var result = space_state.intersect_ray(query)
		
		if result:
			var final = result.collider.get_parent()
			print(final)
			if !final.is_in_group("InputButtonGroup"):
				return
			mainScript.ButtonPressed(final.returnButtonValue())
	
	
	
