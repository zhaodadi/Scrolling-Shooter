package  {
	import flash.display.Sprite;
	import flash.events.Event;

	public class Mover extends Sprite
	{
		// the current direction
		public var dx:Number = 0;
		public var dy:Number = 0;

		// give each new Mover object a unique number
		// the static variable count exists once for the class
//		private static var count:int = 0;
		// each Mover object gets its own id variable equal to count (which is then incremented)
//		public var id:uint = count++;
		
		// constructor
		// x and y specify initial position
		// optional dx and dy specify initial velocity
		public function Mover(x:Number, y:Number, dx:Number = 0, dy:Number = 0)
		{
			// initialise current position and direction to supplied paramaters
			this.x = x;
			this.y = y;
			this.dx = dx;
			this.dy = dy;
			
			// add an update function 
			addEventListener(Event.ENTER_FRAME, update);
		}

		// update function performs any updates on the object, including object deaths
		// the default adds the current velocity to the current position
		// returns false if the object dies after updating, true otherwise	
		public function update(event:Event):Boolean
		{
			// add current velocity to current position
			x += dx;
			y += dy;
			return true;
		}
		
		// object death, performs necessary cleanup
		public function die():void
		{
			// deregister the event listener
			removeEventListener(Event.ENTER_FRAME, update);	

			// remove the object from the display
			parent.removeChild(this);	
		}
	}
}
