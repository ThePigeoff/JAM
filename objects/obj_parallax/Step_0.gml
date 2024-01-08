/// @description Insert description here
// You can write your code in this editor
camera_set_view_pos(view_camera[0],-(room_width/2 - mouse_x) * 0.04,-(room_height/2 - mouse_y) * 0.04)

for(var _i = 0; _i < array_length(parallax_layers); _i++)
{
	layer_x(parallax_layers[_i], - ((room_width/2 - mouse_x) * (0.04 - (0.01 * _i))) ) 
	layer_y(parallax_layers[_i], - ((room_height/2 - mouse_y) * (0.04 - (0.01 * _i))) ) 
}





