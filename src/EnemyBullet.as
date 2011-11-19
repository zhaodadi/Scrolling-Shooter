package 
{
	import flash.events.Event;
	
	public class EnemyBullet extends Bullet
	{
		public function EnemyBullet(x:Number, y:Number, angle:Number, speed:Number)
		{
			super(x, y, angle, speed);

			addChild(Resources.makeEnemyBullet());
		}
	
		public override function update(event:Event):Boolean
		{
			if (!super.update(event)) return false;

			// if bullet has collided with the player, then kill it
			if (Globals.player.checkCollision(this))
			{
				die();
				return false;
			}

			return true;
		}

	}
}