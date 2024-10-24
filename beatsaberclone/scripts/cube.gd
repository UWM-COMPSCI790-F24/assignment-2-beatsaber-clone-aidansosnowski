extends Area3D

var speed: float = 10.0
var target: Node3D

func _process(delta: float) -> void:
	if target:
		var direction = (target.global_transform.origin - global_transform.origin).normalized()
		global_transform.origin += direction * speed * delta
		
		if global_transform.origin.distance_to(target.global_transform.origin) < 1.0:
			queue_free()

func _on_area_entered(body):
	if body.name == "BlueSword":
		$AudioStreamPlayer.play()
		$MeshInstance3D.visible = false
