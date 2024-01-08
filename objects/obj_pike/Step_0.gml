/// @description Insert description here
// You can write your code in this editor
//image_angle -= 15;


event_inherited()
var _inst = instance_place(x,y,obj_draggable)
if(_inst != noone and _inst.type = "entity" and array_get_index(dead,_inst) == -1)
{
	
	array_push(dead,_inst)
	instance_create_depth(_inst.x,_inst.y,-99999,obj_Blood)
	
	
}


