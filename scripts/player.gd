extends CharacterBody2D
@export var speed = 100
@export var Bullet : Resource


func getInput():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	
func _physics_process(delta: float) -> void:
	getInput()
	move_and_slide()
	
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
