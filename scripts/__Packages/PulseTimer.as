class PulseTimer extends MovieClip
{
   var onEnterFrame;
   static var myCount = new Number();
   static var maxCount = 30;
   function PulseTimer()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function tick()
   {
      PulseTimer.myCount = PulseTimer.myCount + 1;
      if(PulseTimer.myCount > PulseTimer.maxCount)
      {
         PulseTimer.myCount = 0;
      }
   }
   static function getActive(inCount, inRatio)
   {
      var _loc2_ = 1;
      while(_loc2_ <= inRatio)
      {
         inCount += Math.floor(PulseTimer.maxCount / _loc2_);
         while(inCount > PulseTimer.maxCount)
         {
            inCount -= PulseTimer.maxCount;
         }
         if(inCount == PulseTimer.myCount)
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
}
