class com.newgrounds.encoders.ImageScanner
{
   var _baseN;
   var _encodeAlpha;
   var _maxPerChannel;
   static var DEFAULT_HASH = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ<>?:;-_=+()!&";
   var _hash = com.newgrounds.encoders.ImageScanner.DEFAULT_HASH;
   var _charsPerPixel = 2;
   static var WORK_INTERVAL = 33.333333333333336;
   function ImageScanner(hashLength, charsPerPixel)
   {
      if(hashLength)
      {
         this._hash = com.newgrounds.encoders.ImageScanner.DEFAULT_HASH.substr(0,hashLength);
      }
      this._baseN = new com.newgrounds.encoders.BaseN(this._hash);
      if(charsPerPixel)
      {
         this._charsPerPixel = charsPerPixel;
      }
      this.encodeAlpha = false;
   }
   function get encodeAlpha()
   {
      return this._encodeAlpha;
   }
   function set encodeAlpha(v)
   {
      this._encodeAlpha = v;
      this._maxPerChannel = int(Math.pow(this._hash.length,this._charsPerPixel / (!this._encodeAlpha ? 3 : 4)));
      if(this._maxPerChannel > 256)
      {
         this._maxPerChannel = 256;
      }
   }
   function encode(source, callbackFunction, callbackObject)
   {
      var _loc4_ = {callbackFunction:callbackFunction,callbackObject:callbackObject,source:source,x:0,y:0,output:null};
      var _loc2_ = source.width.toString();
      var _loc3_ = source.height.toString();
      while(_loc2_.length < 3)
      {
         _loc2_ = "0" + _loc2_;
      }
      while(_loc3_.length < 3)
      {
         _loc3_ = "0" + _loc3_;
      }
      _loc4_.output = _loc2_ + _loc3_;
      var _loc6_ = setInterval(this,"doEncode",com.newgrounds.encoders.ImageScanner.WORK_INTERVAL,_loc4_);
      _loc4_.interval = _loc6_;
   }
   function decode(source, callbackFunction, callbackObject)
   {
      var _loc2_ = {callbackFunction:callbackFunction,callbackObject:callbackObject,source:source,i:6,x:0,y:0,output:null};
      var _loc5_ = int(source.substr(0,3));
      var _loc6_ = int(source.substr(3,3));
      _loc2_.output = new flash.display.BitmapData(_loc5_,_loc6_,this._encodeAlpha);
      var _loc4_ = setInterval(this,"doDecode",com.newgrounds.encoders.ImageScanner.WORK_INTERVAL,_loc2_);
      _loc2_.interval = _loc4_;
   }
   function doEncode(state)
   {
      var _loc3_ = getTimer();
      while(state.y < state.source.height && getTimer() - _loc3_ < com.newgrounds.encoders.ImageScanner.WORK_INTERVAL)
      {
         state.output += this.encodePixel(state.source.getPixel32(state.x,state.y));
         state.x = state.x + 1;
         if(state.x == state.source.width)
         {
            state.x = 0;
            state.y = state.y + 1;
         }
      }
      if(state.y == state.source.height)
      {
         clearInterval(state.interval);
         state.callbackFunction.call(state.callbackObject,state.output);
      }
   }
   function doDecode(state)
   {
      var _loc4_ = getTimer();
      while(state.y < state.output.height && getTimer() - _loc4_ < com.newgrounds.encoders.ImageScanner.WORK_INTERVAL)
      {
         var _loc3_ = this.decodePixel(state.source.substr(state.i,this._charsPerPixel));
         state.output.setPixel32(state.x,state.y,_loc3_);
         state.i += this._charsPerPixel;
         state.x = state.x + 1;
         if(state.x == state.output.width)
         {
            state.x = 0;
            state.y = state.y + 1;
         }
      }
      if(state.y == state.output.height)
      {
         clearInterval(state.interval);
         state.callbackFunction.call(state.callbackObject,state.output);
      }
   }
   function encodePixel(pixel)
   {
      var _loc3_ = pixel >> 24 & 0xFF;
      var _loc4_ = pixel >> 16 & 0xFF;
      var _loc5_ = pixel >> 8 & 0xFF;
      var _loc2_ = pixel & 0xFF;
      _loc3_ = int(_loc3_ / 256 * this._maxPerChannel);
      _loc4_ = int(_loc4_ / 256 * this._maxPerChannel);
      _loc5_ = int(_loc5_ / 256 * this._maxPerChannel);
      _loc2_ = int(_loc2_ / 256 * this._maxPerChannel);
      var _loc7_ = _loc4_ * this._maxPerChannel * this._maxPerChannel + _loc5_ * this._maxPerChannel + _loc2_;
      if(this._encodeAlpha)
      {
         _loc7_ += _loc3_ * this._maxPerChannel * this._maxPerChannel * this._maxPerChannel;
      }
      return this._baseN.encodeUint(_loc7_,this._charsPerPixel);
   }
   function decodePixel(encodedPixel)
   {
      var _loc3_ = 255;
      var _loc5_ = undefined;
      var _loc6_ = undefined;
      var _loc4_ = undefined;
      var _loc7_ = 0;
      var _loc2_ = this._baseN.decodeUint(encodedPixel);
      _loc4_ = _loc2_ % this._maxPerChannel;
      _loc2_ /= int(this._maxPerChannel);
      _loc6_ = _loc2_ % this._maxPerChannel;
      _loc2_ /= int(this._maxPerChannel);
      _loc5_ = _loc2_ % this._maxPerChannel;
      _loc2_ /= int(this._maxPerChannel);
      if(this._encodeAlpha)
      {
         _loc3_ = _loc2_ % this._maxPerChannel;
         _loc2_ /= int(this._maxPerChannel);
      }
      return _loc3_ << 24 | _loc5_ << 16 | _loc6_ << 8 | _loc4_;
   }
}
