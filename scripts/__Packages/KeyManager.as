class KeyManager extends MovieClip
{
   var i;
   var onEnterFrame;
   var onKeyUp;
   var onKeyDown;
   static var keys;
   static var keyCounts;
   static var keysToDetect;
   function KeyManager()
   {
      super();
      KeyManager.keys = new Array();
      KeyManager.keyCounts = new Array();
      KeyManager.keysToDetect = new Array();
      this.i = 0;
      while(this.i < 100)
      {
         KeyManager.keys.push(0);
         this.i = this.i + 1;
      }
      this.onEnterFrame = this.detectKeys;
      this.onKeyUp = this.detectKeyUp;
      this.onKeyDown = this.detectKeyDown;
      Key.addListener(this);
      this._visible = false;
   }
   static function addKey(keyName, keyNum)
   {
      if(KeyManager.keysToDetect[keyName] == null)
      {
         KeyManager.keysToDetect[keyName] = keyNum;
         KeyManager.keyCounts[keyName] = 0;
      }
      else
      {
         trace("this key has already been defined");
      }
   }
   function detectKeys()
   {
      for(var _loc1_ in KeyManager.keysToDetect)
      {
         if(KeyManager.keys[KeyManager.keysToDetect[_loc1_]])
         {
            if(KeyManager.keyCounts[_loc1_] != -1)
            {
               KeyManager.keyCounts[_loc1_] = KeyManager.keyCounts[_loc1_] + 1;
            }
         }
         else
         {
            KeyManager.keyCounts[_loc1_] = 0;
         }
      }
   }
   function detectKeyDown()
   {
      KeyManager.keys[Key.getCode()] = true;
   }
   function detectKeyUp()
   {
      KeyManager.keys[Key.getCode()] = false;
   }
   static function lockKeys()
   {
      for(var _loc1_ in KeyManager.keysToDetect)
      {
         KeyManager.keyCounts[_loc1_] = -1;
      }
   }
   static function lockKey(inKey)
   {
      KeyManager.keyCounts[inKey] = -1;
   }
}
