function medalPopupEnterFrame()
{
   if(_alwaysOnTop)
   {
      var _loc2_ = _parent.getNextHighestDepth();
      if(getDepth() != _loc2_ - 1)
      {
         swapDepths(_loc2_);
      }
   }
   if(_medalScrollRect)
   {
      _medalScrollRect.offset(2,0);
      medalNameClip.scrollRect = _medalScrollRect;
      if(_medalScrollRect.left >= medalNameClip.textField.textWidth + 10)
      {
         _medalScrollRect = null;
         play();
      }
   }
}
var _medalScrollRect;
if(_unlockedMedal)
{
   if(medalNameClip && medalNameClip.textField)
   {
      medalNameClip.textField.text = _unlockedMedal.name;
   }
   if(medalPointsText)
   {
      medalPointsText.text = _unlockedMedal.value.toString();
   }
   if(medalNameClip.textField.textWidth > medalNameClip._width)
   {
      _medalScrollRect = new flash.geom.Rectangle(- medalNameClip._width,0,medalNameClip._width,medalNameClip._height);
      medalNameClip.textField._width = 1000;
      medalNameClip.scrollRect = _medalScrollRect;
   }
   onEnterFrame = medalPopupEnterFrame;
}
