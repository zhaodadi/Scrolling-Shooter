package 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.geom.Point;

	public class Enemy extends Animated
	{
		// list of all enemies
		public static var enemies:Array = new Array();

		// whether or not the enemy is on the screen
		public var onscreen:Boolean = false;
		public static const ENEMY1:int = 0;
		public static const ENEMY2:int = 1;
		public static const ENEMY3:int = 2;
		public static const ENEMY4:int = 3;
		public static const BOSS1:int = 4;
		public static const BOSS2:int = 5;

		public function Enemy(x:Number, y:Number, dx:Number, dy:Number, frameSize:Point, planeType:int = -1)
		{
			if (planeType < 0) planeType = Math.floor(Math.random() * Resources.planes.length);
			super(Animated.createBitmapArray(Resources.planes[planeType], frameSize.x, frameSize.y), 
				Animated.FRAMERATE_EVERYFRAME, Animated.FOREVER, x, y, dx, dy);

			// make the enemy's rotation match it's direction
			rotation = Math.atan2(dy, dx) * 180 / Math.PI - 90;

			// store this enemy on the list of all enemies
			enemies.push(this);
		}
		
		public override function update(event:Event):Boolean
		{
			if (!super.update(event)) return false;

			// shoot around 1 in 100 updates			
			if (Math.random() < 0.01) 
			{
				// find the angle to the player
				var angle:Number = Math.atan2(Globals.player.y - y, Globals.player.x - x);

				// create and add a new enemy bullet				
				parent.addChildAt(new EnemyBullet(x, y, angle, 5), 2);			
			}

			// if enemy has collided with the player, then kill it
			if (Globals.player.checkCollision(this))
			{
				// die with an explosion
				explode();
				return false;
			}

			// if player started off-screen, and has now entered the screen, record the fact
			if (!onscreen && Globals.PLAY_AREA.contains(x, y)) onscreen = true;
			// if player moves off-screen, kill it without an explosion
			if (onscreen && !Globals.PLAY_AREA.contains(x, y))
			{
				die();
				return false;
			}
			
			return true;
		}

		public function checkCollision(other:Mover):Boolean
		{
			// if bullet hit current enemy
			if (other.hitTestObject(this))
			{
				// increase player's score
				Globals.player.score++;			
				Globals.playerScore.text = "Score: " + Globals.player.score;
				
				// kill the enemy
				explode();
								
				// return false to indicate this object is now dead
				return true;
			}

			return false;				
		}		

		public function explode():void
		{
			// add an explosion with the enemies position and velocity
			parent.addChildAt(new Explosion(x, y, dx, dy), 2);
			
			// kill the enemy
			die();
		}

		public override function die():void
		{
//			trace("Enemy death (id: " + id + ")"); 

			// clean up					
			super.die();	
			
			// remove the enemy from the list of all enemies
			var i:int = enemies.indexOf(this);			
			enemies[i] = enemies[enemies.length - 1];
			enemies.pop();
		}
	}
}