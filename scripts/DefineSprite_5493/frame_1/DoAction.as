function tick()
{
   SpeedFrameSkipper.adjustFrames(this,_parent.myGameSpeed);
}
onEnterFrame = tick;
var flipPartner = true;
