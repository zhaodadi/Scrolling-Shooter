package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Crosshair extends Sprite
	{
		public function Crosshair(x:Number, y:Number)
		{
			// copy x and y parameters into x and y instance variables
			this.x = x;
			this.y = y;
			
			// draw a white crosshair
			graphics.lineStyle(1.5, 0xFFFFFF);
			graphics.drawCircle(0, 0, 20);
			graphics.moveTo(-3, 0);
			graphics.lineTo(3, 0);
			graphics.moveTo(0, -3);
			graphics.lineTo(0, 3);
			graphics.moveTo(0, -23);
			graphics.lineTo(0, -17);
			graphics.moveTo(0, 23);
			graphics.lineTo(0, 17);
			graphics.moveTo(-23, 0);
			graphics.lineTo(-17, 0);
			graphics.moveTo(23, 0);
			graphics.lineTo(17, 0);
		}

		// update crosshair's on-screen position to be location of the mouse
		public function mouseMove(event:MouseEvent):void
		{
			x = event.stageX;
			y = event.stageY;
		}
	}
}