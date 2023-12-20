extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.version == 1:
		text = "Alpha v0.37, Gameplay Not Finalized"
	elif Global.version == 2:
		text = "Alpha v0.48, Gameplay Not Finalized"
	elif Global.version == 3:
		text = "Build v81695, Gameplay Finalized"
	else:
		text = "ERR - INVALID VALUE IN 'Global.version_display'"
