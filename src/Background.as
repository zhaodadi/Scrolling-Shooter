package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	
	public class Background extends Mover
	{
		// two identical bitmaps for simple scrolling
		public var top:Bitmap;
		public var bottom:Bitmap;

		// constructor
		// parameters are source bitmap data to scroll as background, scrolling speed, and alpha transparency
		public function Background(bitmap:Bitmap, speed:Number, alpha:Number=1.0)
		{
			// call Mover constructor
			super(0, 0, 0, speed);

			// set alpha transparency
			this.alpha = alpha;

			// create two identical bitmaps for scrolling, one off the top of the screen
			top = new Bitmap(bitmap.bitmapData);
			top.x = 0;
			top.y = -top.height;
			addChild(top);
			bottom = new Bitmap(bitmap.bitmapData);
			bottom.x = 0;
			bottom.y = 0;
			addChild(bottom);
		}
		
		public override function update(event:Event):Boolean
		{
			// move both bitmaps until they are too far down the screen, and then push them back up
			y = (y + dy) % top.height;
			
			return true;
		}
	}
}