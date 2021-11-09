/// @param text_id
function game_text(_text_id)
{
	switch(_text_id)
	{
		
	#region Choose Goose 
		
		case "ChooseGoose":
			add_text("Hi Finn! Its so great to see you, blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah");
			add_text("Its great to see you again");
			add_text("Would you like to trade?");
				text_option("Yes","ChooseGoose-TradeYes");
				text_option("No","ChooseGoose-TradeNo");
		break;

		case "ChooseGoose-TradeYes":
			add_text("Awesome");
			add_text("Take a look");
		break;
		
		case "ChooseGoose-TradeNo":
			add_text("Aw");
			add_text("No Worries");
			add_text("Would you like a really long paragraph");
				text_option("Yeah sure","ChooseGoose-ParagraphYes");
				text_option("Heck No","ChooseGoose-ParagraphNo");
		break;
		
		case "ChooseGoose-ParagraphNo":
			add_text(":(");
		break;
		
		case "ChooseGoose-ParagraphYes":
			add_text("IOgfneuigrtebgrejg nboegineoi gvneirgbinb hjgfdujg bhnergbjdfknb g=f hjgfdujg bhnergbjdfknb g=f");
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
			add_text("wtf");
		break;
		
		case "BananaGuardNo":
			add_text("Thank god");
		break;
		
	#endregion
	
	}
} 