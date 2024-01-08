// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_horizontaly(_target,_speed)
{
	if(_speed == 0) return
	var _direction = sign(_speed)
	
	
	with(_target)
	{
	if(object_index != obj_bullet)
	{
		while(place_meeting(x + _speed, y,obj_floor))
		{
			
			_speed = round(_speed)
			x = round(x)
			_speed -= _direction;
		
		}
	}	
		
		
		x_speed = _speed;
		x += _speed;
	}
}