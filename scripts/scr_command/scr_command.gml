// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Command() constructor
{
	execute = function()
	{
		
		
		
	}
	
	command_draw = function()
	{
		
		
		
	}
	
}

function MoveLeft() : Command() constructor
{
	execute = function()
	{
		var _on_ground = collision_point(other.x,other.y + 1,obj_floor,false,true) != noone
		
		var _speed = (other.on_ground)? -5 : -6
		move_horizontaly(other,_speed)
	
	
	}
}

function MoveRight() : Command() constructor
{
	execute = function()
	{
		var _on_ground = collision_point(other.x,other.y + 1,obj_floor,false,true) != noone
		
		var _speed = (other.on_ground)? 5 : 6
		
		move_horizontaly(other,_speed)
	
	}
}

function Space() : Command() constructor
{
	execute = function(_force = -10)	
	{
		if(other.on_ground)
		other.y_speed = _force;
	
	}
}

function Shot() : Command() constructor
{
	cooldown = 5;
	timer = 0;
	
	execute = function()
	{
		timer += 1/room_speed;
		if(other.direction == 270 or other.direction == 90)
		{
			var bullet = instance_create_layer((other.x - other.sprite_xoffset),(other.y - other.sprite_yoffset) + other.sprite_height/2 + 128,other.layer,obj_bullet)
			bullet.direction = other.direction
		}
		else
		{
			var bullet = instance_create_layer((other.x - other.sprite_xoffset) + (other.sprite_width/2) + 64 * other.image_xscale,(other.y - other.sprite_yoffset) + other.sprite_height/2,other.layer,obj_bullet)
			bullet.direction = other.direction
			
		}
			
		
		
		
	}
	
	
}

function Restart() : Command() constructor
{
	execute = function()
	{
		room_restart()
		
		
		
	}
	
	
}

function NotHero() : Command() constructor
{
	execute = function()
	{
		other.sprite_index = other.idle_animation
	
	
	
	
	}
}

function Exit() : Command() constructor
{
	
	execute = function()
	{
		with(other)
		{
			
		}
		
		
	}
	
	

}

function Bullet() : Command() constructor
{
	
	execute = function()
	{
		if(global.is_paused) exit
			other.y += lengthdir_y(8,other.direction);
			//other.x += lengthdir_x(8,other.direction);
			move_horizontaly(other,lengthdir_x(8,other.direction));
		
		
		
	}
	
	
}


function MainHero() : Command() constructor
{
	left_button = "A"
	right_button = "D"
	space_button = "SPACE"
	restart_button = "R"


	controller = new InputSystem()
	controller.add_key(new Button("W", new Command(),1,0))
		var _rst = new Button(restart_button, new Restart(),3,0)
		_rst.pressed_state = 1;
	controller.add_key(_rst)
	controller.add_key(new Button(left_button, new MoveLeft(),0,1))
	controller.add_key(new Button("S", new Command(),1,1))
	controller.add_key(new Button(right_button, new MoveRight(),2,1))
	controller.add_key(new Button(space_button, new Space(),4,1,3))
	
	movement_direction = 1;
	on_ground = true;
	
	is_dead = false;
	dead_timer = 0;
	
	execute = function()
	{
		
		other.sprite_index = other.run_animation
		if(is_dead)
		{
			dead_timer += 1/room_speed;
			if(dead_timer > 2)
			{
				controller.add_input(restart_button)
				
			}
			return;
		}
		
		with(other)
			if(place_meeting(x,y,obj_dangerous))
				other.is_dead = true;
		
		
		if(other.on_ground)
		{
			//var _wall_at_the_front = collision_point(other.x + (64 * sign(other.x_speed)),other.y - 32,obj_floor,false,true) != noone
			with(other)
			var _wall_at_the_front = place_meeting(x + (3 * image_xscale),y,obj_floor)
			var _dangerous_at_the_front = collision_point(other.x + (80 * sign(other.x_speed)),other.y - 32,obj_dangerous,false,true) != noone
			var _gap_at_the_front = collision_point(other.x + (32 * sign(other.x_speed)),other.y + 32,obj_floor,false,true) == noone
			var _gap_far = collision_rectangle(other.x + (32 * sign(other.x_speed)),other.y - 250,other.x + 310 * sign(other.x_speed),other.y + 32,obj_floor,false,true)
			if(_dangerous_at_the_front) controller.add_input(space_button,-13)
			if((_gap_at_the_front and _gap_far != noone and abs(_gap_far.y - other.y) < 250)) controller.add_input(space_button,-14)
			
			if(_wall_at_the_front)
			{
				var _can_jump = collision_point(other.x + (64 * other.image_xscale),other.y - 80,obj_floor,false,true) == noone
				
				if(_can_jump) 
				{
					controller.add_input(space_button)
				}
				else
				{
					movement_direction *= -1;
				}
			}
			
		}
		_controll_command = (movement_direction == 1) ? right_button : left_button;
		
		controller.add_input(_controll_command);
	}
	
	command_draw = function()
	{
		controller.apply_input();
		//draw_circle(other.x + (33 * sign(other.x_speed)),other.y - 32,16,false)
		
		if(sign(other.x_speed) != 0 ) other.image_xscale = sign(other.x_speed);
		other.direction = other.image_xscale == 1? 0 : 180
	}
}

