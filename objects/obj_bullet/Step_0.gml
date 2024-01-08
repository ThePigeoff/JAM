/// @description Insert description here
// You can write your code in this editor
command.execute()

var _wall = collision_circle(x,y,16,obj_floor,false,true)
if(_wall != noone and _wall.object_index != obj_weekwall) instance_destroy()
if(_wall != noone and _wall.object_index == obj_weekwall)
{
	with(_wall) instance_destroy();
	instance_destroy()
}





