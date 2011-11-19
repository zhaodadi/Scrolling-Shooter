package
{
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class Welcome extends Sprite
	{
		// start new game
		public static const START:int = 1;
		
		// help
		public static const HELP:int = 2;
		
		// welcome screen text
		public var startGame:TextField;
		public var help:TextField;
		public var welcomeText:TextField;
		public var about:TextField;
		
		// click's status
		public var clicked:int;
		
		public function Welcome()
		{
			// create a text format to make the scores big and pretty
			var format:TextFormat = new TextFormat();
			format.font = "Arial Black";
			format.size = 30;
			format.align = "center";
			format.color = 0xCFC106;
			
			// welcome message
			welcomeText = new TextField();
			welcomeText.defaultTextFormat = format;
			welcomeText.text = "Welcome to my simple Shoot Plane Game!";
			welcomeText.width = Globals.SCREEN_WIDTH;
			welcomeText.y = 30
			welcomeText.selectable = false;
			addChild(welcomeText);
			
			format.font = "Arial Black";
			format.size = 50;
			format.align = "center";
			format.color = 0x0727F5;
			
			// start game button
			startGame = new TextField();
			startGame.defaultTextFormat = format;
			startGame.text = "Start Game";			
			startGame.width = Globals.SCREEN_WIDTH;
			startGame.y = 150;
			startGame.selectable = false;
			addChild(startGame);
			
			// help button
			help = new TextField();
			help.defaultTextFormat = format;
			help.text = "Help";
			help.width = Globals.SCREEN_WIDTH;
			help.y = 240;
			help.selectable = false;
			addChild(help);
			
			// about button
			about = new TextField();
			about.defaultTextFormat = format;
			about.text = "About";
			about.width = Globals.SCREEN_WIDTH;
			about.y = 330;
			about.selectable = false;
			addChild(about);
		}
	}
}