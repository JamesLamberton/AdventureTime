/// @param text_id
function game_text(_text_id)
{
	switch(_text_id)
	{
		
	#region Choose Goose 
		
		case "ChooseGoose":
			add_text("Hi Finn!","ChooseGoose", -1);
			add_text("Hey Choose Goose","Finn", 1);
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
			add_text("Do you like to eat bananas?")
				text_option("Yes","BananaGuardYes");
				text_option("No","BananaGuardNo");
		break;
		
		case "BananaGuardYes":
			add_text("I sure do", "Finn");
			add_text("wtf");
		break;
		
		case "BananaGuardNo":
			add_text("Thank god");
		break;
		
	#endregion
	
	}
} 