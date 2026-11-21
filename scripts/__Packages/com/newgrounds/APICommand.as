class com.newgrounds.APICommand extends com.newgrounds.APIEventDispatcher
{
   var _command;
   var _parameters;
   var _secureParameters;
   var _hasTimeout;
   var _preventCache;
   var _files;
   var _loader;
   var _timeoutTimer;
   static var bridge;
   static var _throttleTimestamp;
   static var TIMEOUT_INTERVAL = 10000;
   static var THROTTLE_INTERVAL = 10050;
   static var THROTTLE_TICK_INTERVAL = 1000;
   static var THROTTLE_THRESHOLD = 24;
   static var _throttleCount = 0;
   static var _commandQueue = [];
   static var _throttleTimer = setInterval(com.newgrounds.APICommand.onThrottleTimer,com.newgrounds.APICommand.THROTTLE_TICK_INTERVAL);
   static var ENCRYPTOR_RADIX = "/g8236klvBQ#&|;Zb*7CEA59%s`Oue1wziFp$rDVY@TKxUPWytSaGHJ>dmoMR^<0~4qNLhc(I+fjn)X";
   static var _encryptor = new com.newgrounds.encoders.BaseN(com.newgrounds.APICommand.ENCRYPTOR_RADIX);
   static var _pendingCommands = [];
   static var CRLF = "\r\n";
   function APICommand(command)
   {
      super();
      this._command = command;
      this._parameters = new Object();
      this._secureParameters = new Object();
      this._hasTimeout = true;
   }
   static function stopPendingCommands()
   {
      for(var _loc2_ in com.newgrounds.APICommand._pendingCommands)
      {
         var _loc1_ = com.newgrounds.APICommand._pendingCommands[_loc2_];
         _loc1_.close();
      }
      com.newgrounds.APICommand._pendingCommands = [];
   }
   static function onThrottleTimer(event)
   {
      if(getTimer() - com.newgrounds.APICommand._throttleTimestamp >= com.newgrounds.APICommand.THROTTLE_INTERVAL)
      {
         com.newgrounds.APICommand._throttleCount = 0;
         com.newgrounds.APICommand._throttleCount = 0;
         while(com.newgrounds.APICommand._commandQueue.length && com.newgrounds.APICommand._throttleCount < com.newgrounds.APICommand.THROTTLE_THRESHOLD)
         {
            var _loc1_ = com.newgrounds.APICommand._commandQueue.shift();
            _loc1_.command.send(_loc1_.connection);
            com.newgrounds.APICommand._throttleCount = com.newgrounds.APICommand._throttleCount + 1;
         }
      }
   }
   static function encryptHex(hexValue)
   {
      var _loc4_ = hexValue.length % 6;
      var _loc3_ = "";
      var _loc1_ = 0;
      while(_loc1_ < hexValue.length)
      {
         _loc3_ += com.newgrounds.APICommand._encryptor.encodeUint(int("0x" + hexValue.substr(_loc1_,6)),4);
         _loc1_ += 6;
      }
      return _loc4_.toString() + _loc3_;
   }
   function get command()
   {
      return this._command;
   }
   function set command(value)
   {
      this._command = value;
   }
   function get hasTimeout()
   {
      return this._hasTimeout;
   }
   function set hasTimeout(val)
   {
      this._hasTimeout = val;
   }
   function get parameters()
   {
      return this._parameters;
   }
   function set parameters(object)
   {
      this._parameters = new Object();
      if(object)
      {
         for(var _loc3_ in object)
         {
            this._parameters[_loc3_] = object[_loc3_];
         }
      }
   }
   function get preventCache()
   {
      return this._preventCache;
   }
   function set preventCache(value)
   {
      this._preventCache = value;
   }
   function get secureParameters()
   {
      return this._secureParameters;
   }
   function set secureParameters(object)
   {
      this._secureParameters = new Object();
      if(object)
      {
         for(var _loc3_ in object)
         {
            this._secureParameters[_loc3_] = object[_loc3_];
         }
      }
   }
   function get hasSecureParameters()
   {
      for(var _loc2_ in this._secureParameters)
      {
         return true;
         break;
      }
      return false;
   }
   function addFile(filename, data, dataField, contentType)
   {
      if(contentType == undefined)
      {
         contentType = "application/octet-stream";
      }
      if(!this._files)
      {
         this._files = new Object();
      }
      var _loc3_ = {filename:filename,data:data,dataField:dataField,contentType:contentType};
      this._files[filename] = _loc3_;
   }
   function removeFile(filename)
   {
      if(this._files)
      {
         delete this._files[filename];
      }
   }
   function clearFiles()
   {
      this._files = null;
   }
   function close()
   {
      if(this._loader)
      {
         clearInterval(this._timeoutTimer);
         var _loc2_ = 0;
         while(_loc2_ < com.newgrounds.APICommand._pendingCommands.length)
         {
            if(com.newgrounds.APICommand._pendingCommands[_loc2_] == this)
            {
               com.newgrounds.APICommand._pendingCommands.splice(_loc2_,1);
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         this._loader = null;
      }
   }
   function loadInBrowser(connection, newWindow)
   {
      this._parameters.command_id = this._command;
      this._parameters.tracker_id = !connection.apiId ? 1 : connection.apiId;
      if(connection.debug)
      {
         this._parameters.debug = 1;
      }
      var _loc3_ = connection.apiURL + "?host=" + escape(connection.hostDomain);
      for(var _loc4_ in this._parameters)
      {
         _loc3_ += "&" + escape(_loc4_) + "=" + escape(this._parameters[_loc4_]);
      }
      var _loc6_ = undefined;
      if(newWindow)
      {
         _loc6_ = "_blank";
      }
      else
      {
         _loc6_ = "_top";
      }
      _root.getURL(_loc3_,_loc6_);
   }
   function send(connection)
   {
      if(com.newgrounds.APICommand._throttleCount >= com.newgrounds.APICommand.THROTTLE_THRESHOLD)
      {
         com.newgrounds.APICommand._commandQueue.push({connection:connection,command:this});
      }
      else
      {
         this.sendInternal(connection);
      }
   }
   function sendInternal(connection)
   {
      var _loc4_ = undefined;
      _loc4_ = new LoadVars();
      _loc4_.command_id = this._command;
      _loc4_.tracker_id = connection.apiId;
      if(connection.debug)
      {
         _loc4_.debug = 1;
      }
      if(this._preventCache)
      {
         _loc4_.seed = Math.random();
      }
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc7_ = undefined;
      for(_loc2_ in this._parameters)
      {
         _loc3_ = this._parameters[_loc2_];
         if(_loc3_ != null)
         {
            if(typeof _loc3_ == "boolean")
            {
               _loc4_[_loc2_] = int(_loc3_);
            }
            else
            {
               _loc4_[_loc2_] = _loc3_;
            }
         }
      }
      if(this.hasSecureParameters)
      {
         var _loc6_ = new Object();
         for(_loc2_ in this._secureParameters)
         {
            _loc3_ = this._secureParameters[_loc2_];
            if(_loc3_ != null)
            {
               if(typeof _loc3_ == "boolean")
               {
                  _loc6_[_loc2_] = int(_loc3_);
               }
               else
               {
                  _loc6_[_loc2_] = _loc3_;
               }
            }
         }
         var _loc8_ = "";
         _loc7_ = 0;
         while(_loc7_ < 16)
         {
            _loc8_ += com.newgrounds.APICommand.ENCRYPTOR_RADIX.charAt(int(Math.random() * com.newgrounds.APICommand.ENCRYPTOR_RADIX.length));
            _loc7_ = _loc7_ + 1;
         }
         _loc4_.command_id = "securePacket";
         _loc6_.command_id = this._command;
         _loc6_.as_version = 3;
         _loc6_.session_id = connection.sessionId;
         _loc6_.user_email = connection.userEmail;
         _loc6_.publisher_id = connection.publisherId;
         _loc6_.seed = _loc8_;
         var _loc13_ = com.newgrounds.crypto.MD5.hash(_loc8_);
         var _loc11_ = com.newgrounds.crypto.RC4.encrypt(com.newgrounds.encoders.json.JSON.encode(_loc6_),connection.encryptionKey);
         _loc4_.secure = com.newgrounds.APICommand.encryptHex(_loc13_ + _loc11_);
      }
      com.newgrounds.Logger.logInternal("Sending packet:",_loc4_);
      var _loc12_ = undefined;
      _loc12_ = "application/x-www-form-urlencoded";
      for(_loc2_ in _loc4_)
      {
         if(typeof _loc4_[_loc2_] == "object")
         {
            _loc4_[_loc2_] = com.newgrounds.encoders.json.JSON.encode(_loc4_[_loc2_]);
         }
      }
      if(this._files)
      {
         for(var _loc10_ in this._files)
         {
            var _loc5_ = this._files[_loc10_];
            if(typeof _loc5_.data == "string")
            {
               _loc4_[_loc10_] = _loc5_.data;
            }
            else
            {
               _loc4_[_loc10_] = com.newgrounds.encoders.json.JSON.encode(_loc5_.data);
            }
         }
      }
      com.newgrounds.APICommand._pendingCommands.push(this);
      com.newgrounds.APICommand._throttleCount = com.newgrounds.APICommand._throttleCount + 1;
      com.newgrounds.APICommand._throttleTimestamp = getTimer();
      this.startLoader(connection.apiURL,_loc4_,_loc12_);
   }
   function startLoader(url, data, contentType)
   {
      this._loader = LoadVars(data);
      this._loader.onData = this.as2CompleteHandler;
      this._loader.contentType = contentType;
      this._loader.sendAndLoad(url,this._loader,"POST");
      if(this._hasTimeout)
      {
         setInterval(this,this.onTimeout,com.newgrounds.APICommand.TIMEOUT_INTERVAL);
      }
   }
   function as2CompleteHandler(data)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < com.newgrounds.APICommand._pendingCommands.length)
      {
         if(com.newgrounds.APICommand._pendingCommands[_loc2_]._loader == this)
         {
            _loc3_ = com.newgrounds.APICommand._pendingCommands[_loc2_];
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc3_.onComplete(data);
   }
   function onTimeout(event)
   {
      this.close();
      com.newgrounds.Logger.logError("Command timed out.");
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.COMMAND_COMPLETE,null,com.newgrounds.APIEvent.ERROR_TIMED_OUT));
   }
   function onError(error)
   {
      com.newgrounds.Logger.logError("Error when sending command:",error);
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.COMMAND_COMPLETE,null,com.newgrounds.APIEvent.ERROR_UNKNOWN));
      this.close();
   }
   function onComplete(data)
   {
      try
      {
         if(!data || data == "")
         {
            throw new Error();
         }
         com.newgrounds.Logger.logInternal("Received packet:",data);
         var _loc2_ = com.newgrounds.encoders.json.JSON.decode(data);
         if(!_loc2_)
         {
            throw new Error();
         }
         if(com.newgrounds.APICommand.bridge)
         {
            com.newgrounds.APICommand.bridge.sendEvent(_loc2_.command_id,_loc2_);
         }
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.COMMAND_COMPLETE,_loc2_,!(_loc2_ && _loc2_.success) ? com.newgrounds.APIEvent.ERROR_COMMAND_FAILED : com.newgrounds.APIEvent.ERROR_NONE));
      }
      catch(e)
      {
         com.newgrounds.Logger.logError("Invalid response returned from server: " + data);
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.COMMAND_COMPLETE,null,com.newgrounds.APIEvent.ERROR_BAD_RESPONSE));
      }
      this.close();
   }
}
