class MadnessObstacle extends MovieClip
{
   var myHoles;
   var onEnterFrame;
   var myDataRef;
   var inUse;
   var myType;
   var mySprite;
   var myHealth;
   var amCover;
   var myHealthMax;
   var myDepth;
   var myWidth;
   static var allObstacles;
   var invincible = new Boolean();
   var destroyed = false;
   var zoneWidth = 40;
   var zoneDepth = 15;
   function MadnessObstacle()
   {
      super();
      this.myHoles = new Array();
      this.onEnterFrame = this.tick;
   }
   function init(inPlaceholder, inDataRef)
   {
      this.myDataRef = inDataRef;
      this.myDataRef.mySprite = this;
      this.inUse = undefined;
      this._x = inPlaceholder._x;
      this._y = inPlaceholder._y;
      inPlaceholder._visible = false;
      this.swapDepths(this._y);
      this.refreshStats(inDataRef.myType);
      this.myType = inDataRef.myType;
      this.gotoAndStop(this.myType);
      if(this.myType.substr(0,5) == "empty")
      {
         this.gotoAndStop("empty");
      }
      this._xscale = MadnessCharacter.setPerspectiveScale(this._x,this._y,this._parent.determineRoom(this._x,this._y));
      this._yscale = this._xscale;
      MadnessCharacter.setMyDepth(this,this._yscale);
      this.mySprite.stop();
      var _loc2_ = 0;
      while(_loc2_ < this.myDataRef.myHoles.length)
      {
         this.createSplat(this.myDataRef.myHoles[_loc2_].myX,this.myDataRef.myHoles[_loc2_].myY,this.myDataRef.myHoles[_loc2_].myType,this.myDataRef.myHoles[_loc2_].myVariant,this.myDataRef.myHoles[_loc2_].myRot);
         _loc2_ = _loc2_ + 1;
      }
      this.applyStats();
      if(this.myDataRef.vanishSpikeHoles != true && this.myType.substr(0,6) == "spikes")
      {
         this.mySprite.gotoAndStop(2);
         this.mySprite.mySpikes._visible = false;
         MadWorld.thisWorld.drawToBitmap(this,"bmpBodies");
         this.mySprite.gotoAndStop(1);
         this.mySprite.stop();
         this.myDataRef.vanishSpikeHoles = true;
      }
      this.mySprite.mySpikeHoles._visible = false;
   }
   function tick()
   {
      if(this.inUse != undefined && this.inUse.targetObstacle != this)
      {
         this.inUse = undefined;
      }
      if(this.myHealth <= 0 && !this.destroyed)
      {
         this.inUse.targetObstacle = undefined;
         this.inUse.myStatus = "stun" + SwainMath.randomNumber(1,3);
         this.inUse.mySprite.gotoAndStop(this.inUse.myStatus);
         this.clearSplats();
         this.inUse = undefined;
         this.destroyed = true;
         this.removeMe();
         this.amCover = false;
      }
      // 22/11/2026 dyzqy: An obstacle is an immovable object... No need to change its depth every time :)
      //            (TODO) Commented it! Verify it works.
      // MadnessCharacter.setMyDepth(this,this._yscale);
      if(!this.amCover)
      {
         if(this.myDataRef.noClip)
         {
            this.mySprite.gotoAndStop(2);
            if(this.myDataRef.alreadyClosed && this.mySprite._visible)
            {
               this.mySprite._visible = false;
            }
         }
         else
         {
            this.mySprite.gotoAndStop(1);
         }
      }
      else if(this.myHealth <= 0)
      {
         this.mySprite.gotoAndStop(3);
      }
      else if(this.myHealth < this.myHealthMax * 0.5)
      {
         this.mySprite.gotoAndStop(2);
      }
      this.myDataRef.myHealth = this.myHealth;
      this.myDataRef.myHoles = this.myHoles;
   }
   function refreshStats(inType)
   {
   }
   function applyStats()
   {
      if(this.myType == "woodcrate")
      {
         this.myHealth = 3000;
         this.myDepth = 30;
         this.myWidth = 75;
         this.amCover = true;
      }
      if(this.myType == "barrel")
      {
         this.myHealth = 2000;
         this.myDepth = 26;
         this.myWidth = 25;
         this.amCover = true;
      }
      if(this.myType.substr(0,4) == "box1")
      {
         this.myHealth = 2000;
         this.myDepth = 26;
         this.myWidth = 30;
         this.amCover = true;
      }
      if(this.myType.substr(0,4) == "box2")
      {
         this.myHealth = 2000;
         this.myDepth = 26;
         this.myWidth = 40;
         this.amCover = true;
      }
      if(this.myType == "spikes1" || this.myType == "spikes2")
      {
         this.myDepth = 900;
         this.myWidth = 30;
         this.amCover = false;
      }
      if(this.myType == "empty0")
      {
         this.myDepth = 20;
         this.myWidth = 50;
         this.amCover = false;
      }
      if(this.myType == "empty1")
      {
         this.myDepth = 30;
         this.myWidth = 50;
         this.amCover = false;
      }
      if(this.myType == "empty2")
      {
         this.myDepth = 50;
         this.myWidth = 50;
         this.amCover = false;
      }
      if(this.myType == "empty3")
      {
         this.myDepth = 40;
         this.myWidth = 170;
         this.amCover = false;
      }
      if(this.myType == "empty4")
      {
         this.myDepth = 40;
         this.myWidth = 140;
         this.amCover = false;
      }
      this.myHealthMax = this.myHealth;
      if(this.myDataRef.myHealth != undefined)
      {
         this.myHealth = this.myDataRef.myHealth;
         this.myHealthMax = this.myDataRef.myHealthMax;
      }
   }
   function removeMe()
   {
      var _loc2_ = 0;
      while(_loc2_ < MadnessObstacle.allObstacles.length)
      {
         if(this == MadnessObstacle.allObstacles[_loc2_])
         {
            // 22/11/2026 dyzqy: Fixed array leak! Removed the [_loc2_]
            //            (TODO) Verify this didn't create any bugs
            MadnessObstacle.allObstacles.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function hurtMe(inDamage)
   {
      this.myHealth -= inDamage;
   }
   function createSplat(inX, inY, inType, inVariant, inRot)
   {
      var _loc2_ = this.attachMovie("madness_splat","newBulletHole",this.getNextHighestDepth());
      _loc2_.gotoAndStop(inType);
      _loc2_._rotation = inRot;
      if(inVariant == undefined)
      {
         _loc2_.mySprite.gotoAndStop(SwainMath.randomNumber(1,5));
      }
      else
      {
         _loc2_.mySprite.gotoAndStop(inVariant);
      }
      _loc2_._x = inX;
      _loc2_._y = inY;
      var _loc3_ = new Object();
      _loc3_.myX = inX;
      _loc3_.myY = inY;
      _loc3_.myVariant = _loc2_.mySprite._currentframe;
      _loc3_.myType = inType;
      _loc3_.myRot = inRot;
      this.myHoles.push(_loc3_);
   }
   function clearSplats()
   {
      while(this.myHoles.length > 0)
      {
         trace(this.myHoles[0]);
         this.myHoles[0].cacheAsBitmap = false;
         this.myHoles[0].removMovieClip();
         delete this.myHoles[0];
         this.myHoles.splice(0,1);
      }
   }
   function spikesOpen()
   {
      this.myDataRef.alreadyClosed = true;
   }
   static function returnInsideObstacle(inX, inY, inWidth)
   {
      var _loc1_ = 0;
      while(_loc1_ < MadnessObstacle.allObstacles.length)
      {
         if(inX < MadnessObstacle.allObstacles[_loc1_]._x + MadnessObstacle.allObstacles[_loc1_].myWidth / 2 + inWidth / 2 && inX > MadnessObstacle.allObstacles[_loc1_]._x - MadnessObstacle.allObstacles[_loc1_].myWidth / 2 - inWidth / 2 && inY < MadnessObstacle.allObstacles[_loc1_]._y + MadnessObstacle.allObstacles[_loc1_].myDepth / 2 && inY > MadnessObstacle.allObstacles[_loc1_]._y - MadnessObstacle.allObstacles[_loc1_].myDepth / 2)
         {
            return true;
         }
         _loc1_ = _loc1_ + 1;
      }
      return false;
   }
}
