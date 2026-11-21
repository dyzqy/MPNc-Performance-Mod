function onMedalUnlocked(event)
{
   if(event.success)
   {
      _medalQueue.push(event.data);
      showNextUnlock();
   }
}
function showNextUnlock()
{
   if(_unlockedMedal)
   {
      return undefined;
   }
   if(!_medalQueue.length)
   {
      gotoAndStop("hidden");
      onEnterFrame = null;
      return undefined;
   }
   _unlockedMedal = com.newgrounds.Medal(_medalQueue.shift());
   gotoAndStop("medalUnlocked");
   play();
}
gotoAndStop("hidden");
com.newgrounds.API.addEventListener(com.newgrounds.APIEvent.MEDAL_UNLOCKED,onMedalUnlocked);
var alwaysOnTop;
_X = int(_X);
_Y = int(_Y);
var _unlockedMedal;
var _medalQueue = [];
var _alwaysOnTop = true;
if(alwaysOnTop)
{
   _alwaysOnTop = alwaysOnTop == "true";
}
