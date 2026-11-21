function setListItems(listItems)
{
   if(!listItems)
   {
      _listItems = [];
   }
   else
   {
      _listItems = listItems.concat();
   }
   var _loc1_ = 0;
   while(_loc1_ < _listItems.length)
   {
      if(typeof _listItems[_loc1_] == "string")
      {
         _listItems[_loc1_] = {label:_listItems[_loc1_],data:_listItems[_loc1_]};
      }
      _loc1_ = _loc1_ + 1;
   }
   setSelectedIndex(0);
}
function setSelectedItem(data)
{
   var _loc1_ = 0;
   while(_loc1_ < _listItems.length)
   {
      if(_listItems[_loc1_].data == data)
      {
         setSelectedIndex(_loc1_);
         return undefined;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function setSelectedIndex(i)
{
   if(i < _listItems.length)
   {
      _selectedItem = _listItems[i];
      if(currentItem && currentItem.label)
      {
         currentItem.label.text = _selectedItem.label;
      }
   }
}
function hideList()
{
   _listDown = false;
   gotoAndStop("sortUP");
}
function _onListClick()
{
   _listDown = !_listDown;
   if(_listDown)
   {
      gotoAndStop("sortDOWN");
   }
   else
   {
      gotoAndStop("sortUP");
   }
}
stop();
if(listButton)
{
   listButton.onRelease = _onListClick;
}
if(currentItem)
{
   currentItem.onRelease = _onListClick;
   if(currentItem.label)
   {
      if(_selectedItem)
      {
         currentItem.label.text = _selectedItem.label;
      }
      else
      {
         currentItem.label.text = "";
      }
   }
}
var _listItems;
var _listDown;
var _selectedItem;
if(!_listItems)
{
   _listItems = [];
}
