extends CharacterBody2D

# ------------- NAVIGATION REGION

@export var speed = 300
var accel = 7
var direction = Vector3()

@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta):
	if (nav.target_position and not nav.is_navigation_finished()):
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = velocity.lerp(direction * speed, accel * delta)
		move_and_slide()
	
func _input(event):
	if event.is_action_pressed("left_click"):
		nav.target_position = get_global_mouse_position()

# ------------- ASTAR

#@export var speed: float = 300.0
#@onready var sprite_2d = $Sprite2D
#@onready var tile_map = $"../TileMap"
#
#var distance_to_point = 0
#
#var click_position = Vector2()
#
#var astar_grid: AStarGrid2D
#var current_id_path: Array[Vector2i]
#
#
#func _ready():
	#click_position = position
	#
	#astar_grid = AStarGrid2D.new()
	#astar_grid.region = tile_map.get_used_rect()
	#astar_grid.cell_size = Vector2(16, 16)
	#astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	#astar_grid.update()
	#
	#print(tile_map.get_used_rect())
	#
	#for x in tile_map.get_used_rect().size.x:
		#for y in tile_map.get_used_rect().size.y:
			#var tile_position = Vector2i(
				#x + tile_map.get_used_rect().position.x, 
				#y + tile_map.get_used_rect().position.y
			#)
#
			#var tile_data = tile_map.get_cell_tile_data(0, tile_position)
			#if tile_data == null or tile_data.get_custom_data("walkable") == false:
				#astar_grid.set_point_solid(tile_position)
#
#func _input(event):
	#if event.is_action_pressed("left_click"):
		#var id_path = astar_grid.get_id_path(
			#tile_map.local_to_map(global_position),
			#tile_map.local_to_map(get_global_mouse_position())
		#).slice(1)
		#
		#print((get_global_mouse_position() - global_position).normalized())
		#
		#if not id_path.is_empty():
			#current_id_path = id_path
			#
#func _physics_process(delta):
	#if current_id_path.is_empty():
		#return
	#
	#var target_position = tile_map.map_to_local(current_id_path.front())
	#global_position = global_position.move_toward(target_position, speed * delta)
	#
	#if global_position == target_position:
		#current_id_path.pop_front()
	
# ------------- OLD ARROWS

#func _physics_process(delta):
	#if Input.is_action_just_pressed("left_click"):
		#click_position = get_global_mouse_position()
		#
	#if distance_to_point > 30:
		#velocity = (click_position - position).normalized() * speed
		#move_and_slide()
