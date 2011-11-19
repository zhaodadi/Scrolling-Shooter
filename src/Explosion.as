package 
{
	import flash.display.Bitmap;
	import flash.media.Sound;
	
	public class Explosion extends Animated
	{	
		public function Explosion(x:Number, y:Number, dx:Number=0, dy:Number=0)
		{
			// make animation play at 20 frames per second and only play through once
			super(Animated.createBitmapArray(Resources.explosionFrames, Resources.EXPLOSION_FRAME_SIZE.x, Resources.EXPLOSION_FRAME_SIZE.y), 
				20, 1, x, y, dx, dy);
			
			// make the explosions slightly transparent
			alpha = .75;

			// play sound effect
			Resources.explosionFx.play();
		}		
	}	
}