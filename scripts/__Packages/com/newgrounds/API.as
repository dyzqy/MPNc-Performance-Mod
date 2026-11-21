class com.newgrounds.API
{
   static var _adFeedURL;
   static var _movieVersion;
   static var _bridge;
   static var _requestedSaveGroupId;
   static var _requestedSaveFileId;
   static var _movieName;
   static var _newVersion;
   static var _saveFilePath;
   static var _imageFilePath;
   static var VERSION = "3.1.1 AS2";
   static var RELEASE_MODE = "releaseMode";
   static var DEBUG_MODE_LOGGED_IN = "debugModeLoggedIn";
   static var DEBUG_MODE_LOGGED_OUT = "debugModeLoggedOut";
   static var DEBUG_MODE_NEW_VERSION = "debugModeNewVersion";
   static var DEBUG_MODE_HOST_BLOCKED = "debugModeHostBlocked";
   static var TEST_AD_FEED_URL = "https://www.ngads.com/adtest.php";
   static var _dispatcher = new com.newgrounds.APIEventDispatcher();
   static var _connection = new com.newgrounds.APIConnection();
   static var _debugMode = com.newgrounds.API.DEBUG_MODE_LOGGED_IN;
   static var _adsApproved = false;
   static var _medals = new Object();
   static var _medalsArray = [];
   static var _scoreBoards = new Object();
   static var _scoreBoardsArray = [];
   static var _saveGroups = new Object();
   static var _saveGroupsArray = [];
   static var _sharedObjects = new Object();
   function API()
   {
   }
   static function get connected()
   {
      return com.newgrounds.API._connection.connected;
   }
   static function get isNetworkHost()
   {
      return com.newgrounds.API._connection.isNetworkHost;
   }
   static function get apiId()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.apiId;
   }
   static function get debugMode()
   {
      return com.newgrounds.API._debugMode;
   }
   static function set debugMode(val)
   {
      com.newgrounds.API._debugMode = val;
   }
   static function get publisherId()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.publisherId;
   }
   static function get sessionId()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.sessionId;
   }
   static function get hostDomain()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.hostDomain;
   }
   static function get hostURL()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.hostURL;
   }
   static function get isNewgrounds()
   {
      return com.newgrounds.API._connection.publisherId == 1;
   }
   static function get hasUserSession()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.hasUserSession;
   }
   static function get username()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.username;
   }
   static function get userId()
   {
      com.newgrounds.API._connection.assertInitialized();
      return com.newgrounds.API._connection.userId;
   }
   static function assertConnected(eventType)
   {
      if(eventType == undefined)
      {
         eventType = null;
      }
      if(com.newgrounds.API._connection.assertConnected())
      {
         return true;
      }
      if(eventType)
      {
         com.newgrounds.API.dispatchEvent(eventType,null,com.newgrounds.APIEvent.ERROR_NOT_CONNECTED);
      }
      return false;
   }
   static function get adsApproved()
   {
      return com.newgrounds.API._adsApproved;
   }
   static function get adFeedURL()
   {
      return com.newgrounds.API._adFeedURL;
   }
   static function get medals()
   {
      return com.newgrounds.API._medalsArray;
   }
   static function get scoreBoards()
   {
      return com.newgrounds.API._scoreBoardsArray;
   }
   static function get saveGroups()
   {
      return com.newgrounds.API._saveGroupsArray;
   }
   static function connect(_root, apiId, encryptionKey, movieVersion)
   {
      if(encryptionKey == undefined)
      {
         encryptionKey = null;
      }
      if(movieVersion == undefined)
      {
         movieVersion = "";
      }
      com.newgrounds.APIEventDispatcher.globalDispatcher = com.newgrounds.API._dispatcher;
      System.security.loadPolicyFile("https://apifiles.ngfiles.com/crossdomain.xml");
      if(com.newgrounds.API._connection.initialized)
      {
         com.newgrounds.Logger.logError("Connection already in progress. Please call API.disconnect() before attempting another connection.");
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.API_CONNECTED,false,com.newgrounds.APIEvent.ERROR_NOT_CONNECTED);
         return undefined;
      }
      apiId = com.newgrounds.API.trimWhitespace(apiId);
      if(encryptionKey)
      {
         encryptionKey = com.newgrounds.API.trimWhitespace(encryptionKey);
      }
      if(!apiId || apiId == "")
      {
         com.newgrounds.Logger.logError("No apiId given. Please use the API ID from your API settings page.");
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.API_CONNECTED,false,com.newgrounds.APIEvent.ERROR_INVALID_ARGUMENT);
         return undefined;
      }
      com.newgrounds.Logger.logMessage("====== Newgrounds API v" + com.newgrounds.API.VERSION + " ======");
      com.newgrounds.API._connection.connectionState = com.newgrounds.APIConnection.CONNECTING;
      _root;
      com.newgrounds.API._movieVersion = movieVersion;
      com.newgrounds.API._connection.apiId = apiId;
      var _loc4_ = undefined;
      _loc4_ = apiId.indexOf(":");
      if(_loc4_ != -1)
      {
         com.newgrounds.API._connection.trackerId = int(apiId.substring(0,_loc4_));
      }
      else
      {
         com.newgrounds.API._connection.trackerId = int(apiId);
      }
      if(!com.newgrounds.API._connection.trackerId)
      {
         com.newgrounds.Logger.logError("Invalid API ID: " + apiId);
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.API_CONNECTED,false,com.newgrounds.APIEvent.ERROR_INVALID_ARGUMENT);
         return undefined;
      }
      com.newgrounds.API._connection.encryptionKey = encryptionKey;
      com.newgrounds.API._connection.initialized = true;
      com.newgrounds.API._connection.hostURL = _root._url;
      com.newgrounds.API.doConnect(_root);
   }
   static function doConnect(flashVars)
   {
      if(com.newgrounds.API.isNetworkHost && com.newgrounds.API._debugMode != com.newgrounds.API.RELEASE_MODE)
      {
         com.newgrounds.Logger.logMessage("Live file detected, turning off debug mode.");
         com.newgrounds.API._debugMode = com.newgrounds.API.RELEASE_MODE;
      }
      if(flashVars && flashVars.NewgroundsAPI_SandboxID)
      {
         com.newgrounds.API._bridge = new com.newgrounds.Bridge(flashVars.NewgroundsAPI_SandboxID);
         com.newgrounds.APICommand.bridge = com.newgrounds.API._bridge;
      }
      if(com.newgrounds.API._debugMode == com.newgrounds.API.RELEASE_MODE)
      {
         if(flashVars)
         {
            if(flashVars.NewgroundsAPI_UserName)
            {
               com.newgrounds.API._connection.username = flashVars.NewgroundsAPI_UserName;
            }
            if(flashVars.NewgroundsAPI_UserID)
            {
               com.newgrounds.API._connection.userId = flashVars.NewgroundsAPI_UserID;
            }
            if(flashVars.NewgroundsAPI_PublisherID)
            {
               com.newgrounds.API._connection.publisherId = flashVars.NewgroundsAPI_PublisherID;
            }
            if(flashVars.NewgroundsAPI_UserpageFormat)
            {
               com.newgrounds.API._connection.userpageFormat = flashVars.NewgroundsAPI_UserpageFormat;
            }
            if(flashVars.NewgroundsAPI_SessionID)
            {
               com.newgrounds.API._connection.sessionId = flashVars.NewgroundsAPI_SessionID;
            }
            if(flashVars.NewgroundsAPI_SaveGroupID)
            {
               com.newgrounds.API._requestedSaveGroupId = flashVars.NewgroundsAPI_SaveGroupID;
            }
            if(flashVars.NewgroundsAPI_SaveFileID)
            {
               com.newgrounds.API._requestedSaveFileId = flashVars.NewgroundsAPI_SaveFileID;
            }
         }
      }
      else
      {
         com.newgrounds.API._connection.debug = true;
         if(com.newgrounds.API._debugMode == com.newgrounds.API.DEBUG_MODE_LOGGED_IN || com.newgrounds.API._debugMode == com.newgrounds.API.DEBUG_MODE_LOGGED_OUT)
         {
            com.newgrounds.API._connection.publisherId = 1;
         }
         if(com.newgrounds.API._debugMode == com.newgrounds.API.DEBUG_MODE_LOGGED_IN)
         {
            com.newgrounds.API._connection.sessionId = "D3bu64p1U53R";
            com.newgrounds.API._connection.userId = 10;
            com.newgrounds.API._connection.username = "API-Debugger";
         }
      }
      com.newgrounds.API._connection.sendSimpleCommand("connectMovie",com.newgrounds.API.onConnect,{host:com.newgrounds.API._connection.hostDomain,movie_version:com.newgrounds.API._movieVersion,publisher_id:com.newgrounds.API._connection.publisherId});
   }
   static function onConnect(event)
   {
      var _loc1_ = event.data;
      if(!event.success)
      {
         com.newgrounds.Logger.logError("Unable to connect to the API.");
         com.newgrounds.API._connection.reset();
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.API_CONNECTED,event.data,event.error);
         return undefined;
      }
      if(com.newgrounds.API.debugMode != com.newgrounds.API.RELEASE_MODE)
      {
         com.newgrounds.API._adFeedURL = com.newgrounds.API.TEST_AD_FEED_URL;
      }
      else if(_loc1_.ad_url)
      {
         com.newgrounds.API._adFeedURL = unescape(_loc1_.ad_url);
      }
      switch(_loc1_.ad_status)
      {
         case -1:
            com.newgrounds.Logger.logWarning("Your movie is not approved to run Flash Ads.");
            break;
         case 0:
            com.newgrounds.Logger.logWarning("Your movie is still awaiting approval to run Flash Ads.");
            break;
         case 1:
            com.newgrounds.Logger.logMessage("Your movie is approved to run Flash Ads!");
      }
      com.newgrounds.API._adsApproved = _loc1_.ad_status == 1;
      if(com.newgrounds.API._debugMode == com.newgrounds.API.DEBUG_MODE_HOST_BLOCKED || _loc1_.deny_host)
      {
         com.newgrounds.Logger.logWarning(com.newgrounds.API._connection.hostDomain + " does not have permission to host this movie!","Update your API configuration to allow this host.");
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.API_CONNECTED,{officialURL:unescape(_loc1_.movie_url)},com.newgrounds.APIEvent.ERROR_HOST_BLOCKED);
         com.newgrounds.API._connection.reset();
         return undefined;
      }
      com.newgrounds.API._movieName = !_loc1_.movieName ? "" : _loc1_.movieName;
      com.newgrounds.Logger.logMessage("Connecting to the Newgrounds API Gateway...","----- " + _loc1_.movie_name + " -----");
      if(com.newgrounds.API._debugMode == com.newgrounds.API.DEBUG_MODE_NEW_VERSION)
      {
         _loc1_.movie_version = "Debug Mode";
      }
      if(_loc1_.movie_version)
      {
         com.newgrounds.Logger.logMessage("A new version of this movie is available.","Current version:\t" + com.newgrounds.API._movieVersion,"Newest version:\t" + _loc1_.movie_version,"Use API.loadOfficialVersion() to link to the latest version.");
         com.newgrounds.API._newVersion = true;
      }
      else
      {
         com.newgrounds.API._newVersion = false;
      }
      if(_loc1_.request_portal_url)
      {
         com.newgrounds.API._connection.sendSimpleCommand("setPortalID",null,{portal_url:com.newgrounds.API._connection.hostURL});
      }
      com.newgrounds.API._connection.sendSimpleCommand("preloadSettings",com.newgrounds.API.onMetadataLoaded,{publisher_id:com.newgrounds.API._connection.publisherId,user_id:com.newgrounds.API._connection.userId});
   }
   static function onMetadataLoaded(event)
   {
      var _loc11_ = event.data;
      var _loc1_ = undefined;
      var _loc7_ = undefined;
      if(!event.success)
      {
         com.newgrounds.Logger.logWarning("Unable to load movie metadata.");
         com.newgrounds.API.disconnect();
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.API_CONNECTED,null,event.error);
         return undefined;
      }
      var _loc10_ = 0;
      if(_loc11_.medals)
      {
         _loc10_ = _loc11_.medals.length;
         var _loc18_ = undefined;
         if(com.newgrounds.API.hasUserSession)
         {
            _loc18_ = com.newgrounds.API.loadLocal("medals_unlocked_" + com.newgrounds.API.username);
         }
         else
         {
            _loc18_ = com.newgrounds.API.loadLocal("medals_unlocked");
         }
         _loc1_ = 0;
         while(_loc1_ < _loc10_)
         {
            var _loc4_ = _loc11_.medals[_loc1_];
            var _loc15_ = _loc4_.medal_unlocked;
            var _loc17_ = _loc18_ && _loc18_[_loc4_.medal_id];
            var _loc14_ = !com.newgrounds.API.hasUserSession ? _loc17_ : _loc15_;
            if(com.newgrounds.API.debugMode != com.newgrounds.API.RELEASE_MODE)
            {
               _loc14_ = false;
            }
            var _loc5_ = new com.newgrounds.Medal(com.newgrounds.API._connection,_loc4_.medal_id,_loc4_.medal_name,_loc4_.medal_description,Boolean(int(_loc4_.secret)),_loc14_,_loc4_.medal_value,_loc4_.medal_difficulty,_loc4_.medal_icon);
            _loc5_.addEventListener(com.newgrounds.APIEvent.MEDAL_UNLOCKED,com.newgrounds.API.onMedalUnlocked,false,0,true);
            _loc5_.addEventListener(com.newgrounds.APIEvent.MEDAL_UNLOCK_CONFIRMED,com.newgrounds.API.onMedalUnlockConfirmed,false,0,true);
            com.newgrounds.API._medals[_loc5_.name] = _loc5_;
            com.newgrounds.API._medalsArray.push(_loc5_);
            com.newgrounds.Logger.logMessage(_loc5_);
            if(com.newgrounds.API.hasUserSession && _loc17_ && !_loc15_)
            {
               com.newgrounds.Logger.logMessage("Server missed the \"" + _loc5_.name + "\" unlock. Resending...");
               _loc5_.unlock();
            }
            _loc1_ = _loc1_ + 1;
         }
      }
      com.newgrounds.Logger.logMessage(_loc10_ + " medal" + (_loc10_ == 1 ? "" : "s") + " initialized.");
      _loc10_ = 0;
      if(_loc11_.score_boards)
      {
         _loc10_ = _loc11_.score_boards.length;
         _loc1_ = 0;
         while(_loc1_ < _loc10_)
         {
            var _loc16_ = _loc11_.score_boards[_loc1_];
            var _loc9_ = new com.newgrounds.ScoreBoard(com.newgrounds.API._connection,_loc16_.name,_loc16_.id);
            com.newgrounds.API._scoreBoards[_loc9_.name] = _loc9_;
            com.newgrounds.API._scoreBoardsArray.push(_loc9_);
            com.newgrounds.Logger.logMessage(_loc9_);
            _loc1_ = _loc1_ + 1;
         }
      }
      com.newgrounds.Logger.logMessage(_loc10_ + " scoreboard" + (_loc10_ == 1 ? "" : "s") + " initialized.");
      _loc10_ = 0;
      if(_loc11_.save_groups)
      {
         _loc10_ = _loc11_.save_groups.length;
         _loc1_ = 0;
         while(_loc1_ < _loc10_)
         {
            var _loc2_ = _loc11_.save_groups[_loc1_];
            var _loc13_ = [];
            if(_loc2_.keys)
            {
               _loc7_ = 0;
               while(_loc7_ < _loc2_.keys.length)
               {
                  var _loc6_ = _loc2_.keys[_loc7_];
                  _loc13_.push(new com.newgrounds.SaveKey(_loc6_.name,_loc6_.id,_loc6_.type));
                  _loc7_ = _loc7_ + 1;
               }
            }
            var _loc12_ = [];
            if(_loc2_.ratings)
            {
               _loc1_ = 0;
               while(_loc1_ < _loc2_.ratings.length)
               {
                  var _loc3_ = _loc2_.ratings[_loc1_];
                  _loc12_.push(new com.newgrounds.SaveRating(_loc3_.name,_loc3_.id,_loc3_.float,_loc3_.min,_loc3_.max));
                  _loc1_ = _loc1_ + 1;
               }
            }
            var _loc8_ = new com.newgrounds.SaveGroup(com.newgrounds.API._connection,_loc2_.group_name,_loc2_.group_id,_loc2_.group_type,_loc13_,_loc12_);
            com.newgrounds.API._saveGroups[_loc8_.name] = _loc8_;
            com.newgrounds.API._saveGroupsArray.push(_loc8_);
            com.newgrounds.Logger.logMessage(_loc8_);
            _loc1_ = _loc1_ + 1;
         }
      }
      com.newgrounds.Logger.logMessage(_loc10_ + " save group" + (_loc10_ == 1 ? "" : "s") + " initialized.");
      if(_loc11_.save_file_path)
      {
         com.newgrounds.API._saveFilePath = _loc11_.save_file_path + "/";
         com.newgrounds.SaveFile._saveFilePath = com.newgrounds.API._saveFilePath;
         com.newgrounds.Logger.logInternal("Save file path: " + com.newgrounds.API._saveFilePath);
      }
      if(_loc11_.image_file_path)
      {
         com.newgrounds.API._imageFilePath = _loc11_.image_file_path + "/";
         com.newgrounds.SaveFile._imageFilePath = com.newgrounds.API._imageFilePath;
         com.newgrounds.Logger.logInternal("Image file path: " + com.newgrounds.API._imageFilePath);
      }
      com.newgrounds.Logger.logMessage("Connection complete!");
      com.newgrounds.API._connection.connectionState = com.newgrounds.APIConnection.CONNECTED;
      com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.API_CONNECTED,{movieName:com.newgrounds.API._movieName,newVersion:com.newgrounds.API._newVersion});
      if(com.newgrounds.API._requestedSaveFileId && com.newgrounds.API._requestedSaveGroupId)
      {
         com.newgrounds.API.addEventListener(com.newgrounds.APIEvent.FILE_LOADED,com.newgrounds.API.onRequestedFileLoaded);
         com.newgrounds.API.loadSaveFile(com.newgrounds.API._requestedSaveFileId,false);
      }
   }
   static function disconnect()
   {
      if(!com.newgrounds.API._connection.connected)
      {
         com.newgrounds.Logger.logWarning("The Newgrounds API is already disconnected.");
         return undefined;
      }
      com.newgrounds.API._connection.reset();
      for(var _loc2_ in com.newgrounds.API._medals)
      {
         var _loc1_ = com.newgrounds.API._medals[_loc2_];
         _loc1_.removeEventListener(com.newgrounds.APIEvent.MEDAL_UNLOCKED,com.newgrounds.API.onMedalUnlocked);
         _loc1_.removeEventListener(com.newgrounds.APIEvent.MEDAL_UNLOCK_CONFIRMED,com.newgrounds.API.onMedalUnlockConfirmed);
      }
      com.newgrounds.API._newVersion = false;
      com.newgrounds.API._medals = new Object();
      com.newgrounds.API._medalsArray = [];
      com.newgrounds.API._scoreBoards = new Object();
      com.newgrounds.API._scoreBoardsArray = [];
      com.newgrounds.API._saveGroups = new Object();
      com.newgrounds.API._saveGroupsArray = [];
      com.newgrounds.API._sharedObjects = new Object();
      com.newgrounds.API._imageFilePath = null;
      com.newgrounds.API._saveFilePath = null;
      com.newgrounds.Logger.logMessage("Disconnected from the Newgrounds API.");
   }
   static function loadNewgrounds()
   {
      com.newgrounds.API._connection.loadInBrowser("loadNewgrounds");
   }
   static function loadOfficialVersion()
   {
      if(com.newgrounds.API._connection.assertInitialized())
      {
         com.newgrounds.API._connection.loadInBrowser("loadOfficialVersion",false);
      }
   }
   static function loadMySite()
   {
      if(com.newgrounds.API._connection.assertInitialized())
      {
         com.newgrounds.API._connection.loadInBrowser("loadMySite");
      }
   }
   static function loadCustomLink(linkName)
   {
      if(com.newgrounds.API._connection.assertInitialized())
      {
         com.newgrounds.API._connection.loadInBrowser("loadCustomLink",true,{link:linkName});
      }
   }
   static function getMedal(medalName)
   {
      return com.newgrounds.API._medals[medalName];
   }
   static function unlockMedal(medalName)
   {
      if(!com.newgrounds.API.assertConnected())
      {
         return undefined;
      }
      var _loc1_ = com.newgrounds.API._medals[medalName];
      if(!_loc1_)
      {
         com.newgrounds.Logger.logError("No medal named \"" + medalName + "\" w.");
         return undefined;
      }
      _loc1_.unlock();
   }
   static function onMedalUnlocked(event)
   {
      if(event.success)
      {
         var _loc2_ = com.newgrounds.Medal(event.data);
         var _loc1_ = undefined;
         if(com.newgrounds.API.hasUserSession)
         {
            _loc1_ = com.newgrounds.API.loadLocal("medals_unlocked_" + com.newgrounds.API.username);
            if(!_loc1_)
            {
               _loc1_ = new Object();
            }
            _loc1_[_loc2_.id] = true;
            com.newgrounds.API.saveLocal("medals_unlocked_" + com.newgrounds.API.username,_loc1_);
         }
         else
         {
            _loc1_ = com.newgrounds.API.loadLocal("medals_unlocked");
            if(!_loc1_)
            {
               _loc1_ = new Object();
            }
            _loc1_[com.newgrounds.Medal(event.data).id] = true;
            com.newgrounds.API.saveLocal("medals_unlocked",_loc1_);
            com.newgrounds.Logger.logMessage("User instanceof not logged in. Medal \"" + _loc2_.name + "\" unlocked locally.");
         }
      }
   }
   static function onMedalUnlockConfirmed(event)
   {
      if(com.newgrounds.API.hasUserSession)
      {
         var _loc1_ = com.newgrounds.API.loadLocal("medals_unlocked_" + com.newgrounds.API.username);
         if(!_loc1_)
         {
            _loc1_ = new Object();
         }
         else
         {
            delete _loc1_[com.newgrounds.Medal(event.data).id];
         }
         com.newgrounds.API.saveLocal("medals_unlocked_" + com.newgrounds.API.username,_loc1_);
      }
   }
   static function clearLocalMedals()
   {
      for(var _loc2_ in com.newgrounds.API._medals)
      {
         var _loc1_ = com.newgrounds.API._medals[_loc2_];
         _loc1_.setUnlocked(false);
      }
      if(!com.newgrounds.API.hasUserSession)
      {
         com.newgrounds.API.saveLocal("medals_unlocked",new Object());
      }
   }
   static function getScoreBoard(scoreBoardName)
   {
      if(!com.newgrounds.API.assertConnected())
      {
         return null;
      }
      return com.newgrounds.API._scoreBoards[scoreBoardName];
   }
   static function loadScores(scoreBoardName, period, firstResult, numResults, tag)
   {
      if(period == undefined)
      {
         period = "All-Time";
      }
      if(firstResult == undefined)
      {
         firstResult = 1;
      }
      if(numResults == undefined)
      {
         numResults = 10;
      }
      if(tag == undefined)
      {
         tag = null;
      }
      if(!com.newgrounds.API.assertConnected())
      {
         return null;
      }
      var _loc1_ = com.newgrounds.API._scoreBoards[scoreBoardName];
      if(!_loc1_)
      {
         com.newgrounds.Logger.logError("No scoreboard named \"" + scoreBoardName + "\" w.");
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.SCORES_LOADED,null,com.newgrounds.APIEvent.ERROR_INVALID_ARGUMENT);
         return null;
      }
      _loc1_.period = period;
      _loc1_.firstResult = firstResult;
      _loc1_.numResults = numResults;
      _loc1_.tag = tag;
      _loc1_.loadScores();
      return _loc1_;
   }
   static function postScore(scoreBoardName, numericScore, tag)
   {
      if(tag == undefined)
      {
         tag = null;
      }
      if(!com.newgrounds.API.assertConnected())
      {
         return undefined;
      }
      if(!com.newgrounds.API.hasUserSession)
      {
         com.newgrounds.Logger.logError("The user must be logged-in to post a score.");
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.SCORE_POSTED,null,com.newgrounds.APIEvent.ERROR_NOT_LOGGED_IN);
         return undefined;
      }
      var _loc1_ = com.newgrounds.API._scoreBoards[scoreBoardName];
      if(!_loc1_)
      {
         com.newgrounds.Logger.logError("No scoreboard named \"" + scoreBoardName + "\" w.");
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.SCORE_POSTED,null,com.newgrounds.APIEvent.ERROR_INVALID_ARGUMENT);
         return undefined;
      }
      _loc1_.postScore(numericScore,tag);
   }
   static function getSaveGroup(groupName)
   {
      if(!com.newgrounds.API.assertConnected())
      {
         return null;
      }
      return com.newgrounds.API._saveGroups[groupName];
   }
   static function getSaveGroupById(id)
   {
      for(var _loc3_ in com.newgrounds.API._saveGroups)
      {
         var _loc1_ = com.newgrounds.API._saveGroups[_loc3_];
         if(_loc1_.id == id)
         {
            return _loc1_;
         }
      }
      return null;
   }
   static function createSaveFile(groupName)
   {
      if(!com.newgrounds.API.assertConnected())
      {
         return null;
      }
      var _loc1_ = com.newgrounds.API.getSaveGroup(groupName);
      if(!_loc1_)
      {
         com.newgrounds.Logger.logError("The save group \"" + groupName + "\" w found.");
         return null;
      }
      return new com.newgrounds.SaveFile(_loc1_);
   }
   static function loadSaveFile(saveId, loadContents)
   {
      if(loadContents == undefined)
      {
         loadContents = true;
      }
      com.newgrounds.API._connection.sendSimpleCommand("loadSaveFile",com.newgrounds.API.onFileLoaded,{save_id:saveId,get_contents:loadContents});
   }
   static function onFileLoaded(event)
   {
      var _loc2_ = undefined;
      if(event.success)
      {
         _loc2_ = com.newgrounds.SaveFile.fromObject(com.newgrounds.API.getSaveGroupById(event.data.group_id),event.data.file);
         if(event.data.get_contents)
         {
            _loc2_.load();
         }
         else
         {
            com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.FILE_LOADED,_loc2_);
         }
      }
      else
      {
         com.newgrounds.Logger.logError("Unable to load file:",event.error);
         com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.FILE_LOADED,null,event.error);
      }
   }
   static function createSaveQuery(groupName)
   {
      if(!com.newgrounds.API.assertConnected())
      {
         return null;
      }
      var _loc1_ = com.newgrounds.API.getSaveGroup(groupName);
      if(!_loc1_)
      {
         com.newgrounds.Logger.logError("The save group \"" + groupName + "\" w found.");
         return null;
      }
      var _loc2_ = new com.newgrounds.SaveQuery(_loc1_);
      return _loc2_;
   }
   static function createSaveQueryByDate(groupName, sortDescending)
   {
      if(sortDescending == undefined)
      {
         sortDescending = true;
      }
      var _loc1_ = com.newgrounds.API.createSaveQuery(groupName);
      if(!_loc1_)
      {
         return null;
      }
      _loc1_.sortOn(com.newgrounds.SaveQuery.CREATED_ON,sortDescending);
      return _loc1_;
   }
   static function createSaveQueryByName(groupName, filename, exactMatch, sortDescending)
   {
      if(exactMatch == undefined)
      {
         exactMatch = false;
      }
      if(sortDescending == undefined)
      {
         sortDescending = false;
      }
      var _loc1_ = com.newgrounds.API.createSaveQuery(groupName);
      _loc1_.addCondition(com.newgrounds.SaveQuery.FILE_NAME,!exactMatch ? com.newgrounds.SaveQuery.OPERATOR_CONTAINS : com.newgrounds.SaveQuery.OPERATOR_EQUAL,filename);
      return _loc1_;
   }
   static function createSaveQueryByRating(groupName, ratingName, sortDescending)
   {
      if(sortDescending == undefined)
      {
         sortDescending = true;
      }
      var _loc1_ = com.newgrounds.API.createSaveQuery(groupName);
      _loc1_.sortOn(ratingName,sortDescending);
      return _loc1_;
   }
   static function onRequestedFileLoaded(event)
   {
      com.newgrounds.API.removeEventListener(com.newgrounds.APIEvent.FILE_LOADED,com.newgrounds.API.onRequestedFileLoaded);
      if(event.success)
      {
         var _loc1_ = event.data;
         if(_loc1_)
         {
            com.newgrounds.API.dispatchEvent(com.newgrounds.APIEvent.FILE_REQUESTED,_loc1_);
         }
      }
   }
   static function addEventListener(eventType, listener, priority, useWeakReference)
   {
      if(priority == undefined)
      {
         priority = 0;
      }
      if(useWeakReference == undefined)
      {
         useWeakReference = true;
      }
      com.newgrounds.API._dispatcher.addEventListener(eventType,listener,false,priority,useWeakReference);
   }
   static function removeEventListener(eventType, listener)
   {
      com.newgrounds.API._dispatcher.removeEventListener(eventType,listener);
   }
   static function dispatchEvent(event, data, error)
   {
      if(data == undefined)
      {
         data = null;
      }
      if(error == undefined)
      {
         error = null;
      }
      com.newgrounds.API._dispatcher.dispatchEvent(new com.newgrounds.APIEvent(event,data,error));
   }
   static function saveLocal(saveId, saveData)
   {
      try
      {
         var _loc3_ = undefined;
         var _loc2_ = "ng_ap_secure_" + com.newgrounds.API._connection.trackerId + "_" + com.newgrounds.crypto.RC4.encrypt(saveId,com.newgrounds.API._connection.encryptionKey);
         if(!com.newgrounds.API._sharedObjects[saveId])
         {
            com.newgrounds.API._sharedObjects[saveId] = SharedObject.getLocal(_loc2_);
         }
         _loc3_ = com.newgrounds.API._sharedObjects[saveId];
         _loc3_.data.data = com.newgrounds.API.encodeData(saveData);
      }
      catch(error:Error)
      {
         com.newgrounds.Logger.logError("Unable to save local data.",error);
         return false;
      }
      return true;
   }
   static function loadLocal(saveId)
   {
      try
      {
         var _loc1_ = undefined;
         var _loc3_ = "ng_ap_secure_" + com.newgrounds.API._connection.trackerId + "_" + com.newgrounds.crypto.RC4.encrypt(saveId,com.newgrounds.API._connection.encryptionKey);
         if(!com.newgrounds.API._sharedObjects[saveId])
         {
            com.newgrounds.API._sharedObjects[saveId] = SharedObject.getLocal(_loc3_);
         }
         _loc1_ = com.newgrounds.API._sharedObjects[saveId];
         if(_loc1_ && _loc1_.data && _loc1_.data.data)
         {
            return com.newgrounds.API.decodeData(_loc1_.data.data);
         }
         return null;
      }
      catch(error:Error)
      {
         com.newgrounds.Logger.logError("Unable to load local data.",error);
      }
      return null;
   }
   static function logCustomEvent(eventName)
   {
      if(com.newgrounds.API.assertConnected())
      {
         com.newgrounds.Logger.logMessage("Logged event: " + eventName);
         com.newgrounds.API._connection.sendSimpleCommand("logCustomEvent",null,{event:eventName});
      }
   }
   static function encodeData(data)
   {
      if(!com.newgrounds.API._connection.assertInitialized())
      {
         return null;
      }
      return com.newgrounds.crypto.RC4.encrypt(com.newgrounds.encoders.json.JSON.encode(data),com.newgrounds.API._connection.encryptionKey);
   }
   static function decodeData(data)
   {
      if(!com.newgrounds.API._connection.assertInitialized())
      {
         return null;
      }
      try
      {
         return com.newgrounds.encoders.json.JSON.decode(com.newgrounds.crypto.RC4.decrypt(data,com.newgrounds.API._connection.encryptionKey));
      }
      catch(error:Error)
      {
      }
      return null;
   }
   static function stopPendingCommands()
   {
      com.newgrounds.APICommand.stopPendingCommands();
      com.newgrounds.Logger.logMessage("Pending commands stopped.");
   }
   static function trimWhitespace(string)
   {
      if(!string)
      {
         return null;
      }
      var _loc3_ = 0;
      while(string.charAt(_loc3_) == " ")
      {
         _loc3_ = _loc3_ + 1;
      }
      var _loc1_ = string.length - 1;
      while(string.charAt(_loc1_) == " " && _loc1_ >= 0)
      {
         _loc1_ = _loc1_ - 1;
      }
      return string.slice(_loc3_,_loc1_ + 1);
   }
}
