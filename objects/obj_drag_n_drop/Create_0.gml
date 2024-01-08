global.is_paused = false;

draggable_objects = []; 
mouse_target = undefined;


replaced = [];

add_draggable_item = function(_obj) 
{
	array_push(draggable_objects,_obj)
}

if(audio_is_playing(snd_gametheme) == false) audio_play_sound(snd_gametheme,1,true)
window_set_fullscreen(true)