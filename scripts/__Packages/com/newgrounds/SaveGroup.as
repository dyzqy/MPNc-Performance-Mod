class com.newgrounds.SaveGroup
{
   var _connection;
   var _id;
   var _name;
   var _type;
   var _keysArray;
   var _ratingsArray;
   var _keys;
   var _ratings;
   static var TYPE_SYSTEM = 0;
   static var TYPE_PRIVATE = 1;
   static var TYPE_PUBLIC = 2;
   static var TYPE_MODERATED = 3;
   function SaveGroup(connection, name, id, type, keys, ratings)
   {
      this._connection = connection;
      this._id = id;
      this._name = name;
      this._type = type;
      this._keysArray = keys;
      this._ratingsArray = ratings;
      this._keys = new Object();
      this._ratings = new Object();
      var _loc11_ = undefined;
      for(var _loc7_ in keys)
      {
         var _loc2_ = keys[_loc7_];
         this._keys[_loc2_.name] = _loc2_;
      }
      for(var _loc6_ in ratings)
      {
         var _loc3_ = ratings[_loc6_];
         this._ratings[_loc3_.name] = _loc3_;
      }
   }
   function get connection()
   {
      return this._connection;
   }
   function get name()
   {
      return this._name;
   }
   function get type()
   {
      return this._type;
   }
   function get id()
   {
      return this._id;
   }
   function get keys()
   {
      return this._keysArray;
   }
   function get ratings()
   {
      return this._ratingsArray;
   }
   function getKey(name)
   {
      return this._keys[name];
   }
   function getRating(name)
   {
      return this._ratings[name];
   }
   function getKeyById(id)
   {
      for(var _loc4_ in this._keys)
      {
         var _loc2_ = this._keys[_loc4_];
         if(_loc2_.id == id)
         {
            return _loc2_;
         }
      }
      return null;
   }
   function getRatingById(id)
   {
      for(var _loc4_ in this._ratings)
      {
         var _loc2_ = this._ratings[_loc4_];
         if(_loc2_.id == id)
         {
            return _loc2_;
         }
      }
      return null;
   }
   function toString()
   {
      return "SaveGroup: " + this.name + "  Keys: " + this._keysArray + "  Ratings: " + this._ratingsArray;
   }
}
