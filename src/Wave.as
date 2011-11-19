package 
{
	public class Wave
	{
		// wave type constants
		// empty round
		public static const NOTHING:int = 0;		
		// enemies move in a straight line
		public static const STRAIGHT:int = 1;		
		// enemies move in a straight line from random positions and directions
		public static const RANDOM:int = 2;		
		// enemies move in a arc
		public static const CURVING:int = 3;
		// enemies with two guns
		public static const TWO:int = 4;
		// BOSS
		public static const BOSS1:int = 5;

		// wave type
		public var type:int;
		
		// number of enemies in this wave
		public var number:int;

		// start x and y position
		public var x:Number;
		public var y:Number;
		
		// increase in x and y position between enemy creations
		public var nx:Number;
		public var ny:Number;

		// enemy's x and y direction
		public var dx:Number;
		public var dy:Number;
		
		// either 
		// RANDOM: x and y direction range
		// CURVING: dxr is amount of rotation 
		public var dxr:Number;
		public var dyr:Number;		
		
		public function Wave(type:int, number:int = 0, x:Number = 0, y:Number = 0, nx:Number = 0, ny:Number = 0, dx:Number = 0, dy:Number = 0, dxr:Number = 0, dyr:Number = 0)
		{
			this.type = type;
			this.number = number;
			this.x = x;
			this.y = y;
			this.nx = nx;
			this.ny = ny;
			this.dx = dx;
			this.dy = dy;
			this.dxr = dxr;
			this.dyr = dyr;
		}
	}
}