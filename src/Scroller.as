package  {
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
		
	// set the screen size to 800x600 with a dark grey background
	[SWF(width="800", height="600", backgroundColor="#222222")]
	public class Scroller extends Sprite
	{	
		public function Scroller()
		{				
			trace("main begins");
			// set frame rate to 60 frames per second
			stage.frameRate = 60;
			
			// create welcome screen
			Globals.wel = new Welcome();
			Globals.wel.startGame.addEventListener(MouseEvent.CLICK,createObjects);
			addChild(Globals.wel);
			
		}

		public function createObjects(event:MouseEvent):void
		{	
			this.removeChild(Globals.wel);
			
			// hide the mouse pointer (we are making our own)
			Mouse.hide();
			
			// create and add parallax scrolling islands and lower clouds
			Globals.background1 = new Background(Resources.islands, 1, 0.5);
			//Globals.background2 = new Background(Resources.backgroundClouds, 1.5, 0.75);
			addChild(Globals.background1);
			//addChild(Globals.background2);

			// create and add player
			Globals.player = new Player(400, 500);
			addChild(Globals.player);

			// create and and add parallax scrolling foreground clouds
			Globals.foreground = new Background(Resources.foregroundClouds, 3, 1.0);
			addChild(Globals.foreground);

			// create and add crosshair
			Globals.crosshair = new Crosshair(mouseX, mouseY);
			addChild(Globals.crosshair);

			// create a text format to make the scores big and pretty
			var format:TextFormat = new TextFormat();
        	format.font = "Arial Black";
        	format.size = 40;
			format.align = "left";
			format.color = 0xBB0000;

			// create and add player's score
			Globals.playerScore = new TextField();
			Globals.playerScore.defaultTextFormat = format;
			Globals.playerScore.text = "Score: " + Globals.player.score;			
			Globals.playerScore.width = Globals.SCREEN_WIDTH;
			Globals.playerScore.filters = [new DropShadowFilter()];
			Globals.playerScore.selectable = false;
			addChild(Globals.playerScore);

			// right align the health
			format.align = "right";

			// create and add player's health
			Globals.playerHealth = new TextField();
			Globals.playerHealth.defaultTextFormat = format;
			Globals.playerHealth.text = Globals.player.health + " :Health";
			Globals.playerHealth.width = Globals.SCREEN_WIDTH;
			Globals.playerHealth.filters = [new DropShadowFilter()];
			Globals.playerHealth.selectable = false;
			addChild(Globals.playerHealth);
			
			// add event listeners for mouse and keyboard
			// these are added to the stage rather than to the objects themselves
			// so that input is always caught (as long as window has focus)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Globals.player.keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, Globals.player.keyUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, Globals.crosshair.mouseMove);
			stage.addEventListener(MouseEvent.CLICK, Globals.player.shoot);
			
			// create object that will create the waves of enemies
			Globals.waves = new Waves(this);
		}
	}
}
