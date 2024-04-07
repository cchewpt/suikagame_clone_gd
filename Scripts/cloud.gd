extends Node2D

@onready var _cherry_img = $cherry
@onready var _strawberry_img = $strawberry
@onready var _grape_img = $grape
@onready var _dekopon_img = $dekopon

@onready var _rng = RandomNumberGenerator.new()

var _fruit_list

signal dropped_fruit

var _current_fruit
var _current_fruit_id

const CLOUD_SPEED = 3

const DROP_COOLDOWN = 120
var _tick = 0
var _waiting_to_spawn = false

func _pick_random_fruit() :
	return _rng.randi_range(0,3)

func _spawn_new_fruit():
	_current_fruit_id = _pick_random_fruit()
	_current_fruit = _fruit_list[_current_fruit_id]
	_current_fruit.show()
	
func _ready():
	_set_up_list()
	_spawn_new_fruit()
	
func _drop():
	_current_fruit.hide()
	_waiting_to_spawn =true
	dropped_fruit.emit(position, _current_fruit_id)

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		position.x -= CLOUD_SPEED
	if Input.is_action_pressed("right"):
		position.x += CLOUD_SPEED
	if Input.is_action_just_pressed("drop"):
		_drop()
	if _waiting_to_spawn:
		_ticker()

func _ticker():
	_tick += 1
	if _tick > DROP_COOLDOWN:
		_tick = 0
		_spawn_new_fruit()
		_waiting_to_spawn = false
		
func _set_up_list():
	_fruit_list = [
	_cherry_img,
	_strawberry_img,
	_grape_img,
	_dekopon_img]
	
