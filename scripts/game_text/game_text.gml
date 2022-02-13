/// @param text_id
function game_text(_text_id)
{
	switch(_text_id)
	{
		
	#region Choose Goose 
		
		case "ChooseGoose":
			add_text("Hi Finn!","ChooseGoose", -1);
			text_color(3,8,c_white,c_white,c_blue,c_blue);
			add_text("Hey Choose Goose","Finn", 1);
			text_color(4,16,c_yellow,c_yellow,c_white,c_white);
			add_text("Its great to see you again Finn. Not many travelers have been visting my store, so its good to see a friendly face.","ChooseGoose", -1);
			add_text("Would you like to trade?","ChooseGoose", -1);
				text_option("Yes","ChooseGoose-TradeYes");
				text_option("No","ChooseGoose-TradeNo");
		break;

		case "ChooseGoose-TradeYes":
			add_text("Yeah sure","Finn", 1);
			add_text("Awesome","ChooseGoose", -1);
			add_text("Take a look!","ChooseGoose", -1);
		break;
		
		case "ChooseGoose-TradeNo":
			add_text("No Thanks Choose Goose","Finn",1)
			add_text("Aw","ChooseGoose",-1);
			add_text("No Worries","ChooseGoose",-1);
			add_text("Would you like a really long paragraph?","ChooseGoose",-1);
				text_option("Yeah sure","ChooseGoose-ParagraphYes");
				text_option("Heck No","ChooseGoose-ParagraphNo");
		break;
		
		case "ChooseGoose-ParagraphNo":
			add_text(":(","ChooseGoose",-1);
		break;
		
		case "ChooseGoose-ParagraphYes":
			add_text("IOgfneuigrtebgrejg nboegineoi gvneirgbinb hjgfdujg bhnergbjdfknb g=f hjgfdujg bhnergbjdfknb g=f","ChooseGoose",-1);
			add_text("Um, Thanks, I guess","Finn",1);
		break;
		
	#endregion

	#region Banana Guard	
		case "BananaGuard":
			add_text("Hey Finn");
			text_color(4,8,c_white,c_white,c_blue,c_blue);
			add_text("You better be careful, there's skeletons up ahead");
			text_color(31,40,c_white,c_white,c_red,c_red);
			add_text("Thanks Banana Guard"); 
			text_color(7,19,c_yellow,c_yellow,c_white,c_white);
		break; 
		
		
	#endregion
	
	#region Jake 
	
		case "Jake":
			add_text("Hey Finn","Jake",-1);
			add_text("Bemo's gone missing! Do you recon you can go and find him?","Jake",-1);
				text_option("Sure","JakeQuest01-Yes");
				text_option("Not right now","JakeQuest01-No");	
		break;
		
		case "JakeQuest01-Yes":
			add_text("Yeah sure","Finn",1);
			add_text("Good luck Finn!","Jake",-1);
			
			oJake.text_id = "JakeQuest01-Yes";
			oQuest.quest = "findBemo";
			oBemo.isObjective = true;
		break;
		
		case "JakeQuest01-Finished":
			add_text("You found bemo! thanks Finn!","Jake",-1);
			
			oQuest.quest = "noQuest";
			oJake.text_id = "JakeQuest02";
			
		break;
		
		case "JakeQuest02":
		
			add_text("Hey Finn! hope the adventuring is going well", "Jake", -1);
		
		break;
	
	#endregion
	
	#region Bemo
	
	case "Bemo":
	
		oBemo.isObjective = false;
		add_text("Finn you found me!","Bemo",-1);
		add_text("Bemo what are you doing down here?","Finn",1);
		add_text("Sorry Finn, I wanted to go adventuring but got lost","Bemo",-1);
	
	break;
	
	#endregion
	
	}
} 