class SpeedFrameSkipper
{
   function SpeedFrameSkipper()
   {
   }
   static function adjustFrames(inMC, inSpeed)
   {
      if(!_root.newWorld.paused)
      {
         if(inMC._currentframe < inMC._totalframes)
         {
            var _loc2_ = 0;
            while(_loc2_ <= inSpeed)
            {
               inMC.nextFrame();
               _loc2_ = _loc2_ + 1;
            }
         }
         else
         {
            inMC.gotoAndPlay(1);
            _loc2_ = 1;
            while(_loc2_ <= inSpeed)
            {
               inMC.nextFrame();
               _loc2_ = _loc2_ + 1;
            }
         }
      }
   }
}
