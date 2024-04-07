extends Node2D

var _cherry_scene = preload('res://Scenes/cherry.tscn')
var _strawberry_scene = preload("res://Scenes/strawberry.tscn")
var _grape_scene = preload("res://Scenes/grape.tscn")
var _dekopon_scene = preload('res://Scenes/dekopon.tscn')
var _orange_scene = preload("res://Scenes/orange.tscn")
var _apple_scene = preload("res://Scenes/apple.tscn")
var _persimmon_scene = preload('res://Scenes/persimmon.tscn')
var _peach_scene = preload("res://Scenes/peach.tscn")
var _pineapple_scene = preload("res://Scenes/pineapple.tscn")
var _melon_scene = preload('res://Scenes/melon.tscn')
var _waterlemon_scene = preload("res://Scenes/watermelon.tscn")

var _current_fruit
var _fruit_list = [_cherry_scene, _strawberry_scene, _grape_scene, _dekopon_scene,
					_orange_scene, _apple_scene, _persimmon_scene, _peach_scene,
					 _pineapple_scene, _melon_scene, _waterlemon_scene]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	
func _spawn_fruit(pos, fruit_id):
	_current_fruit = _fruit_list[fruit_id].instantiate()
	add_child(_current_fruit)
	_current_fruit.fruits_collided.connect(_spawn_next_fruit)
	_current_fruit.position = pos

func _on_cloud_dropped_fruit(pos, fruit_id):
	_spawn_fruit(pos, fruit_id)

func _spawn_next_fruit(position, fruit_id):
	var fruit_id_to_spawn = fruit_id + 1
	_spawn_fruit(position, fruit_id_to_spawn)
	
