extends KinematicBody2D

signal health_changed
signal dead
signal shoot

export (PackedScene) var bullet
export (int) var max_speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var max_health

var velocity = Vector2()
var can_shoot = true
var alive = true
var health

func _ready():
	$GunTimer.wait_time = gun_cooldown
	health = max_health
	emit_signal("health_changed", health * 100 / max_health)
	
func control(delta):
	pass
	
func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		
		$AnimationPlayer.play("muzzle_flash")
		
		var direction = Vector2(1, 0).rotated($Turret.global_rotation)
		emit_signal("shoot", bullet, $Turret/Muzzle.global_position, direction)
	
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)
	
func take_damage(amount):
	health -= amount
	emit_signal("health_changed", health * 100 / max_health)
	
	if health <= 0:
		explode()

func explode():
	$CollisionShape2D.disabled = true
	alive = false
	$Turret.hide()
	$Body.hide()
	$Explosion.show()
	$Explosion.play()

func _on_GunTimer_timeout():
	can_shoot = true


func _on_Explosion_animation_finished():
	queue_free()
