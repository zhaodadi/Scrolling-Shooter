package
{
	import flash.events.Event;
	import flash.geom.Point;

	public class TwoGunEnermy extends Enemy
	{
		public function TwoGunEnermy(x:Number, y:Number, dx:Number, dy:Number, p:Point, planeType:int)
		{
			super(x, y, dx, dy, p, planeType);
		}
		
		public override function update(event:Event):Boolean
		{
			if (!super.update(event)) return false;
			// shoot around 1 in 100 updates			
			if (Math.random() < 0.01) 
			{
				parent.addChildAt(new EnemyBullet(x, y, 1, 5), 2);
				parent.addChildAt(new EnemyBullet(x, y, 1, 5), 2);
			}
			
			return true;
		}
		
	}
}