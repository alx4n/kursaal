class_name BulletSpeedItem
extends BulletUpgrade

@export var speed_increase := 0

func apply_upgrade(bullet: Bullet):
	bullet.speed += speed_increase
