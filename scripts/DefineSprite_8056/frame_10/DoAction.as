function _onItemClick()
{
   var _loc3_ = MovieClip(this);
   if(_loc3_.item)
   {
      setSelectedItem(_loc3_.item.data);
   }
   if(_loc3_ && _parent && _parent instanceof MovieClip && MovieClip(_parent)._onListChange)
   {
      MovieClip(_parent)._onListChange(_loc3_.item);
   }
}
var i = 0;
var itemClip = item0;
while(itemClip)
{
   if(i < _listItems.length)
   {
      itemClip.item = _listItems[i];
      itemClip.label.text = _listItems[i].label;
      itemClip.onRelease = _onItemClick;
   }
   else
   {
      itemClip._visible = false;
   }
   i++;
   itemClip = this["item" + i];
}
