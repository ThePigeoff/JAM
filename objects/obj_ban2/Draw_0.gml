/// @description Insert description here
// You can write your code in this editor
var level_center_x = room_width/2
var level_center_y = room_height/2

//draw_sprite(main_menu_zaglushka,0,level_center_x,level_center_y)
draw_set_halign(fa_center)
draw_set_font(fnt_text)
draw_sprite(obj_game.not_hero.icon,0,level_center_x,level_center_y)
draw_text(level_center_x,level_center_y + 180,text_array[text_id])

if(keyboard_check_pressed(vk_enter)) text_id++;

if(text_id == array_length(text_array))
show_error("Ваш компьютер заражен гепатитом А",true)





