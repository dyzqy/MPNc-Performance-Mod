onClipEvent(enterFrame){
   var pctLoaded = Math.round(_root.getBytesLoaded() / _root.getBytesTotal() * 100);
   myBar._xscale = pctLoaded;
   if(_root.getBytesLoaded() == _root.getBytesTotal())
   {
      _parent.myLaunch._visible = true;
   }
}
