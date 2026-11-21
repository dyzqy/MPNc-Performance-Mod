class com.newgrounds.Logger
{
   static var PRIORITY_INTERNAL = 0;
   static var PRIORITY_MESSAGE = 1;
   static var PRIORITY_WARNING = 2;
   static var PRIORITY_ERROR = 3;
   static var PRIORITY_MAX = 4;
   static var HEADER = "[Newgrounds API] :: ";
   static var _eventDispatcher = new com.newgrounds.EventDispatcher();
   static var _messageLevel = com.newgrounds.Logger.PRIORITY_MESSAGE;
   static var _throwLevel = com.newgrounds.Logger.PRIORITY_MAX;
   function Logger()
   {
   }
   static function logInternal()
   {
      var _loc2_ = arguments;
      com.newgrounds.Logger.log(com.newgrounds.Logger.PRIORITY_INTERNAL,_loc2_);
   }
   static function logMessage()
   {
      var _loc2_ = arguments;
      com.newgrounds.Logger.log(com.newgrounds.Logger.PRIORITY_MESSAGE,_loc2_);
   }
   static function logWarning()
   {
      var _loc2_ = arguments;
      com.newgrounds.Logger.log(com.newgrounds.Logger.PRIORITY_WARNING,_loc2_);
   }
   static function logError()
   {
      var _loc2_ = arguments;
      com.newgrounds.Logger.log(com.newgrounds.Logger.PRIORITY_ERROR,_loc2_);
   }
   static function log(priority, messages)
   {
      if(priority == undefined)
      {
         priority = com.newgrounds.Logger.PRIORITY_MESSAGE;
      }
      if(messages == undefined)
      {
         messages = null;
      }
      if(priority >= com.newgrounds.Logger._messageLevel)
      {
         var _loc1_ = 0;
         while(_loc1_ < messages.length)
         {
            trace(com.newgrounds.Logger.HEADER + messages[_loc1_]);
            com.newgrounds.Logger._eventDispatcher.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.LOG,messages[_loc1_]));
            _loc1_ = _loc1_ + 1;
         }
      }
      if(priority >= com.newgrounds.Logger._throwLevel)
      {
         throw new Error(messages.join("\n"));
      }
   }
   static function addEventListener(event, listener)
   {
      com.newgrounds.Logger._eventDispatcher.addEventListener(event,listener,false,0,false);
   }
}
