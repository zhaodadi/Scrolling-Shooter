package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	public class Waves
	{	
		// current wave		
		public var count:int = 0;
		
		// timer object used to create the enemies at fixed intervals
		public var timer:Timer;

		// reference to main class
		public var parent:Sprite;

		// all the waves of enemies for a game
		// these should all use screen size constants :S 
		public var waves:Array = [
			
			//final boss
			new Wave(Wave.NOTHING),
			new Wave(Wave.BOSS1, 1,360,0,0,0,0,0.5),
		// slowing move enemies with two guns
		new Wave(Wave.TWO, 2, 100, 0, 500, 0, 0, 0.6),
		
		// groups of 4 enemies from the left and right alternatively
		new Wave(Wave.STRAIGHT, 4, -20, 100, 0, 80, 4, 0),
		new Wave(Wave.STRAIGHT, 4, 820, 140, 0, 80, -4, 0),
		new Wave(Wave.STRAIGHT, 4, -20, 100, 0, 80, 4, 0),
		new Wave(Wave.STRAIGHT, 4, 820, 140, 0, 80, -4, 0),
		new Wave(Wave.STRAIGHT, 4, -20, 100, 0, 80, 4, 0),
		new Wave(Wave.STRAIGHT, 4, 820, 140, 0, 80, -4, 0),
		new Wave(Wave.STRAIGHT, 4, -20, 100, 0, 80, 4, 0),
		new Wave(Wave.STRAIGHT, 4, 820, 140, 0, 80, -4, 0),
		
		new Wave(Wave.NOTHING),
		
		// groups of 10 enemies flying straight down but in an angled formation
		new Wave(Wave.STRAIGHT, 10, 0, 0, 80, -40, 0, 6),
		new Wave(Wave.STRAIGHT, 10, 800, 0, -80, -40, 0, 6),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// groups of 5 enemies from the top corners of the screen flying at a 45 degree angle			
		new Wave(Wave.STRAIGHT, 5, 0, 0, -100, -100, 3, 3),
		new Wave(Wave.STRAIGHT, 5, 840, -40, 100, -100, -3, 3),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// slowing move enemies with two guns
		new Wave(Wave.TWO, 2, 100, 0, 500, 0, 0, 0.6),
		
		// 6 curving enemies from the bottom left and right
		new Wave(Wave.CURVING, 1, 0, 620, 0, -32, 4, 0, -1),
		new Wave(Wave.CURVING, 1, 40, 620, 0, -32, 4, 0, -1),
		new Wave(Wave.CURVING, 1, 80, 620, 0, -32, 4, 0, -1),
		new Wave(Wave.CURVING, 1, 120, 620, 0, -32, 4, 0, -1),
		new Wave(Wave.CURVING, 1, 160, 620, 0, -32, 4, 0, -1),
		new Wave(Wave.CURVING, 1, 200, 620, 0, -32, 4, 0, -1),
		
		new Wave(Wave.CURVING, 1, 800, 620, 0, -32, -4, 0, 1),
		new Wave(Wave.CURVING, 1, 760, 620, 0, -32, -4, 0, 1),
		new Wave(Wave.CURVING, 1, 720, 620, 0, -32, -4, 0, 1),
		new Wave(Wave.CURVING, 1, 680, 620, 0, -32, -4, 0, 1),
		new Wave(Wave.CURVING, 1, 640, 620, 0, -32, -4, 0, 1),
		new Wave(Wave.CURVING, 1, 600, 620, 0, -32, -4, 0, 1),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// groups of 5 enemies from the top corners of the screen flying at an angle
		new Wave(Wave.STRAIGHT, 5, 0, 0, -100, -100, 3, 2),
		new Wave(Wave.STRAIGHT, 5, 800, 0, 100, -100, -3, 2),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// 20 random enemies from the top of the screen
		new Wave(Wave.RANDOM, 20, 100, -200, 600, 200, 1, 4, -2, -2),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// slowing move enemies with two guns
		new Wave(Wave.TWO, 2, 100, 0, 500, 0, 0, 0.6),
		
		// 6 groups of 3 enemies from the top left and right
		new Wave(Wave.CURVING, 3, 0, -20, 0, -32, 4, 0, 1),
		new Wave(Wave.CURVING, 3, 40, -20, 0, -32, 4, 0, 1),
		new Wave(Wave.CURVING, 3, 80, -20, 0, -32, 4, 0, 1),
		new Wave(Wave.CURVING, 3, 120, -20, 0, -32, 4, 0, 1),
		new Wave(Wave.CURVING, 3, 160, -20, 0, -32, 4, 0, 1),
		new Wave(Wave.CURVING, 3, 200, -20, 0, -32, 4, 0, 1),
		
		new Wave(Wave.CURVING, 3, 800, -20, 0, -32, -4, 0, -1),
		new Wave(Wave.CURVING, 3, 760, -20, 0, -32, -4, 0, -1),
		new Wave(Wave.CURVING, 3, 720, -20, 0, -32, -4, 0, -1),
		new Wave(Wave.CURVING, 3, 680, -20, 0, -32, -4, 0, -1),
		new Wave(Wave.CURVING, 3, 640, -20, 0, -32, -4, 0, -1),
		new Wave(Wave.CURVING, 3, 600, -20, 0, -32, -4, 0, -1),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// 10 random enemies from the left
		new Wave(Wave.RANDOM, 10, -200, 100, 200, 400, 4, 1, -2, -2),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// 10 random enemies from the right
		new Wave(Wave.RANDOM, 10, 1000, 100, -200, 400, -4, 1, 2, -2),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		// 40 slow-moving curving enemies from the top
		new Wave(Wave.CURVING, 10, 0, -20, 80, 0, 2, 0, 0.5),
		new Wave(Wave.CURVING, 10, 800, -20, -80, 0, -2, 0, -0.5),
		new Wave(Wave.CURVING, 10, 0, -20, 80, 0, 2, 0, 0.5),
		new Wave(Wave.CURVING, 10, 800, -20, -80, 0, -2, 0, -0.5),
		
		// slowing move enemies with two guns
		new Wave(Wave.TWO, 2, 100, 0, 500, 0, 0, 0.6),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		new Wave(Wave.NOTHING),
		];
		
		public var numberOfWave:int;
		
		// constructor
		public function Waves(parent:Sprite)
		{
			// store the main class so we can add enemies to it later
			this.parent = parent;
			
			// create a new timer that calls nextWave() once per second
			timer = new Timer(1000.0);
			timer.addEventListener(TimerEvent.TIMER, nextWave);
			timer.start();
		}
		
		// create the next wave of enemies
		public function nextWave(event:Event):void
		{
			// get the current wave
			var wave:Wave = waves[count];

			//trace("NEW WAVE(" + count + ") -- type:" + wave.type + " number:" + wave.number);
			
			// increase the current wave
			count = count + 1;

			// keep track of current x and y coordinates to create enemies from
			var x:int = wave.x;
			var y:int = wave.y;

			// plane type
			var waveType:int = Math.random() * 4;
			
			// select plane based on wave type
			var size:Point = new Point(0,0);
			if(waveType == Enemy.ENEMY1 || waveType == Enemy.ENEMY3)
			{
				size = Resources.BIGGER_ENEMY_FRAME_SIZE;
			}
			else if(waveType == Enemy.ENEMY2 || waveType == Enemy.ENEMY4) 
			{
				size = Resources.SMALLER_ENEMY_FRAME_SIZE;
			}
			

			// loop as many times as there are enemies in the wave
			for (var i:int = 0; i < wave.number; i++)
			{
				// reference to an enemy
				var e:Enemy;
								
				// perform different actions based on the type of wave
				switch (wave.type)
				{
					// if straight moving enemies, create a normal enemy, and move on the position to create the next enemy
					case Wave.STRAIGHT:
						e = new Enemy(x, y, wave.dx, wave.dy, size, waveType);
						
						x += wave.nx;
						y += wave.ny;
						break;
					// if curving enemies, create a curving enemy, and move on the position to create the next enemy
					case Wave.CURVING:
						e = new CurvingEnemy(x, y, wave.dx, wave.dy, size, waveType, wave.dxr);

						x += wave.nx;
						y += wave.ny;
						break;
					// if random enemies, choose random position and direction
					case Wave.RANDOM:
						e = new Enemy(x + Math.random() * wave.nx, y + Math.random() * wave.ny, 
							wave.dx + Math.random() * wave.dxr, wave.dy + Math.random() * wave.dyr, size, waveType);
						break;
					// above are random planes
					// two gun enemies
					case Wave.TWO:
						e = new TwoGunEnermy(x, y, wave.dx, wave.dy, Resources.SMALLER_ENEMY_FRAME_SIZE, Enemy.ENEMY2);
						
						x += wave.nx;
						y += wave.ny;
						break;
					// level 1 boss
					case Wave.BOSS1:
						e = new Boss(x,y,wave.dx,wave.dy,Resources.BOSS1_FRAME_SIZE,Enemy.BOSS1);
						
						x += wave.nx;
						y += wave.ny;
						break;
				}

				// add enemy to the screen				
				parent.addChildAt(e, 2);
			}
			
		}

	}
}