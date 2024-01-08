if(global.is_paused) exit;

y_speed += grv;
//show_message(gravity)
var _direction = sign(y_speed)
while(place_meeting(x, y + y_speed, obj_floor) and grv != 0)
{
	y = round(y)
	y_speed = round(y_speed)
	y_speed -= _direction
	
	//show_message(y_speed)
	//show_message("y_speed: " + string(y_speed) + " dir: " + string(_direction))
}

y += y_speed;

on_ground = place_meeting(x,y+3,obj_floor)

if(keyboard_check_pressed(ord("R"))) room_restart()