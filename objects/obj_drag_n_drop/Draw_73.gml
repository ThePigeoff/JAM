/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button_pressed(mb_left))
{
	for (var _i = 0; _i < array_length(draggable_objects);  _i++ )
	{
		var _item = draggable_objects[_i]
		
		if(_item.is_mouse_over())
		{
			mouse_target = _item;
			mouse_target_origin_x = _item.x;
			mouse_target_origin_y = _item.y
			mouse_offset_x = _item.x - mouse_x;
			mouse_offset_y = _item.y - mouse_y;
			global.is_paused = true;
			
			with(all)
				image_speed = 0;
		}
	}
}

if(mouse_target != undefined)
{
	var max_distance = (mouse_target.type == "entity") ? 350 : 1200;
	var distance_to_cursor = point_distance(mouse_x,mouse_y,mouse_target.x,mouse_target.y)
	var direction_to_cursor = point_direction(mouse_target.x,mouse_target.y,mouse_x,mouse_y)
	
	if(mouse_check_button_released(mb_left))
	{
		global.is_paused = false;
		
		with(all)
				image_speed = 1;
		for (var _i = 0; _i < array_length(draggable_objects);  _i++ )
		{
			var _item = draggable_objects[_i]
			
			if(distance_to_cursor < max_distance and _item.is_mouse_over() and _item != mouse_target and _item.type == mouse_target.type)
			{
				var swap = mouse_target.command;
				mouse_target.command = _item.command;
				_item.command = swap;
				
				array_push(replaced,[_item,mouse_target])
				
			}
			
			
		}
		mouse_target.x = mouse_target_origin_x;
		mouse_target.y = mouse_target_origin_y;
		mouse_target = undefined	
	}
	else
	{
		//mouse_target.x = mouse_x + mouse_offset_x;	
		//mouse_target.y = mouse_y + mouse_offset_y;
		
		//draw_sprite_ext(spr_line,0,mouse_target.x - mouse_offset_x,mouse_target.y - mouse_offset_y,min(distance_to_cursor,max_distance)/sprite_get_width(spr_line),1,direction_to_cursor,c_white,1.0)
		draw_line_width_color(mouse_target.x,mouse_target.y,mouse_target.x + lengthdir_x(min(max_distance,distance_to_cursor),direction_to_cursor),mouse_target.y + lengthdir_y(min(max_distance,distance_to_cursor),direction_to_cursor),8,c_black,c_black)
		if(distance_to_cursor > max_distance)
			draw_sprite(spr_xxx,0,mouse_target.x + lengthdir_x(max_distance,direction_to_cursor),mouse_target.y + lengthdir_y(max_distance,direction_to_cursor))
	}
	
	
}






