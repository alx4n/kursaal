extends CharacterBody2D

@onready var damage_component : DamageComponent = %DamageComponent
@onready var muzzle : Marker2D = $Marker2D

@export var arm : Arm
@export var player : Player

@export var damage_amount := 15
