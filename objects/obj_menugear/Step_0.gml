/// @description Insert description here
// You can write your code in this editor
image_angle = lerp(image_angle,target_angle,0.08)

var _dir = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)

target_angle += 60 * _dir;


target_angle = clamp(target_angle,first_angle, first_angle + 60 * 2)




