extends Node

## 生命值组件

signal health_decreased(source: Node)  # 实体扣除生命值
signal died()                         # 实体死亡
signal health_changed(old_value: int, new_value: int)  # 生命值改变，一般给UI用

var health: int = 0:
	get:
		return health
	
var invincible: bool = false:
	get:
		return invincible
	set(value):
		invincible = value

## 减少生命值
func decrease_health(amount: int = 1, source: Node = null) -> bool:
	if invincible:
		return false
	
	var old_health = health
	health = max(health - amount, 0)
	health_changed.emit(old_health, health)
	
	if health == 0:
		died.emit()
		return true
	
	health_decreased.emit(source)
	return true

## 增加生命值
func increase_health(amount: int = 1) -> bool:
	var old_health = health
	health += amount
	health_changed.emit(old_health, health)
	return true

## 设置无敌状态
func set_invincible() -> void:
	invincible = true

## 结束无敌状态
func end_invincible() -> void:
	invincible = false
