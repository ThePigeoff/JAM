/// @description Insert description here
// You can write your code in this editor
var start_angle = 180;
var choised = undefined;
for(var i = 0; i < array_length(menu_characters); i++)
{
	var character = menu_characters[i]
	
	var _cur_angle = (image_angle - first_angle) + start_angle - (60 * i)
	if(round(_cur_angle) == 180)
		choised = character;
		
	
	
	var char_icon = (choised == character)? character.icon_gear : character.icon_gear_evil
	draw_sprite(char_icon,0,x + lengthdir_x(276,(image_angle - first_angle) + start_angle - (60 * i)),y + lengthdir_y(276,(image_angle - first_angle) + start_angle - (60 * i)))
	
	
	
}

draw_set_font(fnt_names)
draw_set_valign(fa_center)
draw_set_halign(fa_left)
if(choised != undefined)
{
	var _width = string_width("Yo wanna be a " + string(choised.name) + " ?")
	
	var x_start = 412 - (_width/2)
	
	draw_text(x_start,512,"Yo wanna be a ")
	draw_text(x_start,412,"lol. ")
	draw_set_color(c_red)
	draw_text(x_start + string_width("Yo wanna be a "),512, choised.name)
	draw_set_color(c_white)
	draw_text(x_start + string_width("Yo wanna be a ") + string_width(choised.name),512, " ?")
	
	if(keyboard_check_pressed(vk_enter))
	{
		obj_game.main_hero = choised;
		var _ind = array_get_index(menu_characters, choised)
		array_delete(menu_characters,_ind,1)
		random_set_seed(current_time)
		var _ind_not_hero = choose(0,1)
		obj_game.not_hero = menu_characters[_ind_not_hero]
		room_goto_next();
		audio_stop_sound(snd_menu)
	}

	
}






