package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	public class Animated extends Mover
	{
		// array of bitmap objects representing the individual frames of animation
		public var frames:Array;
		
		// current frame
		public var frame:uint = 0;
		
		// framerate constants
		public static const FRAMERATE_EVERYFRAME:int = -1;
		public static const FRAMERATE_MANUAL:int = 0;
		
		// number of times to play the animation (count of number of frames)
		public var times:int;
		
		// animation times constants
		public static const FOREVER:int = -1;
		
		// timer used for animation timing (seperate to usual frame redraw timing)
		public var timer:Timer = null;
		
		// constructor takes array of bitmaps specifying the animation frames, 
		// a frame rate, 
		//    > 0  frames to be displayed per second
		//    ==0  (FRAMERATE_MANUAL) calls to nextFrame and prevFrame must be performed by the user
		//    ==-1 (FRAMERATE_EVERYFRAME) moves to the next frame at the start of each update
		// the number of times to play the animation,
		//    > 0  number of times to play the animation through
		//    ==-1 (TIMES_FOREVER) forever
		// a position, and optional velocity
		public function Animated(frames:Array, frameRate:int, times:int, x:Number, y:Number, dx:Number = 0, dy:Number = 0)
		{
			// call to Mover's constructor
			super(x, y, dx, dy);
			
			// set instance variables to values based in
			this.frames = frames;
			this.times = times * frames.length;
						
			// add each frame to the display, but make them all invisible	
			for each (var bitmap:Bitmap in frames)
			{
				bitmap.visible = false;
				addChild(bitmap);
			}
			
			// make current frame visible
			frames[frame].visible = true;
			
			// if frameRate set, create a timer to call nextFrame the appropriate amount of times per second
			if (frameRate > 0)
			{
				timer = new Timer(1000.0 / frameRate);
				timer.addEventListener(TimerEvent.TIMER, nextFrame);
				timer.start();
			}
		}

		// create an array of bitmaps from a single source bitmap containing fixed size tiles
		public static function createBitmapArray(tiles:Bitmap, tileWidth:int, tileHeight:int):Array
		{
			// number of rows and columns
			const COLUMNS:int = tiles.width / tileWidth;
			const ROWS:int = tiles.height / tileHeight;
			
			// array of frames initialised to correct length
			var frames:Array = new Array(COLUMNS * ROWS);
			
			// temporary bitmaps used for copying
			var colour:BitmapData = new BitmapData(tiles.width, tiles.height, true);
			var alpha:BitmapData = new BitmapData(tiles.width, tiles.height, true);
						
			// copy from the source bitmap into the temporary ones
			colour.draw(tiles, null, null, flash.display.BlendMode.NORMAL);
			alpha.draw(tiles, null, null, flash.display.BlendMode.ALPHA);
			
			// loop through all tiles and copy them into a bitmap each
			for (var y:int = 0; y < ROWS; y++)
			{
				for (var x:int = 0; x < COLUMNS; x++)
				{
					// temporary bitmap data
					var bitmapData:BitmapData = new BitmapData(tileWidth, tileHeight, true);
					
					// copy correct tile from the big image into the temporary
					bitmapData.copyPixels(colour, new Rectangle(x * tileWidth, y * tileHeight, tileWidth, tileHeight), new Point(0, 0), 
						alpha, new Point(x * tileWidth, 0));
					
					// create new bitmap from bitmap data
					var b:Bitmap = new Bitmap(bitmapData);
					
					// set position so that the centre is at the origin (0,0)
					b.x = -tileWidth/2;
					b.y = -tileWidth/2;
					
					// store bitmap in the array
					frames[x + y * COLUMNS] = b;
				}
			}

			// return the array
			return frames;
		}
		
		public override function update(event:Event):Boolean
		{
			// call Mover's update, returning if object dies
			if (!super.update(event)) return false;

			// update current frame if every frame was chosen as the framerate
			if (timer == null) nextFrame();			

			// check to see if animation has completed, and if so, remove it
			if (times == 0)
			{
				die();
				return false;
			}

			// object didn't die
			return true;
		}		
		
		// move on to next frame
		public function nextFrame(event:Event = null):void
		{
			// set current frame to invisible
			frames[frame].visible = false;
			
			// move counter on to next frame (wrapping if we reach the frame limit)
			frame = (frame + 1) % frames.length;
			
			// keep track of how many frames played remaining
			if (times > 0) 
			{
				times--;
				if (times == 0) return;
			}
			
			// make new current frame visible
			frames[frame].visible = true;
		}

		// move on to previous frame
		public function previousFrame(event:Event = null):void
		{
			frames[frame].visible = false;
			frame = (frame - 1 + frames.length) % frames.length;

			if (times > 0) 
			{
				times--;
				if (times == 0) return;
			}

			frames[frame].visible = true;
		}		
	}
}