class com.newgrounds.Medal extends com.newgrounds.APIEventDispatcher
{
   var _connection;
   var _id;
   var _name;
   var _description;
   var _secret;
   var _unlocked;
   var _value;
   var _difficulty;
   var _iconLoader;
   static var ICON_WIDTH = 50;
   static var ICON_HEIGHT = 50;
   static var DEFAULT_ICON = flash.display.BitmapData.loadBitmap("DefaultMedalIcon");
   static var DIFFICULTY_EASY = "Easy";
   static var DIFFICULTY_MODERATE = "Moderate";
   static var DIFFICULTY_CHALLENGING = "Challenging";
   static var DIFFICULTY_DIFFICULT = "Difficult";
   static var DIFFICULTY_BRUTAL = "Brutal";
   static var DIFFICULTIES = ["Unknown",com.newgrounds.Medal.DIFFICULTY_EASY,com.newgrounds.Medal.DIFFICULTY_MODERATE,com.newgrounds.Medal.DIFFICULTY_CHALLENGING,com.newgrounds.Medal.DIFFICULTY_DIFFICULT,com.newgrounds.Medal.DIFFICULTY_BRUTAL];
   function Medal(connection, id, name, description, secret, unlocked, value, difficultyId, iconURL)
   {
      super();
      this._connection = connection;
      this._id = id;
      this._name = name;
      this._description = description;
      this._secret = secret;
      this._unlocked = unlocked;
      this._value = value;
      this._difficulty = com.newgrounds.Medal.DIFFICULTIES[difficultyId];
      this._iconLoader = new com.newgrounds.BitmapLoader(com.newgrounds.Medal.DEFAULT_ICON,iconURL);
      this._iconLoader.load();
   }
   function get difficulty()
   {
      return this._difficulty;
   }
   function get icon()
   {
      return this._iconLoader.bitmapData;
   }
   function get id()
   {
      return this._id;
   }
   function get name()
   {
      return this._name;
   }
   function get description()
   {
      return this._description;
   }
   function get secret()
   {
      return this._secret;
   }
   function get unlocked()
   {
      return this._unlocked;
   }
   function get value()
   {
      return this._value;
   }
   function toString()
   {
      return "Medal: " + this._name + "\t\t(" + (!this._unlocked ? "locked, " : "unlocked, ") + this._value + "pts, " + this._difficulty + ")";
   }
   function attachIcon(parent)
   {
      return this._iconLoader.attachBitmap(parent);
   }
   function unlock()
   {
      if(this._unlocked)
      {
         com.newgrounds.Logger.logWarning("Medal \"" + this._name + "\" is already unlocked.");
         return undefined;
      }
      com.newgrounds.Logger.logMessage("Unlocking medal \"" + this.name + "\"...");
      this._unlocked = true;
      if(this._connection.hasUserSession)
      {
         this._connection.sendSimpleCommand("unlockMedal",{target:this,func:this.onUnlockConfirmed},null,{medal_id:this.id});
      }
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.MEDAL_UNLOCKED,this));
   }
   function setUnlocked(unlocked)
   {
      this._unlocked = unlocked;
   }
   function onUnlockConfirmed(event)
   {
      if(event.success)
      {
         com.newgrounds.Logger.logMessage("Medal \"" + this.name + "\" unlocked.");
      }
      else
      {
         com.newgrounds.Logger.logError("Failed to unlock \"" + this.name + "\"!");
      }
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.MEDAL_UNLOCK_CONFIRMED,this,event.error));
   }
}
