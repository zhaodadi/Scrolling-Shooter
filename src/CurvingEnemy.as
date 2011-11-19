package 
{
	import flash.events.Event;
	import flash.geom.Point;
	
	public class CurvingEnemy extends Enemy
	{
		// amount to change direction the enemy is facing each frame
		public var dr:Number;
		
		public function CurvingEnemy(x:Number, y:Number, dx:Number, dy:Number, p:Point, colour:int, dr:Number)
		{
			super(x, y, dx, dy, p, colour);
		
			// store the change in rotation	
			this.dr = dr;
		}
		
		
		public override function update(event:Event):Boolean
		{
			// calculate the current speed
			var speed:Number = new Point(dx, dy).length;
			
			// change the rotation
			rotation = rotation + dr;
			
			// calculate the new x and y directions
			dx = Math.cos((rotation + 90)/180*Math.PI) * speed;
			dy = Math.sin((rotation + 90)/180*Math.PI) * speed;
			
			// update the enemy via the super's update
			return super.update(event);
		}
	}
}