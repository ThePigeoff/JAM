/// @description Insert description here
// You can write your code in this editor
obj_drag_n_drop.add_draggable_item(self)

grv = 0.4;
y_speed = 0;
x_speed = 0;

on_ground = false;
type = "object"

is_mouse_over = function()
{
	var _origin_x = bbox_left;
	var _origin_y = bbox_top;
	
	return point_in_rectangle(mouse_x,mouse_y,_origin_x,_origin_y,bbox_right,bbox_bottom)
	
	
	
}



