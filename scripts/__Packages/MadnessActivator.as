class MadnessActivator extends MovieClip
{
   var onEnterFrame;
   var myDataRef;
   var myType;
   var myAnimation;
   var mySprite;
   var noPlayerUse;
   static var allActivators;
   static var aiActivators;
   static var bombActive;
   var activated = false;
   var fakeDepth = 100;
   function MadnessActivator()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init(inPlaceholder, inDataRef)
   {
      this.myDataRef = inDataRef;
      this.myDataRef.mySprite = this;
      this.myType = inDataRef.myType;
      this.gotoAndStop(this.myType);
      this.myAnimation = this.myDataRef.myAnimation;
      this.mySprite.gotoAndStop(1);
      this.activated = false;
      if(this.myDataRef.myEvents.length == 0)
      {
         this.mySprite.gotoAndStop(2);
         this.activated = true;
      }
      this._x = inPlaceholder._x;
      this._y = inPlaceholder._y;
      inPlaceholder._visible = false;
      if(this.myDataRef.myItemsSpent == undefined)
      {
         this.myDataRef.myItemsSpent = new Array();
      }
      this.setDoors();
      if(this.myDataRef.asploded)
      {
         this.mySprite.myBomb.gotoAndStop(this.mySprite.myBomb._totalframes);
      }
      this.noPlayerUse = this.myType.substr(-2,2) == "AI";
      if(this.returnActive())
      {
         if(this.noPlayerUse)
         {
            MadnessActivator.aiActivators.push(this);
         }
         else
         {
            MadnessActivator.allActivators.push(this);
         }
      }
      this.fakeDepth = MadnessCharacter.setPerspectiveScale(this._x,this._y,MadWorld.thisWorld.determineRoom(this._x,this._y)) - 50;
      MadnessCharacter.setMyDepth(this,this.fakeDepth);
   }
   function tick()
   {
      if(this.returnActive())
      {
         this.activated = false;
         this.mySprite.gotoAndStop(1);
      }
      else
      {
         this.activated = true;
         this.mySprite.gotoAndStop(2);
      }
      MadnessCharacter.setMyDepth(this,this.fakeDepth);
   }
   function activateMe()
   {
      while(this.myDataRef.myEvents.length > 0)
      {
         if(this.myDataRef.myEvents[0].myType == "lock")
         {
            this.myDataRef.myEvents[0].myTarget.amLocked = true;
            this.myDataRef.myEvents[0].myTarget.mySprite.amLocked = true;
            this.myDataRef.myEvents[0].myTarget.myConnection.amLocked = true;
            this.myDataRef.myEvents[0].myTarget.myConnection.mySprite.amLocked = true;
         }
         else if(this.myDataRef.myEvents[0].myType == "unlock")
         {
            this.myDataRef.myEvents[0].myTarget.amLocked = false;
            this.myDataRef.myEvents[0].myTarget.mySprite.amLocked = false;
            this.myDataRef.myEvents[0].myTarget.myConnection.amLocked = false;
            this.myDataRef.myEvents[0].myTarget.myConnection.mySprite.amLocked = false;
         }
         else if(this.myDataRef.myEvents[0].myType == "function")
         {
            this.myDataRef.myEvents[0].myAction();
         }
         this.myDataRef.myEvents.splice(0,1);
      }
      if(this.myDataRef.myItems.length > 0)
      {
         var _loc2_ = new Object();
         var _loc3_ = this.mySprite["item" + this.myDataRef.myItemsSpent.length];
         _loc2_.x = _loc3_._x;
         _loc2_.y = _loc3_._y;
         this.mySprite.localToGlobal(_loc2_);
         this._parent.globalToLocal(_loc2_);
         this.dropItem(this.myDataRef.myItems[0],_loc2_.x);
         _loc3_.gotoAndPlay("opening");
         this.mySprite["item" + this.myDataRef.myItemsSpent.length].myIndicator._visible = false;
         this.myDataRef.myItems.splice(0,1);
         var _loc4_ = new Object();
         this.myDataRef.myItemsSpent.push(_loc4_);
         if(this.myDataRef.myItems.length > 0)
         {
            this.mySprite["item" + this.myDataRef.myItemsSpent.length].myIndicator._visible = true;
         }
      }
      if(this.myDataRef.myObjective == "use")
      {
         MadnessLevel.completeObjectiveCheck(this.myDataRef,"use");
      }
      if(this.myType.substr(0,4) == "bomb")
      {
         MadnessActivator.bombActive = true;
         this.myDataRef.asploded = false;
      }
      if(this.myType.substr(0,8) == "terminal")
      {
         this.playSound("activator2");
      }
      if(this.myType.substr(0,5) == "panel")
      {
         this.playSound("activator1");
      }
      if(this.myType.substr(0,6) == "locker")
      {
         this.playSound("clang");
      }
      if(this.myType == "wallsafe")
      {
         this.playSound("clang");
      }
      if(!this.returnActive())
      {
         this.unregisterMe();
      }
   }
   function setDoors()
   {
      var _loc4_ = new Number();
      var _loc3_ = new Number();
      if(this.myType.substr(0,6) == "locker")
      {
         _loc4_ = 3;
      }
      if(this.myType == "wallsafe")
      {
         _loc4_ = 1;
      }
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if(this.myDataRef.myItemsSpent[_loc2_] != undefined)
         {
            this.mySprite["item" + _loc2_].gotoAndStop("open");
            this.mySprite["item" + _loc2_].myIndicator._visible = false;
         }
         else if(this.myDataRef.myItems[_loc3_] == undefined)
         {
            this.mySprite["item" + _loc2_].gotoAndStop("open");
            this.mySprite["item" + _loc2_].myIndicator._visible = false;
         }
         else
         {
            this.mySprite["item" + _loc2_].gotoAndStop("closed");
            if(_loc3_ == 0)
            {
               this.mySprite["item" + _loc2_].myIndicator._visible = true;
            }
            else
            {
               this.mySprite["item" + _loc2_].myIndicator._visible = false;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function dropItem(inItem, inX)
   {
      MadWorld.thisWorld.gunItemDrop(inX,this._y,MadnessCharacter.setPerspectiveScale(inX,this._y,MadWorld.thisWorld.determineRoom(this._x,this._y)),inItem);
   }
   function playSound(inSound)
   {
      SwainAudioPlayer.playSound(inSound,MadWorld.returnAudioPosition(this._x));
   }
   function asplodeMe()
   {
      this.myDataRef.asploded = true;
      this.playSound("explode");
      MadnessActivator.bombActive = false;
      MadWorld.thisWorld.shakeyCam(15);
      var _loc2_ = undefined;
      var _loc4_ = 0;
      while(_loc4_ < MadnessCharacter.allRosters.length)
      {
         var _loc3_ = 0;
         while(_loc3_ < MadnessCharacter.allRosters[_loc4_].myActiveMembers.length)
         {
            _loc2_ = MadnessCharacter.allRosters[_loc4_].myActiveMembers[_loc3_].mySprite;
            if(!_loc2_.deadMan)
            {
               if(SwainMath.get_distance(this,_loc2_) < 110)
               {
                  if(_loc2_.myHealth > 0)
                  {
                     _loc2_.applyKnockback(this,10,false);
                  }
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function bombSetup()
   {
      if(MadnessActivator.bombActive)
      {
         SwainAudioPlayer.playSound("swapgun",0);
      }
   }
   function bombBeep()
   {
      if(MadnessActivator.bombActive)
      {
         SwainAudioPlayer.playSound("bombbeep",0);
      }
   }
   function returnActive()
   {
      return this.myDataRef.myEvents.length > 0 || this.myDataRef.myItems.length > 0 || this.myDataRef.myObjective != undefined;
   }
   function unregisterMe()
   {
      var _loc2_ = 0;
      while(_loc2_ < MadnessActivator.allActivators.length)
      {
         if(this == MadnessActivator.allActivators[_loc2_])
         {
            MadnessActivator.allActivators.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < MadnessActivator.aiActivators.length)
      {
         if(this == MadnessActivator.aiActivators[_loc2_])
         {
            MadnessActivator.aiActivators.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
