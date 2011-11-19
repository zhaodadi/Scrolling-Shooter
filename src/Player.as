package  {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	public class Player extends Animated
	{
		// player movement speed
		public const SPEED:int = 5;

		// keep track of which keys are currently pressed
		private var left:Boolean = false;
		private var right:Boolean = false;
		private var up:Boolean = false;
		private var down:Boolean = false;

		// player's score and health
		public var score:uint = 0;
		public var health:int = 1000;
		
		public function Player(x:Number, y:Number)
		{
			// call Animated's constructor with created array of frames for animation
			// and to set initial position
			super(Animated.createBitmapArray(Resources.planeFrames, Resources.PLANE_FRAME_SIZE.x, Resources.PLANE_FRAME_SIZE.y), 
				Animated.FRAMERATE_EVERYFRAME, Animated.FOREVER, x, y);
		}

		// update current position of player based on keyboard input
		public override function update(event:Event):Boolean
		{
			// calculate current velocity from keys currently pressed
			// if left only move left, if right only move right 
			// if left and right pressed or neither velocity is 0
			// ditto for up/down movement
			dx = left ? (right ? 0 : -SPEED) : (right ? SPEED : 0);
			dy = up ? (down ? 0 : -SPEED) : (down ? SPEED : 0);

			// call Mover.update to update current position			
			super.update(event);
			
			// limit ship to boundary
			if (x < 0) x = 0;
			if (x > Globals.SCREEN_WIDTH) x = Globals.SCREEN_WIDTH;
			if (y < 0) y = 0;
			if (y > Globals.SCREEN_HEIGHT) y = Globals.SCREEN_HEIGHT;
			
			return true;
		}
		
		// record current keys pressed
		public function keyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.LEFT)
			{
				left = true;
			}
			else if (event.keyCode == Keyboard.RIGHT)
			{
				right = true;
			}
			else if (event.keyCode == Keyboard.UP)
			{
				up = true;
			}
			else if (event.keyCode == Keyboard.DOWN)
			{
				down = true;
			}
		}

		// record current keys unpressed
		public function keyUp(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.LEFT)
			{
				left = false;
			}
			else if (event.keyCode == Keyboard.RIGHT)
			{
				right = false;
			}
			else if (event.keyCode == Keyboard.UP)
			{
				up = false;
			}
			else if (event.keyCode == Keyboard.DOWN)
			{
				down = false;
			}
		}

		// add a new bullet
		public function shoot(event:MouseEvent):void
		{
			// calculate the angle to the crosshair from the player
			// atan2 returns the angle in radians (0 <= angle < 2*PI)
			var angle:Number = Math.atan2(Globals.crosshair.y - y , Globals.crosshair.x - x);
			
			// add the bullet to the display list at position 0 (before the player and the crosshair)
			if (visible) parent.addChildAt(new PlayerBullet(x, y, angle), 2);
		}

		public function checkCollision(other:Mover):Boolean
		{
			// don't test collisions if the player is already dead						
			if (visible && other.hitTestObject(this))
			{
				// decrease player's health
				health--;
				
				// if health is gone, kill player
				if (health <= 0)
				{
					die();
				}

				// update on-screen health display
				Globals.playerHealth.text = health + " :Health";
								
				return true;
			}			
			
			return false;
		}
		
		public override function die():void
		{
			// make the player sprite invisible, this stops other collision being detected later
			visible = false;

			// when player it hit make a bunch of explosions
			for (var i:int = 0; i < 4; i++)
			{
				parent.addChildAt(new Explosion(x + Math.random() * 40 - 20, y  + Math.random() * 40 - 20, dx, dy), 2);
			}

			// remove event listeners
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);

			// call Mover.die to clean up any other details
			super.die();
		}
	}
}