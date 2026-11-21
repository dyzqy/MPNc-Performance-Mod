class MadnessSpawner extends MovieClip
{
   var onEnterFrame;
   var myDataRef;
   var mySpawnerSprite;
   var mySprite;
   var autoDelete;
   var myUnit;
   var myFaction;
   var myTrigger;
   var myTimer;
   var myType;
   var amActive;
   var thisFrame;
   var myRoom;
   var checkDepth;
   static var allSpawners;
   var myLifespan = new Number();
   var fakeDepth = 100;
   function MadnessSpawner()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init(inPlaceholder, inDataRef, inAutoDelete)
   {
      this.myDataRef = inDataRef;
      this.myDataRef.mySprite = this;
      this.mySpawnerSprite = this.mySprite;
      this.autoDelete = inAutoDelete;
      this.myUnit = this.mySpawnerSprite.myDataRef = this.myDataRef.myUnit;
      this.myFaction = this.myUnit.myFaction = inDataRef.myFaction;
      this.myTrigger = this.myDataRef.myTrigger;
      this.myTimer = this.myDataRef.myTimer;
      this.myType = this.myDataRef.myType;
      this.gotoAndStop(this.myDataRef.myType);
      this.mySpawnerSprite.myDataRef = this.myUnit;
      if(this.myUnit == undefined)
      {
         this.hideUnit();
      }
      else
      {
         MadnessCharacter.applyNecessaryStats(this.mySpawnerSprite,this.myUnit);
         MadnessCharacter.adjustSprite(this.mySpawnerSprite);
      }
      this.amActive = this.myDataRef.amActive && this.myUnit != undefined;
      if(this.amActive)
      {
         MadnessSpawner.allSpawners.push(this);
      }
      this.mySpawnerSprite.stop();
      if(this.amActive)
      {
         if(this.myTrigger == "open" && this.myUnit != undefined)
         {
            this.mySpawnerSprite.gotoAndStop(this.myTimer);
         }
         if(this.myTrigger == "open" && this.myUnit == undefined)
         {
            this.mySpawnerSprite.gotoAndStop(this.mySpawnerSprite._totalframes);
         }
      }
      else
      {
         this.mySpawnerSprite.gotoAndStop(1);
         if(this.myTrigger == "open" && this.myUnit == undefined)
         {
            this.mySpawnerSprite.gotoAndStop(this.mySpawnerSprite._totalframes);
         }
      }
      this.thisFrame = this.mySpawnerSprite._currentframe;
      this._x = inPlaceholder._x;
      this._y = inPlaceholder._y;
      inPlaceholder._visible = false;
      this.mySpawnerSprite.mySprite.gotoAndStop(this.mySpawnerSprite._currentframe);
      this.myRoom = MadWorld.thisWorld.determineRoom(this._x,this._y);
      this.adjustScaleAndDepth();
      if(this.myDataRef.vanishMe)
      {
         this._visible = false;
      }
   }
   function pauseTick()
   {
      this.mySpawnerSprite.stop();
      if(!MadWorld.thisWorld.paused)
      {
         this.onEnterFrame = this.tick;
      }
   }
   function tick()
   {
      if(MadWorld.thisWorld.paused)
      {
         this.onEnterFrame = this.pauseTick;
      }
      if(this.amActive)
      {
         this.myLifespan = this.myLifespan + 1;
         if(this.myTrigger == "timer" && this.myLifespan >= this.myTimer)
         {
            this.thisFrame += _root.myGameSpeed + 1;
         }
         if(this.myTrigger == "open")
         {
            this.thisFrame += _root.myGameSpeed + 1;
         }
         if(this.thisFrame > this.mySpawnerSprite._totalframes)
         {
            this.thisFrame = this.mySpawnerSprite._totalframes;
         }
         while(this.mySpawnerSprite._currentframe < this.thisFrame)
         {
            this.mySpawnerSprite.nextFrame();
            this.mySpawnerSprite.mySprite.nextFrame();
         }
         if(this.myUnit != undefined)
         {
            MadnessCharacter.adjustSprite(this.mySpawnerSprite);
         }
      }
      this.mySpawnerSprite.stop();
      this.mySpawnerSprite.mySprite.gotoAndStop(this.mySpawnerSprite._currentframe);
      MadnessCharacter.setMyDepth(this,this.fakeDepth);
   }
   function unregisterMe()
   {
      var _loc2_ = 0;
      while(_loc2_ < MadnessSpawner.allSpawners.length)
      {
         if(this == MadnessSpawner.allSpawners[_loc2_])
         {
            MadnessSpawner.allSpawners.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.myType.substr(0,6) == "ground")
      {
         MadWorld.thisWorld.drawToBitmap(this,"bmpBodies");
         this._visible = false;
         this.myDataRef.vanishMe = true;
         this.autoDelete = true;
      }
      if(this.autoDelete)
      {
         false;
         this.removeMovieClip();
      }
   }
   function hideUnit()
   {
      this.mySpawnerSprite.mySprite.myHand._visible = this.mySpawnerSprite.mySprite.myHand2._visible = this.mySpawnerSprite.mySprite.myFoot._visible = this.mySpawnerSprite.mySprite.myFoot2._visible = this.mySpawnerSprite.mySprite.myBody._visible = this.mySpawnerSprite.mySprite.myHead._visible = false;
   }
   function spawnUnit()
   {
      if(this.myUnit != undefined)
      {
         MadWorld.thisWorld.createSprite(this.myUnit,null,this._x,this._y);
         if(MadWorld.activeFactions.length > 0)
         {
            this.myDataRef.mySprite.myMission = "engage";
         }
         this.myDataRef.amActive = this.amActive = false;
         this.myDataRef.myUnit = this.myUnit = undefined;
         this.myDataRef.myTrigger = "open";
         this.unregisterMe();
      }
   }
   function playSound(inSound)
   {
      SwainAudioPlayer.playSound(inSound,MadWorld.returnAudioPosition(this._x));
   }
   function forceSpriteUpdate()
   {
      MadnessCharacter.adjustSprite(this.mySpawnerSprite);
   }
   function adjustScaleAndDepth()
   {
      this.checkDepth = this.myType.substr(0,6) == "ground" || this.myType == "zipline" || this.myType.substr(0,6) == "window";
      if(this.checkDepth)
      {
         this._yscale = this._xscale = MadnessCharacter.setPerspectiveScale(this._x,this._y,this.myRoom);
         this.fakeDepth = this._yscale;
      }
      else
      {
         this.mySpawnerSprite.mySprite._xscale = MadnessCharacter.setPerspectiveScale(this._x,this._y,this.myRoom);
         this.mySpawnerSprite.mySprite._yscale = this.mySpawnerSprite.mySprite._xscale;
         this.fakeDepth = MadnessCharacter.setPerspectiveScale(this._x,this._y - 40,this.myRoom);
      }
      MadnessCharacter.setMyDepth(this,this.fakeDepth);
   }
}
