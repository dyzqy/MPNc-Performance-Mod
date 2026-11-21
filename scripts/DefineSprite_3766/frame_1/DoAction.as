function tick()
{
   SpeedFrameSkipper.adjustFrames(this,_root.myGameSpeed);
}
onEnterFrame = tick;
