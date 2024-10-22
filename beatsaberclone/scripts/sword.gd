extends Area3D

# To toggle the sword on/off
var sword_active = true

func _input(event):
	if event.is_action_pressed("toggle_sword"):
		sword_active = !sword_active
		$MeshInstance.visible = sword_active
		$CollisionShape3D.disabled = !sword_active

# Handle collision events with cubes
func _on_body_entered(body: Node):
	if body.name == "BlueBox" and sword_active:
		print("Hit the BlueBox")


func _on_left_hand_button_pressed(name: String) -> void:
	sword_active = !sword_active
	$MeshInstance.visible = sword_active
	$CollisionShape3D.disabled = !sword_active
