extends Line2D

@onready var occluder_node = $LightOccluder2D
@onready var collision_poly = $StaticBody2D/CollisionPolygon2D

func _ready():
	var shapes = Geometry2D.offset_polyline(points, width / 2, Geometry2D.JOIN_ROUND, Geometry2D.END_ROUND)
	
	if shapes.size() > 0:
		var poly_data = shapes[0]
		
		var occluder_poly = OccluderPolygon2D.new()
		occluder_poly.polygon = poly_data
		occluder_node.occluder = occluder_poly
		collision_poly.polygon = poly_data
