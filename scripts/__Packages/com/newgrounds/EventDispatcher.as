class com.newgrounds.EventDispatcher
{
   var _listeners;
   function EventDispatcher()
   {
      this._listeners = {};
   }
   function addEventListener(type, listener)
   {
      if(!this._listeners[type])
      {
         this._listeners[type] = [];
      }
      if(typeof listener == "function")
      {
         this._listeners[type].push({target:null,func:listener});
      }
      else
      {
         this._listeners[type].push(listener);
      }
   }
   function removeEventListener(type, listener)
   {
      var _loc3_ = this._listeners[type];
      if(_loc3_)
      {
         var _loc5_ = _loc3_.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            if(_loc3_[_loc2_].func == listener || _loc3_[_loc2_] == listener)
            {
               _loc3_.splice(_loc2_,1);
               return undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function dispatchEvent(event)
   {
      var _loc4_ = this._listeners[event.type];
      if(_loc4_)
      {
         var _loc5_ = _loc4_.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            var _loc3_ = _loc4_[_loc2_];
            _loc3_.func.call(_loc3_.target,event);
            _loc2_ = _loc2_ + 1;
         }
      }
      return true;
   }
}
