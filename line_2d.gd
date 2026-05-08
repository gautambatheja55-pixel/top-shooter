extends Line2D

func _ready() -> void:
	var collision_poly = $StaticBody2D/CollisionPolygon2D
	var points_for_collision=Geometry2D.offset_polyline(points,width/2,Geometry2D.JOIN_ROUND
	,Geometry2D.END_ROUND)
	
	if points_for_collision.size()>0:
		collision_poly.polygon=points_for_collision[0]
