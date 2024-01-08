/// @description Insert description here
// You can write your code in this editor
text_array = obj_game.not_hero.dialogue[$ obj_game.main_hero.name];

array_insert(text_array,0,"Похоже " + obj_game.not_hero.name + " недоволен вашим выбором")
text_id = 0;

array_insert(text_array,array_length(text_array),"Помогите " + obj_game.not_hero.name + " стать главным героем")
array_insert(text_array,array_length(text_array),"Если вам, конечно, достаточно стыдно")
array_push(text_array,"Вам дана великая сила игровых багов")
array_push(text_array,"При помощи курсора мыши вы можете менять свойства обьектов местами")
array_push(text_array,"Просто попробуйте!")





