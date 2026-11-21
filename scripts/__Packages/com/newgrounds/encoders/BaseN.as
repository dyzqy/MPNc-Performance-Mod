class com.newgrounds.encoders.BaseN
{
   var _hash;
   var _base;
   var _reverseHash;
   static var DEFAULT_HASH = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~@#$%^&*()+|;/";
   function BaseN(hash)
   {
      if(hash)
      {
         this._hash = hash;
      }
      else
      {
         this._hash = com.newgrounds.encoders.BaseN.DEFAULT_HASH;
      }
      this._base = this._hash.length;
      this._reverseHash = new Object();
      var _loc2_ = 0;
      while(_loc2_ < this._hash.length)
      {
         this._reverseHash[this._hash.charAt(_loc2_)] = _loc2_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function encodeUint(number, minimumChars)
   {
      if(minimumChars == undefined)
      {
         minimumChars = 1;
      }
      var _loc2_ = "";
      var _loc3_ = number;
      while(_loc3_ != 0)
      {
         _loc2_ = this._hash.charAt(_loc3_ % this._base) + _loc2_;
         _loc3_ /= this._base;
         _loc3_ = int(_loc3_);
      }
      while(_loc2_.length < minimumChars)
      {
         _loc2_ = this._hash.charAt(0) + _loc2_;
      }
      return _loc2_;
   }
   function decodeUint(encodedNumber)
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < encodedNumber.length)
      {
         _loc3_ *= this._base;
         _loc3_ += this._reverseHash[encodedNumber.charAt(_loc2_)];
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
}
