extends XRController3D

var sword_active = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed(name: String) -> void:
	if (name == "ax_button"):
		sword_active = !sword_active
		$BlueSword.visible = sword_active
		$BlueSword.disabled = !sword_active
