class MadnessDoors extends MovieClip
{
   var stayOpen;
   var myEnterers;
   var myExiters;
   var mySprites;
   var myStarts;
   var onEnterFrame;
   var myDataRef;
   var myDir;
   var myType;
   var amLocked;
   var noClose;
   var noSpawn;
   var myLock;
   var myStatus;
   var myDoor;
   var myDoorBACK;
   var noBullet;
   var mySpawnTimer;
   var spriteHolder;
   var myExit;
   static var allDoors;
   var currentStart = 0;
   var currentStartIncrement = 1;
   function MadnessDoors()
   {
      super();
      this.stayOpen = new Array();
      this.myEnterers = new Array();
      this.myExiters = new Array();
      this.mySprites = new Array();
      this.myStarts = new Array();
      this.onEnterFrame = this.tick;
   }
   function init(inPlaceholder, inDataRef)
   {
      this.myDataRef = inDataRef;
      this.myDataRef.mySprite = this;
      this.myDir = this.myDataRef.myDir;
      this.myType = this.myDataRef.myType;
      this.amLocked = this.myDataRef.amLocked;
      this.noClose = this.myDataRef.noClose;
      this.noSpawn = this.myDataRef.noSpawn;
      this.gotoAndStop(this.myType + "_" + this.myDir);
      this._x = inPlaceholder._x;
      this._y = inPlaceholder._y;
      inPlaceholder._visible = false;
      var _loc3_ = 0;
      while(this["start" + String(_loc3_)] != undefined)
      {
         this.myStarts.push(this["start" + String(_loc3_)]);
         this["start" + String(_loc3_)]._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      if(this.myDataRef.myConnection == undefined)
      {
         this.myLock._visible = false;
      }
      else if(this.amLocked || this._parent.roomLock || this.myDataRef.myConnection == undefined)
      {
         this.myLock.gotoAndStop(1);
      }
      else
      {
         this.myLock.gotoAndStop(2);
      }
      this.myLock.lockLight.gotoAndStop(this.myLock.lockLight._totalframes);
      this.myStatus = "closed";
      this.myDoor.stop();
      this.myDoorBACK.stop();
      this.noBullet._visible = false;
      var _loc2_ = 0;
      while(_loc2_ < this.myDataRef.myCharacters.length)
      {
         this.addCharacter(this.myDataRef.myCharacters[_loc2_],"enter");
         _loc2_ = _loc2_ + 1;
      }
      if(MadnessGameSelect.gameMode == "arena")
      {
         if(this.myDataRef.myConnection == MadnessRoster.storeRoster)
         {
            this.myDoor.myArt.amArena.gotoAndStop("gun");
            this.myDoorBACK.myArt.amArena.gotoAndStop("gun");
            this.myDoor.myArt2.amArena.gotoAndStop("gun");
            this.myDoorBACK.myArt2.amArena.gotoAndStop("gun");
         }
         else
         {
            this.myDoor.myArt.amArena.gotoAndStop("skull");
            this.myDoorBACK.myArt.amArena.gotoAndStop("skull");
            this.myDoor.myArt2.amArena.gotoAndStop("skull");
            this.myDoorBACK.myArt2.amArena.gotoAndStop("skull");
         }
      }
      else if(this.myDataRef.myConnection == undefined && this.myDataRef.myObjective == undefined)
      {
         this.myDoor.myArt.amArena.gotoAndStop("employees");
         this.myDoorBACK.myArt.amArena.gotoAndStop("employees");
         this.myDoor.myArt2.amArena.gotoAndStop("employees");
         this.myDoorBACK.myArt2.amArena.gotoAndStop("employees");
         if(this.myType == "door_left")
         {
            this.myDoor.myArt.amArena.mySign._xscale = -100;
         }
         if(this.myType == "door_left")
         {
            this.myDoor.myArt2.amArena.mySign._xscale = -100;
         }
      }
      else
      {
         this.myDoor.myArt.amArena.gotoAndStop("none");
         this.myDoorBACK.myArt.amArena.gotoAndStop("none");
         this.myDoor.myArt2.amArena.gotoAndStop("none");
         this.myDoorBACK.myArt2.amArena.gotoAndStop("none");
      }
      if(this.myDataRef.myConnection == undefined && this.myDataRef.myObjective == undefined)
      {
         this.myDoor.myArt.gotoAndStop(2);
         this.myDoor.myArt2.gotoAndStop(2);
      }
      else
      {
         this.myDoor.myArt.gotoAndStop(1);
         this.myDoor.myArt2.gotoAndStop(1);
      }
   }
   function pauseTick()
   {
      if(!this._parent.paused)
      {
         this.onEnterFrame = this.tick;
      }
   }
   function tick()
   {
      if(this._parent.paused)
      {
         this.onEnterFrame = this.pauseTick;
      }
      if(this.mySprites.length == 0)
      {
         this.currentStart = 0;
         this.currentStartIncrement = 1;
         this.mySpawnTimer = 0;
      }
      else
      {
         this.mySpawnTimer = this.mySpawnTimer + 1;
      }
      if(this.myDoorBACK != undefined)
      {
         if(this.myExiters.length > 0)
         {
            this.myDoorBACK._visible = true;
            this.myDoor._visible = false;
         }
         if(this.myEnterers.length > 0 || this.myEnterers.length == 0 && this.myExiters.length == 0 && this.mySprites.length == 0)
         {
            this.myDoorBACK._visible = false;
            this.myDoor._visible = true;
         }
      }
      while(this.myExiters.length > 0)
      {
         this.mySprites.push(this.makeSprite(this.myExiters[0]));
         this.myExiters.splice(0,1);
      }
      if(this.myStatus == "closed" || this.myDoor == undefined)
      {
         while(this.myEnterers.length > 0)
         {
            this.mySprites.push(this.makeSprite(this.myEnterers[0]));
            this.myEnterers.splice(0,1);
         }
         if(this.mySprites.length > 0 && !this.amLocked)
         {
            this.myStatus = "opening";
            this.myDoor.gotoAndPlay("opening");
            this.myDoorBACK.gotoAndPlay("opening");
            if(this.myDoor != undefined)
            {
               SwainAudioPlayer.playSound("door1",MadWorld.returnAudioPosition(this._x));
            }
         }
      }
      if(this.myStatus == "open" && !this.noClose)
      {
         if(this.stayOpen.length == 0 && this.mySprites.length == 0)
         {
            this.myStatus = "closing";
            this.myDoor.gotoAndPlay("closing");
            this.myDoorBACK.gotoAndPlay("closing");
            if(this.myDoor != undefined)
            {
               SwainAudioPlayer.playSound("door1",MadWorld.returnAudioPosition(this._x));
            }
         }
      }
      if(this.myStatus == "open" || this.myDoor == undefined)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.mySprites.length)
         {
            this.spriteAI(this.mySprites[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this.amLocked || this._parent.roomLock || this.myDataRef.myConnection == undefined)
      {
         this.myLock.gotoAndStop(1);
      }
      else
      {
         this.myLock.gotoAndStop(2);
      }
   }
   function makeSprite(inChar)
   {
      var _loc4_ = String(SwainMath.randomNumber(0,999999999));
      this.spriteHolder.attachMovie("doors_sprite","newChar" + _loc4_,this.spriteHolder.getNextHighestDepth());
      var _loc2_ = this.spriteHolder["newChar" + _loc4_];
      _loc2_.gotoAndStop("idle");
      _loc2_.myMission = inChar.myDoorMission;
      _loc2_.myDataRef = inChar;
      _loc2_.reloadTimer = -1;
      _loc2_.myStatus2 = "idle";
      _loc2_.myWeapon = _loc2_.myDataRef.myWeapon;
      if(this.myDir == "right" && _loc2_.myMission == "enter" || this.myDir == "left" && _loc2_.myMission == "exit" || this.myDir == "down" && SwainMath.randomNumber(0,1) == 0)
      {
         _loc2_.isFacingRight = true;
      }
      else
      {
         _loc2_.isFacingRight = false;
      }
      if(_loc2_.myMission != "exit")
      {
         if(this.myDir == "down")
         {
            _loc2_.goTimer = this.mySprites.length + SwainMath.randomNumber(1,5);
         }
         else
         {
            _loc2_.goTimer = this.mySprites.length + SwainMath.randomNumber(6,18);
         }
      }
      if(_loc2_.myMission == "enter")
      {
         _loc2_._x = this.myStarts[this.currentStart]._x;
         _loc2_._y = this.myStarts[this.currentStart]._y;
         _loc2_.targetX = 0;
         _loc2_.targetY = 0;
         this.adjustCurrentStart();
      }
      else
      {
         _loc2_._x = _loc2_.myDoorX - this._x;
         _loc2_._y = _loc2_.myDoorX - this._y;
         if(this.myDir == "right" || this.myDir == "left")
         {
            _loc2_.targetX = this.myExit._x;
            _loc2_.targetY = this.myExit._y;
         }
         else
         {
            var _loc5_ = this.myStarts[SwainMath.randomNumber(0,this.myStarts.length - 1)];
            _loc2_.targetX = _loc5_._x;
            _loc2_.targetY = _loc5_._y;
         }
      }
      if(!_loc2_.isFacingRight)
      {
         _loc2_.myAimX = -5;
      }
      else
      {
         _loc2_.myAimX = 5;
      }
      _loc2_.myAimY = _loc2_._y;
      _loc2_.headDamage = 0;
      _loc2_.bodydamage = 0;
      _loc2_.myShirt = 0;
      _loc2_.myHat = 0;
      _loc2_.myMouth = 0;
      _loc2_.myMask = 0;
      MadnessCharacter.adjustSprite(_loc2_);
      _loc2_._xscale = MadnessCharacter.setPerspectiveScale(this._x + _loc2_._x,this._y + _loc2_._y,this._parent.determineRoom(this._x,this._y));
      _loc2_._xscale *= _loc2_.myDataRef.myScale;
      _loc2_._yscale = _loc2_._xscale;
      if(!_loc2_.isFacingRight)
      {
         _loc2_._xscale *= -1;
      }
      this.removeFromReserveList(inChar);
      inChar.mySprite = undefined;
      return _loc2_;
   }
   function removeSprite(inSprite, inDelete)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.mySprites.length)
      {
         if(inSprite == this.mySprites[_loc2_])
         {
            this.mySprites.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(inDelete)
      {
         inSprite.removeMovieClip();
         false;
      }
   }
   function addCharacter(inChar, inGoal)
   {
      inChar.myDoorMission = inGoal;
      inChar.myDoorX = inChar.mySprite._x;
      inChar.myDoorY = inChar.mySprite._y;
      inChar.mySprite = undefined;
      inChar.loggedX = undefined;
      inChar.loggedY = undefined;
      if(inGoal == "enter")
      {
         this.myEnterers.push(inChar);
      }
      else
      {
         this.myExiters.push(inChar);
      }
   }
   function removeCharacter(inChar)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.myEnterers.length)
      {
         if(inChar == this.myEnterers[_loc2_])
         {
            this.myEnterers.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.myExiters.length)
      {
         if(inChar == this.myExiters[_loc2_])
         {
            this.myExiters.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function adjustCurrentStart()
   {
      this.currentStart += this.currentStartIncrement;
      if(this.currentStart > this.myStarts.length - 1)
      {
         this.currentStart = this.myStarts.length - 1;
         this.currentStartIncrement = -1;
      }
      if(this.currentStart < 0)
      {
         this.currentStart = 0;
         this.currentStartIncrement = 1;
      }
   }
   function spriteAI(inSprite)
   {
      if(this.mySpawnTimer >= inSprite.goTimer && inSprite.myStatus2 == "idle")
      {
         this.mySpawnTimer -= inSprite.goTimer / 1.5;
         if(!inSprite.myDataRef.amZombie)
         {
            inSprite.myStatus2 = "run";
         }
         else
         {
            inSprite.myStatus2 = "run_zombie";
            inSprite.gotoAndStop(inSprite.myStatus2);
         }
      }
      if(inSprite.amDone)
      {
         if(!inSprite.myDataRef.amZombie)
         {
            inSprite.myStatus2 = "idle";
         }
         else
         {
            inSprite.myStatus2 = "idle_zombie";
         }
      }
      inSprite._xscale = MadnessCharacter.setPerspectiveScale(this._x + inSprite._x,this._y + inSprite._y,this._parent.determineRoom(this._x,this._y));
      inSprite._xscale *= inSprite.myDataRef.myScale;
      inSprite._yscale = inSprite._xscale;
      var _loc6_ = 0;
      var _loc7_ = 0;
      if(this.myDir == "down")
      {
         _loc6_ = 25;
      }
      else
      {
         _loc7_ = 25;
      }
      var _loc8_ = 0.95 + 0.95 * _root.myGameSpeed * 0.1;
      if(inSprite.myStatus2.substr(0,3) == "run" && !inSprite.amDone)
      {
         if(inSprite._x < inSprite.targetX - _loc6_)
         {
            inSprite._x += inSprite.myDataRef.mySpeed * _loc8_;
            inSprite.isFacingRight = true;
         }
         else if(inSprite._x > inSprite.targetX + _loc6_)
         {
            inSprite._x -= inSprite.myDataRef.mySpeed * _loc8_;
            inSprite.isFacingRight = false;
            inSprite._xscale *= -1;
         }
         if(inSprite._y < inSprite.targetY - _loc7_)
         {
            inSprite._y += inSprite.myDataRef.mySpeed / 2 * _loc8_;
         }
         else if(inSprite._y > inSprite.targetY + _loc7_)
         {
            inSprite._y -= inSprite.myDataRef.mySpeed / 2 * _loc8_;
         }
      }
      var _loc5_ = this.mySprites;
      var _loc4_ = 0;
      while(_loc4_ < _loc5_.length)
      {
         if(inSprite._y > _loc5_[_loc4_]._y && inSprite.getDepth() < _loc5_[_loc4_].getDepth())
         {
            inSprite.swapDepths(_loc5_[_loc4_]);
         }
         _loc4_ = _loc4_ + 1;
      }
      if(inSprite._x <= inSprite.targetX + _loc6_ + inSprite.myDataRef.mySpeed && inSprite._x >= inSprite.targetX + (- _loc6_) - inSprite.myDataRef.mySpeed)
      {
         if(inSprite._y <= inSprite.targetY + _loc7_ + inSprite.myDataRef.mySpeed / 2 && inSprite._y >= inSprite.targetY + (- _loc7_) - inSprite.myDataRef.mySpeed / 2)
         {
            if(inSprite.myMission == "enter")
            {
               this._parent.createSprite(inSprite.myDataRef,this,this._x + inSprite._x,this._y + inSprite._y);
            }
            _loc4_ = 0;
            while(_loc4_ < this.myDataRef.myCharacters.length)
            {
               if(inSprite.myDataRef == this.myDataRef.myCharacters[_loc4_])
               {
                  this.myDataRef.myCharacters.splice(_loc4_,1);
                  break;
               }
               _loc4_ = _loc4_ + 1;
            }
            this.removeSprite(inSprite,inSprite.myMission == "enter" || this.myDir != "down");
            inSprite.amDone = true;
            inSprite.myStatus2 = "idle";
         }
      }
      inSprite.gotoAndStop(inSprite.myStatus2);
      MadnessCharacter.adjustSprite(inSprite);
   }
   function keepDoorOpen(inChar)
   {
      this.stayOpen.push(inChar);
   }
   function removeFromReserveList(inChar)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.stayOpen.length)
      {
         if(inChar == this.stayOpen[_loc2_])
         {
            this.stayOpen.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function lockMe()
   {
      this.myDataRef.amLocked = true;
      this.myDataRef.myConnection.amLocked = true;
      this.myDataRef.myConnection.mySprite.amLocked = true;
      this.amLocked = true;
   }
   function unlockMe()
   {
      this.myDataRef.amLocked = false;
      this.myDataRef.myConnection.amLocked = false;
      this.myDataRef.myConnection.mySprite.amLocked = false;
      this.amLocked = false;
   }
}
