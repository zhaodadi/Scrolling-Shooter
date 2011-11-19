package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	
	public class Resources
	{
		// ----------------------------- player resources --------------------------------------------------
		
		// player graphics - specify the source image file here
		// picture modified base on http://photos.joyandjon.com/v/airplanes/f22/f16-f35-f22-size-comparison.jpg.html
		[Embed(source="f22.png")] public static var PlaneFrames:Class;
		public static var planeFrames:Bitmap = new PlaneFrames();
		// player graphics - specify the size of each animation frame here
		public static const PLANE_FRAME_SIZE:Point = new Point(160, 150);
		
		// gun sound - specify the source mp3 here
		[Embed(source="gun1.mp3")] public static var GunSound:Class;
		public static var gunFx:Sound = new GunSound();			


		// ----------------------------- player bullet resources -------------------------------------------

		// player bullet creation function
		// currently has custom hand-drawn bullets
		// you can modify this code to do hand drawing yourself or 
		// replace this function with the following (currently commented out) code
		[Embed(source="missile.gif")]	public static var BulletPicture:Class;
		public static var missileFrames:Bitmap = new BulletPicture();
		public static const MISSILE_SIZE:Point = new Point(500, 43);
		/*public static function makePlayerBullet():Bitmap
		{
			return new BulletPicture();
		}
/*
		public static function makePlayerBullet():Sprite
		{
			var s:Sprite = new Sprite();
			
			// create a shaded (colour and transparency) line for a zoomy looking bullet
			// this should be done with lineGradientStyle and drawRoundRect, but I couldn't make it work :S
			s.graphics.lineStyle(4, 0xFFFF00, 0.15, true, "normal", null, "ROUND");
			for (var i:int = -8; i < 8; i += 2)
			{
				s.graphics.moveTo(i, 0);
				s.graphics.lineTo(8, 0);
			}	
			
			return s;
		} */

		// ----------------------------- enemy resources ---------------------------------------------------
		// Enemy 1 graphics
		[Embed(source="enemy1.png")] public static var Enemy1:Class;
		// Enemy 2 graphics
		[Embed(source="enemy2.png")] public static var Enemy2:Class;
		// Enemy 2 graphics
		[Embed(source="enemy3.png")] public static var Enemy3:Class;
		// F35 graphics
		[Embed(source="enemy4.png")] public static var Enemy4:Class;
		// boss in level 1
		[Embed(source="boss1.png")] public static var Boss1:Class;
		// array of different plane colours, can add as many of these as you want
		//public static var planes:Array = [new F35(), new Enemy2()];
		public static var planes:Array = [new Enemy1(), new Enemy2(), new Enemy3(), new Enemy4(), new Boss1()];
		// enemy plane graphics - specify the size of each animation frame here
		public static const BIGGER_ENEMY_FRAME_SIZE:Point = new Point(100, 70);
		public static const SMALLER_ENEMY_FRAME_SIZE:Point = new Point(50, 70);
		public static const BOSS1_FRAME_SIZE:Point = new Point(290, 240);
		
		

		// ----------------------------- enemy bullet resources --------------------------------------------

		// player bullet creation function
		// currently has custom hand-drawn bullets
		// you can modify this code to do hand drawing yourself or 
		// replace this function with the following (currently commented out) code
		/*[Embed(source="myAwesomeEnemyBullet.png")] public static var EnemyBulletPicture:Class;
		public static function makeEnemyBullet():Bitmap
		{
			return new EnemyBulletPicture();
		}*/

		public static function makeEnemyBullet():Sprite
		{
			var s:Sprite = new Sprite();
			
			// draw a yellow circle
			s.graphics.beginFill(0xFF0000);
			s.graphics.drawCircle(0, 0, 3);
			s.graphics.endFill();	
			
			return s;
		}


		// ----------------------------- explosion resources -----------------------------------------------

		// explosion graphics - specify the source image file here		
		[Embed(source="bigexplosion.png")] public static var ExplosionFrames:Class;
		public static var explosionFrames:Bitmap = new ExplosionFrames();
		// explosion graphics - specify the size of each animation frame here
		public static const EXPLOSION_FRAME_SIZE:Point = new Point(52, 52);
		
		// explosion sound - specify the source mp3 here
		[Embed(source="explosion.mp3")] public static var ExplosionSound:Class;
		public static var explosionFx:Sound = new ExplosionSound();	


		// ----------------------------- parallax scrolling background resources ---------------------------
		
		// island graphics
		// currently uses makeIslands() function, 
		// this could be replaced with the following (currently commented out) three lines instead
		[Embed(source="level1_bg.png")] public static var BackgroundPicture:Class;
		public static var islands:Bitmap = new BackgroundPicture();
		/*public static var islands:Bitmap = makeIslands(Globals.SCREEN_WIDTH, Globals.SCREEN_HEIGHT, 1);
		
		public static function makeIslands(width:Number, height:Number, speed:Number):Bitmap
		{
			// create a blank bitmap to draw in for background
			var data:BitmapData = new BitmapData(width, height, true, 0x00FFFFFF);
			var seed:Number = Math.floor(Math.random() * 100);
			var r:Rectangle = new Rectangle(0, 0, width, height);
			var p:Point = new Point(0,0);
						
			// do a bunch of weird things to create mildly realistic water and islands
			data.perlinNoise(speed * width / 10, speed * width / 10, 15, seed, true, false, 
				BitmapDataChannel.GREEN, false, null);
			data.threshold(data, r, p, "<", 0x00006000, 0xFF000088, 0x0000FF00);

			return new Bitmap(data);
		}*/

		// cloud graphics
		// currently uses makeClouds() function, 
		// could be modified like the islands above to use an embedded graphic
		public static var backgroundClouds:Bitmap = makeClouds(Globals.SCREEN_WIDTH, Globals.SCREEN_HEIGHT, 1.5);
		public static var foregroundClouds:Bitmap = makeClouds(Globals.SCREEN_WIDTH, Globals.SCREEN_HEIGHT, 3);

		public static function makeClouds(width:Number, height:Number, speed:Number):Bitmap
		{			
			// create a blank bitmap to draw in for background
			var data:BitmapData = new BitmapData(width, height, true, 0x00FFFFFF);
			var seed:Number = Math.floor(Math.random() * 100);
			var r:Rectangle = new Rectangle(0, 0, width, height);
			var p:Point = new Point(0,0);

			// do a bunch of weird things to create mildly realistic clouds
			data.perlinNoise(speed * width / 10, speed * width / 10, 15, seed, true, true, 0, true, null);
			data.threshold(data, r, p, "<", 0x60606060, 0x60606060, 0xFFFFFFFF);
			data.colorTransform(r, new ColorTransform(2.5, 2.5, 2.5, 2.5, -255, -255, -255, -255));
			data.copyChannel(data, r, p, BitmapDataChannel.BLUE, BitmapDataChannel.ALPHA);

			return new Bitmap(data)
		}
	}
}