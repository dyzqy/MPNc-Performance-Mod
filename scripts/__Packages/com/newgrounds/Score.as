class com.newgrounds.Score
{
   var _rank;
   var _username;
   var _score;
   var _numericValue;
   var _tag;
   function Score(rank, username, score, numericValue, tag)
   {
      this._rank = rank;
      this._username = username;
      this._score = score;
      this._numericValue = numericValue;
      this._tag = tag;
   }
   function get numericValue()
   {
      return this._numericValue;
   }
   function get rank()
   {
      return this._rank;
   }
   function get score()
   {
      return this._score;
   }
   function get tag()
   {
      return this._tag;
   }
   function get username()
   {
      return this._username;
   }
   function toString()
   {
      return this._rank + ".\t" + this._username + "\t" + this._score;
   }
}
