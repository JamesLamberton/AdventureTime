///@desc oQuest Control
if not instance_exists(oPlayer) exit;

openJournal = keyboard_check_pressed(ord("J"));

if openJournal 
{
	if isOpen == true 
	{
		isOpen = false;
	}
	else
	{
		isOpen = true;
	}
}

switch (quest)
{
	
	#region NO QUEST
	
	case "noQuest":
	
		questNameText = "No active Quest";
		questDescText = "You have no active Quest";
		
	break;
	
	#endregion
	
	#region QUEST - FIND BEMO
	
	case "findBemo":
	
		questNameText = "Find Bemo";
		questDescText = "Bemo has gotten himself lost in a nearby cave, I'm going to have to go and find him";
	
	with (oPlayer)
	{
		if place_meeting(x,y,oBemo)
		{
			oJake.text_id = "JakeQuest01-Finished";		
		}	
	}
	
	break;
	
	#endregion
	
}