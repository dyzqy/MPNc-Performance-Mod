function enterFrameHandler()
{
   var _loc2_ = 0;
   _loc2_ = _root.getBytesLoaded() / _root.getBytesTotal();
   if(loadingBar)
   {
      loadingBar.gotoAndStop(int(_loc2_ * (loadingBar._totalframes - 1)) + 1);
   }
   if(_loc2_ >= 1)
   {
      onEnterFrame = null;
      gotoAndStop("loaded");
   }
}
stop();
var autoPlay;
var className;
onEnterFrame = enterFrameHandler;
