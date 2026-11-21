function tick()
{
   SpeedFrameSkipper.adjustFrames(this,_parent.myGameSpeed);
}
onEnterFrame = tick;
_parent.actionSlowdown = true;
