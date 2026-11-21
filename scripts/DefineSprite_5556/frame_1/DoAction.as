function tick()
{
   SpeedFrameSkipper.adjustFrames(this,_parent.myGameSpeed);
}
if(onEnterFrame == null)
{
   onEnterFrame = tick;
}
_parent.actionSlowdown = true;
