function tick()
{
   SpeedFrameSkipper.adjustFrames(this,_root.myGameSpeed);
}
if(!_parent._parent.myDataRef.asploded)
{
   onEnterFrame = tick;
}
