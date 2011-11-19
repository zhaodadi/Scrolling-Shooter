package 
{
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	public class Globals
	{
		// screen size
		public static const SCREEN_WIDTH:int = 800;
		public static const SCREEN_HEIGHT:int = 600;

		// play area
		public static const OFFSCREEN_DISTANCE:int = 20;
		public static const PLAY_AREA:Rectangle = new Rectangle(-OFFSCREEN_DISTANCE, -OFFSCREEN_DISTANCE, SCREEN_WIDTH + OFFSCREEN_DISTANCE*2, SCREEN_HEIGHT + OFFSCREEN_DISTANCE*2);
		
		//welcome screen
		public static var wel:Welcome;
		// player sprite
		public static var player:Player;
		
		// crosshair
		public static var crosshair:Crosshair;

		// player's score and health
		public static var playerScore:TextField;
		public static var playerHealth:TextField;

		// parallax scrolling background images
		public static var background1:Background;
		public static var background2:Background;
		public static var foreground:Background;

		// waves of enemies
		public static var waves:Waves;
	}
}