extends CharacterBody2D


const SPEED = 300.0

# Vertical impulse applied to the character upon bouncing on an item.
@export var bounce_impulse = 400


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Iterate through all collisions that occurred this frame
	for index in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(index)

		# If the collision is with ground
		if collision.get_collider() == null:
			continue

		# If the collider is with an item.
		if collision.get_collider().is_in_group("item"):
			# we check that we are hitting it from above.
			if Vector2.UP.dot(collision.get_normal()) > 0.1:
				# If so, we squash it and bounce.
				velocity.y = -1 * bounce_impulse
				break
				
	move_and_slide()
