// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function person() constructor
{
	name = "";
	run_animation = "";
	idle_animation = "";
	
	
}

function Princess() : person() constructor
{
	name = "Princess"
	icon_gear = mein_menu_princess
	icon_gear_evil = mein_menu_princess_evil
	icon = princess_icon;
	run_animation = Princess_run;
	idle_animation = Princess_idle
	down_animation = Princess_down;
	up_animation = Princess_up;
	
	dialogue =
	{
		Cat : ["Эммм","Принцесса не любит котиков?","Даже не знаю что тут сказать","Давайте просто поверим в этом"],	
		Robot : ["Все по заветам сказочной истории","Королевство роботов много лет сражается с королевством принцесс","Ну или типа того"]	
	}
}

function Cat() : person() constructor
{
	name = "Cat"
	icon_gear = mein_menu__at
	icon_gear_evil = mein_menu__at_evil
	icon = cat_icon;
	run_animation = Cat_run;
	idle_animation = Cat_static
	down_animation = Cat_down
	up_animation = Cat_up
	dialogue =
	{
		Robot : ["Однажды он попытался пометить электрического робота","Но это не ваше дело","Холодный твердый металл","Да на таком не особо удобно лежать"],	
		Princess : ["Знаете","Кошки в принципе не очень любят женщин","Запахи духов очень сильно бьют по носу"]	
	}
	
}

function Robot() : person() constructor
{
	name = "Robot"
	icon_gear = mein_menu_robot
	icon = robot_icon;
	icon_gear_evil = mein_menu_robot_evil
	run_animation = robot_run;
	idle_animation = Robot_static
	down_animation = robot_down
	up_animation = robot_up
	
	dialogue =
	{
		Cat : ["Однажды его попытался пометить кот","Очень смешная история","Но осадок обидный все равно остался"],	
		Princess : ["Как бездушной машине для убийств","Он ненавидит все розовое","Как вы собрались спасать мир?","Магией дружбы?"]	
	}
}