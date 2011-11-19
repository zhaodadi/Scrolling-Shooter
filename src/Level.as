package
{
	public class Level
	{
		// recorder current level number
		public var levelRound:int;
				
		public var waves:Waves;
		
		public function Level(parent:Sprite, wavesCreated:Array, levelRound:int)
		{
			waves = new Waves(parent, wavesCreated);
			this.levelRound = levelRound;
		}
	}
}