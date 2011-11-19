package 
{
	import flash.events.Event;

	public class Bullet extends Animated
	{	
		// constructor
		// x and y specify initial position
		// angle and speed specify initial starting direction (in radians) and speed		
		public function Bullet(x:Number, y:Number, angle:Number, speed:Number)
		{
			// call Mover constructor with initial position and speed
			super(Animated.createBitmapArray(Resources.missileFrames, Resources.MISSILE_SIZE.x, Resources.MISSILE_SIZE.y), 
				  Animated.FRAMERATE_EVERYFRAME, Animated.FOREVER,x, y);

			// rotate the bullet image to match the movement direction
			rotation = angle / Math.PI * 180;
		}
		
		public override function update(event:Event):Boolean
		{
			// call Mover.update and exit if it returns false
			if (!super.update(event)) return false;
			
			// if exited the viewable area, kill the bullet and return false
			if (!Globals.PLAY_AREA.contains(x, y))
			{
				die();
				return false;
			}
			
			return true;
		}
		
		public override function die():void
		{
			// trace, so we can see that bullet has really been removed
//			trace("Bullet death (id: " + id + ")"); 

			// call the Mover.die function
			super.die()
		}
	}
}