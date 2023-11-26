extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# First, we get the list of animation names from the AnimatedSprite2D's sprite_frames property.
	# This returns an Array containing all three animation names: ["walk", "swim", "fly"].
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	
	# We then need to pick a random number between 0 and 2 to select one of these names 
	# from the list (array indices start at 0). randi() % n selects a random integer between 0 and n-1.
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])
	
# Make the mobs delete themselves when they leave the screen.
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
