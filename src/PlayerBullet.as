package 
{
	import flash.events.Event;
	import flash.media.Sound;
	
	public class PlayerBullet extends Bullet
	{
		// player bullet speed
		public static const SPEED:Number = 10;
		
		// constructor
		// takes initial position and angle as arguments
		public function PlayerBullet(x:Number, y:Number, angle:Number)
		{
			// call Bullet constructor
			super(x, y, angle, SPEED);

			addChild(new Bullet(x,y,angle,5));

			// play sound effect
			Resources.gunFx.play();
		}

		public override function update(event:Event):Boolean
		{
			if (!super.update(event)) return false;
			
			// check this bullet against all the enemies currently alive
			for each (var e:Enemy in Enemy.enemies)
			{
				// check to see if the current enemy has collided with this bullet
				if (e.checkCollision(this))
				{
					die();
					return false;
				}
			}
			
			return true;
		}
	}
}