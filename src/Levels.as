package
{
	import flash.display.Sprite;

	public class Levels
	{		
		// store wave info
		public var waves1:Array = [
			// slowing move enemies with two guns
			new Wave(Wave.TWO, 2, 100, 0, 500, 0, 0, 0.6),
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
			
			//final boss
			new Wave()
		];
		
		public var level:Level;
		
		public var totalLevel:int = 2;

		public function Levels(parent:Sprite)
		{
			
			for(var i:int=0; i<totalLevel; i++)
			{
				level = new Level(parent,waves1,i);
			}
		}
		
		public function nextLevel()
		{
		}
		}
	}
}