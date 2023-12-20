extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(2.5))
	if has_overlapping_bodies():
		queue_free()
		Global.gemsCollected = Global.gemsCollected + 1
