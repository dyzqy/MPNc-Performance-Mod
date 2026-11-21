class com.newgrounds.APIEventDispatcher extends com.newgrounds.EventDispatcher
{
   static var _globalDispatcher;
   static var _eventQueue = com.newgrounds.APIEventDispatcher.initEventQueue();
   function APIEventDispatcher()
   {
      super();
   }
   static function get globalDispatcher()
   {
      return com.newgrounds.APIEventDispatcher._globalDispatcher;
   }
   static function set globalDispatcher(value)
   {
      com.newgrounds.APIEventDispatcher._globalDispatcher = value;
   }
   static function initEventQueue()
   {
      setInterval(com.newgrounds.APIEventDispatcher.runEventQueue,50);
      return [];
   }
   function dispatchEvent(event)
   {
      com.newgrounds.APIEventDispatcher._eventQueue.push({dispatcher:this,event:event});
      return true;
   }
   function actualDispatchEvent(event)
   {
      var _loc3_ = super.dispatchEvent(event);
      if(com.newgrounds.APIEventDispatcher._globalDispatcher && this != com.newgrounds.APIEventDispatcher._globalDispatcher)
      {
         com.newgrounds.APIEventDispatcher._globalDispatcher.dispatchEvent(event);
      }
   }
   static function runEventQueue(event)
   {
      var _loc3_ = com.newgrounds.APIEventDispatcher._eventQueue.length;
      if(_loc3_)
      {
         var _loc4_ = com.newgrounds.APIEventDispatcher._eventQueue;
         com.newgrounds.APIEventDispatcher._eventQueue = [];
         var _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            var _loc2_ = _loc4_[_loc1_];
            _loc2_.dispatcher.actualDispatchEvent(_loc2_.event);
            _loc1_ = _loc1_ + 1;
         }
      }
   }
}
