function tick()
{
   if(_currentframe == 1 && SwainMath.randomNumber(0,180) == 0)
   {
      gotoAndStop(SwainMath.randomNumber(2,5));
   }
}
stop();
onEnterFrame = tick;
