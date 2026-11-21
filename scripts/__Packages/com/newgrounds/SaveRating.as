class com.newgrounds.SaveRating
{
   var _name;
   var _id;
   var _isFloat;
   var _minimum;
   var _maximum;
   function SaveRating(name, id, isFloat, minimum, maximum)
   {
      this._name = name;
      this._id = id;
      this._isFloat = isFloat;
      this._minimum = minimum;
      this._maximum = maximum;
   }
   function get name()
   {
      return this._name;
   }
   function get id()
   {
      return this._id;
   }
   function get isFloat()
   {
      return this._isFloat;
   }
   function get minimum()
   {
      return this._minimum;
   }
   function get maximum()
   {
      return this._maximum;
   }
   function validateValue(value)
   {
      var _loc2_ = Number(value);
      if(isNaN(_loc2_))
      {
         com.newgrounds.Logger.logError("Invalid value for rating \"" + this._name + "\".");
         return NaN;
      }
      if(_loc2_ < this._minimum)
      {
         com.newgrounds.Logger.logWarning(_loc2_ + " is out of acceptable range for rating \"" + this._name + "\". Clamping to " + this._minimum + ".");
         return this._minimum;
      }
      if(_loc2_ > this._maximum)
      {
         com.newgrounds.Logger.logWarning(_loc2_ + " is out of acceptable range for rating \"" + this._name + "\". Clamping to " + this._maximum + ".");
         return this._maximum;
      }
      if(!this.isFloat)
      {
         var _loc3_ = int(_loc2_);
         if(_loc3_ != _loc2_)
         {
            com.newgrounds.Logger.logWarning("Float value " + _loc2_ + " given for integer rating \"" + this._name + "\". Clamping to " + _loc3_ + ".");
         }
         return _loc3_;
      }
      return _loc2_;
   }
   function toString()
   {
      return this._name;
   }
}
