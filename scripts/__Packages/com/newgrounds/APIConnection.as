class com.newgrounds.APIConnection
{
   var _hostURL;
   var hostDomain;
   var sessionId;
   var publisherId;
   var encryptionKey;
   var userEmail;
   var username;
   var userId;
   var userpageFormat;
   var initialized;
   static var NOT_CONNECTED = "notConnected";
   static var CONNECTING = "connecting";
   static var CONNECTED = "connected";
   var connectionState = com.newgrounds.APIConnection.NOT_CONNECTED;
   var apiURL = "https://www.ngads.com/gateway_v2.php";
   function APIConnection()
   {
      this.reset();
   }
   function get hostURL()
   {
      return this._hostURL;
   }
   function set hostURL(value)
   {
      this._hostURL = value;
      this.hostDomain = null;
      if(this._hostURL)
      {
         var _loc2_ = this._hostURL.split("/");
         if(_loc2_[0] != "file:" && this._hostURL != "localhost")
         {
            this.hostDomain = _loc2_[2];
         }
      }
      if(!this.hostDomain)
      {
         this.hostDomain = "localhost";
      }
   }
   function get sandboxType()
   {
      return System.security.sandboxType;
   }
   function get isNetworkHost()
   {
      switch(this.sandboxType)
      {
         case "localWithFile":
         case "localWithNetwork":
         case "localTrusted":
         case "application":
            return false;
         case "remote":
         default:
            return true;
      }
   }
   function get hasUserSession()
   {
      return this.sessionId != null && this.sessionId != "" && this.publisherId != 0;
   }
   function get connected()
   {
      return this.connectionState == com.newgrounds.APIConnection.CONNECTED;
   }
   function reset()
   {
      this.connectionState = com.newgrounds.APIConnection.NOT_CONNECTED;
      this.encryptionKey = null;
      this.sessionId = null;
      this.userEmail = null;
      this.username = null;
      this.userId = 0;
      this.userpageFormat = 0;
   }
   function assertInitialized()
   {
      if(!this.initialized)
      {
         com.newgrounds.Logger.logError("You must initialized the API using API.connect() before using this command.");
         return false;
      }
      return true;
   }
   function assertConnected()
   {
      if(!this.connectionState == com.newgrounds.APIConnection.CONNECTED)
      {
         com.newgrounds.Logger.logError("You must establish a connection using API.connect() before using this command.");
         return false;
      }
      return true;
   }
   function sendSimpleCommand(command, completeHandler, parameters, secureParameters)
   {
      if(parameters == undefined)
      {
         parameters = null;
      }
      if(secureParameters == undefined)
      {
         secureParameters = null;
      }
      var _loc2_ = new com.newgrounds.APICommand(command);
      _loc2_.parameters = parameters;
      _loc2_.secureParameters = secureParameters;
      if(completeHandler != null)
      {
         _loc2_.addEventListener(com.newgrounds.APIEvent.COMMAND_COMPLETE,completeHandler);
      }
      _loc2_.send(this);
   }
   function sendCommand(command)
   {
      command.send(this);
   }
   function loadInBrowser(command, newWindow, parameters)
   {
      if(newWindow == undefined)
      {
         newWindow = true;
      }
      if(parameters == undefined)
      {
         parameters = null;
      }
      var _loc2_ = new com.newgrounds.APICommand(command);
      _loc2_.parameters = parameters;
      _loc2_.loadInBrowser(this,newWindow);
   }
}
