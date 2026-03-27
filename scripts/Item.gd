extends Area2D


@export var sprite : Sprite2D
@export var Upgrade: BulletUpgrade:
	set(val):
		Upgrade = val
		needs_update = true
		
@export var needs_update = false 
	
func _process(delta: float) -> void:
	pass
	
	
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.upgrades.append(Upgrade)
		$SFXCollect.play()
		$SFXCollect.reparent(self.get_parent().get_node("SFX"), true)
		queue_free()
