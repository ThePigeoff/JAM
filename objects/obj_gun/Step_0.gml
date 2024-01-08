/// @description Insert description here
// You can write your code in this editor
direction = image_angle
event_inherited()
if(global.is_paused) exit;
counter += 1/room_speed;
if(timer < counter)
{
command.execute();
counter = 0;
}





