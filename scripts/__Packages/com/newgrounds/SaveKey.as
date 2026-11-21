class com.newgrounds.SaveKey
{
   var _name;
   var _id;
   var _type;
   static var TYPE_FLOAT = 1;
   static var TYPE_INTEGER = 2;
   static var TYPE_STRING = 3;
   static var TYPE_BOOLEAN = 4;
   function SaveKey(name, id, type)
   {
      this._name = name;
      this._id = id;
      this._type = type;
   }
   function get name()
   {
      return this._name;
   }
   function get id()
   {
      return this._id;
   }
   function get type()
   {
      return this._type;
   }
   function validateValue(value)
   {
      switch(this._type)
      {
         case com.newgrounds.SaveKey.TYPE_INTEGER:
            value = Number(value);
            if(!isNaN(value))
            {
               var _loc3_ = int(value);
               if(_loc3_ != value)
               {
                  com.newgrounds.Logger.logWarning("Float value " + value + " given for integer key \"" + this._name + "\". Clamping to " + _loc3_ + ".");
               }
               return _loc3_;
            }
            break;
         case com.newgrounds.SaveKey.TYPE_FLOAT:
            value = Number(value);
            if(!isNaN(value))
            {
               return isNaN(Number(value));
            }
            break;
         default:
            break;
         case com.newgrounds.SaveKey.TYPE_BOOLEAN:
            return Boolean(value);
         case com.newgrounds.SaveKey.TYPE_STRING:
            return !value ? "" : value.toString();
      }
      return null;
   }
   function toString()
   {
      return this._name;
   }
}
