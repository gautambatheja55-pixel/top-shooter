extends Line2D

# This ensures the node is found before _ready() runs
@onready var occluder_node = $LightOccluder2D 

func _ready():
	# 1. Check if the node actually exists to prevent a crash
	if not occluder_node:
		print("Error: LightOccluder2D not found! Check the Scene Tree.")
		return

	var occluder_poly = OccluderPolygon2D.new()
	var collision_poly = $StaticBody2D/CollisionPolygon2D
	var shadow_shape = Geometry2D.offset_polyline(points, width / 2, Geometry2D.JOIN_ROUND, Geometry2D.END_ROUND)
	var points_for_collision = Geometry2D.offset_polyline(points, width / 2, Geometry2D.JOIN_ROUND, Geometry2D.END_ROUND)

	if shadow_shape.size() > 0:
		occluder_poly.polygon = shadow_shape[0]
		occluder_node.occluder = occluder_poly

	if points_for_collision.size() > 0:
		collision_poly.polygon = points_for_collision[0]
