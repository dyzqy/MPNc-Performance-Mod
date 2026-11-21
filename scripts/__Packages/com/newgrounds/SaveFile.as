class com.newgrounds.SaveFile extends com.newgrounds.APIEventDispatcher
{
   var _iconLoader;
   var _group;
   var _keys;
   var _ratings;
   var _name;
   var _description;
   var _id;
   var _data;
   var _dataLoader;
   var _fileSize;
   var _readOnly;
   var _draft;
   var _authorId;
   var _authorName;
   var _views;
   var _createdDate;
   var _modifiedDate;
   var _encodedIcon;
   var _encodedData;
   var _encoderQueue;
   var _encoding;
   var _dataLoaded;
   var _encodingParent;
   var _encodingProperty;
   var _dataURL;
   static var _currentFile;
   static var ICON_WIDTH = 90;
   static var ICON_HEIGHT = 90;
   static var DEFAULT_ICON = flash.display.BitmapData.loadBitmap("DefaultSaveIcon");
   static var STATUS_PRIVATE = 0;
   static var STATUS_SHARED = 1;
   static var STATUS_UNAPPROVED = 2;
   static var STATUS_APPROVED = 3;
   static var _imageFilePath = "";
   static var _saveFilePath = "";
   static var ICON_IMAGE_SCANNER = new com.newgrounds.encoders.ImageScanner();
   static var DATA_IMAGE_SCANNER = new com.newgrounds.encoders.ImageScanner(64,6);
   function SaveFile(group)
   {
      super();
      this._iconLoader = new com.newgrounds.BitmapLoader(com.newgrounds.SaveFile.DEFAULT_ICON,null);
      this._group = group;
      this._keys = {};
      this._ratings = {};
   }
   static function get currentFile()
   {
      return com.newgrounds.SaveFile._currentFile;
   }
   static function fromObject(group, fileData)
   {
      var _loc4_ = new com.newgrounds.SaveFile(group);
      _loc4_._name = fileData.filename;
      _loc4_._description = fileData.description;
      _loc4_._id = fileData.save_id;
      _loc4_._authorId = fileData.user_id;
      _loc4_._authorName = fileData.user_name;
      _loc4_._createdDate = fileData.created;
      _loc4_._modifiedDate = fileData.last_update;
      _loc4_._views = fileData.views;
      if(fileData.thumb && fileData.thumb != "")
      {
         _loc4_._iconLoader.url = com.newgrounds.SaveFile._imageFilePath + fileData.thumb;
      }
      _loc4_._dataURL = com.newgrounds.SaveFile._saveFilePath + fileData.file;
      _loc4_._fileSize = fileData.file_size;
      _loc4_._approved = fileData.status != com.newgrounds.SaveFile.STATUS_UNAPPROVED;
      _loc4_._readOnly = false;
      _loc4_._public = fileData.status != com.newgrounds.SaveFile.STATUS_PRIVATE && fileData.status != com.newgrounds.SaveFile.STATUS_UNAPPROVED;
      for(var _loc8_ in fileData.keys)
      {
         var _loc6_ = fileData.keys[_loc8_];
         var _loc2_ = group.getKeyById(_loc6_.id);
         if(_loc2_)
         {
            _loc4_._keys[_loc2_.name] = _loc2_.validateValue(_loc6_.value);
         }
      }
      for(var _loc9_ in fileData.ratings)
      {
         var _loc5_ = fileData.ratings[_loc9_];
         var _loc3_ = group.getRatingById(_loc5_.id);
         if(_loc3_)
         {
            _loc4_._ratings[_loc3_.name] = _loc3_.validateValue(_loc5_.score);
         }
      }
      return _loc4_;
   }
   function get group()
   {
      return this._group;
   }
   function get name()
   {
      return this._name;
   }
   function set name(val)
   {
      this._name = val;
   }
   function get description()
   {
      return this._description;
   }
   function set description(val)
   {
      this._description = val;
   }
   function get id()
   {
      return this._id;
   }
   function get data()
   {
      return this._data;
   }
   function set data(val)
   {
      this._data = val;
   }
   function get bytesLoaded()
   {
      if(this._data)
      {
         return this.bytesTotal;
      }
      if(!this._dataLoader)
      {
         return 0;
      }
      return this._dataLoader.getBytesLoaded();
   }
   function get bytesTotal()
   {
      return this._fileSize;
   }
   function get readOnly()
   {
      return this._readOnly;
   }
   function get draft()
   {
      return this._draft;
   }
   function set draft(v)
   {
      this._draft = v;
   }
   function get authorId()
   {
      return this._authorId;
   }
   function get authorName()
   {
      return this._authorName;
   }
   function get keys()
   {
      return this._keys;
   }
   function get ratings()
   {
      return this._ratings;
   }
   function get views()
   {
      return this._views;
   }
   function get createdDate()
   {
      return this._createdDate;
   }
   function get updatedDate()
   {
      return this._modifiedDate;
   }
   function toString()
   {
      return "Save File: " + this._name;
   }
   function get icon()
   {
      return this._iconLoader.bitmapData;
   }
   function set icon(v)
   {
      this.createIcon(v);
   }
   function get iconLoaded()
   {
      return this._iconLoader.loaded;
   }
   function createIcon(source)
   {
      var _loc9_ = new flash.display.BitmapData(com.newgrounds.SaveFile.ICON_WIDTH,com.newgrounds.SaveFile.ICON_HEIGHT,false,0);
      var _loc6_ = undefined;
      var _loc5_ = undefined;
      var _loc10_ = 0;
      var _loc8_ = 0;
      if(source instanceof flash.display.BitmapData)
      {
         _loc6_ = source.width;
         _loc5_ = source.height;
      }
      else if(source instanceof MovieClip)
      {
         _loc6_ = source._width;
         _loc5_ = source._height;
         var _loc7_ = MovieClip(source).getBounds(source);
         _loc10_ = _loc7_.xMin;
         _loc8_ = _loc7_.yMin;
      }
      var _loc3_ = new flash.geom.Matrix();
      var _loc4_ = undefined;
      _loc4_ = Math.min(com.newgrounds.SaveFile.ICON_WIDTH / _loc6_,com.newgrounds.SaveFile.ICON_HEIGHT / _loc5_);
      _loc3_.translate(- _loc10_,- _loc8_);
      _loc3_.scale(_loc4_,_loc4_);
      _loc3_.translate((com.newgrounds.SaveFile.ICON_WIDTH - _loc6_ * _loc4_) / 2,(com.newgrounds.SaveFile.ICON_HEIGHT - _loc5_ * _loc4_) / 2);
      _loc9_.draw(source,_loc3_);
      this._iconLoader.bitmapData = _loc9_;
   }
   function attachIcon(parent)
   {
      if(this._iconLoader)
      {
         return this._iconLoader.attachBitmap(parent);
      }
      com.newgrounds.Logger.logError("No icon available for this sumbission.");
      return null;
   }
   function save()
   {
      if(!this._group.connection.hasUserSession)
      {
         com.newgrounds.Logger.logError("The user must be logged-in to save a file.");
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.FILE_SAVED,null,com.newgrounds.APIEvent.ERROR_NOT_LOGGED_IN));
         return undefined;
      }
      com.newgrounds.BitmapLoader._cacheSeed = com.newgrounds.BitmapLoader._cacheSeed + 1;
      com.newgrounds.SaveFile._currentFile = this;
      if(this.iconLoaded)
      {
         com.newgrounds.SaveFile.ICON_IMAGE_SCANNER.encode(this.icon,this.onIconEncoded,this);
      }
      else
      {
         this.encodeData(true);
      }
   }
   function onIconEncoded(encodedIcon)
   {
      this._encodedIcon = encodedIcon;
      this.encodeData(true);
   }
   function doSave()
   {
      var _loc4_ = new com.newgrounds.APICommand("saveFile");
      _loc4_.secureParameters.group = this._group.id;
      _loc4_.secureParameters.user_name = this._group.connection.username;
      _loc4_.secureParameters.filename = this._name;
      _loc4_.secureParameters.description = this._description;
      if(this._draft)
      {
         _loc4_.secureParameters.draft = true;
      }
      if(this._id && !this._readOnly)
      {
         _loc4_.secureParameters.overwrite = 1;
         _loc4_.secureParameters.save_id = this._id;
      }
      var _loc8_ = [];
      for(var _loc9_ in this._keys)
      {
         var _loc2_ = this._group.getKey(_loc9_);
         if(_loc2_)
         {
            _loc8_.push({id:_loc2_.id,value:_loc2_.validateValue(this._keys[_loc9_])});
         }
         else
         {
            com.newgrounds.Logger.logError("No key named \"" + _loc9_ + "\" in save group \"" + this._group.name + "\".");
         }
      }
      _loc4_.secureParameters.keys = _loc8_;
      var _loc7_ = [];
      for(var _loc10_ in this._ratings)
      {
         var _loc3_ = this._group.getRating(_loc10_);
         if(_loc3_)
         {
            _loc7_.push({id:_loc3_.id,value:_loc3_.validateValue(this._ratings[_loc10_])});
         }
         else
         {
            com.newgrounds.Logger.logError("No rating named \"" + _loc10_ + "\" in save group \"" + this._group.name + "\".");
         }
      }
      _loc4_.secureParameters.ratings = _loc7_;
      if(typeof this._encodedData == "string")
      {
         _loc4_.addFile("file",this._encodedData,"file");
      }
      else
      {
         _loc4_.addFile("file",com.newgrounds.encoders.json.JSON.encode(this._encodedData),"file");
      }
      if(this.iconLoaded)
      {
         _loc4_.addFile("thumbnail",this._encodedIcon,"thumbnail");
      }
      _loc4_.addEventListener(com.newgrounds.APIEvent.COMMAND_COMPLETE,{target:this,func:this.onSaveComplete});
      this._group.connection.sendCommand(_loc4_);
   }
   function encodeData(encode)
   {
      this._encoderQueue = [];
      this._encoding = encode;
      if(encode)
      {
         this._encodedData = this._data;
         this.preEncodeObject(this,"_encodedData");
      }
      else
      {
         this.preEncodeObject(this,"_data");
      }
      this.encodeObject();
   }
   function preEncodeObject(parent, property)
   {
      var _loc3_ = parent[property];
      var _loc5_ = undefined;
      try
      {
         if(this._encoding)
         {
            _loc5_ = _loc3_ instanceof flash.display.BitmapData;
         }
         else
         {
            _loc5_ = _loc3_.type == "__bitmap";
         }
      }
      catch(error)
      {
      }
      var _loc2_ = _loc3_;
      var _loc8_ = undefined;
      if(_loc5_)
      {
         this._encoderQueue.push({parent:parent,property:property});
      }
      else if(typeof _loc3_ == "object" && !_loc8_)
      {
         if(this._encoding)
         {
            if(_loc3_ instanceof Array)
            {
               _loc2_ = [];
            }
            else
            {
               _loc2_ = {};
            }
            for(var _loc4_ in _loc3_)
            {
               _loc2_[_loc4_] = _loc3_[_loc4_];
            }
            parent[property] = _loc2_;
         }
         for(_loc4_ in _loc2_)
         {
            this.preEncodeObject(_loc2_,_loc4_);
         }
      }
   }
   function encodeObject()
   {
      if(!this._encoderQueue.length)
      {
         if(this._encoding)
         {
            this.doSave();
         }
         else
         {
            this._dataLoaded = true;
            this.checkLoadComplete();
         }
         return undefined;
      }
      var _loc6_ = this._encoderQueue.pop();
      var _loc4_ = _loc6_.parent;
      var _loc3_ = _loc6_.property;
      var _loc2_ = _loc4_[_loc3_];
      var _loc5_ = undefined;
      if(this._encoding)
      {
         _loc5_ = {type:"__bitmap",width:_loc2_.width,height:_loc2_.height,transparent:_loc2_.transparent};
         _loc4_[_loc3_] = _loc5_;
         this._encodingParent = _loc5_;
         this._encodingProperty = "data";
         com.newgrounds.SaveFile.DATA_IMAGE_SCANNER.encodeAlpha = _loc2_.transparent;
         com.newgrounds.SaveFile.DATA_IMAGE_SCANNER.encode(flash.display.BitmapData(_loc2_),this.encodeBitmapComplete,this);
      }
      else
      {
         this._encodingParent = _loc4_;
         this._encodingProperty = _loc3_;
         com.newgrounds.SaveFile.DATA_IMAGE_SCANNER.encodeAlpha = _loc2_.transparent;
         com.newgrounds.SaveFile.DATA_IMAGE_SCANNER.decode(String(_loc2_.data),this.encodeBitmapComplete,this);
      }
   }
   function encodeBitmapComplete(data)
   {
      this._encodingParent[this._encodingProperty] = data;
      this.encodeObject();
   }
   function load()
   {
      com.newgrounds.SaveFile._currentFile = this;
      this._dataLoaded = false;
      this._data = null;
      if(!this.iconLoaded)
      {
         this._iconLoader.addEventListener(com.newgrounds.APIEvent.ICON_LOADED,{target:this,func:this.onIconLoaded});
         this._iconLoader.load();
      }
      this._dataLoader = new LoadVars();
      var file = this;
      this._dataLoader.onData = function(data)
      {
         file.onDataLoaded(data);
      };
      this._dataLoader.load(this._dataURL);
   }
   function onIconLoaded(event)
   {
      if(!event.success && this._iconLoader.url)
      {
         com.newgrounds.Logger.logWarning("Unable to load the icon for this save file.");
      }
      this._iconLoader.removeEventListener(com.newgrounds.APIEvent.ICON_LOADED,this.onIconLoaded);
      this.checkLoadComplete();
   }
   function checkLoadComplete()
   {
      if(this._dataLoaded && this.iconLoaded)
      {
         com.newgrounds.Logger.logMessage("Data loaded.");
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.FILE_LOADED,this));
      }
   }
   function onDataLoaded(data)
   {
      try
      {
         if(data)
         {
            if(data.charAt(0) == "{")
            {
               this._data = com.newgrounds.encoders.json.JSON.decode(String(data));
            }
            else
            {
               this._data = String(data);
            }
            this.encodeData(false);
         }
      }
      catch(error:Error)
      {
         com.newgrounds.Logger.logError("Error while loading data:",error);
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.FILE_LOADED,this,com.newgrounds.APIEvent.ERROR_BAD_FILE));
      }
   }
   function onDataError(error)
   {
      com.newgrounds.Logger.logError("Unable to load data:",error);
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.FILE_LOADED,this,com.newgrounds.APIEvent.ERROR_BAD_FILE));
   }
   function onSaveComplete(event)
   {
      if(event.success)
      {
         com.newgrounds.Logger.logMessage("File \"" + this._name + "\" saved!");
         if(event.data)
         {
            this._id = event.data.save_id;
            this._dataURL = unescape(event.data.file_url);
         }
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.FILE_SAVED,this));
      }
      else
      {
         com.newgrounds.Logger.logError("Error saving file \"" + this._name + "\":",event.error);
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.FILE_SAVED,this,event.error));
      }
   }
   function sendVote(ratingName, vote)
   {
      var _loc2_ = this._group.getRating(ratingName);
      if(!_loc2_)
      {
         com.newgrounds.Logger.logError("No save rating named \"" + ratingName + "\" exists for this save group.");
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.VOTE_COMPLETE,{},com.newgrounds.APIEvent.ERROR_INVALID_ARGUMENT));
         return undefined;
      }
      vote = _loc2_.validateValue(vote);
      if(isNaN(vote))
      {
         com.newgrounds.Logger.logError("Invalid vote (" + vote + "). " + ratingName + " allows a range of " + _loc2_.minimum + "-" + _loc2_.maximum + ".");
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.VOTE_COMPLETE,{},com.newgrounds.APIEvent.ERROR_INVALID_ARGUMENT));
         return undefined;
      }
      com.newgrounds.Logger.logMessage("Voting " + vote + " for " + ratingName + " on " + this._name + "...");
      this._group.connection.sendSimpleCommand("rateSaveFile",{target:this,func:this.onVoteComplete},null,{group:this._group.id,save_id:this._id,rating_id:_loc2_.id,vote:vote});
   }
   function onVoteComplete(event)
   {
      var _loc2_ = event.error;
      if(event.data.already_voted)
      {
         com.newgrounds.Logger.logError("Vote failed. You\'ve already voted on this rating today.");
         _loc2_ = com.newgrounds.APIEvent.ERROR_ALREADY_VOTED;
      }
      if(_loc2_ == com.newgrounds.APIEvent.ERROR_NONE)
      {
         var _loc3_ = this._group.getRatingById(event.data.rating_id);
         if(_loc3_)
         {
            this._ratings[_loc3_.name] = _loc3_.validateValue(event.data.score);
         }
         com.newgrounds.Logger.logMessage("Vote complete!");
      }
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.VOTE_COMPLETE,this,_loc2_));
   }
   function clone()
   {
      var _loc3_ = new com.newgrounds.SaveFile(this._group);
      _loc3_._data = this._data;
      _loc3_._description = this._description;
      _loc3_._draft = this._draft;
      _loc3_._fileSize = this._fileSize;
      _loc3_._iconLoader.bitmapData = this._iconLoader.bitmapData;
      var _loc2_ = undefined;
      for(_loc2_ in this._keys)
      {
         _loc3_._keys[_loc2_] = this._keys[_loc2_];
      }
      for(_loc2_ in this._ratings)
      {
         _loc3_._ratings[_loc2_] = this._ratings[_loc2_];
      }
      _loc3_._name = this._name;
      return _loc3_;
   }
}
