// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InputSystem() constructor
{
	pressed_keys = [];
	keys = [];
	grid = new KeysGrid(80,10,7);
	mouse_target = undefined;
	
	add_key = function(_key)
	{
		array_push(keys,_key)
		_key.key_calc_position(grid)
	}
	
	add_input = function(_button_name)
	{
		
		if(argument_count == 1)
			array_push(pressed_keys,[_button_name])	
		else
			array_push(pressed_keys,[_button_name,argument[1]])	
		
	}
	
	apply_input = function()
	{
		var _mouse_click = mouse_check_button(mb_left)
		draw_sprite_ext(KeyBack,0,grid.grid_x - 50 + lengthdir_x(38,point_direction(grid.grid_x,grid.grid_y,obj_hero.x,obj_hero.y) - 180),grid.grid_y - 60 + lengthdir_y(38,point_direction(grid.grid_x,grid.grid_y,obj_hero.x,obj_hero.y) - 180),(1000)/sprite_get_width(KeyBack),(450)/sprite_get_height(KeyBack),0,c_black,0.5)
		draw_sprite_ext(KeyBack,0,grid.grid_x - 50,grid.grid_y - 60,(1000)/sprite_get_width(KeyBack),(450)/sprite_get_height(KeyBack),0,c_white,1.0)
		for(var _i = 0; _i < array_length(keys); _i++)
		{
			var _current_button = keys[_i]
			
			var _button_index = _current_button.is_pressed(pressed_keys);
			if(_button_index != -1)
			{
				if(global.is_paused)
				{
					
				}
				else if(array_length(pressed_keys[_button_index]) > 1)
				{
					_current_button.activate(pressed_keys[_button_index][1])
				}
				else
					_current_button.activate()
				_current_button.pressed_state = 1;
			}
			else
			{
				_current_button.pressed_state = max(0,_current_button.pressed_state - 0.08)	
			}
			
			_current_button.draw_key(grid)
			
			if(_mouse_click and _current_button.mouse_over) _current_button.mouse_target = true;
		}
		
		pressed_keys = [];
	}
	
}

function KeysGrid(_cell_size,_cell_border,_cell_count_x) constructor
{
	cell_size = _cell_size;
	cell_border = _cell_border;
	grid_cell_count_x = _cell_count_x;
	grid_x = 1920 * 0.5 - ((grid_cell_count_x * (cell_size + cell_border))/2)
	grid_y = 1080 * 0.7
	
}

function Draggable() constructor
{
	obj_drag_n_drop.add_draggable_item(self);
	type = "object"
	
	is_mouse_over = function()
	{
		return point_in_rectangle(mouse_x,mouse_y,x,y,x + width,y + height)
		
	}
	
	
}

function Button(_button,_command,_cell_x,_cell_y,_cell_width = 1, _cell_height = 1) : Draggable() constructor
{
	button = _button;
	command = _command;
	
	cell_x = _cell_x;
	cell_y = _cell_y;
	cell_width = _cell_width;
	cell_height = _cell_height;
	pressed_state = 0;
	mouse_over = false;
	mouse_target = false;
	
	x = 0;
	y = 0;
	width = 0;
	height = 0;
	
	activate = function()
	{
		command.execute(argument[0]);
	}
	
	is_pressed = function(_input)
	{
		return array_find_index(_input,function(_element,_index) {return _element[0] == button});
	}
	
	key_calc_position = function(_grid)
	{
		width = _grid.cell_size * cell_width;
		height = _grid.cell_size * cell_height;
		
		var _grid_button_x = (cell_x * (_grid.cell_size + _grid.cell_border))
		var _grid_button_y = (cell_y * (_grid.cell_size + _grid.cell_border))
		
		x = _grid.grid_x + _grid_button_x;
		y = _grid.grid_y + _grid_button_y;
	
	}
	
	draw_key = function(_grid)
	{
		draw_set_font(fnt_keys)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_alpha(max(0.2,pressed_state))
		//draw_rectangle(x,y,x + width,y + height,true)
		var _key_color = make_color_rgb(36,0,14)
		draw_sprite_ext(KEY,(pressed_state/0.33),x + (width/2), y + (height/2),max(1,width/sprite_get_width(KEY)),1,0,c_white,1.0)
		draw_text_color(x + (width/2),6 + y + (height/2) + (3 * (pressed_state/0.33)),button,_key_color,_key_color,_key_color,_key_color,1.0)
		draw_set_alpha(1)
	}
	
	
	
	
}

