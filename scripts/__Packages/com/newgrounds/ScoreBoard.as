class com.newgrounds.ScoreBoard extends com.newgrounds.APIEventDispatcher
{
   var _connection;
   var _name;
   var _id;
   var _scores;
   var _tag;
   static var TODAY = "Today";
   static var THIS_WEEK = "This Week";
   static var THIS_MONTH = "This Month";
   static var THIS_YEAR = "This Year";
   static var ALL_TIME = "All-Time";
   var _period = com.newgrounds.ScoreBoard.ALL_TIME;
   var _firstResult = 1;
   var _numResults = 10;
   function ScoreBoard(connection, name, id)
   {
      super();
      this._connection = connection;
      this._name = name;
      this._id = id;
   }
   function get name()
   {
      return this._name;
   }
   function get scores()
   {
      return this._scores;
   }
   function get period()
   {
      return this._period;
   }
   function set period(val)
   {
      this._period = val;
   }
   function get firstResult()
   {
      return this._firstResult;
   }
   function set firstResult(val)
   {
      this._firstResult = Math.max(1,val);
   }
   function get numResults()
   {
      return this._numResults;
   }
   function set numResults(val)
   {
      this._numResults = val;
   }
   function get tag()
   {
      return this._tag;
   }
   function set tag(val)
   {
      this._tag = val;
   }
   function get page()
   {
      return Math.ceil((this._firstResult - 1) / this._numResults) + 1;
   }
   function prevPage()
   {
      if(this.firstResult > this._numResults)
      {
         this.firstResult -= this._numResults;
      }
   }
   function nextPage()
   {
      this.firstResult += this._numResults;
   }
   function loadScores()
   {
      this._connection.sendSimpleCommand("loadScores",{target:this,func:this.onScoresLoaded},{publisher_id:this._connection.publisherId,board:this._id,page:(this._firstResult - 1) / this._numResults + 1,num_results:this._numResults,period:this._period,tag:this._tag});
   }
   function postScore(numericScore, tag)
   {
      if(tag == undefined)
      {
         tag = null;
      }
      if(isNaN(numericScore))
      {
         com.newgrounds.Logger.logError("Cannot post invalid score: " + numericScore);
         this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.SCORE_POSTED,null,com.newgrounds.APIEvent.ERROR_INVALID_ARGUMENT));
         return undefined;
      }
      com.newgrounds.Logger.logMessage("Posting a score of " + numericScore + " by " + this._connection.username + " to scoreboard \"" + this._name + "\"...");
      this._connection.sendSimpleCommand("postScore",{target:this,func:this.onScorePosted},null,{user_name:this._connection.username,board:this._id,value:numericScore,tag:tag});
   }
   function onScoresLoaded(event)
   {
      var _loc4_ = event.data;
      this._scores = [];
      var _loc5_ = undefined;
      if(_loc4_.first_result)
      {
         _loc5_ = _loc4_.first_result;
      }
      else
      {
         _loc5_ = this._firstResult;
      }
      if(_loc4_.scores)
      {
         var _loc3_ = 0;
         while(_loc3_ < _loc4_.scores.length)
         {
            var _loc2_ = _loc4_.scores[_loc3_];
            if(_loc2_)
            {
               this._scores[_loc3_] = new com.newgrounds.Score(_loc5_,_loc2_.username,_loc2_.value,_loc2_.numeric_value,_loc2_.tag);
            }
            _loc3_++;
            _loc5_++;
         }
      }
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.SCORES_LOADED,this));
   }
   function onScorePosted(event)
   {
      if(event.success)
      {
         com.newgrounds.Logger.logMessage("Score posted!");
         var _loc4_ = event.data;
         var _loc2_ = {};
         _loc2_.score = _loc4_.value;
         _loc2_.scoreBoard = this;
      }
      else
      {
         com.newgrounds.Logger.logError("Error posting score: " + event.error);
      }
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.SCORE_POSTED,_loc2_,event.error));
   }
   function toString()
   {
      return "Scoreboard: " + this._name;
   }
}
