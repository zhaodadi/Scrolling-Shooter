package
{
	import flash.geom.Point;
	import flash.events.Event;
	
	public class Boss extends Enemy
	{
		// boss's health
		public var health:int = 10;
		
		public function Boss(x:Number, y:Number, dx:Number, dy:Number, frameSize:Point, planeType:int)
		{
			super(x, y, dx, dy, frameSize, planeType);
		}
		
		public override function update(event:Event):Boolean
		{
			// keep boss on top of the screen
			if(y>130)
				dy = -1;
			else
				dy = 1;
			
			// if enemy has collided with the player, then deduct player's health
			if (Globals.player.checkCollision(this))
			{
				Globals.player.health--;
				// update on-screen health display
				Globals.playerHealth.text = health + " :Health";
				return false;
			}
			
			
			// update the enemy via the super's update
			return true;
		}		
		
		public override function checkCollision(other:Mover):Boolean
		{
			// if bullet hit current enemy
			if (other.hitTestObject(this))
			{
				health--;
				
				trace ("I was hit! Loss health by 1");
				
				if(health == 0)
				{
					trace("boss died");
					// increase player's score
					Globals.player.score++;			
					Globals.playerScore.text = "Score: " + Globals.player.score;
					
					// kill the enemy
					explode();
					
					// return false to indicate this object is now dead
					return true;
				}
				
				return true;
			}
			
			return false;				
		}	
	}
}