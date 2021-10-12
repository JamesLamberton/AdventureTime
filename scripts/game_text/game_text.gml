/// @param text_id
function game_text(_text_id)
{
	switch(_text_id) // Add new dialoge character name here and there associated dialoge. 
	{
		#region ChooseGoose
		
			case "ChooseGoose": 
				add_text_page("Hiya Fella");
				add_text_page("Would you like to trade?");
					script_option("Yeah", "ChooseGoose - Yes");
					script_option("Nah", "ChooseGoose - No");
			break;
		
			case "ChooseGoose - Yes":
		
				add_text_page("Take a look!");
		
			break;
			
			case "ChooseGoose - No":
		
				add_text_page("Aw, see ya round");
		
			break;
		
		#endregion
		
		case "Jake":
		add_text_page("Hey Finn");
		break;
	}
}