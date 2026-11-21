class com.newgrounds.APIEvent extends com.newgrounds.Event
{
   var _error;
   var _success;
   var _data;
   static var COMMAND_COMPLETE = "commandComplete";
   static var MEDAL_UNLOCK_CONFIRMED = "medalUnlockConfirmed";
   static var ICON_LOADED = "iconLoaded";
   static var API_CONNECTED = "movieConnected";
   static var LOG = "log";
   static var MEDAL_UNLOCKED = "medalUnlocked";
   static var SCORES_LOADED = "scoresLoaded";
   static var SCORE_POSTED = "scorePosted";
   static var QUERY_COMPLETE = "queryComplete";
   static var FILE_LOADED = "fileLoaded";
   static var FILE_SAVED = "fileSaved";
   static var FILE_REQUESTED = "fileRequested";
   static var VOTE_COMPLETE = "voteComplete";
   static var ERROR_NONE = "noError";
   static var ERROR_UNKNOWN = "unknownError";
   static var ERROR_COMMAND_FAILED = "commandFailed";
   static var ERROR_NOT_CONNECTED = "notConnected";
   static var ERROR_INVALID_ARGUMENT = "invalidArgument";
   static var ERROR_TIMED_OUT = "timedOut";
   static var ERROR_BAD_FILE = "badFile";
   static var ERROR_BAD_RESPONSE = "badResponse";
   static var ERROR_SENDING_COMMAND = "errorSendingCommand";
   static var ERROR_HOST_BLOCKED = "hostBlocked";
   static var ERROR_ALREADY_VOTED = "alreadyVoted";
   static var ERROR_NOT_LOGGED_IN = "notLoggedIn";
   static var ERROR_WRONG_ENCRYPTION_KEY = "wrongEncryptionKey";
   function APIEvent(type, data, error)
   {
      super(type);
      if(data == undefined)
      {
         data = null;
      }
      if(error == undefined)
      {
         error = null;
      }
      if(!error || error == "" || error == com.newgrounds.APIEvent.ERROR_NONE)
      {
         this._error = com.newgrounds.APIEvent.ERROR_NONE;
         this._success = true;
      }
      else
      {
         this._error = error;
         this._success = false;
      }
      if(data)
      {
         this._data = data;
      }
      else
      {
         this._data = {};
      }
   }
   function clone()
   {
      return new com.newgrounds.APIEvent(this.type,this._data,this._error);
   }
   function get success()
   {
      return this._success;
   }
   function get data()
   {
      return this._data;
   }
   function get error()
   {
      return this._error;
   }
}
