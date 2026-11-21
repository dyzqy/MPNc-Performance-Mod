class com.newgrounds.SaveQuery extends com.newgrounds.APIEventDispatcher
{
   var _group;
   var _connection;
   var _files;
   var _lookupKeys;
   var _lookupRatings;
   var _fileConditions;
   var _keyConditions;
   var _ratingConditions;
   var _sortFields;
   static var FILE_ID = "fileId";
   static var AUTHOR_ID = "authorId";
   static var AUTHOR_NAME = "authorName";
   static var FILE_NAME = "fileName";
   static var CREATED_ON = "createdOn";
   static var UPDATED_ON = "updatedOn";
   static var FILE_VIEWS = "fileViews";
   static var FILE_STATUS = "fileStatus";
   static var FILE_FIELDS = [com.newgrounds.SaveQuery.FILE_ID,com.newgrounds.SaveQuery.AUTHOR_ID,com.newgrounds.SaveQuery.AUTHOR_NAME,com.newgrounds.SaveQuery.FILE_NAME,com.newgrounds.SaveQuery.CREATED_ON,com.newgrounds.SaveQuery.UPDATED_ON,com.newgrounds.SaveQuery.FILE_VIEWS,com.newgrounds.SaveQuery.FILE_STATUS];
   static var OPERATOR_EQUAL = "=";
   static var OPERATOR_LESS_THAN = "<";
   static var OPERATOR_GREATER_THAN = ">";
   static var OPERATOR_NOT_EQUAL = "!=";
   static var OPERATOR_LESS_OR_EQUAL = "<=";
   static var OPERATOR_GREATER_OR_EQUAL = ">=";
   static var OPERATOR_CONTAINS = "*";
   static var OPERATOR_NOT_CONTAINS = "!*";
   static var OPERATOR_NOT_BEGINS_WITH = "!*=";
   static var OPERATOR_NOT_ENDS_WITH = "!=*";
   static var OPERATOR_BEGINS_WITH = "*=";
   static var OPERATOR_ENDS_WITH = "=*";
   static var TABLE_FILES = 1;
   static var TABLE_KEYS = 2;
   static var TABLE_RATINGS = 3;
   var _page = 1;
   var _resultsPerPage = 10;
   var _isRandomized = false;
   function SaveQuery(group)
   {
      super();
      this._group = group;
      this._connection = group.connection;
      this.reset();
   }
   function get group()
   {
      return this._group;
   }
   function get resultsPerPage()
   {
      return this._resultsPerPage;
   }
   function set resultsPerPage(val)
   {
      this._resultsPerPage = Math.min(Math.max(val,1),100);
   }
   function get page()
   {
      return this._page;
   }
   function set page(val)
   {
      this._page = Math.max(val,1);
   }
   function prevPage()
   {
      this.page = this.page - 1;
   }
   function nextPage()
   {
      this.page = this.page + 1;
   }
   function get isRandomized()
   {
      return this._isRandomized;
   }
   function set isRandomized(val)
   {
      this._isRandomized = val;
   }
   function get files()
   {
      return this._files;
   }
   function reset()
   {
      this._page = 1;
      this._resultsPerPage = 10;
      this._isRandomized = false;
      this._lookupKeys = [];
      this._lookupRatings = [];
      this._fileConditions = [];
      this._keyConditions = [];
      this._ratingConditions = [];
      this._sortFields = [];
      this._files = [];
      this.includeAllFields();
   }
   function clone()
   {
      var _loc2_ = new com.newgrounds.SaveQuery(this._group);
      _loc2_._page = this._page;
      _loc2_._resultsPerPage = this._resultsPerPage;
      _loc2_._isRandomized = this._isRandomized;
      _loc2_._lookupKeys = this._lookupKeys.concat();
      _loc2_._lookupRatings = this._lookupRatings.concat();
      _loc2_._fileConditions = this._fileConditions.concat();
      _loc2_._keyConditions = this._keyConditions.concat();
      _loc2_._ratingConditions = this._ratingConditions.concat();
      return _loc2_;
   }
   function includeAllFields()
   {
      for(var _loc5_ in this._group.keys)
      {
         var _loc2_ = this._group.keys[_loc5_];
         this._lookupKeys.push(_loc2_.id);
      }
      for(var _loc4_ in this._group.ratings)
      {
         var _loc3_ = this._group.ratings[_loc4_];
         this._lookupRatings.push(_loc3_.id);
      }
   }
   function addCondition(field, operator, value)
   {
      var _loc2_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < com.newgrounds.SaveQuery.FILE_FIELDS.length)
      {
         if(com.newgrounds.SaveQuery.FILE_FIELDS[_loc2_] == field)
         {
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc2_ == com.newgrounds.SaveQuery.FILE_FIELDS.length)
      {
         _loc2_ = -1;
      }
      if(_loc2_ >= 0)
      {
         this._fileConditions.push({field:_loc2_,operator:operator,value:value});
      }
      else
      {
         var _loc3_ = this._group.getKey(field);
         if(_loc3_)
         {
            value = _loc3_.validateValue(value);
            this._keyConditions.push({key_id:_loc3_.id,operator:operator,value:value});
            return undefined;
         }
         var _loc4_ = field.split(".");
         var _loc6_ = this._group.getRating(_loc4_[0]);
         if(_loc6_)
         {
            value = _loc6_.validateValue(value);
            this._ratingConditions.push({rating_id:_loc6_.id,operator:operator,value:value,column:(!_loc4_[1] ? "score" : _loc4_[1])});
            return undefined;
         }
         com.newgrounds.Logger.logError("The save group \"" + this._group.name + "\" does not have a field named \"" + field + "\".");
      }
   }
   function sortOn(field, sortDescending)
   {
      if(sortDescending == undefined)
      {
         sortDescending = false;
      }
      var _loc2_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < com.newgrounds.SaveQuery.FILE_FIELDS.length)
      {
         if(com.newgrounds.SaveQuery.FILE_FIELDS[_loc2_] == field)
         {
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc2_ == com.newgrounds.SaveQuery.FILE_FIELDS.length)
      {
         _loc2_ = -1;
      }
      if(_loc2_ >= 0)
      {
         this._sortFields.push({table:com.newgrounds.SaveQuery.TABLE_FILES,field:_loc2_,desc:sortDescending});
      }
      else
      {
         var _loc5_ = this._group.getKey(field);
         if(_loc5_)
         {
            this._sortFields.push({table:com.newgrounds.SaveQuery.TABLE_KEYS,field:_loc5_.id,desc:sortDescending});
            return undefined;
         }
         var _loc3_ = field.split(".");
         var _loc6_ = this._group.getRating(_loc3_[0]);
         if(_loc6_)
         {
            this._sortFields.push({table:com.newgrounds.SaveQuery.TABLE_RATINGS,field:_loc6_.id,desc:sortDescending,extra:(!_loc3_[1] ? "score" : _loc3_[1])});
            return undefined;
         }
         com.newgrounds.Logger.logError("The save group \"" + this._group.name + "\" does not have a field named \"" + field + "\".");
      }
   }
   function execute()
   {
      var _loc5_ = {};
      _loc5_.page = this._page;
      _loc5_.num_results = this._resultsPerPage;
      if(this._isRandomized)
      {
         _loc5_.randomize = 1;
      }
      if(this._lookupKeys && this._lookupKeys.length)
      {
         _loc5_.lookup_keys = this._lookupKeys;
      }
      if(this._lookupRatings && this._lookupRatings.length)
      {
         _loc5_.lookup_ratings = this._lookupRatings;
      }
      if(this._fileConditions && this._fileConditions.length)
      {
         _loc5_.file_conditions = this._fileConditions;
      }
      if(this._keyConditions && this._keyConditions.length)
      {
         _loc5_.key_conditions = this._keyConditions;
      }
      if(this._ratingConditions && this._ratingConditions.length)
      {
         _loc5_.rating_conditions = this._ratingConditions;
      }
      if(this._sortFields && this._sortFields.length)
      {
         _loc5_.sort_conditions = this._sortFields;
      }
      this._connection.sendSimpleCommand("lookupSaveFiles",{target:this,func:this.onQueryComplete},{publisher_id:this._connection.publisherId,group_id:this._group.id,query:_loc5_});
   }
   function onQueryComplete(event)
   {
      if(event.success)
      {
         var _loc4_ = event.data;
         this._files = [];
         if(_loc4_.files)
         {
            var _loc2_ = 0;
            while(_loc2_ < _loc4_.files.length)
            {
               var _loc3_ = com.newgrounds.SaveFile.fromObject(this._group,_loc4_.files[_loc2_]);
               if(_loc3_)
               {
                  this._files.push(_loc3_);
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.QUERY_COMPLETE,this));
      }
      else
      {
         com.newgrounds.Logger.logError("Query failed: " + event.error);
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.QUERY_COMPLETE,this,event.error));
      }
   }
}
