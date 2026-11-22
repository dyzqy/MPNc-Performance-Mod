class MadnessCharacter extends MovieClip
{
   var targetsHit;
   var targetsTac;
   var myLockList;
   var resurrectFlashColor;
   var onEnterFrame;
   var myDataRef;
   var myRoster;
   var myFaction;
   var onMouseDown;
   var onMouseUp;
   var myMission;
   var myLeader;
   var mySpeed;
   var myTacBar;
   var myMash;
   var myHealth;
   var mySubStatus;
   var mySprite;
   var mySubWalk;
   var mySubIdle;
   var myPulseNumber;
   var doorLockBoost;
   var myTactics;
   var myTacMod;
   var myTacticsMax;
   var slowMoActive;
   var hittingObstacle;
   var myWidth;
   var intendedTarget;
   var targetPickup;
   var targetApproach;
   var myAccel;
   var intendedX;
   var intendedY;
   var myLastRoom;
   var intendedRoom;
   var stairsAdjustMove;
   var targetObstacle;
   var myAttackTarget;
   var targetActivator;
   var myColorTransform;
   var myColor;
   var whipRange;
   var myBlasts;
   var myHealthMax;
   var myStatusTEXT;
   var myMissionTEXT;
   var targetLockTEXT;
   var pathFindTEXT;
   var nameTEXT;
   var targetDoor;
   var autoX;
   var autoY;
   var intendedRot;
   var myDash;
   var grappleTimer;
   var targetEnemy;
   var magicLevel;
   var myHeight;
   var myDepth;
   var myReload;
   var myBlood;
   var traitBravery;
   var traitCover;
   var traitDistracted;
   var traitTriggerFinger;
   var traitCombatSkill;
   var bulletCheckDistance;
   var bulletRotation;
   static var allRosters;
   static var aimingSprite;
   static var damageDifficultyMod = new Number();
   static var playerLives = new Number();
   var amPlayer = new Boolean();
   var wounded = new Number();
   var tacRerchargeDelay = 90;
   var tacTimer = new Number();
   var tacDisplayTimer = new Number();
   var myHeadArmor = new Number();
   var myBodyArmor = new Number();
   var meleeHealth = new Number();
   var meleeHealthTimer = new Number();
   var grappleTimerMax = 100;
   var magicChargeTimer = -1;
   var magicLevel2Threshold = 5;
   var headSpray = 0;
   var bodySpray = 0;
   var headDamage = 0;
   var bodyDamage = 0;
   var headBloodTimer = 0;
   var noDamage = false;
   var deadMan = false;
   var amInjured = false;
   var amBleeding = false;
   var myWeapon = new Number();
   var myHat = new Number();
   var myMask = new Number();
   var myMouth = new Number();
   var myShirt = new Number();
   var recoilTimer = new Number();
   var deathTimer = new Number();
   var blocking = false;
   var pickupTimer = new Number();
   var aimTimer = -1;
   var aimFlashTimer = 50;
   var resurrectFlashTimer = 0;
   var magicFlashTimer = 0;
   var lastHitTimer = new Number();
   var emptyClipTimer = new Number();
   var mySpeedRight = new Number();
   var mySpeedDown = new Number();
   var myStatus = new String();
   // 23/11/2026 dyzqy: A Boolean is faster to check than a String!
   var isFacingRight:Boolean = false;
   var facingOpposite = false;
   var myGameSpeed = new Number();
   var slowmoSpeedMod = new Number();
   var actionSlowdown = false;
   var amDodging = false;
   var backtrackTimer = new Number();
   var heavySpeedMod = new Number();
   var lastStairsAngle = new Number();
   var moveLeft = false;
   var moveRight = false;
   var moveUp = false;
   var moveDown = false;
   var toggleAction = false;
   var toggleGuard = false;
   var toggleReload = false;
   var togglePickup = false;
   var toggleSlowmo = false;
   var mouseTimer = -1;
   var mouseTime2x = 9;
   var mouseClick = false;
   var mouseReleaseTimer = 2;
   var mouseHold = false;
   var mouse2x = false;
   var myAimX = new Number();
   var myAimY = new Number();
   var mouseLock = false;
   var actionTimer = new Number();
   var swapTimer = new Number();
   var rofTimer = new Number();
   var meleeCombos = new Number();
   var meleeComboTimer = new Number();
   var smgAimTimer = 1;
   var rofAdjust = new Number();
   var shootWaitBuffer = 30;
   var rofLastFrame = 1;
   var reloadTimer = -1;
   var dashTimer = -1;
   var dashTimeEnable = 6;
   var lifeSpan = new Number();
   var invincibleTimer = new Number();
   var slowmoTimer = new Number();
   var doorLock = false;
   var pathFind = false;
   var targetLock = false;
   var ignoreRooms = false;
   var interactTarget = undefined;
   var interactType = new String();
   var myRoom = new Object();
   var targetX = new Number();
   var targetY = new Number();
   var advanceX = new Number();
   var advanceY = new Number();
   var missionTimer = 99999999999;
   var shotTimer = 99999999999;
   var inRange = false;
   var shootReady = false;
   var myMorale = new Number();
   var awake = true;
   var freakOutTimer = new Number();
   var myAimAI = new Number();
   var totalFrameDamage = new Number();
   var thrownHook = false;
   function MadnessCharacter()
   {
      super();
      this.targetsHit = new Array();
      this.targetsTac = new Array();
      this.myLockList = new Array();
      this.resurrectFlashColor = new Array();
      this.onEnterFrame = this.tick;
   }
   function init(inRef, inRosterRef, inFaction, inPlayer, inRoster, myDoor, myStartX, myStartY)
   {
      this.myDataRef = inRef;
      this.myDataRef.mySprite = this;
      this.myRoster = inRosterRef;
      this.myFaction = inFaction;
      this.amPlayer = inPlayer;
      if(this.amPlayer)
      {
         this.onMouseDown = this.mouseDown;
         this.onMouseUp = this.mouseUp;
      }
      if(this.myDataRef.amZombie)
      {
         this.myMission = "patrol";
      }
      else if(this.myRoster == MadnessRoster.playerRoster)
      {
         this.myMission = "patrol";
         if(MadnessGameSelect.gameMode == "arena")
         {
            this.myMission = "engage";
         }
         if(MadnessRoster.playerRoster.teamLeader.mySprite.lifeSpan > 90)
         {
            this.myMission = "engage";
         }
      }
      else
      {
         this.myMission = "follow";
      }
      this.myLeader = this.myRoster.teamLeader.mySprite;
      this._x = myStartX;
      this._y = myStartY;
      if(this.myDataRef.loggedX != undefined)
      {
         this._x = this.myDataRef.loggedX;
      }
      if(this.myDataRef.loggedY != undefined)
      {
         this._y = this.myDataRef.loggedY;
      }
      this.refreshStats();
      if(myDoor.myDir == "right" || myDoor.myDir == "left")
      {
         // TODO: Implement the same system in myDoor.myDir
         this.isFacingRight = (myDoor.myDir == "right");
      }
      else if(SwainMath.randomNumber(0,1) == 0)
      {
         this.isFacingRight = true;
      }
      else
      {
         this.isFacingRight = false;
      }
      if(this.isFacingRight)
      {
         this.myAimX = this._x + 50;
         this.mySpeedRight = this.mySpeed;
      }
      else
      {
         this.isFacingRight = false;
         this.myAimX = this._x - 50;
         this.mySpeedRight = - this.mySpeed;
         this._xscale = -100;
      }
      this.myAimY = this._y - 50;
      this.rofTimer = 9999;
      this.myWeapon = this.myDataRef.myWeapon;
      this.myRoom = this._parent.determineRoom(this._x,this._y);
      this._alpha = 100;
      this.myTacBar._alpha = 0;
      this.tacTimer = this.tacRerchargeDelay;
      this.myMash._alpha = 0;
      this.myMash.gotoAndStop(1);
      this.myMash._visible = false;
      if(this.myHealth <= 0 && this.myDataRef.noPaint)
      {
         this.myStatus = this.myDataRef.lastStatus;
         this.mySubStatus = this.myDataRef.lastSubStatus;
         this.isFacingRight = this.myDataRef.lastFacing;
         this.gotoAndStop(this.myStatus + this.mySubStatus);
         this.mySprite.onEnterFrame = this.amDead;
         this.cacheAsBitmap = true;
         this.mySprite.gotoAndStop(this.mySprite._totalframes);
         this.killMe();
      }
      this.headSpray = this.myDataRef.headSpray;
      this.bodySpray = this.myDataRef.bodySpray;
      if(this.amPlayer)
      {
      }
      this.myStatus = "run";
      if(this.myDataRef.amZombie || this.myDataRef.amAbom)
      {
         this.mySubWalk = String(SwainMath.randomNumber(1,3));
         this.mySubIdle = String(SwainMath.randomNumber(1,3));
         this.gotoAndStop("run_zombie_" + this.mySubWalk);
      }
      else
      {
         this.gotoAndStop("run");
      }
      MadnessCharacter.adjustSprite(this);
      this._xscale = MadnessCharacter.setPerspectiveScale(this._x,this._y,this.myRoom);
      this._xscale *= this.myDataRef.myScale;
      this._yscale = this._xscale;
      MadnessCharacter.setMyDepth(this,this._yscale);
      if(this.myDataRef.myBoss != "")
      {
         this.bossEvents("start");
      }
      if(this.myRoster == MadnessRoster.playerRoster || this.myDataRef.myBoss != "")
      {
         this.myDataRef.amSurprised = false;
      }
      this.myPulseNumber = SwainMath.randomNumber(1,30);
   }
   function pauseTick()
   {
      this.mySprite.stop();
      if(!this._parent.paused)
      {
         this.onEnterFrame = this.tick;
      }
   }
   function tick()
   {
      // 22/11/2026 dyzqy: Offscreen culling.
      // 23/11/2026 dyzqy: there's no such variable as camX or camY, am I crazy or what
      // var offScreen = (Math.abs(this._x - camX) > 950 || Math.abs(this._y - camY) > 650);
      // this._visible = !offScreen;

      if(this._parent.paused)
      {
         this.onEnterFrame = this.pauseTick;
      }
      if(this.myRoom == -1)
      {
         trace("ERROR! Character without room!");
         trace("ERROR! Character without room!");
         trace("ERROR! Character without room!");
         trace("ERROR! Character without room!");
      }
      if(this.amPlayer && this.inputAllowed())
      {
         this.playerControls();
      }
      else if(!MadnessTransition.transitionLock && this.inputAllowed() && !this.myDataRef.standStill)
      {
         // 21/11/2026 dyzqy: Limit the AI calls, it is quite expensive... 
         //            !TODO) Check if this doesn't epxlode anything
         // if(PulseTimer.getActive(this.myPulseNumber,2))
            MadnessAI.setActions(this);
      }
      if(this._alpha < 100)
      {
         this._alpha += 20;
      }
      this.lifeSpan = this.lifeSpan + 1;
      if(this.freakOutTimer > 0)
      {
         this.freakOutTimer = this.freakOutTimer - 1;
      }
      this.determineGameSpeed();
      if(this.doorLock)
      {
         this.doorLockBoost = 1.3;
         if(this.myDataRef.bossFlee != undefined)
         {
            this.doorLockBoost *= 2;
         }
      }
      else
      {
         this.doorLockBoost = 1;
      }
      if(this.emptyClipTimer > 0 && this.amPlayer)
      {
         this.emptyClipTimer -= 1 + this.myGameSpeed;
      }
      if(this.mouseTimer > -1 && this.mouseTimer <= this.mouseTime2x)
      {
         this.mouseTimer = this.mouseTimer + 1;
      }
      else
      {
         this.mouseTimer = -1;
         if(!this.mouseHold)
         {
            this.mouse2x = false;
         }
      }
      if(this.mouseTimer > 0 || this.mouseTimer == -1)
      {
         this.mouseClick = false;
      }
      this.mouseReleaseTimer = this.mouseReleaseTimer + 1;
      this.bossEvents("tick");
      this.breakdownAutoMove();
      this.breakdownStatusActions();
      this.breakdownAttack();
      if(this.myHealth <= 0)
      {
         this.tacTimer = 0;
         this.myTactics = 0;
      }
      if(this.tacTimer == 0 && this.myStatus == "idle" && MadnessDataFile.havePerk("perkDodge1",this.myDataRef) && !this.targetLock)
      {
         this.myStatus = "tactics";
      }
      if(!this.amDodging && !this.blocking)
      {
         if(this.tacTimer < this.tacRerchargeDelay - Math.floor(10 * this.myTacMod))
         {
            this.tacTimer += 1 + this.myGameSpeed;
            if(this.myHealth > 0 && this.myTactics > 0)
            {
               this.tacDisplayTimer = 20;
            }
         }
         else
         {
            this.myTactics += (1 + this.myGameSpeed) * 0.05 * this.myTacMod;
            if(this.myTactics > this.myTacticsMax)
            {
               this.myTactics = this.myTacticsMax;
            }
         }
      }
      if(this.myTacticsMax > 0)
      {
         // 22/11/2026 dyzqy: You don't really need to check and do expensive operations every single frame, do you?
         if(this.tacDisplayTimer > 0)
         {
            var _loc2_ = 1;
            while(_loc2_ <= 4)
            {
               var dotClip = this.myTacBar["dot" + String(_loc2_)];
               var dotFrame = (this.myTactics > this.myTacticsMax - this.myTacticsMax / 4 * _loc2_) ? 2 : 1;
               if(dotClip._currentframe != dotFrame)
               {
                  dotClip.gotoAndStop(dotFrame);
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      }
      else
      {
         this.myTacBar._visible = false;
      }
      if(this.tacDisplayTimer > 0)
      {
         if(this.myTactics < this.myTacticsMax && this.myHealth > 0 && this.myTactics > 0)
         {
            this.tacDisplayTimer -= 0.5;
         }
         else
         {
            this.tacDisplayTimer -= 1;
         }
      }
      if((this.myHealth <= 0 || this.myTactics == 0) && this.tacDisplayTimer > 10)
      {
         this.tacDisplayTimer = 10;
      }
      if(Math.abs(this.tacDisplayTimer) < 10)
      {
         this.myTacBar._alpha = Math.abs(this.tacDisplayTimer) * 10;
      }
      else
      {
         this.myTacBar._alpha = 100;
      }
      if(this.slowMoActive)
      {
         this.myDataRef.mySlowMo -= 1;
         if(this.myDataRef.mySlowMo <= 0)
         {
            this.myDataRef.mySlowMo = 0;
            this.slowMoActive = false;
         }
      }
      else if(this.myDataRef.mySlowMo > this.myDataRef.mySlowMoMax)
      {
         this.myDataRef.mySlowMo = this.myDataRef.mySlowMoMax;
      }
      this._x += this.mySpeedRight * this.myDataRef.mySpeedBoost * this.slowmoSpeedMod * this.doorLockBoost * this.heavySpeedMod;
      this._y += this.mySpeedDown * this.myDataRef.mySpeedBoost * this.slowmoSpeedMod * this.doorLockBoost * this.heavySpeedMod;
      this.hittingObstacle = false;
      if(this.myStatus != "cover")
      {
         _loc2_ = 0;
         while(_loc2_ < MadnessObstacle.allObstacles.length)
         {
            if(!MadnessObstacle.allObstacles[_loc2_].myDataRef.noClip && !this.targetLock)
            {
               if(this._x < MadnessObstacle.allObstacles[_loc2_]._x + MadnessObstacle.allObstacles[_loc2_].myWidth / 2 + this.myWidth / 2 && this._x > MadnessObstacle.allObstacles[_loc2_]._x - MadnessObstacle.allObstacles[_loc2_].myWidth / 2 - this.myWidth / 2 && this._y < MadnessObstacle.allObstacles[_loc2_]._y + MadnessObstacle.allObstacles[_loc2_].myDepth / 2 && this._y > MadnessObstacle.allObstacles[_loc2_]._y - MadnessObstacle.allObstacles[_loc2_].myDepth / 2)
               {
                  this.hittingObstacle = true;
                  if(this._x - this.mySpeedRight * this.slowmoSpeedMod * this.doorLockBoost <= MadnessObstacle.allObstacles[_loc2_]._x - MadnessObstacle.allObstacles[_loc2_].myWidth / 2 - this.myWidth / 2 || this._x - this.mySpeedRight * this.slowmoSpeedMod * this.doorLockBoost >= MadnessObstacle.allObstacles[_loc2_]._x + MadnessObstacle.allObstacles[_loc2_].myWidth / 2 + this.myWidth / 2)
                  {
                     if(this._x - this.mySpeedRight * this.slowmoSpeedMod * this.doorLockBoost < MadnessObstacle.allObstacles[_loc2_]._x)
                     {
                        this._x = MadnessObstacle.allObstacles[_loc2_]._x - MadnessObstacle.allObstacles[_loc2_].myWidth / 2 - this.myWidth / 2 - 1;
                     }
                     else
                     {
                        this._x = MadnessObstacle.allObstacles[_loc2_]._x + MadnessObstacle.allObstacles[_loc2_].myWidth / 2 + this.myWidth / 2 + 1;
                     }
                  }
                  if(this._y - this.mySpeedDown * this.slowmoSpeedMod * this.doorLockBoost <= MadnessObstacle.allObstacles[_loc2_]._y - MadnessObstacle.allObstacles[_loc2_].myDepth / 2 || this._y - this.mySpeedDown * this.slowmoSpeedMod * this.doorLockBoost >= MadnessObstacle.allObstacles[_loc2_]._y + MadnessObstacle.allObstacles[_loc2_].myDepth / 2)
                  {
                     if(this._y - this.mySpeedDown * this.slowmoSpeedMod * this.doorLockBoost < MadnessObstacle.allObstacles[_loc2_]._y)
                     {
                        this._y = MadnessObstacle.allObstacles[_loc2_]._y - MadnessObstacle.allObstacles[_loc2_].myDepth / 2 - 1;
                     }
                     else
                     {
                        this._y = MadnessObstacle.allObstacles[_loc2_]._y + MadnessObstacle.allObstacles[_loc2_].myDepth / 2 + 1;
                     }
                  }
                  if(this.intendedTarget == this.targetPickup && this.intendedTarget != undefined && this.targetLock)
                  {
                     this.initiatePickup();
                  }
                  if(this.moveRight || this.moveLeft)
                  {
                     if(this._x == MadnessObstacle.allObstacles[_loc2_]._x + MadnessObstacle.allObstacles[_loc2_].myWidth / 2 + this.myWidth / 2 + 1 || this._x == MadnessObstacle.allObstacles[_loc2_]._x - MadnessObstacle.allObstacles[_loc2_].myWidth / 2 - this.myWidth / 2 - 1)
                     {
                        this._y += 4 * this.slowmoSpeedMod * this.doorLockBoost;
                        this.mySpeedDown += 0.1;
                     }
                  }
                  if(!this.amPlayer)
                  {
                     if(this.moveUp || this.moveDown)
                     {
                        if(this._y == MadnessObstacle.allObstacles[_loc2_]._y + MadnessObstacle.allObstacles[_loc2_].myDepth / 2 + 1 || this._y == MadnessObstacle.allObstacles[_loc2_]._y - MadnessObstacle.allObstacles[_loc2_].myDepth / 2 - 1)
                        {
                           if(this.isFacingRight)
                           {
                              this._x += 4 * this.slowmoSpeedMod * this.doorLockBoost;
                           }
                           else
                           {
                              this._x -= 4 * this.slowmoSpeedMod * this.doorLockBoost;
                           }
                        }
                     }
                  }
                  if(this.pathFind && SwainMath.randomNumber(0,60) == 0)
                  {
                     this.pathFind = false;
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(!this.targetLock && !this.targetApproach && this.myStatus != "dodge" && this.myRoster == MadnessRoster.playerRoster)
      {
         _loc2_ = 0;
         while(_loc2_ < this._parent.noColliders.length)
         {
            if(this._parent.noColliders[_loc2_] != this)
            {
               if(this._x < this._parent.noColliders[_loc2_]._x + this._parent.noColliders[_loc2_].myWidth / 2 * (this._yscale / 100) + this.myWidth / 2 * (this._yscale / 100) && this._x > this._parent.noColliders[_loc2_]._x - this._parent.noColliders[_loc2_].myWidth / 2 * (this._yscale / 100) - this.myWidth / 2 * (this._yscale / 100) && this._y < this._parent.noColliders[_loc2_]._y + this._parent.noColliders[_loc2_].myDepth / 2 * (this._parent.noColliders[_loc2_]._yscale / 100) && this._y > this._parent.noColliders[_loc2_]._y - this._parent.noColliders[_loc2_].myDepth / 2 * (this._parent.noColliders[_loc2_]._yscale / 100))
               {
                  if(this.mySpeedRight > 0 && this.moveRight && this._x < this._parent.noColliders[_loc2_]._x || this.mySpeedRight < 0 && this.moveLeft && this._x > this._parent.noColliders[_loc2_]._x)
                  {
                     this._x -= this.mySpeedRight * this.slowmoSpeedMod * this.doorLockBoost;
                     if(this.mySpeedDown == 0)
                     {
                        this.mySpeedRight = 0;
                     }
                  }
                  if(this.mySpeedDown > 0 && this.moveDown && this._y < this._parent.noColliders[_loc2_]._y || this.mySpeedDown < 0 && this.moveUp && this._y > this._parent.noColliders[_loc2_]._y)
                  {
                     this._y -= this.mySpeedDown * this.slowmoSpeedMod * this.doorLockBoost;
                     if(this.mySpeedRight == 0)
                     {
                        this.mySpeedDown = 0;
                     }
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this.myRoom != undefined)
      {
         if(this.myRoom.roomNumber != 0 && this._x < this.myRoom.myDL._x && this._x < this.myRoom.myUL._x)
         {
            this.myRoom = this._parent.myRooms[this.myRoom.roomNumber - 1];
         }
         if(this.myRoom.roomNumber != this._parent.myRooms.length - 1 && this._x > this.myRoom.myDR._x && this._x > this.myRoom.myUR._x)
         {
            this.myRoom = this._parent.myRooms[this.myRoom.roomNumber + 1];
         }
         if(this._y < this.myRoom.myUL._y && this._y < this.myRoom.myUR._y)
         {
            this._y += 5;
            this.mySpeedDown = 0;
         }
         if(this._y > this.myRoom.myDL._y && this._y > this.myRoom.myDR._y)
         {
            this._y -= 5;
            this.mySpeedDown = 0;
         }
         while(this.myRoom.roomNumber == 0 && SwainMath.calculate_rotation(this.myRoom.myDL._x,this.myRoom.myDL._y,this._x,this._y) <= this.myRoom.leftAngle)
         {
            this._x += this.myAccel;
            this.mySpeedRight = 0;
            if(this.intendedTarget == this.targetPickup && this.intendedTarget != undefined && this.targetLock)
            {
               this.initiatePickup();
            }
            if(this.intendedX != undefined)
            {
               this.intendedX = this._x;
            }
         }
         while(this.myRoom.roomNumber == this._parent.myRooms.length - 1 && SwainMath.calculate_rotation(this.myRoom.myDR._x,this.myRoom.myDR._y,this._x,this._y) >= this.myRoom.rightAngle)
         {
            this._x -= this.myAccel;
            this.mySpeedRight = 0;
            if(this.intendedTarget == this.targetPickup && this.intendedTarget != undefined && this.targetLock)
            {
               this.initiatePickup();
            }
            if(this.intendedX != undefined)
            {
               this.intendedX = this._x;
            }
         }
         while(SwainMath.calculate_rotation(this.myRoom.myUL._x,this.myRoom.myUL._y,this._x,this._y) < this.myRoom.upAngle && SwainMath.calculate_rotation(this.myRoom.myUL._x,this.myRoom.myUL._y,this._x,this._y) > 0)
         {
            this._y += this.myAccel;
            this.mySpeedDown = 0;
            if(this.intendedTarget == this.targetPickup && this.intendedTarget != undefined && this.targetLock)
            {
               this.initiatePickup();
            }
            if(this.intendedY != undefined)
            {
               this.intendedY = this._y;
            }
         }
         while(SwainMath.calculate_rotation(this.myRoom.myDL._x,this.myRoom.myDL._y,this._x,this._y) > this.myRoom.downAngle)
         {
            this._y -= this.myAccel;
            this.mySpeedDown = 0;
            if(this.intendedTarget == this.targetPickup && this.intendedTarget != undefined && this.targetLock)
            {
               this.initiatePickup();
            }
            if(this.intendedY != undefined)
            {
               this.intendedY = this._y;
            }
         }
         if(this.mySpeedDown == 0 && this.mySpeedRight == 0 && !this.doorLock)
         {
            this.pathFind = false;
            this.ignoreRooms = false;
            if(!this.targetLock)
            {
               this.intendedX = undefined;
               this.intendedY = undefined;
            }
         }
      }
      this.myLastRoom = this.myRoom;
      if(this.mySpeedRight != 0 || this.mySpeedDown != 0)
      {
         this.myRoom = this._parent.determineRoom(this._x,this._y);
      }
      if(this.myRoom == undefined)
      {
         this.myRoom = this.myLastRoom;
      }
      this._xscale = MadnessCharacter.setPerspectiveScale(this._x,this._y,this.myRoom);
      this._xscale *= this.myDataRef.myScale;
      this._yscale = this._xscale;
      if(this.targetLock || this.pathFind)
      {
         if(this.interactType == "execute")
         {
            this.intendedX = this.interactTarget._x;
            this.intendedY = this.interactTarget._y;
            this.intendedRoom = this._parent.determineRoom(this.intendedX,this.intendedY);
         }
         if(this.interactType == "cover" && this.intendedTarget.inUse != undefined)
         {
            this.targetLock = false;
            this.pathFind = false;
         }
         if(this._x < this.intendedX + this.mySpeed * this.doorLockBoost + 1 && this._x > this.intendedX - this.mySpeed * this.doorLockBoost - 1 && this._y < this.intendedY + this.mySpeed * this.stairsAdjustMove * this.doorLockBoost + 1 && this._y > this.intendedY - this.mySpeed * this.stairsAdjustMove * this.doorLockBoost - 1)
         {
            if(this.doorLock)
            {
               if(this.myRoster == MadnessRoster.playerRoster)
               {
                  this._parent.endTimer = 1;
               }
               this.intendedTarget.addCharacter(this.myDataRef,"exit");
               if(this.myRoster.rosterName.substr(0,9) == "npcRoster")
               {
                  this.myRoster.removeCharacter(this.myDataRef);
               }
               this.removeMe();
            }
            else
            {
               if(this.interactType == "pickup")
               {
                  this.initiatePickup();
               }
               if(this.interactType == "execute")
               {
                  this.interactTarget.myStatus = "axed";
                  this.interactTarget.gotoAndStop("axed");
                  this.interactTarget.wounded = 0;
                  this.interactTarget._visible = false;
                  this.myStatus = "execute";
                  this.interactTarget.killMe();
                  if(this.interactTarget.isFacingRight)
                  {
                     this.isFacingRight = false;
                  }
                  else
                  {
                     this.isFacingRight = true;
                  }
                  this.mySpeedRight = 0;
                  this.mySpeedDown = 0;
                  this._x = this.intendedX;
                  this._y = this.intendedY;
               }
               if(this.interactType == "cover")
               {
                  this.targetObstacle = this.findClosestObstacle();
                  this.takeCover(this.targetObstacle);
               }
               if(this.interactType == "bodyshield")
               {
               }
               if(this.interactType == "activator")
               {
                  this.mySpeedRight = 0;
                  this.mySpeedDown = 0;
                  this.myStatus = "use";
                  this.isFacingRight = true;
               }
               this.interactType = "";
            }
            if(this.targetLock)
            {
               this._x = this.intendedX;
               this._y = this.intendedY;
               this.mySpeedDown = 0;
               this.mySpeedRight = 0;
            }
            this.targetLock = false;
            this.pathFind = false;
            this.bossEvents("go_to");
         }
      }
      if(this.myDataRef.amZombie)
      {
         if(PulseTimer.getActive(this.myPulseNumber,1) && this.myMission == "engage")
         {
            var _loc3_ = 1;
            _loc2_ = 0;
            while(_loc2_ < this.myRoster.myActiveMembers.length)
            {
               if(this.myRoster.myActiveMembers[_loc2_] != this.myDataRef && this.myRoster.myActiveMembers[_loc2_].mySprite.myMission == "engage")
               {
                  if(this.myRoster.myActiveMembers[_loc2_].mySpeedBoost > _loc3_)
                  {
                     this.myDataRef.mySpeedBoost = this.myRoster.myActiveMembers[_loc2_].mySpeedBoost;
                  }
                  _loc3_ += 0.2;
               }
               _loc2_ = _loc2_ + 1;
            }
            if(_loc3_ > 3)
            {
               _loc3_ = 2.5;
            }
            if(this.myDataRef.mySpeedBoost < _loc3_)
            {
               this.myDataRef.mySpeedBoost = _loc3_;
            }
            if(this.enemyInFront(this.myAttackTarget))
            {
               if(this.myDataRef.autoDash && this.myStatus == "run" || this.myDataRef.mySpeedBoost > 1.4 && this.myStatus == "run" && (this.myAttackTarget._x < this._x - 100 || this.myAttackTarget._x > this._x + 100))
               {
                  this.myStatus = "dash";
               }
            }
         }
      }
      if(this.myDataRef.amAbom)
      {
         if(this.myStatus == "run" && this.myMission == "engage")
         {
            if(this.enemyInFront(this.myAttackTarget))
            {
               if(this._x < this.myAttackTarget._x - 100 * this.myDataRef.myScale || this._x > this.myAttackTarget._x + 100 * this.myDataRef.myScale)
               {
                  this.myStatus = "dash";
               }
            }
         }
      }
      if(this.myStatus != "grapple" && this.myStatus != "knockback" && this.mySubStatus.substr(0,8) != "_wounded" && this.myStatus !== "backtrack" && this.myStatus != "cover" && this.myStatus.substr(0,5) != "dying" && this.myStatus.substr(0,4) != "dead" && this.myStatus.substr(0,5) != "dodge" && this.myStatus.substr(0,5) != "melee" && this.myStatus.substr(0,7) != "unarmed" && this.myStatus.substr(0,4) != "stun" && this.wounded == 0 && this.myStatus != "magic")
      {
         if(this.mySpeedRight < 0)
         {
            this.isFacingRight = false;
         }
         else if(this.mySpeedRight > 0)
         {
            this.isFacingRight = true;
         }
      }
      if(!this.isFacingRight)
      {
         this._xscale *= -1;
         this.myTacBar._xscale = -100;
      }
      else
      {
         this.myTacBar._xscale = 100;
      }
      if(!this.myDataRef.amSlow)
      {
         if(this._xscale < 0 && !this.facingOpposite || this._xscale > 0 && this.facingOpposite)
         {
            this._rotation = this.recoilTimer / 2;
         }
         else
         {
            this._rotation = (- this.recoilTimer) / 2;
         }
      }

      // 22/11/2026 dyzqy: No overlapping gotoAndStops, instead, save final value and make it *the* one!
      this.facingOpposite = false;
      var targetFrame = undefined;

      if(!this.myDataRef.amZombie && !this.myDataRef.amAbom)
      {
         if(this.myStatus == "cover" || this.myStatus == "block" || this.myStatus == "run" || this.myStatus == "idle" || this.myStatus == "tactics")
         {
            if(this.mySubStatus.substr(0,8) != "_wounded")
            {
               if(this.returnInvertValid())
               {
                  this.facingOpposite = true;
                  targetFrame = this.myStatus + "_turn";
               }
               else
               {
                  targetFrame = this.myStatus;
               }
            }
         }
         else if(this.myStatus == "dash")
         {
            if(this.mySpeedRight > 0 && this.mySpeedRight > this.mySpeed || this.mySpeedRight < 0 && this.mySpeedRight < - this.mySpeed)
            {
               if(this.returnInvertValid())
               {
                  this.facingOpposite = true;
                  targetFrame = "dash_turn";
               }
               else
               {
                  targetFrame = "dash";
               }
            }
            else if(this.returnInvertValid())
            {
               this.facingOpposite = true;
               targetFrame = "run_turn";
            }
            else
            {
               targetFrame = "run";
            }
         }
      }
      else
      {
         if(this.myStatus == "idle")
         {
            if(this.myDataRef.myWeapons[this.myWeapon] == undefined)
            {
               targetFrame = this.myStatus + "_zombie_" + this.mySubIdle;
            }
            else if(this.myDataRef.myWeapons[this.myWeapon].melee)
            {
               targetFrame = this.myStatus + "_zombie_melee1";
            }
            else
            {
               targetFrame = this.myStatus + "_zombie_gun1";
            }
         }
         else if(this.myStatus == "run")
         {
            if(this.myDataRef.myWeapons[this.myWeapon] == undefined)
            {
               targetFrame = this.myStatus + "_zombie_" + this.mySubWalk;
            }
            else if(this.myDataRef.myWeapons[this.myWeapon].melee)
            {
               targetFrame = this.myStatus + "_zombie_melee1";
            }
            else
            {
               targetFrame = this.myStatus + "_zombie_gun1";
            }
         }
         else if(this.myStatus == "dash")
         {
            targetFrame = this.myStatus + "_zombie_1";
         }
      }

      if(this.myStatus == "dead")
      {
         targetFrame = "dead" + this.mySubStatus;
      }
      else if(this.myStatus.substr(0,7) == "wounded")
      {
         if(this.wounded == 1)
         {
            targetFrame = "wounded_fall";
         }
         else if(this.wounded == 2)
         {
            if(this.mySpeedRight != 0)
            {
               targetFrame = "wounded_move";
            }
            else
            {
               targetFrame = "wounded_idle";
            }
         }
      }
      else if(this.myStatus.substr(0,5) == "melee" || this.myStatus.substr(0,7) == "unarmed" || this.myStatus.substr(0,7) == "execute" || this.myStatus.substr(0,4) == "axed" || this.myStatus.substr(0,4) == "stun" || this.myStatus == "recover")
      {
         targetFrame = this.myStatus;
      }
      else if(this.myStatus == "startup")
      {
         targetFrame = this.mySubStatus;
      }
      else if(this.myStatus == "surrender" || this.myStatus == "dodge" || this.myStatus == "incap" || this.myStatus == "knockback" || this.myStatus == "restrained" || this.myStatus == "grapple")
      {
         targetFrame = this.myStatus + this.mySubStatus;
      }
      else if(this.myStatus == "use")
      {
         targetFrame = this.targetActivator.myAnimation;
      }
      else if(this.myStatus == "swap" || this.myStatus == "backtrack" || this.myStatus == "pickup")
      {
         targetFrame = this.myStatus;
      }
      else if(this.myStatus == "magic")
      {
         targetFrame = "magic" + this.mySubStatus;
      }

      if((this.myStatus == "run" || this.myStatus == "idle" || this.myStatus == "backtrack") && this.mySubStatus.substr(0,8) == "_wounded")
      {
         this.facingOpposite = false;
         targetFrame = this.myStatus + this.mySubStatus;
      }

      if((this.myStatus == "use" || this.myStatus == "recover" || this.myStatus == "tactics" || this.myStatus.substr(0,7) == "execute" || this.myStatus.substr(0,5) == "melee" || this.myStatus.substr(0,7) == "unarmed" || this.myStatus.substr(0,7) == "deflect" || this.myStatus.substr(0,4) == "stun" || this.myStatus == "swap" || this.myStatus == "pickup" || this.myStatus == "magic" || this.myStatus == "knockback" || this.myStatus == "startup") && this.mySprite._currentframe >= this.mySprite._totalframes - 1)
      {
         if(this.myStatus.substr(0,7) == "execute")
         {
            this.clearLockedAction("execute");
         }
         this.myStatus = "idle";
         targetFrame = "idle";
      }

      if(targetFrame != undefined)
      {
         this.gotoAndStop(targetFrame);
      }

      MadnessCharacter.adjustSprite(this);
      this.aimFlashTimer = this.aimFlashTimer + 1;
      if(this.aimFlashTimer <= 5)
      {
         var _loc5_ = this.aimFlashTimer;
         if(_loc5_ <= -10)
         {
            _loc5_ += 15;
         }
         else if(_loc5_ <= -5)
         {
            _loc5_ += 10;
         }
         else if(_loc5_ <= 0)
         {
            _loc5_ += 5;
         }
         this.myColorTransform = {rb:290 - _loc5_ * 40,gb:0,bb:0};
         this.myColor.setTransform(this.myColorTransform);
      }
      if(this.aimFlashTimer < 6 && this.myStatus != "idle" && this.myStatus != "run" && this.myStatus != "backtrack" && this.myStatus != "tactics" && this.myStatus != "dash" && this.myStatus != "restrained" && this.myStatus != "grapple" && this.myStatus != "knockback")
      {
         this.aimFlashTimer = 6;
      }
      if(this.aimFlashTimer == 6)
      {
         this.myColorTransform = {rb:0,gb:0,bb:0};
         this.myColor.setTransform(this.myColorTransform);
      }
      if(this.magicFlashTimer > 0)
      {
         this.magicFlashTimer = this.magicFlashTimer - 1;
         this.myColorTransform = {rb:- this.magicFlashTimer * 10,gb:- this.magicFlashTimer * 10,bb:- this.magicFlashTimer * 10};
         this.myColor.setTransform(this.myColorTransform);
      }
      if(this.resurrectFlashTimer > 0)
      {
         this.resurrectFlashTimer = this.resurrectFlashTimer - 1;
         this.myColorTransform = {rb:this.resurrectFlashTimer * this.resurrectFlashColor[0],gb:this.resurrectFlashTimer * this.resurrectFlashColor[1],bb:this.resurrectFlashTimer * this.resurrectFlashColor[2]};
         this.myColor.setTransform(this.myColorTransform);
         if(this.resurrectFlashTimer > 15 && SwainMath.randomNumber(0,1) == 0 && this.myDataRef.headGearResurrect)
         {
            var _loc4_ = 0;
            while(_loc4_ == 0)
            {
               _loc4_ = SwainMath.randomNumber(-1,1);
            }
            var _loc6_ = new Object();
            _loc6_.x = this.mySprite.myHead._x;
            _loc6_.y = this.mySprite.myHead._y + 26;
            this.mySprite.localToGlobal(_loc6_);
            this._parent.globalToLocal(_loc6_);
            this._parent.createParticle("spark" + SwainMath.randomNumber(1,2),"sparks",_loc6_.x,_loc6_.y,SwainMath.randomNumber(10,50) / 10 * _loc4_,SwainMath.randomNumber(-240,-150) / 10,SwainMath.randomNumber(-180,180),SwainMath.randomNumber(-900,900) / 10,0.9,this._y + SwainMath.randomNumber(-5,5),100,100,false,90);
         }
      }
      if(this.rofTimer == 1 && !this.myDataRef.myWeapons[this.myWeapon].melee && !this.whipRange)
      {
         _loc2_ = 0;
         while(_loc2_ < this.myBlasts.length)
         {
            this._parent.makeBullet(this,this.myBlasts[_loc2_].myRot,this.myBlasts[_loc2_].myLength,this.myBlasts[_loc2_].myX,this.myBlasts[_loc2_].myY,null,null,this.myDataRef.myWeapons[this.myWeapon].myTracer);
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this.amPlayer && !this.thrownHook && this.myDataRef.myWeapons[this.myWeapon] == undefined && (this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack") && PulseTimer.getActive(this.myPulseNumber,10) && !this.targetLock)
      {
         this.targetPickup = this.findClosestPickup(true);
      }
      else if(this.amPlayer && this.myStatus != "idle" && this.myStatus != "run" && this.myStatus != "backtrack" && this.myStatus != "pickup" && this.myStatus != "dash")
      {
         this.targetPickup = undefined;
      }
      if(this.mySpeedDown != 0)
      {
         MadnessCharacter.setMyDepth(this,this._yscale);
      }
      if(this.myDataRef.amInvincible)
      {
         this.myHealth = this.myDataRef.myHealthMax;
      }
      this.applyDeath();
      if(this.myStatus == "dead")
      {
         if(this.mySprite._currentframe == this.mySprite._totalframes)
         {
            this.mySprite.onEnterFrame = null;
            this.killMe();
            if(this.amPlayer)
            {
               this._parent.playerDies();
               if(!MadnessLevel.levelFailed && MadnessGameSelect.gameMode == "story")
               {
                  trace(" **** DEAD **** " + this.mySprite._currentframe + " is my character\'s sprite frame");
                  this.invincibleTimer = 60;
                  this.headDamage = 0;
                  this.bodyDamage = 0;
                  if(this.headSpray > 3)
                  {
                     this.headSpray = 3;
                  }
                  if(this.bodySpray > 3)
                  {
                     this.bodySpray = 3;
                  }
                  this.myHealth = this.myHealthMax;
                  this.amBleeding = false;
                  this.myStatus = "recover";
                  this.gotoAndStop(this.myStatus);
                  this.deadMan = false;
                  this.myWidth = this.myDataRef.myWidth;
                  this.noDamage = false;
               }
            }
            else
            {
               if(this.myDataRef.noPaint)
               {
                  this.mySprite.stop();
                  this.myDataRef.lastStatus = this.myStatus;
                  this.myDataRef.lastSubStatus = this.mySubStatus;
                  this.myDataRef.lastFacing = this.isFacingRight;
                  this.cacheAsBitmap = true;
                  return true;
               }
               this.paintMe();
            }
         }
      }
      this.myDataRef.myHealth = this.myHealth;
      this.myDataRef.myTactics = this.myTactics;
      this.myDataRef.loggedX = this._x;
      this.myDataRef.loggedY = this._y;
      if((this.headDamage >= 3 && this.myHealth <= 0 || this.amBleeding) && this.mySubStatus != "_magic1")
      {
         _loc6_ = new Object();
         _loc6_.x = this.mySprite.myHead._x;
         _loc6_.y = this.mySprite.myHead._y + 26;
         this.mySprite.localToGlobal(_loc6_);
         this._parent.globalToLocal(_loc6_);
         this.makeSparks(_loc6_.x,_loc6_.y,this._y,"drops_" + this.myDataRef.myBlood);
      }
      this.totalFrameDamage = 0;
      this.myStatusTEXT.text = this.myStatus;
      this.myMissionTEXT.text = this.myMission;
      this.targetLockTEXT.text = this.targetLock;
      this.pathFindTEXT.text = this.pathFind;
      this.nameTEXT.text = this._name;
   }
   function breakdownAutoMove()
   {
      if(this.amPlayer && !MadnessLevel.levelVictory && !this.targetLock && this.toggleGuard && !this.thrownHook && !this.blocking && (this.myStatus == "run" || this.myStatus == "idle" || this.myStatus == "dash" || this.myStatus == "backtrack"))
      {
         var _loc5_ = false;
         if(!_loc5_ && !this.amPressingMove())
         {
            var _loc4_ = 0;
            while(_loc4_ < MadnessActivator.allActivators.length)
            {
               this.targetActivator = MadnessActivator.allActivators[_loc4_];
               if(!this.targetActivator.activated)
               {
                  if(this._x < this.targetActivator._x + 80 && this._x > this.targetActivator._x - 80 && this._y < this.targetActivator._y + 50 && this._y > this.targetActivator._y - 50)
                  {
                     this.attractToMC(this.targetActivator,"activator");
                     _root.myGameSpeed = 1;
                     this.slowMoActive = false;
                     this.toggleGuard = false;
                     _loc5_ = true;
                     break;
                  }
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         if(!_loc5_ && !MadnessActivator.bombActive)
         {
            _loc4_ = 0;
            while(_loc4_ < MadnessDoors.allDoors.length)
            {
               this.targetDoor = MadnessDoors.allDoors[_loc4_];
               if(!this.targetDoor.amLocked)
               {
                  if((this.targetDoor.myDataRef.myConnection != undefined || this.targetDoor.myDataRef.myObjective != undefined) && this.lifeSpan > 12 && this.targetDoor.mySprites.length == 0 && !this._parent.roomLock)
                  {
                     if(this._x < this.targetDoor._x + 90 && this._x > this.targetDoor._x - 90 && this._y < this.targetDoor._y + 50 && this._y > this.targetDoor._y - 50)
                     {
                        this._parent.exitDoor = this.targetDoor;
                        _root.myGameSpeed = 1;
                        this.slowMoActive = false;
                        this._parent.playerAim._visible = false;
                        this.toggleGuard = false;
                        var _loc3_ = 0;
                        while(_loc3_ < this.myRoster.myActiveMembers.length)
                        {
                           if(this.myRoster.myActiveMembers[_loc3_].mySprite != undefined)
                           {
                              this.myRoster.myActiveMembers[_loc3_].mySprite.attractToDoor(this.targetDoor);
                           }
                           _loc3_ = _loc3_ + 1;
                        }
                        _loc5_ = true;
                        break;
                     }
                  }
               }
               _loc4_ = _loc4_ + 1;
            }
         }
      }
      if(this.targetLock || this.pathFind)
      {
         this.targetApproach = false;
         if(this.ignoreRooms || this.myRoom == this.intendedRoom || this._x > this.intendedX - 80 && this._x < this.intendedX + 80 && (this._y > this.intendedY - 80 && this._y < this.intendedY + 80))
         {
            this.autoX = this.intendedX;
            this.autoY = this.intendedY;
         }
         else if(this.intendedRoom.roomNumber > this.myRoom.roomNumber)
         {
            this.autoX = (this.myRoom.myUR._x + this.myRoom.myDR._x) / 2 + 20;
            this.autoY = (this.myRoom.myUR._y + this.myRoom.myDR._y) / 2;
         }
         else
         {
            this.autoX = (this.myRoom.myUL._x + this.myRoom.myDL._x) / 2 - 20;
            this.autoY = (this.myRoom.myUL._y + this.myRoom.myDL._y) / 2;
         }
         this.moveUp = false;
         this.moveDown = false;
         this.moveRight = false;
         this.moveLeft = false;
         if(this._x < this.autoX - this.mySpeed * this.doorLockBoost)
         {
            this.moveRight = true;
         }
         else if(this._x > this.autoX + this.mySpeed * this.doorLockBoost)
         {
            this.moveLeft = true;
         }
         if(this._y < this.autoY - this.mySpeed * this.stairsAdjustMove * this.doorLockBoost)
         {
            this.moveDown = true;
         }
         else if(this._y > this.autoY + this.mySpeed * this.stairsAdjustMove * this.doorLockBoost)
         {
            this.moveUp = true;
         }
         if(!this.moveRight && !this.moveLeft && !this.moveUp && !this.moveDown && !this.doorLock)
         {
            this.pathFind = false;
         }
      }
      else if(this.targetApproach)
      {
         if(this.intendedX - this._x > 5 || this.intendedX - this._x < -5)
         {
            this.mySpeedRight = (this.intendedX - this._x) / 6;
         }
         if(this.intendedY - this._y > 5 || this.intendedY - this._y < -5)
         {
            this.mySpeedDown = (this.intendedY - this._y) / 6;
         }
         if(this.intendedX - this._x < 5 && this.intendedX - this._x > -5 && this.intendedY - this._y < 5 && this.intendedY - this._y > -5)
         {
            this.targetApproach = false;
         }
      }
      if(this.myStatus.substr(0,5) != "melee" && this.myStatus.substr(0,7) != "unarmed" && this.myStatus != "cover")
      {
         this.targetApproach = false;
      }
   }
   function breakdownStatusActions()
   {
      if(this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack")
      {
         if((this.amPlayer || this.myMission == "engage" || this.myDataRef.myStartup == "startup_bottle") && this.myDataRef.myStartup != undefined && !MadnessTransition.transitionLock)
         {
            this.myStatus = "startup";
            this.mySubStatus = this.myDataRef.myStartup;
            this.myDataRef.myStartup = undefined;
            if(!this.amPlayer && this.myAttackTarget != undefined)
            {
               if(!this.myAttackTarget._x > this._x)
               {
                  this.isFacingRight = true;
               }
               else
               {
                  this.isFacingRight = false;
               }
            }
         }
      }
      if(this.toggleSlowmo && this.myDataRef.myMagic == undefined && this.myHealth > 0 && this.myDataRef.mySlowMo > 0 && (this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack" || this.myStatus == "block" || this.myStatus == "dash" || this.myStatus.substr(0,5) == "melee" || this.myStatus.substr(0,7) == "unarmed") || this.toggleSlowmo && _root.myGameSpeed == 0)
      {
         if(this.slowmoTimer == 0)
         {
            this.slowmoTimer = 1;
            if(this.slowMoActive)
            {
               this.slowMoActive = false;
            }
            else
            {
               this.slowMoActive = true;
            }
         }
      }
      else
      {
         this.slowmoTimer = 0;
      }
      if(this.myDataRef == MadnessRoster.playerRoster.teamLeader && (this.myStatus.substr(0,4) == "stun" || this.myStatus == "dead" || this.myStatus == "knockback"))
      {
         this.slowMoActive = false;
      }
      if(this.myDataRef == MadnessRoster.playerRoster.teamLeader)
      {
         if(this.slowMoActive)
         {
            _root.myGameSpeed = 0;
         }
         else
         {
            _root.myGameSpeed = 1;
         }
      }
      if(this.myStatus == "recover")
      {
         this.mySpeedDown = 0;
         this.mySpeedRight = 0;
      }
      else
      {
         this.invincibleTimer -= 1 + this.myGameSpeed;
      }
      if(this.myStatus == "surrender")
      {
         if(this.myAttackTarget != undefined)
         {
            if(this.myAttackTarget._x > this._x)
            {
               this.isFacingRight = true;
            }
            else
            {
               this.isFacingRight = false;
            }
         }
      }
      if((this.myStatus == "block" || this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack" || this.myStatus == "dash") && this.rofTimer > 10)
      {
         if(this.togglePickup && !this.thrownHook && this.pickupTimer == 0)
         {
            if(this.myDataRef.myWeapons[this.myWeapon] == undefined)
            {
               if(this.targetPickup != undefined)
               {
                  this.targetPickup = this.findClosestPickup(true);
                  if(this.targetPickup != undefined)
                  {
                     this.attractToMC(this.targetPickup,"pickup");
                  }
               }
            }
            else if(this.myDataRef.myWeapons[this.myWeapon].amHeavy)
            {
               this.dropGun();
               this.myStatus = "stun1";
               this.gotoAndStop(this.myStatus);
            }
            else
            {
               this.myStatus = "melee_throw1";
               this.rofTimer = 1;
               this.rofLastFrame = 1;
               if(this.myAimX < this._x)
               {
                  this.isFacingRight = false;
               }
               else
               {
                  this.isFacingRight = true;
               }
            }
         }
         else if(this.toggleGuard)
         {
            if(this.myDataRef.myWeapons[this.myWeapon].melee)
            {
               if(!this.blocking)
               {
                  this.actionTimer = 1;
               }
               else
               {
                  this.actionTimer += 1 + this.myGameSpeed;
                  this.myStatus = "block";
               }
               this.blocking = true;
            }
            else
            {
               if(this.myDataRef.myWeapons[this.myWeapon] == undefined)
               {
                  this.targetObstacle = undefined;
               }
               else
               {
                  this.targetObstacle = this.findClosestObstacle();
               }
               if(this.targetObstacle != undefined && this.amPlayer)
               {
                  this.takeCover(this.targetObstacle);
                  if(this.amPlayer)
                  {
                     KeyManager.lockKeys();
                  }
               }
               else
               {
                  this.myTactics -= 6;
                  this.tacTimer = 0;
                  if(this.myTactics < 0)
                  {
                     this.myTactics = 0;
                  }
                  this.myStatus = "dodge";
                  this.actionTimer = 0;
                  this.actionSlowdown = false;
                  this.mySubStatus = "_leap";
                  if(this.myAimX < this._x && this.isFacingRight || this.myAimX > this._x && !this.isFacingRight)
                  {
                     this.mySubStatus += "Back";
                  }
                  else
                  {
                     this.mySubStatus += "Front";
                  }
                  this.intendedX = this.myAimX;
                  this.intendedY = this.myAimY;
                  if(this.amPlayer)
                  {
                     this.intendedRot = SwainMath.calculate_rotation(this._x,this._y,this.intendedX,this.intendedY);
                  }
                  else
                  {
                     this.intendedRot = SwainMath.randomNumber(-180,180);
                  }
                  this.amDodging = true;
               }
            }
         }
         else
         {
            this.blocking = false;
            if(this.myStatus == "block")
            {
               this.myStatus = "idle";
            }
            if(this.toggleAction && !this.thrownHook && (this.myWeapon == 1 || MadnessDataFile.havePerk("perkSidearm1",this.myDataRef) || this.myDataRef.myWeapons[1] != undefined) && (this.myDataRef.myWeapons[0] != undefined || this.myDataRef.myWeapons[1] != undefined))
            {
               this.myStatus = "swap";
               this.actionTimer = 0;
               if(this.amPlayer)
               {
                  if(this.myDataRef.myWeapons[1 - this.myWeapon].melee)
                  {
                     this.playSound("swapmelee");
                  }
                  else if(this.myDataRef.myWeapons[1 - this.myWeapon] != undefined)
                  {
                     this.playSound("swapgun");
                  }
               }
            }
         }
         if(this.togglePickup)
         {
            this.pickupTimer = this.pickupTimer + 1;
         }
         else
         {
            this.pickupTimer = 0;
         }
      }
      else
      {
         this.blocking = false;
         if(this.myStatus == "block")
         {
            this.myStatus = "idle";
         }
      }
      if(this.myStatus == "cover")
      {
         if(this.targetObstacle._x > this._x)
         {
            this.isFacingRight = true;
         }
         else
         {
            this.isFacingRight = false;
         }
         if(this.amPlayer && (this.moveUp || this.moveDown || this.moveRight || this.moveLeft) || this.toggleGuard)
         {
            if(this.toggleGuard && this.amPlayer)
            {
               KeyManager.lockKeys();
            }
            this.myStatus = "idle";
            this.targetObstacle.inUse = undefined;
            this.targetObstacle = undefined;
         }
      }
      else
      {
         this.targetObstacle = undefined;
      }
      if(this.myStatus == "dodge")
      {
         if(this.actionTimer == 0 && this.mySprite._currentframe < this.mySprite._totalframes)
         {
            this.mySpeedRight = SwainMath.get_position(this._x,this._y,this.intendedRot,this.mySpeed * 1.2,"x") - this._x;
            if(this.mySpeedRight > 0 && this.mySpeedRight < 6)
            {
               this.mySpeedRight = 5.5;
            }
            if(this.mySpeedRight < 0 && this.mySpeedRight > -6)
            {
               this.mySpeedRight = -5.5;
            }
            this.mySpeedDown = SwainMath.get_position(this._x,this._y,this.intendedRot,this.mySpeed * 1.2 * 0.5,"y") - this._y;
         }
         else
         {
            if(this.mySubStatus.substr(0,5) == "_leap")
            {
               if(this.myDataRef.myDodge != undefined)
               {
                  this.mySubStatus = "_" + this.myDataRef.myDodge;
               }
               else if(this.myDataRef.myWeapons[this.myWeapon].amHeavy)
               {
                  this.mySubStatus = "_clumsy";
               }
               else if(MadnessDataFile.havePerk("perkDodge3",this.myDataRef))
               {
                  this.mySubStatus = "_flip";
               }
               else if(MadnessDataFile.havePerk("perkDodge2",this.myDataRef))
               {
                  this.mySubStatus = "_max";
               }
               else
               {
                  this.mySubStatus = "_clumsy";
               }
               if(this.mySpeedRight < 0 && this.isFacingRight || this.mySpeedRight > 0 && !this.isFacingRight)
               {
                  this.mySubStatus += "Back";
               }
               else
               {
                  this.mySubStatus += "Front";
               }
            }
            this.actionTimer = 1;
            if(this.actionSlowdown)
            {
               this.mySpeedDown *= 0.89;
               if(this.mySpeedDown < 1 && this.mySpeedDown > -1)
               {
                  this.mySpeedDown = 0;
               }
               this.mySpeedRight *= 0.89;
               if(this.mySpeedRight < 1 && this.mySpeedRight > -1)
               {
                  this.mySpeedRight = 0;
               }
            }
            if(this.actionSlowdown && this.mySprite._currentframe == this.mySprite._totalframes)
            {
               this.myStatus = "idle";
               this.mySubStatus = "";
            }
         }
      }
      else
      {
         this.amDodging = false;
      }
      if(this.myStatus == "swap" || this.myStatus == "surrender" || this.myStatus == "startup" || this.myStatus == "pickup" || this.myStatus == "magic")
      {
         if(this.mySpeedDown > 0)
         {
            this.mySpeedDown -= this.myAccel * this.slowmoSpeedMod;
            if(this.mySpeedDown < 0)
            {
               this.mySpeedDown = 0;
            }
         }
         if(this.mySpeedDown < 0)
         {
            this.mySpeedDown += this.myAccel * this.slowmoSpeedMod;
            if(this.mySpeedDown > 0)
            {
               this.mySpeedDown = 0;
            }
         }
         if(this.mySpeedRight > 0)
         {
            this.mySpeedRight -= this.myAccel * this.slowmoSpeedMod;
            if(this.mySpeedRight < 0)
            {
               this.mySpeedRight = 0;
            }
         }
         if(this.mySpeedRight < 0)
         {
            this.mySpeedRight += this.myAccel * this.slowmoSpeedMod;
            if(this.mySpeedRight > 0)
            {
               this.mySpeedRight = 0;
            }
         }
      }
      if(this.myStatus == "action")
      {
         this.actionTimer += 1 + this.myGameSpeed;
         this.mySpeedDown = 0;
         this.mySpeedRight = 0;
         if(this.mySprite._currentframe == this.mySprite._totalframes || this.actionTimer > 10 && (this.moveRight || this.moveDown))
         {
            this.myStatus = "idle";
         }
      }
      if(this.myStatus.substr(0,7) == "wounded" && this.wounded == 2)
      {
         this.mySpeedRight = 0;
         this.mySpeedDown = 0;
         if(this.moveRight)
         {
            this.mySpeedRight = 1;
         }
         if(this.moveLeft)
         {
            this.mySpeedRight = -1;
         }
         if(this.moveDown)
         {
            this.mySpeedDown = 0.3;
         }
         if(this.moveUp)
         {
            this.mySpeedDown = -0.3;
         }
      }
      if(this.myStatus.substr(0,4) == "axed")
      {
         this.mySpeedRight = 0;
         this.mySpeedDown = 0;
      }
      if(this.myStatus == "dead")
      {
         if(this.mySubStatus.substr(0,7) == "_stairs")
         {
            if(this.myRoom.amStairs)
            {
               if(this.mySpeedDown < 0)
               {
                  this.mySpeedDown = 0;
               }
               if(this.myRoom.downAngle < 90)
               {
                  if(this.mySpeedRight > 0)
                  {
                     this.mySpeedRight = 0;
                  }
                  if(this.mySpeedRight > -7)
                  {
                     this.mySpeedRight -= 0.5 * this.slowmoSpeedMod;
                  }
                  if(this.mySpeedDown < 7)
                  {
                     this.mySpeedDown += 0.5 * this.slowmoSpeedMod;
                  }
               }
               else
               {
                  if(this.mySpeedRight < 0)
                  {
                     this.mySpeedRight = 0;
                  }
                  if(this.mySpeedRight < 7)
                  {
                     this.mySpeedRight += 0.5 * this.slowmoSpeedMod;
                  }
                  if(this.mySpeedDown < 7)
                  {
                     this.mySpeedDown += 0.5 * this.slowmoSpeedMod;
                  }
               }
               this.lastStairsAngle = this.myRoom.downAngle;
            }
            else
            {
               this.mySpeedDown = 0;
               if(this.isFacingRight && this.lastStairsAngle < 90 || !this.isFacingRight && this.lastStairsAngle >= 90)
               {
                  this.mySubStatus = "_landed3";
               }
               else
               {
                  this.mySubStatus = "_landed" + SwainMath.randomNumber(1,2);
               }
               this.applyDeath();
            }
         }
         else
         {
            if(this.mySubStatus.substr(0,8) == "_stagger")
            {
               this.actionSlowdown = true;
            }
            if(this.mySpeedDown > 0)
            {
               this.mySpeedDown -= 0.65 * this.slowmoSpeedMod;
               if(this.mySpeedDown < 0)
               {
                  this.mySpeedDown = 0;
               }
            }
            if(this.mySpeedDown < 0)
            {
               this.mySpeedDown += 0.65 * this.slowmoSpeedMod;
               if(this.mySpeedDown > 0)
               {
                  this.mySpeedDown = 0;
               }
            }
            if(this.actionSlowdown)
            {
               if(this.mySpeedRight > 0)
               {
                  this.mySpeedRight -= 0.65 * this.slowmoSpeedMod;
                  if(this.mySpeedRight < 0)
                  {
                     this.mySpeedRight = 0;
                  }
               }
               if(this.mySpeedRight < 0)
               {
                  this.mySpeedRight += 0.65 * this.slowmoSpeedMod;
                  if(this.mySpeedRight > 0)
                  {
                     this.mySpeedRight = 0;
                  }
               }
            }
         }
      }
      if(this.myStatus == "incap")
      {
      }
      if(this.myStatus.substr(0,7) == "execute")
      {
         this.mySpeedRight = 0;
         this.mySpeedDown = 0;
      }
      if(this.myStatus == "knockback")
      {
         if(this.actionSlowdown)
         {
            this.mySpeedRight *= 0.92;
            if(this.mySpeedRight < 1 && this.mySpeedRight > -1)
            {
               this.mySpeedRight = 0;
            }
         }
         this.mySpeedDown = 0;
      }
      if(this.myStatus.substr(0,5) == "melee" || this.myStatus.substr(0,4) == "stun" || this.myStatus == "block" || this.myStatus.substr(0,7) == "unarmed" || this.myStatus == "cover")
      {
         if(this.mySpeedDown > 0)
         {
            this.mySpeedDown -= this.myAccel * this.slowmoSpeedMod / 4;
            if(this.mySpeedDown < 0)
            {
               this.mySpeedDown = 0;
            }
         }
         if(this.mySpeedDown < 0)
         {
            this.mySpeedDown += this.myAccel * this.slowmoSpeedMod / 4;
            if(this.mySpeedDown > 0)
            {
               this.mySpeedDown = 0;
            }
         }
         if(this.mySpeedRight > 0)
         {
            this.mySpeedRight -= this.myAccel * this.slowmoSpeedMod / 4;
            if(this.mySpeedRight < 0)
            {
               this.mySpeedRight = 0;
            }
         }
         if(this.mySpeedRight < 0)
         {
            this.mySpeedRight += this.myAccel * this.slowmoSpeedMod / 4;
            if(this.mySpeedRight > 0)
            {
               this.mySpeedRight = 0;
            }
         }
         if(this.myStatus == "block" && (this.moveRight || this.moveLeft || this.moveUp || this.moveDown))
         {
            this.myStatus = "idle";
         }
      }
      if(this.meleeHealthTimer > 0)
      {
         this.meleeHealthTimer -= 1 + _root.myGameSpeed;
         if(this.meleeHealthTimer <= 0)
         {
            this.meleeHealthTimer = 0;
            this.meleeHealth = this.myDataRef.meleeHealth;
         }
      }
      if(this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack" || this.myStatus == "tactics")
      {
         if(this.mySubStatus.substr(0,8) != "_wounded")
         {
            this.mySubStatus = "";
         }
         this.stairsAdjustMove = 0.65;
         if(this.myRoom.amStairs && (this.moveRight || this.moveLeft))
         {
            this.stairsAdjustMove = SwainMath.getRotDistance(90,this.myRoom.downAngle) / 50;
         }
         if(this.moveDown)
         {
            this.mySpeedDown += this.myAccel * this.stairsAdjustMove * this.slowmoSpeedMod;
         }
         else if(this.moveUp)
         {
            this.mySpeedDown -= this.myAccel * this.stairsAdjustMove * this.slowmoSpeedMod;
         }
         else if(this.myStatus != "tactics")
         {
            if(this.mySpeedDown > 0)
            {
               this.mySpeedDown -= this.myAccel * this.slowmoSpeedMod;
               if(this.mySpeedDown < 0)
               {
                  this.mySpeedDown = 0;
               }
            }
            if(this.mySpeedDown < 0)
            {
               this.mySpeedDown += this.myAccel * this.slowmoSpeedMod;
               if(this.mySpeedDown > 0)
               {
                  this.mySpeedDown = 0;
               }
            }
         }
         if(this.myStatus != "tactics")
         {
            if(this.mySpeedDown > this.mySpeed * this.stairsAdjustMove)
            {
               this.mySpeedDown = this.mySpeed * this.stairsAdjustMove;
            }
            if(this.mySpeedDown < (- this.mySpeed) * this.stairsAdjustMove)
            {
               this.mySpeedDown = (- this.mySpeed) * this.stairsAdjustMove;
            }
         }
         if(this.moveRight)
         {
            this.mySpeedRight += this.myAccel * this.slowmoSpeedMod;
         }
         else if(this.moveLeft)
         {
            this.mySpeedRight -= this.myAccel * this.slowmoSpeedMod;
         }
         else
         {
            if(this.mySpeedRight > 0)
            {
               this.mySpeedRight -= this.myAccel * this.slowmoSpeedMod;
               if(this.mySpeedRight < 0)
               {
                  this.mySpeedRight = 0;
               }
            }
            if(this.mySpeedRight < 0)
            {
               this.mySpeedRight += this.myAccel * this.slowmoSpeedMod;
               if(this.mySpeedRight > 0)
               {
                  this.mySpeedRight = 0;
               }
            }
         }
         if(this.mySpeedRight > this.mySpeed)
         {
            this.mySpeedRight = this.mySpeed;
         }
         if(this.mySpeedRight < - this.mySpeed)
         {
            this.mySpeedRight = - this.mySpeed;
         }
         if(this.myStatus != "backtrack")
         {
            this.backtrackTimer = 0;
         }
         if(this.mySpeedRight == 0 && this.mySpeedDown == 0)
         {
            this.backtrackTimer = 0;
            if(this.myStatus != "tactics")
            {
               this.myStatus = "idle";
            }
         }
         else if(this.myStatus != "tactics")
         {
            if(!this.myDataRef.amZombie && !this.myDataRef.amAbom && (this.backtrackTimer < 10 || SwainMath.randomNumber(0,4 * (2 - this.myGameSpeed)) != 0) && (this.mySpeedRight > 0 && !this.isFacingRight && this.myAimX < this._x || this.mySpeedRight < 0 && this.isFacingRight && this.myAimX > this._x))
            {
               this.myStatus = "backtrack";
               if(this.reloadTimer == -1)
               {
                  this.backtrackTimer += 1 + this.myGameSpeed;
               }
            }
            else
            {
               this.myStatus = "run";
            }
         }
      }
      if(this.myStatus == "idle" || this.myStatus == "backtrack" || this.myStatus == "run" || this.myStatus.substr(0,7) == "unarmed" || this.myStatus.substr(0,5) == "melee")
      {
         if(this.dashTimer > 0)
         {
            this.dashTimer = this.dashTimer + 1;
         }
         if(this.dashTimer > this.dashTimeEnable * 100)
         {
            if((this.moveRight || this.moveLeft) && this.dashTimer <= this.dashTimeEnable * 101)
            {
            }
         }
         if(!this.moveRight && !this.moveLeft && this.dashTimer == -1)
         {
            this.dashTimer = 0;
         }
         if((this.moveRight || this.moveLeft) && this.dashTimer == 0)
         {
            this.dashTimer = 1;
         }
         if(this.dashTimer > 0 && this.dashTimer < this.dashTimeEnable * 50 && !this.moveRight && !this.moveLeft)
         {
            this.dashTimer = this.dashTimeEnable * 50;
         }
         if(this.dashTimer > this.dashTimeEnable * 50 && this.dashTimer < this.dashTimeEnable * 51 && (this.moveRight || this.moveLeft) && this.myRoster == MadnessRoster.playerRoster)
         {
            this.myStatus = "dash";
         }
         if(this.dashTimer > this.dashTimeEnable && this.dashTimer < this.dashTimeEnable * 50 || this.dashTimer > this.dashTimeEnable * 51 && this.dashTimer < this.dashTimeEnable * 100 || this.dashTimer > this.dashTimeEnable * 101)
         {
            this.dashTimer = -1;
         }
      }
      if(this.myStatus == "dash")
      {
         this.dashTimer = -1;
         this.stairsAdjustMove = 0.25;
         if(this.myRoom.amStairs && (this.moveRight || this.moveLeft))
         {
            this.stairsAdjustMove = SwainMath.getRotDistance(90,this.myRoom.downAngle) / 35;
         }
         if(this.moveDown)
         {
            this.mySpeedDown += this.myAccel * this.stairsAdjustMove * this.slowmoSpeedMod;
         }
         else if(this.moveUp)
         {
            this.mySpeedDown -= this.myAccel * this.stairsAdjustMove * this.slowmoSpeedMod;
         }
         else
         {
            if(this.mySpeedDown > 0)
            {
               this.mySpeedDown -= this.myAccel * this.slowmoSpeedMod;
               if(this.mySpeedDown < 0)
               {
                  this.mySpeedDown = 0;
               }
            }
            if(this.mySpeedDown < 0)
            {
               this.mySpeedDown += this.myAccel * this.slowmoSpeedMod;
               if(this.mySpeedDown > 0)
               {
                  this.mySpeedDown = 0;
               }
            }
         }
         if(this.mySpeedDown > this.mySpeed * this.stairsAdjustMove)
         {
            this.mySpeedDown = this.mySpeed * this.stairsAdjustMove;
         }
         if(this.mySpeedDown < (- this.mySpeed) * this.stairsAdjustMove)
         {
            this.mySpeedDown = (- this.mySpeed) * this.stairsAdjustMove;
         }
         if(this.moveLeft)
         {
            this.mySpeedRight -= this.myAccel * this.slowmoSpeedMod;
         }
         else if(this.moveRight)
         {
            this.mySpeedRight += this.myAccel * this.slowmoSpeedMod;
         }
         else
         {
            this.myStatus = "idle";
         }
         if(this.mySpeedRight > this.mySpeed * this.myDash)
         {
            this.mySpeedRight = this.mySpeed * this.myDash;
         }
         if(this.mySpeedRight < (- this.mySpeed) * this.myDash)
         {
            this.mySpeedRight = (- this.mySpeed) * this.myDash;
         }
         if(this.myDataRef.amZombie && this.myDataRef.myWeapons[this.myWeapon] != undefined)
         {
            this.dropGun();
            MadnessCharacter.adjustSprite(this);
         }
      }
      if(this.myStatus == "restrained")
      {
         if(this.moveDown || this.moveRight || this.moveLeft || this.moveUp || this.toggleAction || this.toggleGuard || this.mouseClick || this.togglePickup || this.toggleSlowmo)
         {
            if(this.amPlayer)
            {
               KeyManager.lockKeys();
            }
            this.grappleTimer -= 10;
            if(this.myDataRef.grabBreaker)
            {
               this.grappleTimer -= 15;
            }
         }
         var _loc3_ = 0;
         while(_loc3_ < MadnessCharacter.allRosters.length)
         {
            if(MadnessCharacter.allRosters[_loc3_].teamFaction != this.myRoster.teamFaction)
            {
               var _loc4_ = 0;
               while(_loc4_ < MadnessCharacter.allRosters[_loc3_].myActiveMembers.length)
               {
                  if(MadnessCharacter.allRosters[_loc3_].myActiveMembers[_loc4_].mySprite.myAttackTarget == this && MadnessCharacter.allRosters[_loc3_].myActiveMembers[_loc4_].mySprite.myStatus == "grapple")
                  {
                     _loc3_ = 9999;
                     _loc4_ = 9999;
                     break;
                  }
                  if(_loc3_ == MadnessCharacter.allRosters.length - 1 && _loc4_ == MadnessCharacter.allRosters[_loc3_].myActiveMembers.length - 1)
                  {
                     this.myStatus = "idle";
                  }
                  _loc4_ = _loc4_ + 1;
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         if(this.grappleTimer <= 0)
         {
            this.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
            this.playSound("blunt");
         }
         if(this.myMash._alpha < 100 && this.amPlayer)
         {
            this.myMash._alpha += 20;
            if(this.myMash._alpha > 0 && !this.myMash._visible)
            {
               this.myMash.gotoAndPlay(1);
               this.myMash._visible = true;
            }
         }
         this.mySpeedDown = 0;
         this.mySpeedRight = 0;
      }
      else if(this.myMash._alpha > 0)
      {
         this.myMash._alpha -= 20;
         if(this.myMash._alpha <= 0)
         {
            this.myMash._alpha = 0;
            this.myMash.gotoAndStop(1);
            this.myMash._visible = false;
         }
      }
      if(this.myStatus == "grapple")
      {
         this.mySpeedRight = (this.intendedX - this._x) * 0.1;
         this.mySpeedDown = (this.intendedY - this._y) * 0.1;
         if(this.myAttackTarget._x > this._x)
         {
            this.isFacingRight = true;
         }
         else
         {
            this.isFacingRight = false;
         }
         if(this.myAttackTarget.myStatus != "restrained")
         {
            if(this.myAttackTarget.myStatus == "dead" || this.myAttackTarget == undefined)
            {
               this.myStatus = "idle";
            }
            else if(this.targetEnemy.myStatus.substr(0,10) == "stun_parry" && this.targetEnemy.myDataRef.statSTR > this.myDataRef.statSTR + 5)
            {
               this.applyKnockback(this.targetEnemy,3 + this.targetEnemy.myDataRef.statSTR / 8,false);
            }
            else
            {
               this.myStatus = "stun" + SwainMath.randomNumber(1,7);
            }
         }
         else
         {
            this.myAttackTarget.grappleTimer += 0.5;
            if(this.myAttackTarget.grappleTimer > this.myAttackTarget.grappleTimerMax)
            {
               this.myAttackTarget.grappleTimer = this.myAttackTarget.grappleTimerMax;
            }
         }
      }
      if(this.reloadTimer > -1)
      {
         this.reloadTimer += 1 + this.myGameSpeed;
         if(this.myDataRef.myWeapons[this.myWeapon].myCat == "pistol" || this.myDataRef.myWeapons[this.myWeapon].myCat == "revolver")
         {
            if(MadnessDataFile.havePerk("perkPistolReload",this.myDataRef))
            {
               this.reloadTimer = this.reloadTimer + 1;
            }
         }
         else if(this.myDataRef.myWeapons[this.myWeapon].myCat == "smg")
         {
            if(MadnessDataFile.havePerk("perkSMGReload",this.myDataRef))
            {
               this.reloadTimer = this.reloadTimer + 1;
            }
         }
         if(this.myDataRef.myWeapons[this.myWeapon].myCat == "rifle")
         {
            if(MadnessDataFile.havePerk("perkRifleReload",this.myDataRef))
            {
               this.reloadTimer = this.reloadTimer + 1;
            }
         }
         if(this.myDataRef.myWeapons[this.myWeapon].myCat == "shotgun")
         {
            if(MadnessDataFile.havePerk("perkShotgunReload",this.myDataRef))
            {
               this.reloadTimer = this.reloadTimer + 1;
            }
         }
         if(this.reloadTimer >= this.mySprite.handShoot_front.myGun._totalframes && this.reloadTimer >= this.mySprite.handShoot_back.myGun._totalframes)
         {
            this.reloadTimer = -1;
            if(this.myDataRef.myWeapons[this.myWeapon].singleBulletClip)
            {
               this.myDataRef.myWeapons[this.myWeapon].myAmmo += 1;
               this.myDataRef.myWeapons[this.myWeapon].myClips -= 1;
               if(!this.mouseHold && this.myDataRef.myWeapons[this.myWeapon].myAmmo < this.myDataRef.myWeapons[this.myWeapon].myAmmoMax && this.myDataRef.myWeapons[this.myWeapon].myClips > 0)
               {
                  this.reloadTimer = 0;
                  this.rofLastFrame = 1;
               }
            }
            else if(this.myDataRef.myWeapons[this.myWeapon].myAmmo < this.myDataRef.myWeapons[this.myWeapon].myAmmoMax)
            {
               trace("WARNING! Reload on gun " + this.myDataRef.myWeapons[this.myWeapon].myType + " failed, backup initiated (DISABLED)");
            }
         }
         if(this.myStatus != "incap" && this.myStatus != "idle" && this.myStatus != "run" && this.myStatus != "backtrack" && this.myStatus != "dash" && this.myStatus != "cover" && this.myStatus != "tactics")
         {
            this.reloadTimer = -1;
         }
      }
      if(this.myDataRef.myWeapons[this.myWeapon].myClips > 0 && this.reloadTimer == -1 && (this.myStatus == "incap" || this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack" || this.myStatus == "dash" || this.myStatus == "cover") && (this.toggleReload || this.myDataRef.myWeapons[this.myWeapon].myAmmo == 0) && this.rofTimer > this.myDataRef.myWeapons[this.myWeapon].myROF && this.myDataRef.myWeapons[this.myWeapon].myAmmo < this.myDataRef.myWeapons[this.myWeapon].myAmmoMax)
      {
         this.reloadTimer = 0;
         this.rofLastFrame = 1;
      }
      if(this.myDataRef.myMagic != undefined && MadWorld.activeFactions.length > 1)
      {
      }
      if(this.myDataRef.myMagic != undefined && this.myDataRef.mySlowMo >= 20 && (this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack" || this.myStatus == "dash"))
      {
         if(this.toggleSlowmo && this.magicChargeTimer < this.magicLevel2Threshold)
         {
            this.magicChargeTimer = this.magicChargeTimer + 1;
         }
         else if(this.magicChargeTimer > -1)
         {
            if(this.magicChargeTimer >= this.magicLevel2Threshold)
            {
               this.magicLevel = 2;
            }
            else
            {
               this.magicLevel = 1;
            }
            if(this.myAimX < this._x)
            {
               this.isFacingRight = false;
            }
            else
            {
               this.isFacingRight = true;
            }
            this.facingOpposite = false;
            this.myStatus = "magic";
            this.mySubStatus = "_" + this.myDataRef.myMagic + "_" + String(this.magicLevel);
            this.magicChargeTimer = -1;
            this.myDataRef.mySlowMo -= 10 + this.magicLevel * 10;
            if(this.myDataRef.mySlowMo < 0)
            {
               this.myDataRef.mySlowMo = 0;
            }
            if(this.amPlayer)
            {
               KeyManager.lockKey("key_slowmo");
            }
         }
      }
   }
   function breakdownAttack()
   {
      this.lastHitTimer += 1 + this.myGameSpeed;
      if(this.amPlayer)
      {
         this.myAimAI = 0;
      }
      else
      {
         this.myAimAI += SwainMath.randomNumber(-100,100) / 100;
         if(this.myAimAI > (11 - this.myDataRef.traitCombatSkill) * 3)
         {
            this.myAimAI = (11 - this.myDataRef.traitCombatSkill) * 3;
         }
         if(this.myAimAI < (- (11 - this.myDataRef.traitCombatSkill)) * 3)
         {
            this.myAimAI = (- (11 - this.myDataRef.traitCombatSkill)) * 3;
         }
      }
      if(MadnessCharacter.aimingSprite._x == undefined && MadnessCharacter.aimingSprite != undefined)
      {
         this.aimTimer = -1;
         MadnessCharacter.aimingSprite = undefined;
      }
      if(!this.myDataRef.noAimShots && !this.myDataRef.noWieldGuns && this.myAttackTarget == MadnessRoster.playerRoster.teamLeader.mySprite && MadnessCharacter.aimingSprite == undefined && this.reloadTimer == -1 && !this.myDataRef.myWeapons[this.myWeapon].melee && this.myDataRef.myWeapons[this.myWeapon] != undefined && this.myDataRef.myWeapons[this.myWeapon].myAmmo > 0 && this.myRoster != MadnessRoster.playerRoster && this.mouseHold && this.myDataRef.myLevel > 0 && SwainMath.randomNumber(0,(11 - this.myDataRef.traitCombatSkill) * Math.abs(10 - this.myDataRef.myWeapons[this.myWeapon].myROF / 3)) <= 0)
      {
         if(SwainMath.get_distance(this,this.myAttackTarget) < this.myDataRef.myWeapons[this.myWeapon].myRange * 2 || this.myDataRef.noRange && SwainMath.get_distance(this,this.myAttackTarget) < 500)
         {
            if(!this.checkNoRangeMelee())
            {
               MadnessCharacter.aimingSprite = this;
               this.aimTimer = 60 + 220 / (this.myDataRef.myLevel * 3);
               this._parent.createAimReticle(this,this.myAttackTarget);
               this.aimFlash();
            }
         }
      }
      if(this.aimTimer > 0)
      {
         this.aimTimer -= 1 + this.myGameSpeed;
         if(this.aimTimer < 0)
         {
            this.aimTimer = 0;
         }
      }
      if(this.aimTimer > -1)
      {
         if(this.myAttackTarget != MadnessRoster.playerRoster.teamLeader.mySprite || this.myDataRef.myWeapons[this.myWeapon].melee || this.myDataRef.myWeapons[this.myWeapon] == undefined || this.reloadTimer != -1 || this.myStatus != "idle" && this.myStatus != "run" && this.myStatus != "dash" && this.myStatus != "backtrack" && this.myStatus != "tactics")
         {
            this.aimTimer = -1;
            MadnessCharacter.aimingSprite = undefined;
         }
      }
      this.rofTimer += 1 + this.myGameSpeed;
      if(this.slowMoActive && MadnessDataFile.havePerk("perkBulletTime3",this.myDataRef))
      {
         this.rofTimer = this.rofTimer + 1;
      }
      this.rofAdjust = 0;
      if(this.myDataRef.myWeapons[this.myWeapon].myCat == "pistol" || this.myDataRef.myWeapons[this.myWeapon].myCat == "revolver")
      {
         if(MadnessDataFile.havePerk("perkPistolROF2",this.myDataRef))
         {
            this.rofAdjust = this.rofAdjust + 1;
         }
         if(MadnessDataFile.havePerk("perkPistolROF1",this.myDataRef))
         {
            this.rofAdjust = this.rofAdjust + 1;
         }
      }
      if(this.myDataRef.myWeapons[this.myWeapon].myCat == "smg")
      {
         if(MadnessDataFile.havePerk("perkSMGROF",this.myDataRef))
         {
            this.rofAdjust = this.rofAdjust + 1;
         }
      }
      if(this.myDataRef.myWeapons[this.myWeapon].myCat == "shotgun" && this.myDataRef.myWeapons[this.myWeapon].havePump)
      {
         if(MadnessDataFile.havePerk("perkShotgunROF2",this.myDataRef))
         {
            this.rofAdjust += 7;
         }
         if(MadnessDataFile.havePerk("perkShotgunROF1",this.myDataRef))
         {
            this.rofAdjust += 7;
         }
      }
      if(this.rofTimer > this.myDataRef.myWeapons[this.myWeapon].myROF + 3)
      {
         this.smgAimTimer = 1;
      }
      if(MadnessDataFile.havePerk("perkSMGAim2",this.myDataRef) && this.myDataRef.myWeapons[this.myWeapon].myCat == "smg" && this.smgAimTimer > 0.1)
      {
         this.smgAimTimer -= 0.04;
      }
      else if(MadnessDataFile.havePerk("perkSMGAim1",this.myDataRef) && this.myDataRef.myWeapons[this.myWeapon].myCat == "smg" && this.smgAimTimer > 0.4)
      {
         this.smgAimTimer -= 0.02;
      }
      if(this.myStatus.substr(0,5) != "melee")
      {
         this.meleeComboTimer += 1 + this.myGameSpeed;
         if(this.meleeComboTimer > 4)
         {
            this.meleeCombos = 3;
         }
      }
      if(this.myMission == "follow" && this.myRoster.teamLeader == this.myDataRef)
      {
         this.myMission = "patrol";
      }
      if(this.myRoster.teamAttacker == this)
      {
         if(this.myDataRef.myWeapons[this.myWeapon].melee || this.myDataRef.myWeapons[this.myWeapon] == undefined || this.rofTimer >= this.myDataRef.myWeapons[this.myWeapon].myROF - this.rofAdjust)
         {
            this.myRoster.teamAttacker = undefined;
         }
      }
      if(this.reloadTimer == -1 && (this.rofTimer >= this.myDataRef.myWeapons[this.myWeapon].myROF - this.rofAdjust || this.myDataRef.myWeapons[this.myWeapon] == undefined) && (this.mouseHold && this.aimTimer == -1 || this.aimTimer == 0) && (this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "backtrack" || this.myStatus == "dash" || this.myStatus == "cover" || this.myStatus == "tactics" || this.myStatus == "incap") && this.mySubStatus.substr(0,8) != "_wounded" && (!this.myDataRef.myWeapons[this.myWeapon].melee && this.myDataRef.myWeapons[this.myWeapon] != undefined || (this.myDataRef.myWeapons[this.myWeapon] == undefined || this.myDataRef.myWeapons[this.myWeapon].melee) && (!this.moveUp && !this.moveDown && !this.moveRight && !this.moveLeft || (this.moveUp || this.moveDown || this.moveRight || this.moveLeft) && (this.mySpeedRight >= this.mySpeed * 0.7 || this.mySpeedRight <= (- this.mySpeed) * 0.7 || this.mySpeedDown >= this.mySpeed * this.stairsAdjustMove || this.mySpeedDown <= (- this
      .mySpeed) * this.stairsAdjustMove))))
      {
         this.whipRange = false;
         if(this.aimTimer == -1 && this.myDataRef.myWeapons[this.myWeapon].myCat != "melee" && this.myStatus != "incap" && this.myDataRef.myWeapons[this.myWeapon] != undefined)
         {
            this.whipRange = this.checkWhipRange();
         }
         if(this.myDataRef.myWeapons[this.myWeapon] == undefined || this.whipRange)
         {
            if(this.whipRange)
            {
               if(this.myDataRef.myCharacter == "mag")
               {
                  this.myStatus = "unarmed_mag_" + SwainMath.randomNumber(1,2);
                  ItemGenerator.changeUnarmedDamage(this.myDataRef,"unarmed_elite",false);
               }
               else if(this.myDataRef.amZombie || this.myDataRef.amAbom)
               {
                  this.myStatus = "unarmed_zombie_" + SwainMath.randomNumber(1,2);
               }
               else if(this.myDataRef.myWeapons[this.myWeapon].twoHand)
               {
                  this.myStatus = "melee_rifle";
               }
               else
               {
                  this.myStatus = "melee_pistol";
               }
               if(this.myAimX < this._x)
               {
                  this.isFacingRight = false;
               }
               else
               {
                  this.isFacingRight = true;
               }
            }
            else if(this.myStatus == "dash" && !this.myDataRef.amZombie && !this.myDataRef.amAbom)
            {
               this.myStatus = "melee_dash1";
            }
            else
            {
               if(this.myDataRef.amZombie)
               {
                  if(this.myStatus == "dash" && this.myDataRef.myScale == 1)
                  {
                     if(this.myDataRef.autoDash)
                     {
                        this.myStatus = "unarmed_dash_zombie1";
                     }
                     else
                     {
                        this.myStatus = "unarmed_dash_zombie2";
                     }
                  }
                  else if(this.myDataRef.myScale > 1 || this.myDataRef.myLevel > 6 && (this.myAttackTarget.myStatus == "restrained" || SwainMath.randomNumber(0,3) == 0))
                  {
                     this.myStatus = "unarmed_zombie_slam";
                  }
                  else
                  {
                     this.myStatus = "unarmed_zombie_" + SwainMath.randomNumber(1,2);
                  }
               }
               else if(this.myDataRef.amAbom)
               {
                  if(this.myStatus == "dash")
                  {
                     if(this.myDataRef.myScale > 1)
                     {
                        this.myStatus = "melee_dash_mag2";
                     }
                     else if(this.myDataRef.noHands)
                     {
                        this.myStatus = "melee_dash_abom1";
                     }
                     else
                     {
                        this.myStatus = "unarmed_dash_zombie2";
                     }
                  }
                  else if(this.myDataRef.myScale > 1)
                  {
                     this.myStatus = "unarmed_mag_3";
                  }
                  else if(this.myDataRef.noHands)
                  {
                     this.myStatus = "unarmed_abom" + SwainMath.randomNumber(1,2);
                  }
                  else
                  {
                     this.myStatus = "unarmed_zombie_" + SwainMath.randomNumber(1,2);
                  }
               }
               else if(this.myDataRef.improvedChump)
               {
                  this.myStatus = "unarmed_patient_1";
               }
               else if(MadnessDataFile.havePerk("perkUnarmedMoves3",this.myDataRef))
               {
                  if(SwainMath.randomNumber(0,2) == 0)
                  {
                     this.myStatus = "unarmed_brawl_" + SwainMath.randomNumber(1,4);
                  }
                  else if(SwainMath.randomNumber(0,1) == 0)
                  {
                     this.myStatus = "unarmed_savate_" + SwainMath.randomNumber(1,5);
                  }
                  else
                  {
                     this.myStatus = "unarmed_elite_" + SwainMath.randomNumber(1,5);
                  }
               }
               else if(MadnessDataFile.havePerk("perkUnarmedMoves2",this.myDataRef))
               {
                  if(SwainMath.randomNumber(0,1) == 0)
                  {
                     this.myStatus = "unarmed_brawl_" + SwainMath.randomNumber(1,4);
                  }
                  else
                  {
                     this.myStatus = "unarmed_savate_" + SwainMath.randomNumber(1,5);
                  }
               }
               else if(MadnessDataFile.havePerk("perkUnarmedMoves1",this.myDataRef))
               {
                  this.myStatus = "unarmed_brawl_" + SwainMath.randomNumber(1,4);
               }
               else
               {
                  this.myStatus = "unarmed_chump_" + SwainMath.randomNumber(1,2);
               }
               if(this.myAimX < this._x)
               {
                  this.isFacingRight = false;
               }
               else
               {
                  this.isFacingRight = true;
               }
            }
         }
         else if(this.myDataRef.myWeapons[this.myWeapon].melee)
         {
            if(this.myDataRef.amZombie || this.myDataRef.amAbom)
            {
               this.myStatus = "unarmed_zombie_melee1";
               if(this.myAimX < this._x)
               {
                  this.isFacingRight = false;
               }
               else
               {
                  this.isFacingRight = true;
               }
            }
            else if(this.myDataRef.myCharacter == "fatboy")
            {
               this.myStatus = "melee_slam";
               if(this.myAimX < this._x)
               {
                  this.isFacingRight = false;
               }
               else
               {
                  this.isFacingRight = true;
               }
            }
            else if(this.myStatus == "dash")
            {
               this.myStatus = "melee_dash2";
            }
            else
            {
               if(this.meleeCombos > 2)
               {
                  this.meleeCombos = 0;
               }
               this.meleeComboTimer = 0;
               if(MadnessDataFile.havePerk("perkMeleeMoves4",this.myDataRef))
               {
                  if(this.meleeCombos == 0)
                  {
                     this.myStatus = "melee_better" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 1)
                  {
                     this.myStatus = "melee_better" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 2)
                  {
                     this.myStatus = "melee_finish" + SwainMath.randomNumber(1,3);
                  }
               }
               else if(MadnessDataFile.havePerk("perkMeleeMoves3",this.myDataRef))
               {
                  if(this.meleeCombos == 0)
                  {
                     this.myStatus = "melee_better" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 1)
                  {
                     this.myStatus = "melee_better" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 2)
                  {
                     this.myStatus = "melee_better" + SwainMath.randomNumber(1,3);
                  }
               }
               else if(MadnessDataFile.havePerk("perkMeleeMoves2",this.myDataRef))
               {
                  if(this.meleeCombos == 0)
                  {
                     this.myStatus = "melee_basic" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 1)
                  {
                     this.myStatus = "melee_basic" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 2)
                  {
                     this.myStatus = "melee_better" + SwainMath.randomNumber(1,6);
                  }
               }
               else if(MadnessDataFile.havePerk("perkMeleeMoves1",this.myDataRef))
               {
                  if(this.meleeCombos == 0)
                  {
                     this.myStatus = "melee_basic" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 1)
                  {
                     this.myStatus = "melee_basic" + SwainMath.randomNumber(1,6);
                  }
                  if(this.meleeCombos == 2)
                  {
                     this.myStatus = "melee_basic" + SwainMath.randomNumber(1,6);
                  }
               }
               else
               {
                  this.meleeCombos = 2;
                  this.myStatus = "melee_chump" + SwainMath.randomNumber(1,2);
               }
               this.meleeCombos = this.meleeCombos + 1;
               if(this.myAimX < this._x)
               {
                  this.isFacingRight = false;
               }
               else
               {
                  this.isFacingRight = true;
               }
            }
         }
         else if(this.myDataRef.amZombie || this.myDataRef.amAbom)
         {
            this.myStatus = "unarmed_zombie_gun1";
            if(this.myAimX < this._x)
            {
               this.isFacingRight = false;
            }
            else
            {
               this.isFacingRight = true;
            }
         }
         else if(this.myDataRef.myWeapons[this.myWeapon].myAmmo > 0)
         {
            this.recoilTimer = this.myDataRef.myWeapons[this.myWeapon].myDamage * this.myDataRef.myWeapons[this.myWeapon].myShots;
            if(this.myDataRef.myWeapons[this.myWeapon].myCat != "shotgun" && this.myDataRef.myWeapons[this.myWeapon].myCat != "revolver" && this.myDataRef.myWeapons[this.myWeapon].myType != "m203")
            {
               this.ejectShell();
            }
            this.rofTimer = 1;
            this.rofLastFrame = 1;
            if(this.myDataRef.myWeapons[this.myWeapon].myDamageType == "grenade")
            {
               MadnessCharacter.adjustSprite(this);
               this.launchGrenade();
            }
            else
            {
               this.checkAttackHit("","",this.myDataRef.myWeapons[this.myWeapon]);
            }
            if(this.myRoster != MadnessRoster.playerRoster)
            {
               this.myRoster.teamAttacker = this;
               this.myRoster.teamFireScore += this.returnAttackScore();
            }
            if(this.myDataRef.myCharacter.substr(0,3) == "mag")
            {
               this.shakeyCam(6);
            }
            this.myDataRef.myWeapons[this.myWeapon].myAmmo -= 1;
            if(this.aimTimer == 0)
            {
               this.aimTimer = -1;
               MadnessCharacter.aimingSprite = undefined;
            }
            this.playSound(this.myDataRef.myWeapons[this.myWeapon].mySound);
         }
         else if(this.myDataRef.myWeapons[this.myWeapon].myAmmo == 0 && this.amPlayer && this.emptyClipTimer <= 0)
         {
            this.playSound("emptyclip");
            this.emptyClipTimer = this.myDataRef.myWeapons[this.myWeapon].myROF;
         }
         if(this.myDataRef.myWeapons[this.myWeapon] == undefined)
         {
            ItemGenerator.changeUnarmedDamage(this.myDataRef,this.myStatus,MadnessDataFile.havePerk("perkKnockdown2",this.myDataRef));
         }
         else
         {
            ItemGenerator.changeUnarmedDamage(this.myDataRef,"unarmed_brawl",false);
         }
      }
      var _loc2_ = 0;
      while(_loc2_ < this.targetsHit.length)
      {
         this.targetsHit[_loc2_].applyDeath();
         _loc2_ = _loc2_ + 1;
      }
      this.targetsHit = new Array();
      if(this.recoilTimer > 0)
      {
         this.recoilTimer *= 0.8;
      }
      if(this.recoilTimer < 0)
      {
         this.recoilTimer = 0;
      }
      if(this.myStatus == "grapple" && this.myAttackTarget.myStatus == "restrained")
      {
         if(this.myDataRef.amZombie)
         {
            this.myAttackTarget.myTactics -= this.myDataRef.myLevel * 0.07;
            this.myAttackTarget.tacTimer = 0;
            if(this.myAttackTarget.myTactics <= 0)
            {
               this.myAttackTarget.myHealth = 0;
               this.myAttackTarget.noDamage = true;
               this.myAttackTarget.myStatus = "stun_zombie_bite";
               this.myAttackTarget.dropGun();
               this.myStatus = "stun_grapple_zombie";
               this.gotoAndStop(this.myStatus);
            }
         }
         if(this.myDataRef.amAbom)
         {
            if(this.myAttackTarget.myHealth <= 0)
            {
               this.myAttackTarget.noDamage = true;
               this.myAttackTarget.mySubStatus = "_head" + SwainMath.randomNumber(1,4);
               this.myAttackTarget.myStatus = "idle";
               this.myAttackTarget.dropGun();
               this.myAttackTarget.applyDeath();
               this.myStatus = "idle";
               this.gotoAndStop(this.myStatus);
            }
         }
      }
   }
   function refreshStats()
   {
      this.myHealth = this.myDataRef.myHealth;
      this.myHealthMax = this.myDataRef.myHealthMax;
      this.myTactics = this.myDataRef.myTactics;
      this.myTacticsMax = this.myDataRef.myTacticsMax;
      this.mySpeed = this.myDataRef.mySpeed * this.myDataRef.modSpeed;
      this.myAccel = this.myDataRef.myAccel * this.myDataRef.modSpeed;
      this.myDash = this.myDataRef.myDash;
      this.myHeight = this.myDataRef.myHeight;
      this.myWidth = this.myDataRef.myWidth;
      this.myDepth = this.myDataRef.myDepth;
      this.myReload = this.myDataRef.myReload;
      this.myBlood = this.myDataRef.myBlood;
      this.myTacMod = this.myDataRef.modRecharge;
      this.meleeHealth = this.myDataRef.meleeHealth;
      this.refreshArmor();
      this.traitBravery = this.myDataRef.traitBravery;
      this.traitCover = this.myDataRef.traitCover;
      this.traitDistracted = this.myDataRef.traitDistracted;
      this.traitTriggerFinger = this.myDataRef.traitTriggerFinger;
      this.traitCombatSkill = this.myDataRef.traitCombatSkill;
   }
   function refreshArmor()
   {
      this.myHeadArmor = 0;
      this.myBodyArmor = 0;
      if(this.myDataRef.myHat[0].myArmor != undefined)
      {
         this.myHeadArmor += this.myDataRef.myHat[0].myArmor;
      }
      if(this.myDataRef.myMask[0].myArmor != undefined)
      {
         this.myHeadArmor += this.myDataRef.myMask[0].myArmor;
      }
      if(this.myDataRef.myMouth[0].myArmor != undefined)
      {
         this.myHeadArmor += this.myDataRef.myMouth[0].myArmor;
      }
      if(this.myDataRef.myShirt[0].myArmor != undefined)
      {
         this.myBodyArmor += this.myDataRef.myShirt[0].myArmor;
      }
   }
   function applyDeath()
   {
      if(this.myHealth <= 0)
      {
         if(!this.amPlayer && this.myDataRef.myBoss == "")
         {
            this.myDataRef.myHealth = this.myHealth;
         }
         if(this.myDataRef.myBoss != "")
         {
            this.bossEvents("kill_boss");
         }
         if(this.myStatus != "dead" && this.myStatus.substr(0,4) != "axed" && this.wounded < 1 && this.myStatus.substr(0,4) != "stun")
         {
            if(this.myDataRef.myScale > 2)
            {
               this.myWidth = this.myHeight *= 1.5;
            }
            else if(this.myWidth != this.myHeight)
            {
               this.myWidth = this.myHeight;
            }
            if(this.myRoom.amStairs)
            {
               this.myStatus = "dead";
               if(this.isFacingRight && this.myRoom.downAngle < 90 || !this.isFacingRight && this.myRoom.downAngle >= 90)
               {
                  this.mySubStatus = "_stairs2";
               }
               else
               {
                  this.mySubStatus = "_stairs1";
               }
            }
            else
            {
               this.myStatus = "dead";
               this.actionSlowdown = false;
            }
            if(this.myDataRef.fastDeath)
            {
               this.myDataRef.amSlow = false;
            }
            this.intendedTarget = undefined;
            this.pathFind = false;
            this.targetLock = false;
            if(this.myDataRef.myWeapons[this.myWeapon] != undefined)
            {
               this.dropGun();
            }
         }
      }
   }
   function killMe()
   {
      if(this.myDataRef.myObjective != undefined)
      {
         MadnessLevel.completeObjectiveCheck(this.myDataRef,"kill");
      }
      while(this.myDataRef.myEvents.length > 0)
      {
         if(this.myDataRef.myEvents[0].myType == "function")
         {
            this.myDataRef.myEvents[0].myAction();
         }
         this.myDataRef.myEvents.splice(0,1);
      }
      if(!this.amPlayer)
      {
         this.myRoster.removeCharacter(this.myDataRef);
      }
      if(!this.myDataRef.noPaint)
      {
         MadnessLevel.removeNPC(this._parent.myRoomRef,this.myDataRef);
      }
      if(this.myDataRef.myBoss == "")
      {
         this.deadMan = true;
      }
   }
   function paintMe()
   {
      this.myTacBar._visible = false;
      this._parent.drawToBitmap(this,"bmpBodies");
      this.removeMe();
   }
   function removeMe()
   {
      this.myDataRef.mySprite = undefined;
      this.removeMovieClip();
      false;
   }
   function playerControls()
   {
      this.moveUp = false;
      this.moveDown = false;
      this.moveLeft = false;
      this.moveRight = false;
      this.toggleAction = false;
      this.toggleGuard = false;
      this.toggleReload = false;
      this.togglePickup = false;
      this.toggleSlowmo = false;
      if(!MadnessTransition.transitionLock)
      {
         if(KeyManager.keyCounts.key_up > 0 && KeyManager.keyCounts.key_up > KeyManager.keyCounts.key_down)
         {
            this.moveUp = true;
         }
         if(KeyManager.keyCounts.key_down > 0 && KeyManager.keyCounts.key_down > KeyManager.keyCounts.key_up)
         {
            this.moveDown = true;
         }
         if(KeyManager.keyCounts.key_left > 0 && KeyManager.keyCounts.key_left > KeyManager.keyCounts.key_right)
         {
            this.moveLeft = true;
         }
         if(KeyManager.keyCounts.key_right > 0 && KeyManager.keyCounts.key_right > KeyManager.keyCounts.key_left)
         {
            this.moveRight = true;
         }
         if(KeyManager.keyCounts.key_action > 0)
         {
            this.toggleAction = true;
         }
         if(KeyManager.keyCounts.key_guard > 0)
         {
            this.toggleGuard = true;
         }
         if(KeyManager.keyCounts.key_reload > 0)
         {
            this.toggleReload = true;
         }
         if(KeyManager.keyCounts.key_pickup > 0)
         {
            this.togglePickup = true;
         }
         if(KeyManager.keyCounts.key_slowmo > 0)
         {
            this.toggleSlowmo = true;
         }
      }
      if(this.myDataRef.myWeapons[this.myWeapon] == undefined || this.rofTimer >= this.myDataRef.myWeapons[this.myWeapon].myROF - 1 || this.rofTimer <= 1)
      {
         this.myAimX = this._parent._xmouse;
         this.myAimY = this._parent._ymouse;
      }
      this._parent.playerAim._alpha = 50;
      var _loc2_ = SwainMath.get_distance2(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),this._parent._xmouse,this._parent._ymouse);
      var _loc4_ = 0;
      if(this.myDataRef.myWeapons[this.myWeapon].myCat == "smg")
      {
         if(MadnessDataFile.havePerk("perkSMGRange",this.myDataRef))
         {
            _loc4_ += 40;
         }
      }
      if(this.myDataRef.myWeapons[this.myWeapon].myCat == "rifle")
      {
         if(MadnessDataFile.havePerk("perkRifleRange1",this.myDataRef))
         {
            _loc4_ += 30;
         }
         if(MadnessDataFile.havePerk("perkRifleRange2",this.myDataRef))
         {
            _loc4_ += 30;
         }
      }
      if(this.myDataRef.myWeapons[this.myWeapon] == undefined && _loc2_ > this.myDataRef.myUnarmed.myRange)
      {
         _loc2_ = this.myDataRef.myUnarmed.myRange - 10;
      }
      else if(this.myDataRef.myWeapons[this.myWeapon].melee && _loc2_ > this.myDataRef.myWeapons[this.myWeapon].myRange - 10)
      {
         _loc2_ = this.myDataRef.myWeapons[this.myWeapon].myRange - 10;
      }
      else if(_loc2_ > this.myDataRef.myWeapons[this.myWeapon].myRange + this.myDataRef.modRange + 45 + _loc4_)
      {
         _loc2_ = this.myDataRef.myWeapons[this.myWeapon].myRange + this.myDataRef.modRange + 45 + _loc4_;
      }
      var _loc3_ = this.myDataRef.myWeapons[this.myWeapon].mySpread / 30 * 100 * (_loc2_ / 100);
      if(this.mySpeedRight == 0 && this.mySpeedDown == 0)
      {
         if(this.myDataRef.myWeapons[this.myWeapon].myCat == "rifle" && MadnessDataFile.havePerk("perkRifleAccuracy",this.myDataRef))
         {
            _loc3_ *= 0.3;
         }
         if(this.myDataRef.myWeapons[this.myWeapon].myCat == "pistol")
         {
            if(MadnessDataFile.havePerk("perkPistolAccuracy2",this.myDataRef))
            {
               _loc3_ *= 0.3;
            }
            else if(MadnessDataFile.havePerk("perkPistolAccuracy1",this.myDataRef))
            {
               _loc3_ *= 0.6;
            }
         }
      }
      this._parent.playerAim._x = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),this._parent._xmouse,this._parent._ymouse),_loc2_,"x");
      this._parent.playerAim._y = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),this._parent._xmouse,this._parent._ymouse),_loc2_,"y");
      this._parent.playerAim._rotation = SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight,this._parent.playerAim._x,this._parent.playerAim._y);
      this._parent.playerAim.aimLine._yscale = _loc2_;
      if(_loc3_ <= 33 && !this.myDataRef.myWeapons[this.myWeapon].melee && this.myDataRef.myWeapons[this.myWeapon] != undefined)
      {
         this._parent.playerAim.aimTarget._xscale = 100 * (_loc3_ / 33);
         if(this._parent.playerAim.aimTarget._xscale < 50)
         {
            this._parent.playerAim.aimTarget._xscale = 50;
         }
         this._parent.playerAim.aimTarget._yscale = this._parent.playerAim.aimTarget._xscale;
      }
      else
      {
         this._parent.playerAim.aimTarget._xscale = 100;
         this._parent.playerAim.aimTarget._yscale = this._parent.playerAim.aimTarget._xscale;
      }
      if(_loc3_ <= 33)
      {
         this._parent.playerAim.aimTarget.bracketLine._visible = false;
         this._parent.playerAim.aimTarget.bracketL._visible = false;
         this._parent.playerAim.aimTarget.bracketR._visible = false;
      }
      else
      {
         this._parent.playerAim.aimTarget.bracketLine._xscale = _loc3_;
         this._parent.playerAim.aimTarget.bracketLine._visible = true;
         this._parent.playerAim.aimTarget.bracketL._x = (- _loc3_) / 2;
         this._parent.playerAim.aimTarget.bracketL._visible = true;
         this._parent.playerAim.aimTarget.bracketR._x = _loc3_ / 2;
         this._parent.playerAim.aimTarget.bracketR._visible = true;
      }
   }
   function mouseDown()
   {
      if(!this._parent.paused && !this.targetLock && !this.mouseLock)
      {
         if(this.mouseTimer == -1)
         {
            this.mouseTimer = 0;
            this.mouse2x = false;
         }
         else
         {
            this.mouse2x = true;
         }
         this.mouseClick = true;
         this.mouseHold = true;
      }
   }
   function mouseUp()
   {
      if(!this._parent.paused)
      {
         this.mouseClick = false;
         this.mouseHold = false;
         this.mouseReleaseTimer = 0;
      }
      if(this.mouseLock)
      {
         this.mouseLock = false;
      }
   }
   function checkDamage(inWeapon, inAttacker, inHitX, inHitY, inRangeGood, inHeadshot)
   {
      var _loc12_ = inHeadshot;
      var _loc3_ = inWeapon.myDamage;
      if(_loc12_)
      {
         if(inWeapon.myType != "unarmed")
         {
            _loc3_ -= this.myDataRef.myNaturalArmorHead;
            if(_loc3_ < 1)
            {
               _loc3_ = 1;
            }
         }
         if(!MadnessDataFile.havePerk("perkArmorPierce",inAttacker.myDataRef) || this.myDataRef.myHat[0].myWeight == "heavy")
         {
            _loc3_ -= this.myHeadArmor;
         }
      }
      else
      {
         if(inWeapon.myType != "unarmed")
         {
            _loc3_ -= this.myDataRef.myNaturalArmorBody;
            if(_loc3_ < 1)
            {
               _loc3_ = 1;
            }
         }
         if(!MadnessDataFile.havePerk("perkArmorPierce",inAttacker.myDataRef) || this.myDataRef.myShirt[0].myWeight == "heavy")
         {
            _loc3_ -= this.myBodyArmor;
         }
      }
      if(inWeapon.myCat == "shotgun" && MadnessDataFile.havePerk("perkShotgunDamage",inAttacker.myDataRef) && SwainMath.get_distance(this,inAttacker) < 120)
      {
         _loc3_ *= 1.3;
      }
      if(!_loc12_ && this.myDataRef.amZombie && !inWeapon.melee)
      {
         _loc3_ *= 0.8;
      }
      if(this.myDataRef.amZombie && inWeapon.melee)
      {
         _loc3_ *= 1.4;
      }
      if(_loc3_ < 0)
      {
         _loc3_ = 0;
      }
      if(this.myRoster == MadnessRoster.playerRoster && MadnessGameSelect.gameMode == "story")
      {
         _loc3_ *= MadnessCharacter.damageDifficultyMod;
      }
      if(inAttacker.myDataRef != undefined)
      {
         if(inWeapon.myType == "melee")
         {
            _loc3_ *= inAttacker.myDataRef.modDmg;
         }
         if(inWeapon.myType == "unarmed")
         {
            _loc3_ *= inAttacker.myDataRef.modDmg / 3;
         }
      }
      if(!inRangeGood)
      {
         _loc3_ *= 0.5;
      }
      _loc3_ *= this.myDataRef.modArmor;
      if(MadnessDataFile.havePerk("perkStunProof1",this.myDataRef) && _loc3_ <= 6 && _loc3_ > 0)
      {
         _loc3_ = 1;
      }
      var _loc17_ = 1;
      if(!this.isFacingRight)
      {
         _loc17_ = -1;
      }
      var _loc4_ = new Object();
      _loc4_.myAge = 0;
      var _loc18_ = SwainMath.randomNumber(120,200) / 100;
      if(this.myDataRef.amSpecial || inWeapon.myCat == "melee")
      {
         _loc18_ = 1;
      }
      if(inWeapon.myDamageType == "burn")
      {
         _loc4_.myType = inWeapon.myDamageType;
      }
      else
      {
         _loc4_.myType = inWeapon.myDamageType + "_" + this.myBlood;
      }
      _loc4_.myVariant = SwainMath.randomNumber(1,5);
      _loc4_.myScale = 1 / this.myDataRef.myScale;
      var _loc11_ = new Object();
      _loc11_.x = inHitX;
      _loc11_.y = inHitY;
      this._parent.localToGlobal(_loc11_);
      this.globalToLocal(_loc11_);
      this.localToGlobal(_loc11_);
      if(_loc3_ > 0)
      {
         this.lastHitTimer = 0;
         if(_loc12_)
         {
            this.myDataRef.headWounds.push(_loc4_);
            this.mySprite.myHead.globalToLocal(_loc11_);
            _loc4_.myX = _loc11_.x;
            _loc4_.myY = _loc11_.y;
            _loc4_.myRotation = SwainMath.calculate_rotation(_loc4_.myX,_loc4_.myY,0,0);
         }
         else
         {
            this.myDataRef.bodyWounds.push(_loc4_);
            this.mySprite.myBody.globalToLocal(_loc11_);
            _loc4_.myX = _loc11_.x;
            _loc4_.myY = _loc11_.y;
            _loc4_.myRotation = SwainMath.randomNumber(-110,-80);
            if(_loc4_.myX < 0)
            {
               _loc4_.myRotation += 180;
            }
         }
         if(inWeapon.myCat == "melee" && inWeapon.myTag != "Unarmed" && inWeapon.broken == true)
         {
            _loc4_.myType = "hilt_" + this.myBlood;
            _loc4_.myVariant = inWeapon.myType;
            inWeapon.myHealth = 0;
            if(this.myHealth < 50 && this.myDataRef.myBoss == "" && !this.myDataRef.bulletEater)
            {
               this.myHealth = 0;
               _loc3_ = 1;
            }
         }
      }
      else
      {
         this.makeSparks(inHitX,inHitY,3,"sparks");
         this.blockBullet(inAttacker,inHitX,inHitY,inWeapon);
      }
      var _loc19_ = this.headDamage;
      var _loc20_ = this.bodyDamage;
      if(_loc3_ > 0)
      {
         if(_loc12_)
         {
            if(MadnessDataFile.havePerk("perkHeadshotCrits",inAttacker.myDataRef))
            {
               _loc3_ *= _loc18_;
               _loc4_.myDamage = _loc3_;
            }
            this.myHealth -= _loc3_;
            if(this.myHealth <= 0 && !this.myDataRef.bulletEater && !this.myDataRef.headGearResurrect && (!this.noDamage || this.totalFrameDamage > 0))
            {
               var _loc16_ = SwainMath.randomNumber(-3,_loc3_ / 4);
               if(_loc16_ > 0)
               {
                  this.headSpray += _loc16_;
               }
               _loc16_ = SwainMath.randomNumber(-1,1) / 2;
               if(_loc16_ > 0 && this.headSpray > 0)
               {
                  this.bodySpray += _loc16_;
               }
               if(SwainMath.randomNumber(0,2) == 0 && !this.myDataRef.bulletEater)
               {
                  _loc16_ = Math.floor(SwainMath.randomNumber(-2,_loc3_ + this.totalFrameDamage) / 4);
                  if(_loc16_ > 0)
                  {
                     this.headDamage += _loc16_;
                  }
               }
               if(this.headDamage > 0)
               {
                  this.splatterCharacter(this.headDamage,this.myBlood,inAttacker._x > this._x,this._x,this._y - 70,true);
               }
            }
            else if(inWeapon.myDamageType.substr(0,6) == "bullet" && !this.myDataRef.bulletEater && !this.myDataRef.amZombie && (!this.noDamage || this.totalFrameDamage > 0))
            {
               _loc4_.myType = "scratch_" + this.myBlood;
               _loc4_.myVariant = SwainMath.randomNumber(1,3);
               if(SwainMath.get_distance2(_loc4_.myX,_loc4_.myY,0,0) <= 10)
               {
                  _loc4_.myRotation = SwainMath.calculate_rotation(inAttacker._x,inAttacker._y - this.myDataRef.myShootHeight * (this._yscale / 100),inHitX,inHitY) * _loc17_;
               }
            }
         }
         else
         {
            this.myHealth -= _loc3_;
            _loc4_.myDamage = _loc3_;
            if(this.myHealth < this.myHealthMax * 0.5 && !this.myDataRef.bulletEater && !this.myDataRef.headGearResurrect && (!this.noDamage || this.totalFrameDamage > 0))
            {
               _loc16_ = SwainMath.randomNumber(-3,(_loc3_ + this.totalFrameDamage) / 4);
               if(_loc16_ > 0)
               {
                  this.bodySpray += _loc16_;
               }
               _loc16_ = SwainMath.randomNumber(-1,1) / 2;
               if(_loc16_ > 0 && this.bodySpray > 0)
               {
                  this.headSpray += _loc16_;
               }
            }
            if(this.myHealth <= 0 && (!this.noDamage || this.totalFrameDamage > 0))
            {
               if(SwainMath.randomNumber(0,2) == 0 && !this.myDataRef.bulletEater)
               {
                  _loc16_ = Math.floor(SwainMath.randomNumber(-2,_loc3_) / 4);
                  if(_loc16_ > 0)
                  {
                     this.bodyDamage += _loc16_;
                  }
               }
               if(this.bodyDamage > 0)
               {
                  this.splatterCharacter(this.bodyDamage,this.myBlood,inAttacker._x > this._x,this._x,this._y - 70,false);
               }
            }
            else if(!inRangeGood && !this.myDataRef.bulletEater && !this.noDamage)
            {
               _loc4_.myType = "fleck_" + this.myBlood;
               _loc4_.myVariant = SwainMath.randomNumber(1,5);
            }
         }
         if(!this.noDamage && inWeapon.myType != "unarmed")
         {
            if(_loc3_ < 10)
            {
               this._parent.createEffect(inHitX,inHitY,"blood" + String(SwainMath.randomNumber(1,3)) + "_" + this.myBlood,60,110,SwainMath.calculate_rotation(inHitX,inHitY,inAttacker._x,inAttacker._y - this.myDataRef.myShootHeight * (this._yscale / 100)));
            }
            else
            {
               this._parent.createEffect(inHitX,inHitY,"blood" + String(SwainMath.randomNumber(4,6)) + "_" + this.myBlood,60,110,SwainMath.calculate_rotation(inHitX,inHitY,inAttacker._x,inAttacker._y - this.myDataRef.myShootHeight * (this._yscale / 100)));
            }
            var _loc8_ = 0;
            while(_loc8_ < SwainMath.randomNumber(2,_loc3_ / 3))
            {
               inAttacker.makeSparks(inHitX,inHitY,this._y,"drops_" + this.myDataRef.myBlood);
               _loc8_ = _loc8_ + 1;
            }
         }
         if((this.myDataRef.bulletEater || this.myDataRef.amZombie || this.myDataRef.headGearResurrect) && !this.noDamage)
         {
            if(SwainMath.randomNumber(1,_loc3_ / 4) >= 4 & SwainMath.randomNumber(0,2) != 0)
            {
               this.splatterCharacter(_loc3_ / 5,this.myBlood,inAttacker._x > this._x,inHitX,inHitY,false);
            }
            if(_loc4_.myType.substr(0,4) != "hilt" && _loc4_.myType.substr(0,5) != "punch" && _loc4_.myType.substr(0,5) != "blunt" && _loc4_.myType.substr(0,5) != "blade")
            {
               if(SwainMath.randomNumber(0,1) == 0)
               {
                  _loc4_.myType = "bullet_" + this.myBlood;
                  _loc4_.myVariant = SwainMath.randomNumber(1,5);
               }
               else if(SwainMath.randomNumber(0,1) == 0)
               {
                  _loc4_.myType = "fleck_" + this.myBlood;
                  _loc4_.myVariant = SwainMath.randomNumber(1,5);
               }
               else
               {
                  _loc4_.myType = "scratch_" + this.myBlood;
                  _loc4_.myVariant = SwainMath.randomNumber(1,3);
               }
            }
            if(_loc12_)
            {
               if(this.myHealth < this.myHealthMax / 1.7 && (!this.myDataRef.fastDeteriorate && SwainMath.randomNumber((- this.myHealthMax) / 9,_loc3_) > 0 || this.myDataRef.fastDeteriorate && SwainMath.randomNumber((- this.myHealthMax) / 20,_loc3_) > 0))
               {
                  this.headDamage = this.headDamage + 1;
               }
               else if(this.myDataRef.headGearResurrect && this.myHealth <= 0)
               {
                  this.headDamage = this.headDamage + 1;
               }
               if(SwainMath.randomNumber(0,this.myHealthMax / 50) == 0)
               {
                  this.headSpray = this.headSpray + 1;
               }
            }
            else
            {
               if(this.myHealth < this.myHealthMax / 1.7 && SwainMath.randomNumber((- this.myHealthMax) / 9,_loc3_) > 0)
               {
                  this.bodyDamage = this.bodyDamage + 1;
               }
               if(SwainMath.randomNumber(0,this.myHealthMax / 50) == 0)
               {
                  this.bodySpray = this.bodySpray + 1;
               }
            }
         }
      }
      var _loc15_ = false;
      if(!_loc12_ && this.myDataRef.myShirt[0].destructible)
      {
         if(this.myDataRef.myShirt[0].myIntegrity > 0)
         {
            this.myDataRef.myShirt[0].myIntegrity -= 0.5;
            if(this.myDataRef.myShirt[0].myIntegrity == Math.floor(this.myDataRef.myShirt[0].myIntegrity))
            {
               _loc15_ = true;
            }
         }
         if(this.myDataRef.myShirt[0].myIntegrity <= 0)
         {
            this.myDataRef.myShirt[0] = undefined;
            this.myBodyArmor = 0;
         }
      }
      if(_loc12_ && this.myDataRef.myHat[0].destructible)
      {
         if(this.myDataRef.myHat[0].myIntegrity > 0)
         {
            this.myDataRef.myHat[0].myIntegrity -= 0.5;
            if(this.myDataRef.myHat[0].myIntegrity == Math.floor(this.myDataRef.myHat[0].myIntegrity))
            {
               _loc15_ = true;
            }
         }
         if(this.myDataRef.myHat[0].myIntegrity <= 0)
         {
            this.myDataRef.myHat[0] = undefined;
            this.myHeadArmor = 0;
         }
      }
      if(_loc15_)
      {
         var _loc7_ = 0;
         while(_loc7_ < SwainMath.randomNumber(1,2))
         {
            MadWorld.thisWorld.createParticle("metal" + SwainMath.randomNumber(1,6),"metal",inHitX,inHitY,SwainMath.randomNumber(-20,20),SwainMath.randomNumber(-20,0),SwainMath.randomNumber(-179,179),SwainMath.randomNumber(-4,4),0.5,this._y,100,SwainMath.randomNumber(50,80),false,90,null);
            _loc7_ = _loc7_ + 1;
         }
      }
      if(_loc3_ <= 0)
      {
         if(inWeapon.melee)
         {
            if(inWeapon.myDamageType != "punch")
            {
               this.playSound("blockmelee");
            }
            else
            {
               this.playSound("blockmelee");
            }
         }
         else if(!_loc12_ && this.myDataRef.myShirt[0].destructible || _loc12_ && this.myDataRef.myHat[0].destructible)
         {
            this.playSound("clang");
         }
         else
         {
            this.playSound("ricochet");
         }
      }
      else
      {
         if(inWeapon.myDamageType == "blade")
         {
            this.playSound("slash");
         }
         if(inWeapon.myDamageType == "blunt" || inWeapon.myDamageType == "punch")
         {
            this.playSound("blunt");
         }
      }
      if(this.myHealth <= 0)
      {
         if((this.headDamage >= 2 || this.bodyDamage >= 3) && !this.amInjured)
         {
            if(_loc19_ < this.headDamage || _loc20_ < this.bodyDamage)
            {
               this.playSound("injury");
               this.amInjured = true;
            }
         }
      }
      if(this.headSpray >= 4)
      {
         this.headSpray = 4;
      }
      if(this.bodySpray >= 4)
      {
         this.bodySpray = 4;
      }
      if(this.headDamage >= 4)
      {
         this.headDamage = 4;
         this.mySprite.myHead.myHat._visible = false;
         this.mySprite.myHead.myHat2._visible = false;
         this.mySprite.myHead.myMouth._visible = false;
         this.mySprite.myHead.myMask._visible = false;
      }
      if(this.bodyDamage >= 4)
      {
         this.bodyDamage = 4;
      }
      if(this.headDamage > 3 && !this.myDataRef.bulletEater)
      {
         MadnessCharacter.clearWounds(this,"head");
      }
      if(this.bodyDamage > 3 && !this.myDataRef.bulletEater)
      {
         MadnessCharacter.clearWounds(this,"body");
      }
      this.myDataRef.headSpray = this.headSpray;
      this.myDataRef.bodySpray = this.bodySpray;
      this.mySprite.myHead.headSprite.gotoAndStop(1 + this.headDamage * 5);
      this.mySprite.myBody.bodySprite.gotoAndStop(1 + this.bodyDamage * 5);
      _loc7_ = 0;
      while(_loc7_ < this.headSpray)
      {
         this.mySprite.myHead.headSprite.nextFrame();
         _loc7_ = _loc7_ + 1;
      }
      _loc7_ = 0;
      while(_loc7_ < this.bodySpray)
      {
         this.mySprite.myBody.bodySprite.nextFrame();
         _loc7_ = _loc7_ + 1;
      }
      if(this.myStatus != "restrained" && _loc3_ > 0 && this.myHealth > 0 && this.rofTimer > 5 && !this.myDataRef.bulletEater && !(this.myDataRef.amZombie && this.totalFrameDamage + _loc3_ < this.myHealthMax / 20 && !inWeapon.melee) && this.myStatus != "knockback" && !MadnessDataFile.havePerk("perkStunProof2",this.myDataRef) && !(MadnessDataFile.havePerk("perkStunProof1",this.myDataRef) && _loc3_ < 20))
      {
         this.mySprite.gotoAndStop("idle");
         this.myStatus = "stun" + SwainMath.randomNumber(1,7);
         this.mySprite.gotoAndStop(this.myStatus);
      }
      if(this.myHealth > 0 && inAttacker.myStatus.substr(0,10) == "melee_dash" && (this.myDataRef.weakToDash || MadnessDataFile.havePerk("perkStunDash1",inAttacker.myDataRef) && inAttacker.myDataRef.myScale >= this.myDataRef.myScale) && this.myStatus != "knockback")
      {
         this.mySprite.gotoAndStop("idle");
         this.myStatus = "stun_dash";
         this.mySprite.gotoAndStop(this.myStatus);
      }
      if(inWeapon.melee && this.meleeHealth > 0)
      {
         this.meleeHealthHit(inAttacker,inWeapon);
      }
      if(this.myDataRef.amZombie && _loc3_ > 0)
      {
         if(SwainMath.randomNumber(Math.ceil(_loc3_ / 3),10) == 10 || inAttacker.myStatus.substr(0,10) == "melee_dash")
         {
            this.dropGun();
         }
      }
      MadnessCharacter.checkWounds(this);
      if(this.myRoster == MadnessRoster.playerRoster)
      {
         _root.gameMenu.refreshPics();
      }
      if(this.myDataRef.amSpecial && this.myHealth > 0 && _loc3_ > 0 && this.myStatus != "restrained" && this.myTactics < this.myTacticsMax)
      {
         this.myTactics = this.myTacticsMax;
         this.tacTimer = 0;
      }
      this.totalFrameDamage += _loc3_;
      if(this.myStatus == "dead" && this.mySpeedRight != 0)
      {
         this.mySpeedRight *= 1.3;
      }
      this.triggerBossFlee(_loc3_);
      if((this.myDataRef.headGearResurrect || this.myDataRef.amZombie) && this.headDamage >= 4)
      {
         this.myHealth = 0;
      }
      if(this.myHealth <= 0 && !this.noDamage)
      {
         this.noDamage = true;
         if(this.myDataRef.noHands && this.headDamage < 4 && this.bodyDamage < 4)
         {
            this.myDataRef.healMeMinor();
            this.refreshStats();
            this.noDamage = false;
            this.applyKnockback(inAttacker,5,false);
            this.myDataRef.noDodge = false;
         }
         else if(this.myDataRef.headGearResurrect && this.headDamage < 4)
         {
            this.resurrectionDeath(inAttacker);
         }
         else if(_loc12_)
         {
            if(SwainMath.randomNumber(-2,Math.floor(this.totalFrameDamage / 7)) <= 0 && this.mySubStatus.substr(0,4) != "_fly" && this.myStatus != "knockback")
            {
               this.mySpeedRight = 0;
               if(SwainMath.randomNumber(0,4) == 0 && this.headDamage <= 2 && this.mySubStatus.substr(0,8) != "_stagger")
               {
                  this.mySubStatus = "_stagger_head" + SwainMath.randomNumber(1,2);
                  this.noDamage = false;
               }
               else
               {
                  var _loc14_ = this._parent.myRooms[0];
                  var _loc13_ = this._parent.myRooms[this._parent.myRooms.length - 1];
                  if(this._x < _loc14_.myDL._x + (_loc14_.myUL._x - _loc14_.myDL._x) * ((this._y - _loc14_.myUL._y) / (_loc14_.myDL._y - _loc14_.myUL._y)) + 60 && inAttacker._x > this._x && this.isFacingRight || this._x > _loc13_.myUR._x + (_loc13_.myDR._x - _loc13_.myUR._x) * ((this._y - _loc13_.myUR._y) / (_loc13_.myDR._y - _loc13_.myUR._y)) - 60 && inAttacker._x < this._x && !this.isFacingRight)
                  {
                     this.mySubStatus = "_wall1";
                  }
                  else
                  {
                     this.mySubStatus = "_head" + SwainMath.randomNumber(1,4);
                  }
               }
            }
            else
            {
               if(!this.enemyInFront(inAttacker) && this.myStatus != "knockback")
               {
                  this.mySubStatus = "_trip1";
               }
               else
               {
                  this.mySubStatus = "_fly" + SwainMath.randomNumber(3,4);
               }
               if(inAttacker._x > this._x)
               {
                  this.mySpeedRight -= 2 + SwainMath.randomNumber(this.totalFrameDamage / 15,this.totalFrameDamage / 9);
               }
               else
               {
                  this.mySpeedRight += 2 + SwainMath.randomNumber(this.totalFrameDamage / 15,this.totalFrameDamage / 9);
               }
            }
         }
         else if(this.mySubStatus.substr(0,8) != "_stagger" || this.bodyDamage > 0)
         {
            if(SwainMath.randomNumber(-2,Math.ceil(this.totalFrameDamage / 7)) <= 0 && this.bodyDamage == 0 && this.mySubStatus.substr(0,4) != "_fly" && this.myStatus != "knockback")
            {
               this.mySpeedRight = 0;
               if(SwainMath.randomNumber(0,2) > 0)
               {
                  this.mySubStatus = "_body" + SwainMath.randomNumber(1,4);
               }
               else
               {
                  this.mySubStatus = "_stagger_body" + SwainMath.randomNumber(1,4);
                  this.noDamage = false;
               }
            }
            else
            {
               if(this._y - inHitY <= 25)
               {
                  if(this.enemyInFront(inAttacker))
                  {
                     this.mySubStatus = "_trip1";
                  }
                  else
                  {
                     this.mySubStatus = "_fly" + SwainMath.randomNumber(3,4);
                  }
               }
               else
               {
                  _loc14_ = this._parent.myRooms[0];
                  _loc13_ = this._parent.myRooms[this._parent.myRooms.length - 1];
                  if(this._x < _loc14_.myDL._x + (_loc14_.myUL._x - _loc14_.myDL._x) * ((this._y - _loc14_.myUL._y) / (_loc14_.myDL._y - _loc14_.myUL._y)) + 120 && inAttacker._x > this._x && this.isFacingRight || this._x > _loc13_.myUR._x + (_loc13_.myDR._x - _loc13_.myUR._x) * ((this._y - _loc13_.myUR._y) / (_loc13_.myDR._y - _loc13_.myUR._y)) - 120 && inAttacker._x < this._x && !this.isFacingRight)
                  {
                     this.mySubStatus = "_wall2";
                  }
                  else
                  {
                     this.mySubStatus = "_fly" + SwainMath.randomNumber(1,2);
                  }
               }
               if(inAttacker._x > this._x)
               {
                  this.mySpeedRight -= 3 + SwainMath.randomNumber(this.totalFrameDamage / 13,this.totalFrameDamage / 8);
               }
               else
               {
                  this.mySpeedRight += 3 + SwainMath.randomNumber(this.totalFrameDamage / 13,this.totalFrameDamage / 8);
               }
            }
         }
         if(this.myHealth <= 0)
         {
            this.myStatus = "idle";
         }
         this.applyDeath();
      }
   }
   static function clearWounds(inChar, inCategory)
   {
      var _loc1_ = new Number();
      if(inCategory == "head")
      {
         while(inChar.mySprite.myHead.myPart["wound" + String(_loc1_)] != undefined)
         {
            inChar.mySprite.myHead.myPart["wound" + String(_loc1_)].removeMovieClip();
            _loc1_ = _loc1_ + 1;
         }
      }
      else
      {
         while(inChar.mySprite.myBody.myPart["wound" + String(_loc1_)] != undefined)
         {
            inChar.mySprite.myBody.myPart["wound" + String(_loc1_)].removeMovieClip();
            _loc1_ = _loc1_ + 1;
         }
      }
   }
   static function checkWounds(inChar)
   {
      var _loc2_ = 0;
      while(_loc2_ < inChar.myDataRef.bodyWounds.length)
      {
         if(inChar.mySprite.myBody.myPart["wound" + String(_loc2_)] == undefined)
         {
            inChar.mySprite.myBody.myPart.attachMovie("madness_wound","wound" + String(_loc2_),inChar.mySprite.myBody.myPart.getNextHighestDepth());
            inChar.mySprite.myBody.myPart["wound" + String(_loc2_)]._x = inChar.myDataRef.bodyWounds[_loc2_].myX;
            inChar.mySprite.myBody.myPart["wound" + String(_loc2_)]._y = inChar.myDataRef.bodyWounds[_loc2_].myY;
            inChar.mySprite.myBody.myPart["wound" + String(_loc2_)]._rotation = inChar.myDataRef.bodyWounds[_loc2_].myRotation;
            inChar.mySprite.myBody.myPart["wound" + String(_loc2_)].gotoAndStop(inChar.myDataRef.bodyWounds[_loc2_].myType);
            inChar.mySprite.myBody.myPart["wound" + String(_loc2_)].myWound.gotoAndStop(inChar.myDataRef.bodyWounds[_loc2_].myVariant);
            inChar.mySprite.myBody.myPart["wound" + String(_loc2_)]._xscale *= inChar.myDataRef.bodyWounds[_loc2_].myScale;
            inChar.mySprite.myBody.myPart["wound" + String(_loc2_)]._yscale *= inChar.myDataRef.bodyWounds[_loc2_].myScale;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(inChar.headDamage <= 3)
      {
         _loc2_ = 0;
         while(_loc2_ < inChar.myDataRef.headWounds.length)
         {
            if(inChar.mySprite.myHead.myPart["wound" + String(_loc2_)] == undefined)
            {
               inChar.mySprite.myHead.myPart.attachMovie("madness_wound","wound" + String(_loc2_),inChar.mySprite.myHead.myPart.getNextHighestDepth());
               inChar.mySprite.myHead.myPart["wound" + String(_loc2_)]._x = inChar.myDataRef.headWounds[_loc2_].myX;
               inChar.mySprite.myHead.myPart["wound" + String(_loc2_)]._y = inChar.myDataRef.headWounds[_loc2_].myY;
               inChar.mySprite.myHead.myPart["wound" + String(_loc2_)]._rotation = inChar.myDataRef.headWounds[_loc2_].myRotation;
               inChar.mySprite.myHead.myPart["wound" + String(_loc2_)].gotoAndStop(inChar.myDataRef.headWounds[_loc2_].myType);
               inChar.mySprite.myHead.myPart["wound" + String(_loc2_)].myWound.gotoAndStop(inChar.myDataRef.headWounds[_loc2_].myVariant);
               inChar.mySprite.myHead.myPart["wound" + String(_loc2_)]._xscale *= inChar.myDataRef.headWounds[_loc2_].myScale;
               inChar.mySprite.myHead.myPart["wound" + String(_loc2_)]._yscale *= inChar.myDataRef.headWounds[_loc2_].myScale;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function checkAttackHit(inMeleeDir, inMeleeType, inWeapon)
   {
      // 21/11/2026 dyzqy: From what I understand, this is used to check if a bullet has hit a target. Since there aren't small targets, this could be increased(to lower expensive hit test calculations)
      //            (TODO) Or, if I am crazy enough, I *could* technically divide the level in chuncks, and only check the hitTest if there is a Grunt(I will be using this term for "characters") in that chunck
      //                   Original: 3, 7
      this.bulletCheckDistance = SwainMath.randomNumber(5, 9);
      var _loc6_ = undefined;
      var _loc22_ = undefined;
      var _loc21_ = undefined;
      var _loc9_ = new Number();
      this.targetsHit = new Array();
      this.targetsTac = new Array();
      this.myBlasts = new Array();
      var _loc2_ = inWeapon;
      MadnessCharacter.adjustSprite(this);
      var _loc26_ = _loc2_.myShots;

      // 21/11/2026 dyzqy: Compacted this if statement since everything counts(it hurts seeing stuff like this existing in the code)
      //            (TODO) technically can make the statement(latter part) itself into the int, since if it is true it is 1, if false it is 0
      //                   buuuuut we can do that later, I still wanna have my sanity after all :)  
      if(_loc2_.myCat == "shotgun")
      {
         if(MadnessDataFile.havePerk("perkShotgunShots1",this.myDataRef)) _loc26_ = _loc26_ + 1;
         if(MadnessDataFile.havePerk("perkShotgunShots2",this.myDataRef)) _loc26_ = _loc26_ + 1;
      }

      var _loc23_ = 0;
      while(_loc23_ < _loc26_)
      {
         if(!_loc2_.melee)
         {
            this.bulletRotation = SwainMath.randomNumber((- _loc2_.mySpread) * 100,_loc2_.mySpread * 100) / 100;
            this.bulletRotation += this.myAimAI;
         }
         else
         {
            this.bulletRotation = SwainMath.randomNumber(-600,600) / 100;
         }
         if(this.aimTimer == 0)
         {
            this.bulletRotation = 0;
         }
         if(this.mySpeedRight == 0 && this.mySpeedDown == 0 && (_loc2_.myCat == "pistol" || _loc2_.myCat == "revolver"))
         {
            if(MadnessDataFile.havePerk("perkPistolAccuracy2",this.myDataRef))
            {
               this.bulletRotation *= 0.3;
            }
            else if(MadnessDataFile.havePerk("perkPistolAccuracy1",this.myDataRef))
            {
               this.bulletRotation *= 0.6;
            }
         }
         var _loc7_ = new Number();
         if(_loc2_.myCat == "smg")
         {
            this.bulletRotation *= this.smgAimTimer;
            if(MadnessDataFile.havePerk("perkSMGRange",this.myDataRef))
            {
               _loc7_ += 40;
            }
         }
         if(_loc2_.myCat == "rifle")
         {
            if(MadnessDataFile.havePerk("perkRifleAccuracy",this.myDataRef) && this.mySpeedRight == 0 && this.mySpeedDown == 0)
            {
               this.bulletRotation *= 0.3;
            }
            if(MadnessDataFile.havePerk("perkRifleRange1",this.myDataRef))
            {
               _loc7_ += 30;
            }
            if(MadnessDataFile.havePerk("perkRifleRange2",this.myDataRef))
            {
               _loc7_ += 30;
            }
         }
         var _loc3_ = new Object();
         if(_loc2_.melee || this.myDataRef.myWeapons[this.myWeapon].melee)
         {
            if(!this.isFacingRight)
            {
               this.targetX = this._x + 10;
            }
            else
            {
               this.targetX = this._x - 10;
            }
            this.targetY = this._y - this.myDataRef.myShootHeight * (this._yscale / 100);
         }
         else
         {
            _loc3_.x = 0;
            _loc3_.y = 0;
            if(this.myAimX >= this._x)
            {
               this.mySprite.handShoot_front.myGun.myShootPoint.localToGlobal(_loc3_);
            }
            if(this.myAimX <= this._x)
            {
               this.mySprite.handShoot_back.myGun.myShootPoint.localToGlobal(_loc3_);
            }
            this._parent.globalToLocal(_loc3_);
            this.targetX = _loc3_.x;
            this.targetY = _loc3_.y;
         }
         var _loc16_ = 1;
         if(inMeleeDir == "")
         {
            _loc22_ = 700;
            _loc21_ = 400;
         }
         else
         {
            _loc22_ = _loc2_.myRange * this.myDataRef.myScale;
            _loc21_ = 100;
         }
         if(inMeleeDir == "verylow")
         {
            this.myAimX = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,170,_loc2_.myRange * this.myDataRef.myScale,"x");
            this.myAimY = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,100,_loc2_.myRange * this.myDataRef.myScale,"y");
         }
         else if(inMeleeDir == "low" || this.myDataRef.myScale > 1 && _loc2_.melee)
         {
            this.myAimX = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,80 + 30 * this.myDataRef.myScale,_loc2_.myRange * this.myDataRef.myScale,"x");
            this.myAimY = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,100,_loc2_.myRange * this.myDataRef.myScale,"y");
         }
         else if(inMeleeDir == "mid")
         {
            this.myAimX = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,90,_loc2_.myRange * this.myDataRef.myScale,"x");
            this.myAimY = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,90,_loc2_.myRange * this.myDataRef.myScale,"y");
         }
         else if(inMeleeDir == "high")
         {
            this.myAimX = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,80,_loc2_.myRange * this.myDataRef.myScale,"x");
            this.myAimY = SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,80,_loc2_.myRange * this.myDataRef.myScale,"y");
         }
         if(inMeleeDir != "" && !this.isFacingRight)
         {
            this.myAimX = this._x - (this.myAimX - this._x);
         }
         if(this.myAimX > this._x && this.myAimX < this.targetX || this.myAimX < this._x && this.myAimX > this.targetX)
         {
            this.advanceX = SwainMath.get_position(this.targetX,this.targetY,this.bulletRotation + SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight,this.myAimX,this.myAimY),this.bulletCheckDistance,"x") - this.targetX;
            this.advanceY = SwainMath.get_position(this.targetX,this.targetY,this.bulletRotation + SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight,this.myAimX,this.myAimY),this.bulletCheckDistance,"y") - this.targetY;
         }
         else
         {
            this.advanceX = SwainMath.get_position(this.targetX,this.targetY,this.bulletRotation + SwainMath.calculate_rotation(this.targetX,this.targetY,this.myAimX,this.myAimY),this.bulletCheckDistance,"x") - this.targetX;
            this.advanceY = SwainMath.get_position(this.targetX,this.targetY,this.bulletRotation + SwainMath.calculate_rotation(this.targetX,this.targetY,this.myAimX,this.myAimY),this.bulletCheckDistance,"y") - this.targetY;
         }
         var _loc17_ = 0;
         while(_loc17_ < 5)
         {
            this.targetX += this.advanceX;
            this.targetY += this.advanceY;
            _loc17_ = _loc17_ + 1;
         }
         _loc6_ = false;
         var _loc19_ = 75;
         var _loc5_ = undefined;
         while(!_loc6_ && this.targetX < this._x + _loc22_ && this.targetX > this._x - _loc22_ && this.targetY < this._y + _loc21_ && this.targetY > - _loc21_)
         {
            if(this._parent.bulletWallHit(this.targetX,this.targetY + _loc19_ + SwainMath.randomNumber(-5,5)) && SwainMath.randomNumber(0,_loc2_.mySpread / 2) == 0)
            {
               if(!inWeapon.melee)
               {
                  _loc3_.x = this.targetX;
                  _loc3_.y = this.targetY;
                  this._parent.localToGlobal(_loc3_);
                  var _loc14_ = undefined;
                  _loc14_ = 0;
                  while(_loc14_ < MadnessDoors.allDoors.length)
                  {
                     if(MadnessDoors.allDoors[_loc14_].noBullet.hitTest(_loc3_.x,_loc3_.y,true))
                     {
                        break;
                     }
                     _loc14_ = _loc14_ + 1;
                  }
                  if(_loc14_ == MadnessDoors.allDoors.length)
                  {
                     if(_loc2_.myDamageType.substr(0,6) == "bullet")
                     {
                        this._parent.createSplat(this.targetX,this.targetY,"bullet_" + SwainMath.randomNumber(1,3),SwainMath.calculate_rotation(this._x,this._y,this.targetX,this.targetY));
                     }
                     else
                     {
                        this._parent.createSplat(this.targetX,this.targetY,_loc2_.myDamageType,SwainMath.calculate_rotation(this._x,this._y,this.targetX,this.targetY));
                     }
                  }
               }
               else if(this.myDataRef.myWeapons[this.myWeapon] != undefined)
               {
                  this.playSound("blockmelee");
                  this.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
               }
               var _loc13_ = 0;
               while(_loc13_ < SwainMath.randomNumber(2,this.myDataRef.myWeapons[this.myWeapon].myDamage / 5))
               {
                  this.makeSparks(this.targetX,this.targetY,this.targetY + _loc19_,"sparks");
                  _loc13_ = _loc13_ + 1;
               }
               this.targetX -= this.advanceX;
               this.targetY -= this.advanceY;
               _loc6_ = true;
               break;
            }
            if(this._parent.bulletFloorHit(this.targetX,this.targetY))
            {
               this.targetX -= this.advanceX;
               this.targetY -= this.advanceY;
               _loc6_ = true;
               break;
            }
            if(SwainMath.randomNumber(0,2) > 0 && !_loc2_.melee && _loc2_ != undefined)
            {
               var _loc4_ = undefined;
               var _loc11_ = 0;
               while(_loc11_ < MadnessObstacle.allObstacles.length)
               {
                  _loc4_ = MadnessObstacle.allObstacles[_loc11_];
                  if(!_loc4_.destroyed && _loc4_.inUse && _loc4_.inUse.myRoster != this.myRoster)
                  {
                     if(_loc4_.inUse.rofTimer >= _loc4_.inUse.myDataRef.myWeapons[_loc4_.inUse.myWeapon].myROF)
                     {
                        if(_loc4_.myHit.hitTest(this.targetX + this._parent._x,this.targetY + this._parent._y))
                        {
                           _loc4_.hurtMe(_loc2_.myDamage);
                           _loc4_.createSplat(this.targetX - _loc4_._x,this.targetY - _loc4_._y,"bullet_" + SwainMath.randomNumber(1,3),SwainMath.randomNumber(1,5),SwainMath.calculate_rotation(this._x,this._y,this.targetX,this.targetY));
                           _loc13_ = 0;
                           while(_loc13_ < SwainMath.randomNumber(2,this.myDataRef.myWeapons[this.myWeapon].myDamage / 5))
                           {
                              this.makeSparks(this.targetX,this.targetY,_loc4_._y,"sparks");
                              _loc13_ = _loc13_ + 1;
                           }
                           _loc6_ = true;
                           break;
                        }
                     }
                  }
                  _loc11_ = _loc11_ + 1;
               }
            }
            var _loc12_ = false;
            _loc11_ = 0;
            while(_loc11_ < MadnessCharacter.allRosters.length)
            {
               // TODO: Figure out how to approprietly name this thing
               var thing = MadnessCharacter.allRosters[_loc11_];
               if(thing.teamFaction != this.myFaction)
               {
                  _loc13_ = 0;
                  while(_loc13_ < thing.myActiveMembers.length)
                  {
                     this.targetEnemy = thing.myActiveMembers[_loc13_].mySprite;
                     if(this.targetEnemy.myFaction != this.myFaction && this.targetEnemy._x != undefined && !this.targetEnemy.amDodging && this.targetEnemy.myStatus != "recover" && (this.targetEnemy.amPlayer || this.aimTimer == -1))
                     {
                        var _loc8_ = undefined;
                        _loc8_ = 0;
                        while(_loc8_ < this.targetsTac.length)
                        {
                           if(this.targetsTac[_loc8_] == this.targetEnemy)
                           {
                              break;
                           }
                           _loc8_ = _loc8_ + 1;
                        }
                        if(_loc8_ == this.targetsTac.length)
                        {
                           if(this._x < this.targetEnemy._x && this.myAimX >= this._x || this._x > this.targetEnemy._x && this.myAimX <= this._x)
                           {
                              if(!_loc2_.melee || _loc2_.melee && this.inMeleeRange(this.targetEnemy))
                              {
                                 if(SwainMath.randomNumber(1,this.targetEnemy.myDataRef.myScale) == 1)
                                 {
                                    if(!this.targetEnemy.deadMan && this.targetEnemy.myStatus.substr(0,3) != "use" && this.targetEnemy.myStatus != "knockback")
                                    {
                                       // 23/11/2026 dyzqy: Fixed width calculations
                                       if(this.targetX < this.targetEnemy._x + this.targetEnemy.myHeight * (this.targetEnemy._yscale / 100) * 0.5 && this.targetX > this.targetEnemy._x - this.targetEnemy.myHeight * (this.targetEnemy._yscale / 100) * 0.5)
                                       {
                                          if(this.targetY < this.targetEnemy._y && this.targetY > this.targetEnemy._y - this.targetEnemy.myHeight * (this.targetEnemy._yscale / 100))
                                          {
                                             _loc12_ = false;
                                             _loc3_.x = this.targetX;
                                             _loc3_.y = this.targetY;
                                             this._parent.localToGlobal(_loc3_);
                                             // 23/11/2026 dyzqy: Check the bounding box BEFORE checking the actual bounds
                                             if(this.targetEnemy.mySprite.hitTest(_loc3_.x,_loc3_.y,false) && ((this.targetEnemy.headDamage <= 3 || this.targetEnemy.myDataRef.bulletEater) && (_loc12_ = this.targetEnemy.mySprite.myHead.myHit.hitTest(_loc3_.x,_loc3_.y,true)) || this.targetEnemy.mySprite.myBody.myHit.hitTest(_loc3_.x,_loc3_.y,true)))
                                             {
                                                var _loc18_ = SwainMath.randomNumber(0,99999);
                                                if(_loc2_.melee)
                                                {
                                                   this.intendedX = this.targetEnemy._x;
                                                   this.intendedY = this.targetEnemy._y;
                                                   this.targetApproach = true;
                                                   if(this.isFacingRight)
                                                   {
                                                      this.intendedX -= _loc2_.myRange * this.myDataRef.myScale - 40;
                                                   }
                                                   else
                                                   {
                                                      this.intendedX += _loc2_.myRange * this.myDataRef.myScale - 40;
                                                   }
                                                }
                                                _loc5_ = 2;
                                                if(MadnessDataFile.havePerk("perkPistolEffectiveness",this.myDataRef) && (_loc2_.myCat == "pistol" || _loc2_.myCat == "revolver") || MadnessDataFile.havePerk("perkRifleEffectiveness",this.myDataRef) && _loc2_.myCat == "rifle")
                                                {
                                                   _loc5_ -= 1;
                                                }
                                                if(_loc2_.upgradeLaser)
                                                {
                                                   _loc5_ -= 1;
                                                }
                                                if(_loc2_.upgradeSight)
                                                {
                                                   _loc5_ -= 1;
                                                }
                                                if(_loc9_ > _loc2_.myRange * this.myDataRef.myScale + this.myDataRef.modRange + _loc7_)
                                                {
                                                   _loc5_ += Math.ceil((_loc9_ - (_loc2_.myRange * this.myDataRef.myScale + this.myDataRef.modRange + _loc7_)) / 45);
                                                }
                                                if(_loc5_ < 0)
                                                {
                                                   _loc5_ = 0;
                                                }
                                                if(!this.myDataRef.noRange && this.aimTimer == -1 && !_loc2_.melee && _loc9_ > _loc2_.myRange * this.myDataRef.myScale + this.myDataRef.modRange + _loc7_ && SwainMath.randomNumber(0,_loc5_) > 1)
                                                {
                                                   this.targetsTac.push(this.targetEnemy);
                                                }
                                                else
                                                {
                                                   if(!this.myDataRef.amZombie && !this.myDataRef.amAbom && this.amBlocking(this.targetEnemy,this,_loc2_) && !((MadnessDataFile.havePerk("perkBlockBreak",this.myDataRef) && MadnessGameSelect.gameMode != "story" || this.myDataRef.autoHit) && _loc2_.melee))
                                                   {
                                                      if(MadnessDataFile.havePerk("perkBlock2",this.targetEnemy.myDataRef) && !_loc2_.melee)
                                                      {
                                                         this.targetEnemy.checkAttackHit("","",_loc2_);
                                                         this.targetEnemy.deflectBullet(this,this.targetX,this.targetY,_loc2_);
                                                         this._parent.makeBullet(this.targetEnemy,this.targetEnemy.myBlasts[0].myRot,this.targetEnemy.myBlasts[0].myLength,this.targetEnemy.myBlasts[0].myX,this.targetEnemy.myBlasts[0].myY,this.targetX,this.targetY,_loc2_.myTracer);
                                                      }
                                                      else
                                                      {
                                                         this.targetEnemy.blockBullet(this,this.targetX,this.targetY,_loc2_);
                                                      }
                                                      if(MadnessDataFile.havePerk("perkMeleeDisarm",this.targetEnemy.myDataRef) && this.targetEnemy.actionTimer < 10 && _loc2_.melee && _loc2_.myType != "unarmed")
                                                      {
                                                         this.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
                                                         this.mySprite.gotoAndStop(this.myStatus);
                                                         this.disarmGun();
                                                      }
                                                      this.targetEnemy.blockReset();
                                                      this.targetEnemy.hitTactics(_loc2_,this,true,false,_loc9_ <= _loc2_.myRange * this.myDataRef.myScale + this.myDataRef.modRange + _loc7_);
                                                      this.damageMelee(_loc2_);
                                                      this.targetEnemy.damageMelee(this.targetEnemy.myDataRef.myWeapons[this.targetEnemy.myWeapon]);
                                                      if(this.aimTimer == 0 && this.targetEnemy.myHealth > 0)
                                                      {
                                                         this.targetEnemy.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
                                                         if(this.myTactics <= 0)
                                                         {
                                                            this.targetEnemy.disarmGun();
                                                         }
                                                      }
                                                      if(this.targetEnemy.myTactics == 0)
                                                      {
                                                         this.targetEnemy.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
                                                      }
                                                      if(_loc2_.melee && _loc2_.myDamageType != "punch")
                                                      {
                                                         this.playSound("blockmelee");
                                                      }
                                                      else if(_loc2_.myDamageType == "punch")
                                                      {
                                                         this.playSound("blunt");
                                                      }
                                                      else
                                                      {
                                                         this.playSound("ricochet");
                                                      }
                                                      _loc6_ = true;
                                                      break;
                                                   }
                                                   if(this.myDataRef.weaponStealer && (this.targetEnemy.myStatus != "melee" && this.targetEnemy.rofTimer < 15 || this.targetEnemy.myStatus == "restrained" && SwainMath.randomNumber(0,1) == 0) && this.myDataRef.myWeapons[this.myWeapon] == undefined && this.targetEnemy.myDataRef.myWeapons[this.targetEnemy.myWeapon] != undefined && (this.targetEnemy.myStatus == "restrained" || this.targetEnemy._x > this._x && (this.targetEnemy.isFacingRight && this.targetEnemy.facingOpposite || !this.targetEnemy.isFacingRight && !this.targetEnemy.facingOpposite) || this.targetEnemy._x < this._x && (!this.targetEnemy.isFacingRight && this.targetEnemy.facingOpposite || this.targetEnemy.isFacingRight && !this.targetEnemy.facingOpposite)) && this.myDataRef.myScale == this.targetEnemy.myDataRef.myScale)
                                                   {
                                                      this.playSound("swish");
                                                      if(this.targetEnemy.myDataRef.myWeapons[this.targetEnemy.myWeapon].melee)
                                                      {
                                                         this.playSound("swapmelee");
                                                      }
                                                      else if(this.targetEnemy.myDataRef.myWeapons[this.targetEnemy.myWeapon] != undefined)
                                                      {
                                                         this.playSound("swapgun");
                                                      }
                                                      this.myDataRef.myWeapons[this.myWeapon] = this.targetEnemy.myDataRef.myWeapons[this.targetEnemy.myWeapon];
                                                      this.targetEnemy.myDataRef.myWeapons[this.targetEnemy.myWeapon] = undefined;
                                                      if(this.targetEnemy.myStatus != "restrained")
                                                      {
                                                         this.targetEnemy.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
                                                      }
                                                      _loc6_ = true;
                                                      break;
                                                   }
                                                   if(this.canGrapple(this.targetEnemy))
                                                   {
                                                      this.myStatus = "grapple";
                                                      this.targetEnemy.myStatus = "restrained";
                                                      if(this.myDataRef.amZombie)
                                                      {
                                                         this.mySubStatus = "_zombie";
                                                      }
                                                      if(this.myDataRef.amAbom)
                                                      {
                                                         this.mySubStatus = "_abom";
                                                      }
                                                      else
                                                      {
                                                         this.mySubStatus = "_zombie";
                                                      }
                                                      this.targetEnemy.mySubStatus = this.mySubStatus;
                                                      if(this.targetEnemy.amPlayer)
                                                      {
                                                         this.aimFlash();
                                                      }
                                                      this.targetEnemy.grappleTimer = this.targetEnemy.grappleTimerMax / 10 * this.myDataRef.myLevel;
                                                      this.playSound("land");
                                                      this.playSound("swish");
                                                      this.myAttackTarget = this.targetEnemy;
                                                      this.intendedX = this.targetEnemy._x;
                                                      this.intendedY = this.targetEnemy._y + 8;
                                                      this.intendedY += SwainMath.randomNumber(-50,50) * 0.1;
                                                      if(this.isFacingRight)
                                                      {
                                                         this.intendedX -= (_loc2_.myRange * this.myDataRef.myScale - 40) * (SwainMath.randomNumber(50,100) * 0.01);
                                                      }
                                                      else
                                                      {
                                                         this.intendedX += (_loc2_.myRange * this.myDataRef.myScale - 40) * (SwainMath.randomNumber(50,100) * 0.01);
                                                      }
                                                      _loc6_ = true;
                                                      break;
                                                   }
                                                   if(!(this.targetEnemy.myStatus != "restrained" && this.aimTimer == -1 && this.targetEnemy.myTactics > 0 && (!this.myDataRef.autoHit || !_loc2_.melee) && !this.myDataRef.amSurprised))
                                                   {
                                                      var _loc15_ = this.targetEnemy.myHealth > 0;
                                                      MadnessCharacter.adjustSprite(this.targetEnemy);
                                                      this.targetEnemy.checkDamage(_loc2_,this,this.targetX,this.targetY,_loc9_ <= _loc2_.myRange * this.myDataRef.myScale + this.myDataRef.modRange + _loc7_ || _loc2_.melee || this.myDataRef.autoHit,_loc12_);
                                                      if(_loc15_ && this.targetEnemy.myHealth <= 0)
                                                      {
                                                         MadnessGameSelect.appropriateXP(this.myDataRef,this.targetEnemy.myDataRef,"attack");
                                                      }
                                                      this.targetsHit.push(this.targetEnemy);
                                                      this.damageMelee(_loc2_);
                                                      var _loc10_ = 22;
                                                      if((MadnessDataFile.havePerk("perkStunDash2",this.myDataRef) || this.myDataRef.knockdownDash) && this.myStatus.substr(0,10) == "melee_dash" || this.myDataRef.myScale > this.targetEnemy.myDataRef.myScale)
                                                      {
                                                         _loc10_ = 0;
                                                      }
                                                      else if(MadnessDataFile.havePerk("perkKnockdown2",this.myDataRef) && this.myStatus.substr(0,10) != "melee_dash")
                                                      {
                                                         _loc10_ = 2;
                                                      }
                                                      else if(MadnessDataFile.havePerk("perkKnockdown1",this.myDataRef) && this.myStatus.substr(0,10) != "melee_dash")
                                                      {
                                                         _loc10_ = 6;
                                                      }
                                                      if(this.aimTimer == 0 || _loc2_.melee && !this.targetEnemy.noDamage && ((_loc2_.myDamageType == "blunt" || _loc2_.myDamageType == "punch") && SwainMath.randomNumber(0,_loc10_) == 0 && this.myDataRef.myScale >= this.targetEnemy.myDataRef.myScale))
                                                      {
                                                         this.targetEnemy.applyKnockback(this,this.myDataRef.statSTR / 2,false);
                                                      }
                                                      _loc6_ = true;
                                                      break;
                                                   }
                                                   this.targetEnemy.hitTactics(_loc2_,this,false,false,_loc9_ <= _loc2_.myRange * this.myDataRef.myScale + this.myDataRef.modRange + _loc7_);
                                                   this.targetsTac.push(this.targetEnemy);
                                                }
                                             }
                                          }
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                     _loc13_ = _loc13_ + 1;
                  }
                  // trace("Has done this this many times!" + _loc13_);
               }
               if(_loc6_)
               {
                  break;
               }
               _loc11_ = _loc11_ + 1;
            }
            // trace("FATHER OF ABOVE ^ Has done this this many times!" + _loc11_);
            if(!_loc6_)
            {
               this.targetX += this.advanceX;
               this.targetY += this.advanceY;
            }
            _loc9_ += this.bulletCheckDistance;
         }
         if(inMeleeDir == "")
         {
            var _loc24_ = new Object();
            this.myBlasts.push(_loc24_);
            this.myBlasts[this.myBlasts.length - 1].myX = this.targetX;
            this.myBlasts[_loc23_].myY = this.targetY;
            this.myBlasts[this.myBlasts.length - 1].myRot = this.bulletRotation;
            this.myBlasts[this.myBlasts.length - 1].myLength = SwainMath.get_distance2(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100) * _loc16_,this.targetX,this.targetY);
         }
         _loc23_ = _loc23_ + 1;
      }
   }
   function checkMeleeHit(hitType, hitHeight)
   {
      var _loc2_ = this.myDataRef.myWeapons[this.myWeapon];
      if(hitType == "unarmed")
      {
         _loc2_ = this.myDataRef.myUnarmed;
      }
      this.checkAttackHit(hitHeight,hitType,_loc2_);
   }
   function clearLockedAction(inAction)
   {
      if(inAction == "execute")
      {
         this.interactTarget._visible = true;
         if(this.isFacingRight)
         {
            this._x += this.mySprite.spawn_player._x + this.mySprite._x;
         }
         else
         {
            this._x -= this.mySprite.spawn_player._x + this.mySprite._x;
         }
         this._y += this.mySprite.spawn_player._y + this.mySprite._y;
      }
      this.myStatus = "idle";
      this.interactType = "";
      this.interactTarget = undefined;
      this.targetLock = false;
   }
   function inputAllowed()
   {
      // 23/11/2026 dyzqy: Units who are actively dying or staggering won't receive AI updates.
      if(this.myHealth <= 0 ||this.myStatus.substr(0,4) == "dead" || this.myStatus.substr(0,5) == "dying" || this.doorLock || this.targetLock || this._parent.characterHold)
      {
         return false;
      }
      return true;
   }
   function amBlocking(inTarget, inAttacker, thisWeapon)
   {
      return inTarget.blocking && (thisWeapon.melee || MadnessDataFile.havePerk("perkBlock1",inTarget.myDataRef)) && ((inTarget.isFacingRight && !inTarget.facingOpposite || !inTarget.isFacingRight && inTarget.facingOpposite) && inTarget._x < inAttacker._x || (!inTarget.isFacingRight && !inTarget.facingOpposite || inTarget.isFacingRight && inTarget.facingOpposite) && inTarget._x > inAttacker._x);
   }
   function blockReset()
   {
      this.actionTimer = 1;
      this.recoilTimer = 14;
      MadnessCharacter.makeSpritePart(this,this.mySprite.handNone_front,"Melee - Block" + String(SwainMath.randomNumber(2,6)));
   }
   function blockBullet(inSource, inX, inY, inWeapon)
   {
      var _loc2_ = 0;
      while(_loc2_ < SwainMath.randomNumber(2,5))
      {
         inSource.makeSparks(inX,inY,this._y,"sparks");
         _loc2_ = _loc2_ + 1;
      }
      if(!inWeapon.melee)
      {
         var _loc6_ = undefined;
         if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
         {
            _loc6_ = -1;
         }
         else
         {
            _loc6_ = 1;
         }
         var _loc7_ = SwainMath.randomNumber(-800,800) / 100;
         this._parent.createParticle(inSource.myDataRef.myWeapons[inSource.myWeapon].myCasing,"bullet",inX,inY,SwainMath.randomNumber(-50,-10) / 10 * (- _loc6_),SwainMath.randomNumber(-150,-50) / 10,90 * _loc6_,SwainMath.randomNumber(-900,900) / 10,0.7,this._y + _loc7_,100,this._yscale * _loc6_,true,90);
      }
   }
   function deflectBullet(inSource, inX, inY, inWeapon)
   {
      var _loc2_ = 0;
      while(_loc2_ < SwainMath.randomNumber(2,5))
      {
         inSource.makeSparks(inX,inY,this._y,"sparks");
         _loc2_ = _loc2_ + 1;
      }
   }
   function makeSparks(inX, inY, inFloor, inSparkCat)
   {
      var _loc2_ = undefined;
      if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
      {
         _loc2_ = -1;
      }
      else
      {
         _loc2_ = 1;
      }
      var _loc3_ = SwainMath.randomNumber(-800,800) / 100;
      this._parent.createParticle("spark" + SwainMath.randomNumber(1,2),inSparkCat,inX,inY,SwainMath.randomNumber(-70,-20) / 10 * _loc2_,SwainMath.randomNumber(-200,-50) / 10,SwainMath.randomNumber(-180,180),SwainMath.randomNumber(-900,900) / 10,0.7,inFloor + _loc3_,100,100,false,90);
   }
   function ejectShell()
   {
      var _loc2_ = undefined;
      if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
      {
         _loc2_ = -1;
      }
      else
      {
         _loc2_ = 1;
      }
      var _loc3_ = SwainMath.randomNumber(-800,800) / 100;
      this._parent.createParticle(this.myDataRef.myWeapons[this.myWeapon].myCasing,"casing",this._x + 28 * _loc2_,SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),this.myAimX,this.myAimY),35,"y"),SwainMath.randomNumber(-60,-30) / 10 * _loc2_,SwainMath.randomNumber(-250,-150) / 10,SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),this.myAimX,this.myAimY),SwainMath.randomNumber(-900,900) / 10,0.7,this._y + _loc3_,100,this._yscale * _loc2_,true,90);
   }
   function ejectClip()
   {
      var _loc2_ = undefined;
      if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
      {
         _loc2_ = -1;
      }
      else
      {
         _loc2_ = 1;
      }
      var _loc3_ = SwainMath.randomNumber(0,500) / 100;
      this._parent.createParticle(this.myDataRef.myWeapons[this.myWeapon].myType,"clip",this._x + 27 * _loc2_,SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight,this.myAimX,this.myAimY),35,"y"),SwainMath.randomNumber(-10,10) / 10 * _loc2_,0,SwainMath.randomNumber(-50,50) / 10,SwainMath.randomNumber(-40,40) / 10,0.6,this._y + _loc3_,100,this._yscale * _loc2_,true,90);
   }
   function dropGun()
   {
      if(this.myDataRef.myWeapons[this.myWeapon] != undefined && !this.myDataRef.strongGrip)
      {
         var _loc2_ = undefined;
         if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
         {
            _loc2_ = -1;
         }
         else
         {
            _loc2_ = 1;
         }
         var _loc3_ = SwainMath.randomNumber(-300,300) / 100;
         this._parent.createParticle(this.myDataRef.myWeapons[this.myWeapon].myType,"gun",this._x + 20 * _loc2_,this._y - 40 * this.myDataRef.myScale,SwainMath.randomNumber(-10,10) / 10 * _loc2_ + this.mySpeedRight * SwainMath.randomNumber(50,120) / 100,0,-90 * _loc2_ + SwainMath.randomNumber(-100,100) / 10,SwainMath.randomNumber(-14,14) / 10,0.5,this._y + _loc3_,100,this._yscale * _loc2_,true,90,this.myDataRef.myWeapons[this.myWeapon]);
         if(this.myRoster != MadnessRoster.playerRoster && this.myDataRef.myWeapons[this.myWeapon].myClips > 0)
         {
            if(MadnessGameSelect.myDifficulty == "easy" && MadnessGameSelect.gameMode == "story")
            {
               if(this.myDataRef.myWeapons[this.myWeapon].myClips > 3)
               {
                  this.myDataRef.myWeapons[this.myWeapon].myClips = 3;
               }
            }
            else
            {
               this.myDataRef.myWeapons[this.myWeapon].myClips = 0;
            }
         }
         this.myDataRef.myWeapons[this.myWeapon] = undefined;
      }
   }
   function disarmGun()
   {
      if(this.myDataRef.myWeapons[this.myWeapon] != undefined && !this.myDataRef.strongGrip)
      {
         var _loc2_ = undefined;
         if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
         {
            _loc2_ = -1;
         }
         else
         {
            _loc2_ = 1;
         }
         var _loc3_ = SwainMath.randomNumber(-300,300) / 100;
         this._parent.createParticle(this.myDataRef.myWeapons[this.myWeapon].myType,"gun",this._x + 20 * _loc2_,this._y - 40 * this.myDataRef.myScale,-16 * _loc2_,-20,-90 * _loc2_ + SwainMath.randomNumber(-100,100) / 10,50 * _loc2_,0.5,this._y + _loc3_,100,this._yscale * _loc2_,true,90,this.myDataRef.myWeapons[this.myWeapon]);
         if(this.myRoster != MadnessRoster.playerRoster && this.myDataRef.myWeapons[this.myWeapon].myClips > 0)
         {
            this.myDataRef.myWeapons[this.myWeapon].myClips = 0;
         }
         this.myDataRef.myWeapons[this.myWeapon] = undefined;
      }
   }
   function disarmArmor(inArmor)
   {
      if(inArmor != undefined)
      {
         var _loc2_ = undefined;
         if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
         {
            _loc2_ = -1;
         }
         else
         {
            _loc2_ = 1;
         }
         var _loc4_ = SwainMath.randomNumber(-300,300) / 100;
         this._parent.createParticle(inArmor.myType,"helmet",this._x,this._y - 60 * this.myDataRef.myScale,-6 * _loc2_,-20,-90 * _loc2_ + SwainMath.randomNumber(-100,100) / 10,50 * _loc2_,0.5,this._y + _loc4_,100,this._yscale * _loc2_,true,90,this.myDataRef.myWeapons[this.myWeapon]);
         if(inArmor.myCat == "hat")
         {
            this.myDataRef.myHat[0] = undefined;
         }
         if(inArmor.myCat == "shirt")
         {
            this.myDataRef.myShirt[0] = undefined;
         }
         if(inArmor.myCat == "mask")
         {
            this.myDataRef.myMask[0] = undefined;
         }
         if(inArmor.myCat == "mouth")
         {
            this.myDataRef.myMouth[0] = undefined;
         }
         this.refreshArmor();
      }
   }
   function splatterCharacter(inLevel, inBlood, inDirMod, inX, inY, head)
   {
      var _loc3_ = undefined;
      var _loc12_ = SwainMath.randomNumber(2,2 + inLevel);
      var _loc2_ = undefined;
      if(inDirMod)
      {
         _loc2_ = -1;
      }
      else
      {
         _loc2_ = 1;
      }
      if(inLevel > 4)
      {
         inLevel = 4;
      }
      var _loc7_ = MadnessCharacter.setPerspectiveScale(this._x,this._y,this.myRoom);
      var _loc6_ = SwainMath.randomNumber(10 + 20 * inLevel,30 + 30 * inLevel) / 10 * _loc2_;
      if(this.myDataRef.bulletEater)
      {
         _loc6_ *= 0.2;
      }
      var _loc4_ = 0;
      while(_loc4_ < _loc12_ * 1.5)
      {
         _loc3_ = SwainMath.randomNumber(-800,800) / 100;
         MadWorld.thisWorld.createParticle(inBlood + String(SwainMath.randomNumber(1,3)),"blood",inX + 20 * _loc2_,inY,_loc6_,SwainMath.randomNumber(-10 + inLevel * 2,-5),SwainMath.randomNumber(-180,180),SwainMath.randomNumber(-130,130) / 10,0,this._y + _loc3_,100,_loc7_ * _loc2_,false,90);
         _loc4_ = _loc4_ + 1;
      }
      if(head)
      {
         var _loc11_ = "chunk";
         if(this.myDataRef.amZombie)
         {
            _loc11_ += "_zombie";
         }
         _loc4_ = 0;
         while(_loc4_ < inLevel - 2)
         {
            _loc3_ = SwainMath.randomNumber(-800,800) / 100;
            this._parent.createParticle(inBlood + SwainMath.randomNumber(1,3),_loc11_,inX + 20 * _loc2_,inY,_loc6_,SwainMath.randomNumber(-10 + inLevel * 2,-5),SwainMath.randomNumber(-180,180),SwainMath.randomNumber(-130,130) / 10,0.5,this._y + _loc3_,100,_loc7_ * _loc2_,false,90);
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   static function makeSpritePart(inChar, inContainer, inID)
   {
      if(inID == "remove2")
      {
         inContainer.myPart.removeMovieClip();
         inContainer.partSprite._visible = true;
      }
      else if(!(inContainer.myPart != undefined && inContainer.myPart.myID == inID && inID.substr(0,4) == "Part"))
      {
         if(inID.substr(0,4) == "Part")
         {
            inContainer.myPart.removeMovieClip();
            inContainer.attachMovie(inID,"myPart",inContainer.getNextHighestDepth());
            MadnessCharacter.checkWounds(inChar);
            inContainer.stop();
            inContainer.myPart.myID = inID;
            inContainer.myPart.stop();
            inContainer.partSprite._visible = false;
            inContainer.myPart._x = 0;
            inContainer.myPart._y = 0;

            // 21/11/2026 dyzqy: Caching the head as a bitmap requires rerasterizing it every single time it moves. Just keep it as a vector graphic and save on some CPU cycles.
            // inContainer.myPart.cacheAsBitmap = true;
         }
         else if(inID == "remove3")
         {
            inContainer.myGun.removeMovieClip();
            inContainer.myHand._visible = false;
         }
         else if(!(inContainer.myHandSprite != undefined && inContainer.myHandSprite.myID == inID && inID == "character_hand"))
         {
            if(inID == "character_hand")
            {
               inContainer.myHandSprite.removeMovieClip();
               inContainer.attachMovie(inID,"myHandSprite",inContainer.getNextHighestDepth());
               inContainer.stop();
               inContainer.myHandSprite.myID = inID;
               inContainer.myHandSprite.stop();
               inContainer.myHand._visible = false;
               inContainer.myHandSprite._x = 0;
               inContainer.myHandSprite._y = 0;
            }
            else if(inID == "remove")
            {
               inContainer.myGun.removeMovieClip();
               inContainer.myHand._visible = false;
            }
            else if(!(inContainer.myGun != undefined && inContainer.myGun.myID == inID))
            {
               inContainer.myGun.removeMovieClip();
               inContainer.attachMovie(inID,"myGun",inContainer.getNextHighestDepth());
               inContainer.stop();
               inContainer.myGun.myID = inID;
               inContainer.myGun.stop();
               inContainer.myHand._visible = false;
               inContainer.myHandSprite._visible = false;
               inContainer.myGun._x = - inContainer.myGun.myHand._x;
               inContainer.myGun._y = - inContainer.myGun.myHand._y;
               if(!inChar.myDataRef.noWieldGuns)
               {
                  inContainer.myGun._x += inChar.myDataRef.myWeapons[inChar.myWeapon].xOffset;
                  inContainer.myGun._y += inChar.myDataRef.myWeapons[inChar.myWeapon].yOffset;
               }
            }
         }
      }
   }
   function applySpeed(inSpeedX, inSpeedY)
   {
      if(!this.isFacingRight)
      {
         inSpeedX *= -1;
      }
      this.mySpeedRight = inSpeedX * this.myDataRef.myScale;
      if(inSpeedY != undefined)
      {
         this.mySpeedDown = inSpeedY * this.myDataRef.myScale;
      }
   }
   function applyYMove(inSpeed)
   {
      if(SwainMath.randomNumber(0,1) == 0)
      {
         this.mySpeedDown = inSpeed;
      }
      else
      {
         this.mySpeedDown = - inSpeed;
      }
   }
   function generalStaggerMovement()
   {
      if(SwainMath.randomNumber(0,1) == 0)
      {
         this.applySpeed(SwainMath.randomNumber(-5,-1),SwainMath.randomNumber(-2,2));
      }
      else
      {
         this.applySpeed(SwainMath.randomNumber(1,5),SwainMath.randomNumber(-2,2));
      }
   }
   function enemyInFront(inEnemy)
   {
      return inEnemy._x > this._x && this.isFacingRight || inEnemy._x < this._x && !this.isFacingRight;
   }
   var setSkinsAlready:Boolean = false;
  static function adjustSprite(inChar)
   {
      MadnessCharacter.makeSpritePart(inChar,inChar.mySprite.myHead,"Parts - Head");
      MadnessCharacter.makeSpritePart(inChar,inChar.mySprite.myBody,"Parts - Body");
      
      // 22/11/2026 dyzqy: Caching sprites paths because AVM1 doesn't know how to do it and calculates it every single time.
      var headCache = inChar.mySprite.myHead.myPart;
      var bodyCache = inChar.mySprite.myBody.myPart;

      headCache.gotoAndStop(inChar.myDataRef.headType);
      bodyCache.gotoAndStop(inChar.myDataRef.bodyType);
      if(!inChar.isFacingRight || inChar.isFacingRight && inChar.myDataRef.myWeapons[inChar.myWeapon].twoHand && (inChar.myAimX <= inChar._x && inChar.isFacingRight || inChar.myAimX >= inChar._x && !inChar.isFacingRight) && inChar.reloadTimer == -1)
      {
         bodyCache.nextFrame();
      }
      if(!inChar.isFacingRight && !inChar.facingOpposite || inChar.isFacingRight && inChar.facingOpposite)
      {
         headCache.nextFrame();
      }
      if(inChar.isFacingRight && inChar.myDataRef.myWeapons[inChar.myWeapon].twoHand && inChar.facingOpposite)
      {
         bodyCache._xscale = -100;
      }
      else
      {
         bodyCache._xscale = 100;
      }
      if(inChar.myAimX != undefined && inChar.myStatus != "recover" && inChar.myStatus != "stun" && inChar.myStatus != "startup" && inChar.myStatus != "magic" && inChar.myHealth > 0)
      {
         var _loc5_ = undefined;
         if(inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined && (inChar.isFacingRight && inChar.myAimX < inChar._x || !inChar.isFacingRight && inChar.myAimX > inChar._x))
         {
            _loc5_ = 90;
         }
         else if(inChar.myAimX > inChar._x)
         {
            _loc5_ = SwainMath.calculate_rotation(inChar._x,inChar._y - 65,inChar.myAimX,inChar.myAimY);
         }
         else
         {
            _loc5_ = - SwainMath.calculate_rotation(inChar._x,inChar._y - 65,inChar.myAimX,inChar.myAimY);
         }
         if(_loc5_ < 70)
         {
            _loc5_ = 70;
         }
         if(_loc5_ > 110)
         {
            _loc5_ = 110;
         }
         _loc5_ -= 90;
         headCache._rotation += (_loc5_ - headCache._rotation) / 3;
         headCache._x = SwainMath.get_position(-5,34,bodyCache._rotation + 6 + _loc5_ / 2.5,36,"x");
         headCache._y = SwainMath.get_position(-5,34,bodyCache._rotation + 6 + (5 + _loc5_ / 2.5),36 - (5 + _loc5_ / 2.5) / 5,"y");
      }
      headCache.headSprite.gotoAndStop(1 + inChar.headDamage * 5);
      bodyCache.bodySprite.gotoAndStop(1 + inChar.bodyDamage * 5);
      var _loc4_ = 0;
      while(_loc4_ < inChar.headSpray)
      {
         headCache.headSprite.nextFrame();
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < inChar.bodySpray)
      {
         bodyCache.bodySprite.nextFrame();
         _loc4_ = _loc4_ + 1;
      }
      if(MadnessGameSelect.gameMode == "arena" && MadnessGameSelect.subGameMode != "zombie" && inChar.myFaction == MadnessRoster.playerRoster.teamFaction && inChar.myDataRef != MadnessRoster.playerRoster.teamLeader)
      {
         bodyCache.teamColor._visible = true;
         bodyCache.teamColor.gotoAndStop("green");
      }
      else
      {
         bodyCache.teamColor._visible = false;
         bodyCache.teamColor.stop();
      }
      var _loc9_ = undefined;
      if(inChar.myWeapon == 0)
      {
         _loc9_ = 1;
      }
      if(inChar.myWeapon == 1)
      {
         _loc9_ = 0;
      }
      if(inChar.myWeapon == 2)
      {
         _loc9_ = 99;
      }
      if(inChar.myDataRef.myWeapons[_loc9_] == undefined)
      {
         bodyCache.myBackup._visible = false;
         bodyCache.myBackup.gotoAndStop("none");
      }
      else
      {
         bodyCache.myBackup._visible = true;
         bodyCache.myBackup.gotoAndStop(inChar.myDataRef.myWeapons[_loc9_].myType);
         bodyCache.myBackup.myGun = inChar.myDataRef.myWeapons[_loc9_];
      }
      MadnessCharacter.makeSpritePart(inChar,inChar.mySprite.handNone_back,"character_hand");
      MadnessCharacter.makeSpritePart(inChar,inChar.mySprite.handNone_front,"character_hand");
      MadnessCharacter.makeSpritePart(inChar,inChar.mySprite.handShoot_back,"character_hand");
      MadnessCharacter.makeSpritePart(inChar,inChar.mySprite.handShoot_front,"character_hand");

      // 22/11/2026 dyzqy: Caching sprites...
      var handNoneFrontCache = inChar.mySprite.handNone_front;
      var handShootFrontCache = inChar.mySprite.handShoot_front;
      var handNoneBackCache = inChar.mySprite.handNone_back;
      var handShootBackCache = inChar.mySprite.handShoot_back;

      handNoneBackCache.myHand._visible = false;
      handShootBackCache.myHand._visible = false;
      handNoneFrontCache.myHand._visible = false;
      handShootFrontCache.myHand._visible = false;
      var _loc2_ = inChar.myDataRef.myWeapons[inChar.myWeapon];
      if(_loc2_ == undefined)
      {
         MadnessCharacter.makeSpritePart(inChar,handNoneBackCache,"remove");
         MadnessCharacter.makeSpritePart(inChar,handNoneFrontCache,"remove");
         MadnessCharacter.makeSpritePart(inChar,handShootBackCache,"remove");
         MadnessCharacter.makeSpritePart(inChar,handShootFrontCache,"remove");
      }
      else if(_loc2_.melee)
      {
         if(inChar.blocking)
         {
            if(handNoneFrontCache.myGun.myID.substr(0,13) != "Melee - Block")
            {
               MadnessCharacter.makeSpritePart(inChar,handNoneFrontCache,_loc2_.myTag + " - Block");
            }
            handNoneFrontCache.myGun.myMelee.gotoAndStop(_loc2_.myType);
            handNoneFrontCache.myGun.myHand.gotoAndStop("hand_back");
            handNoneFrontCache.myGun.myHand2.gotoAndStop("hand_back");
            handNoneFrontCache.myGun.gotoAndStop(inChar.actionTimer);
         }
         else if(!inChar.isFacingRight && !inChar.facingOpposite || inChar.isFacingRight && inChar.facingOpposite)
         {
            MadnessCharacter.makeSpritePart(inChar,handNoneBackCache,_loc2_.myTag + " - L");
            MadnessCharacter.makeSpritePart(inChar,handNoneFrontCache,"remove");
            MadnessCharacter.makeSpritePart(inChar,handShootBackCache,_loc2_.myTag + " - L");
            MadnessCharacter.makeSpritePart(inChar,handShootFrontCache,"remove");
            handNoneBackCache.myGun.myMelee.gotoAndStop(_loc2_.myType);
            handShootBackCache.myGun.myMelee.gotoAndStop(_loc2_.myType);
            handNoneFrontCache.gotoAndStop("hand_front");
            handShootFrontCache.gotoAndStop("hand_front");
         }
         else if(inChar.isFacingRight && !inChar.facingOpposite || !inChar.isFacingRight && inChar.facingOpposite)
         {
            MadnessCharacter.makeSpritePart(inChar,handNoneFrontCache,_loc2_.myTag + " - R");
            MadnessCharacter.makeSpritePart(inChar,handNoneBackCache,"remove");
            MadnessCharacter.makeSpritePart(inChar,handShootFrontCache,_loc2_.myTag + " - R");
            MadnessCharacter.makeSpritePart(inChar,handShootBackCache,"remove");
            handNoneFrontCache.myGun.myMelee.gotoAndStop(_loc2_.myType);
            handShootFrontCache.myGun.myMelee.gotoAndStop(_loc2_.myType);
         }
         // 23/11/2026 dyzqy: Moved this here so it is only ran when needed(aka when equipping a melee weapon)
         //                   Tested, seems to be working fine :|>
         ItemGenerator.setItemSprite(handNoneFrontCache.myGun.myMelee.mySprite,_loc2_);
         ItemGenerator.setItemSprite(handNoneBackCache.myGun.myMelee.mySprite,_loc2_);
         ItemGenerator.setItemSprite(handShootFrontCache.myGun.myMelee.mySprite,_loc2_);
         ItemGenerator.setItemSprite(handShootBackCache.myGun.myMelee.mySprite,_loc2_);
      }
      else
      {
         if(!inChar.isFacingRight && !inChar.facingOpposite || inChar.isFacingRight && inChar.facingOpposite)
         {
            if(inChar.reloadTimer == -1)
            {
               MadnessCharacter.makeSpritePart(inChar,handNoneBackCache,_loc2_.myTag + " - Fire L");
               MadnessCharacter.makeSpritePart(inChar,handShootBackCache,_loc2_.myTag + " - Fire L");
            }
            else
            {
               MadnessCharacter.makeSpritePart(inChar,handNoneBackCache,_loc2_.myTag + " - Reload L");
               MadnessCharacter.makeSpritePart(inChar,handShootBackCache,_loc2_.myTag + " - Reload L");
            }
            MadnessCharacter.makeSpritePart(inChar,handNoneFrontCache,"remove");
            MadnessCharacter.makeSpritePart(inChar,handShootFrontCache,"remove");
         }
         if(inChar.isFacingRight && !inChar.facingOpposite || !inChar.isFacingRight && inChar.facingOpposite)
         {
            if(inChar.reloadTimer == -1)
            {
               MadnessCharacter.makeSpritePart(inChar,handNoneFrontCache,_loc2_.myTag + " - Fire R");
               MadnessCharacter.makeSpritePart(inChar,handShootFrontCache,_loc2_.myTag + " - Fire R");
            }
            else
            {
               MadnessCharacter.makeSpritePart(inChar,handNoneFrontCache,_loc2_.myTag + " - Reload R");
               MadnessCharacter.makeSpritePart(inChar,handShootFrontCache,_loc2_.myTag + " - Reload R");
            }
            MadnessCharacter.makeSpritePart(inChar,handNoneBackCache,"remove");
            MadnessCharacter.makeSpritePart(inChar,handShootBackCache,"remove");
         }
      }
      if(inChar.myDataRef.amZombie || inChar.myDataRef.amAbom)
      {
         handNoneBackCache.myHandSprite.gotoAndStop("hand_back_open");
         handShootBackCache.myHandSprite.gotoAndStop("hand_back_open");
         handNoneFrontCache.myHandSprite.gotoAndStop("hand_front_open");
         handShootFrontCache.myHandSprite.gotoAndStop("hand_front_open");
      }
      else
      {
         handNoneBackCache.myHandSprite.gotoAndStop("hand_back");
         handShootBackCache.myHandSprite.gotoAndStop("hand_back");
         handNoneFrontCache.myHandSprite.gotoAndStop("hand_front");
         handShootFrontCache.myHandSprite.gotoAndStop("hand_front");
      }
      // 22/1/2026 dyzqy: gotoAndStop is a very expensive call! It is the reason for almost ALL lag in *most* flash games!
      //                  Limit it, contain it, etc.
      //           (TODO) Fix flashing of one of the hands being bugged for the player when going through doors(?) and holding rifles(?)
      if(!inChar.setSkinsAlready)
      {
         handNoneBackCache.myHandSprite.myHand.gotoAndStop(inChar.myDataRef.handType);
         handNoneFrontCache.myHandSprite.myHand.gotoAndStop(inChar.myDataRef.handType);
         handShootBackCache.myHandSprite.myHand.gotoAndStop(inChar.myDataRef.handType);
         handShootFrontCache.myHandSprite.myHand.gotoAndStop(inChar.myDataRef.handType);
         handNoneBackCache.myGun.myHand.gotoAndStop(inChar.myDataRef.handType);
         handNoneBackCache.myGun.myHand2.gotoAndStop(inChar.myDataRef.handType);
         handNoneFrontCache.myGun.myHand.gotoAndStop(inChar.myDataRef.handType);
         handNoneFrontCache.myGun.myHand2.gotoAndStop(inChar.myDataRef.handType);
         handShootBackCache.myGun.myHand.gotoAndStop(inChar.myDataRef.handType);
         handShootBackCache.myGun.myHand2.gotoAndStop(inChar.myDataRef.handType);
         handShootFrontCache.myGun.myHand.gotoAndStop(inChar.myDataRef.handType);
         handShootFrontCache.myGun.myHand2.gotoAndStop(inChar.myDataRef.handType);
         inChar.mySprite.myHand.myHand.gotoAndStop(inChar.myDataRef.handType);
         inChar.mySprite.myHand2.myHand.gotoAndStop(inChar.myDataRef.handType);
         inChar.mySprite.myHand.gotoAndStop(inChar.myDataRef.handType);
         inChar.mySprite.myHand2.gotoAndStop(inChar.myDataRef.handType);
         inChar.setSkinsAlready = true;
      }
      if(inChar.blocking)
      {
         handNoneFrontCache._visible = true;
         handShootFrontCache._visible = false;
         handNoneBackCache._visible = false;
         handShootBackCache._visible = false;
      }
      else if(inChar.myStatus.substr(0,7) == "unarmed" || inChar.myStatus.substr(0,5) == "melee" || inChar.myStatus.substr(0,7) == "execute" || inChar.myStatus == "swap" || inChar.myStatus == "startup" || inChar.myStatus == "pickup" || inChar.myStatus == "magic" || inChar.myStatus.substr(-6,5) == "parry" || inChar.myStatus.substr(0,4) == "stun")
      {
         if(inChar.isFacingRight)
         {
            handNoneFrontCache._visible = false;
            handShootFrontCache._visible = true;
            handNoneBackCache._visible = true;
            handShootBackCache._visible = false;
         }
         if(!inChar.isFacingRight)
         {
            handNoneFrontCache._visible = true;
            handShootFrontCache._visible = false;
            handNoneBackCache._visible = false;
            handShootBackCache._visible = true;
         }
      }
      else if(_loc2_ != undefined && inChar.reloadTimer > -1)
      {
         if(inChar.isFacingRight)
         {
            handNoneFrontCache._visible = false;
            handShootFrontCache._visible = true;
            handNoneBackCache._visible = true;
            handShootBackCache._visible = false;
         }
         if(!inChar.isFacingRight)
         {
            handNoneFrontCache._visible = true;
            handShootFrontCache._visible = false;
            handNoneBackCache._visible = false;
            handShootBackCache._visible = true;
         }
         handShootBackCache.myGun.gotoAndStop(inChar.rofLastFrame);
         handShootFrontCache.myGun.gotoAndStop(inChar.rofLastFrame);
         _loc4_ = handShootBackCache.myGun._currentframe;
         while(_loc4_ < inChar.reloadTimer + 1)
         {
            handShootBackCache.myGun.nextFrame();
            _loc4_ = _loc4_ + 1;
         }
         handShootFrontCache.myGun.gotoAndStop(inChar.rofLastFrame);
         _loc4_ = handShootFrontCache.myGun._currentframe;
         while(_loc4_ < inChar.reloadTimer + 1)
         {
            handShootFrontCache.myGun.nextFrame();
            _loc4_ = _loc4_ + 1;
         }
         if(handShootBackCache.myGun._currentframe != undefined)
         {
            inChar.rofLastFrame = handShootBackCache.myGun._currentframe;
         }
         else
         {
            inChar.rofLastFrame = handShootFrontCache.myGun._currentframe;
         }
         if(inChar.reloadTimer + 1 > handShootBackCache.myGun._totalframes)
         {
            handShootBackCache.myGun.gotoAndStop(handShootBackCache.myGun._totalframes);
         }
         if(inChar.reloadTimer + 1 > handShootFrontCache.myGun._totalframes)
         {
            handShootFrontCache.myGun.gotoAndStop(handShootFrontCache.myGun._totalframes);
         }
      }
      else if(inChar.aimTimer > -1 || _loc2_ != undefined && inChar.rofTimer < _loc2_.myROF + inChar.shootWaitBuffer && (inChar.myStatus == "incap" || inChar.myStatus == "cover" || inChar.myStatus == "idle" || inChar.myStatus == "run" || inChar.myStatus == "backtrack" || inChar.myStatus == "dash" || inChar.myStatus == "tactics"))
      {
         if(inChar.isFacingRight && !inChar.facingOpposite || !inChar.isFacingRight && inChar.facingOpposite)
         {
            handNoneFrontCache._visible = false;
            handShootFrontCache._visible = true;
            handNoneBackCache._visible = true;
            handShootBackCache._visible = false;
         }
         if(!inChar.isFacingRight && !inChar.facingOpposite || inChar.isFacingRight && inChar.facingOpposite)
         {
            handNoneFrontCache._visible = true;
            handShootFrontCache._visible = false;
            handNoneBackCache._visible = false;
            handShootBackCache._visible = true;
         }
         handShootBackCache.myGun.gotoAndStop(inChar.rofLastFrame);
         handShootFrontCache.myGun.gotoAndStop(inChar.rofLastFrame);
         _loc4_ = handShootBackCache.myGun._currentframe;
         while(_loc4_ < inChar.rofTimer + 1)
         {
            handShootBackCache.myGun.nextFrame();
            _loc4_ = _loc4_ + 1;
         }
         handShootFrontCache.myGun.gotoAndStop(inChar.rofLastFrame);
         _loc4_ = handShootFrontCache.myGun._currentframe;
         while(_loc4_ < inChar.rofTimer + 1)
         {
            handShootFrontCache.myGun.nextFrame();
            _loc4_ = _loc4_ + 1;
         }
         if(handShootBackCache.myGun._currentframe != undefined)
         {
            inChar.rofLastFrame = handShootBackCache.myGun._currentframe;
         }
         else
         {
            inChar.rofLastFrame = handShootFrontCache.myGun._currentframe;
         }
         if(inChar.rofTimer + 1 > handShootBackCache.myGun._totalframes)
         {
            handShootBackCache.myGun.gotoAndStop(handShootBackCache.myGun._totalframes);
         }
         if(inChar.rofTimer + 1 > handShootFrontCache.myGun._totalframes)
         {
            handShootFrontCache.myGun.gotoAndStop(handShootFrontCache.myGun._totalframes);
         }
         if(inChar.rofTimer < handShootFrontCache.myGun.myBlast._totalframes)
         {
            handShootFrontCache.myGun.myBlast.gotoAndStop(inChar.rofTimer);
         }
         if(inChar.rofTimer < handShootBackCache.myGun.myBlast._totalframes)
         {
            handShootBackCache.myGun.myBlast.gotoAndStop(inChar.rofTimer);
         }
      }
      else
      {
         handNoneBackCache._visible = true;
         handShootBackCache._visible = false;
         handNoneFrontCache._visible = true;
         handShootFrontCache._visible = false;
         if(_loc2_ != undefined)
         {
            if(!inChar.isFacingRight && !inChar.facingOpposite || inChar.isFacingRight && inChar.facingOpposite)
            {
               handNoneBackCache.myGun.gotoAndStop(1);
            }
            else
            {
               handNoneFrontCache.myGun.gotoAndStop(1);
            }
         }
         if(inChar.rofTimer < handNoneFrontCache.myGun.myBlast._totalframes)
         {
            handNoneFrontCache.myGun.myBlast.gotoAndStop(inChar.rofTimer);
         }
         if(inChar.rofTimer < handNoneBackCache.myGun.myBlast._totalframes)
         {
            handNoneBackCache.myGun.myBlast.gotoAndStop(inChar.rofTimer);
         }
      }
      if(_loc2_.twoHand && !inChar.myDataRef.amZombie && !inChar.myDataRef.amAbom)
      {
         if(!inChar.isFacingRight && !inChar.facingOpposite || inChar.isFacingRight && inChar.facingOpposite)
         {
            handShootFrontCache._visible = false;
            handNoneFrontCache._visible = false;
         }
         if(inChar.isFacingRight && !inChar.facingOpposite || !inChar.isFacingRight && inChar.facingOpposite)
         {
            handShootBackCache._visible = false;
            handNoneBackCache._visible = false;
         }
      }
      else
      {
         handNoneFrontCache.myGun.myHand2._visible = false;
         handShootFrontCache.myGun.myHand2._visible = false;
         handNoneBackCache.myGun.myHand2._visible = false;
         handShootBackCache.myGun.myHand2._visible = false;
         inChar.mySprite.myHand.myGun.myHand2._visible = false;
         inChar.mySprite.myHand2.myGun.myHand2._visible = false;
      }
      var _loc8_ = undefined;
      _loc8_ = inChar.rofTimer;
      var _loc3_ = undefined;
      var _loc7_ = undefined;
      if(handShootFrontCache._visible)
      {
         _loc3_ = handShootFrontCache;
         _loc7_ = handNoneFrontCache;
      }
      else if(handShootBackCache._visible)
      {
         _loc3_ = handShootBackCache;
         _loc7_ = handNoneBackCache;
      }
      if(_loc8_ < _loc2_.myROF + inChar.shootWaitBuffer * 0.5)
      {
         inChar.lastGunX = _loc3_.myGun._x;
         inChar.lastGunY = _loc3_.myGun._y;
         inChar.lastGunRot = _loc3_._rotation;
      }
      if(inChar.reloadTimer == -1 && _loc8_ > _loc2_.myROF + inChar.shootWaitBuffer * 0.5 && inChar.myStatus.substr(0,5) != "melee" && inChar.myStatus.substr(0,7) != "unarmed" && _loc8_ <= _loc2_.myROF + inChar.shootWaitBuffer)
      {
         var _loc6_ = new Object();
         _loc6_.x = _loc7_.myGun._x;
         _loc6_.y = _loc7_.myGun._y;
         _loc7_.localToGlobal(_loc6_);
         _loc3_.globalToLocal(_loc6_);
         _loc3_.myGun._x = inChar.lastGunX;
         _loc3_.myGun._y = inChar.lastGunY;
         _loc3_._rotation = inChar.lastGunRot;
         if(_loc7_._rotation - _loc3_._rotation > 180)
         {
            _loc3_._rotation += (_loc7_._rotation - _loc3_._rotation - 360) / ((inChar.shootWaitBuffer + _loc2_.myROF - _loc8_ + 2) * 0.2);
         }
         else
         {
            _loc3_._rotation += (_loc7_._rotation - _loc3_._rotation) / ((inChar.shootWaitBuffer + _loc2_.myROF - _loc8_ + 2) * 0.2);
         }
         SwainMath.move_me(_loc3_.myGun,SwainMath.calculate_rotation(_loc3_.myGun._x,_loc3_.myGun._y,_loc6_.x,_loc6_.y),SwainMath.get_distance2(_loc3_.myGun._x,_loc3_.myGun._y,_loc6_.x,_loc6_.y) / ((inChar.shootWaitBuffer + _loc2_.myROF - _loc8_ + 5) * 0.2));
         inChar.lastGunX = _loc3_.myGun._x;
         inChar.lastGunY = _loc3_.myGun._y;
         inChar.lastGunRot = _loc3_._rotation;
      }
      else
      {
         if(inChar.rofTimer == 1)
         {
            handShootFrontCache.myGun._x = - handShootFrontCache.myGun.myHand._x + inChar.myDataRef.myWeapons[inChar.myWeapon].xOffset;
            handShootFrontCache.myGun._y = - handShootFrontCache.myGun.myHand._y + inChar.myDataRef.myWeapons[inChar.myWeapon].yOffset;
            handShootBackCache.myGun._x = - handShootBackCache.myGun.myHand._x + inChar.myDataRef.myWeapons[inChar.myWeapon].xOffset;
            handShootBackCache.myGun._y = - handShootBackCache.myGun.myHand._y + inChar.myDataRef.myWeapons[inChar.myWeapon].yOffset;
         }
         if(!_loc2_.melee && inChar.myStatus.substr(0,7) != "unarmed" && inChar.myStatus.substr(0,5) != "melee" && _loc2_ != undefined && inChar.myStatus != "swap" && inChar.myStats != "recover" && inChar.myStatus != "startup" && inChar.myStatus != "pickup" && inChar.myStatus.substr(0,4) != "stun" && inChar.myStatus != "magic")
         {
            if(inChar.reloadTimer > -1)
            {
               handShootFrontCache._rotation = -30;
               handShootBackCache._rotation = -30;
            }
            else
            {
               if(inChar.myAimX <= inChar._x && inChar.isFacingRight || inChar.myAimX >= inChar._x && !inChar.isFacingRight)
               {
                  handShootFrontCache._rotation = -90 - SwainMath.calculate_rotation(inChar._x - handShootFrontCache._x,inChar._y - handShootFrontCache._y,inChar.myAimX,inChar.myAimY);
                  handShootBackCache._rotation = -90 + SwainMath.calculate_rotation(inChar._x + handShootBackCache._x,inChar._y - handShootBackCache._y,inChar.myAimX,inChar.myAimY);
               }
               else
               {
                  handShootFrontCache._rotation = -90 + SwainMath.calculate_rotation(inChar._x - handShootFrontCache._x,inChar._y - handShootFrontCache._y,inChar.myAimX,inChar.myAimY);
                  handShootBackCache._rotation = -90 - SwainMath.calculate_rotation(inChar._x + handShootBackCache._x,inChar._y - handShootBackCache._y,inChar.myAimX,inChar.myAimY);
               }
               if(inChar._rotation > 0 && !inChar.facingOpposite || inChar._rotation < 0 && inChar.facingOpposite)
               {
                  handShootFrontCache._rotation += inChar._rotation;
                  handShootBackCache._rotation += inChar._rotation;
               }
               else
               {
                  handShootFrontCache._rotation -= inChar._rotation;
                  handShootBackCache._rotation -= inChar._rotation;
               }
            }
         }
      }
      if(inChar.myDataRef.noHands)
      {
         handShootFrontCache._visible = handShootBackCache._visible = false;
         handNoneFrontCache._visible = handNoneBackCache._visible = false;
         inChar.mySprite.myHand._visible = inChar.mySprite.myHand2._visible = false;
      }
      else if(!(handShootFrontCache == undefined && handShootBackCache == undefined && handNoneFrontCache == undefined && handNoneBackCache == undefined))
      {
         if(inChar.mySprite.myHand != undefined)
         {
            if(handShootFrontCache._visible)
            {
               handShootFrontCache.myGun.myHand._visible = false;
               handShootFrontCache.myGun.myHand2._visible = false;
               inChar.mySprite.myHand._visible = true;
               handNoneBackCache._visible = true;
               inChar.mySprite.myHand2._visible = false;
            }
            else if(handShootFrontCache == undefined)
            {
               if(handShootFrontCache == undefined && inChar.isFacingRight)
               {
                  handNoneBackCache._visible = true;
                  inChar.mySprite.myHand2._visible = false;
               }
            }
         }
         else
         {
            handShootFrontCache.myGun.myHand._visible = true;
            if(!inChar.myDataRef.amZombie && !inChar.myDataRef.amAbom)
            {
               handShootFrontCache.myGun.myHand2._visible = true;
            }
         }
         if(inChar.mySprite.myHand2 != undefined)
         {
            if(handShootBackCache._visible)
            {
               handShootBackCache.myGun.myHand._visible = false;
               handShootBackCache.myGun.myHand2._visible = false;
               inChar.mySprite.myHand2._visible = true;
               handNoneFrontCache._visible = true;
               inChar.mySprite.myHand._visible = false;
            }
            else if(handShootBackCache == undefined)
            {
               if(handShootBackCache == undefined && !inChar.isFacingRight)
               {
                  handNoneFrontCache._visible = true;
                  inChar.mySprite.myHand._visible = false;
               }
            }
         }
         else
         {
            handShootBackCache.myGun.myHand._visible = true;
            if(!inChar.myDataRef.amZombie && !inChar.myDataRef.amAbom)
            {
               handShootBackCache.myGun.myHand2._visible = true;
            }
         }
      }
      if(inChar.myWeapon == 0)
      {
         ItemGenerator.setItemSprite(bodyCache.myBackup.mySprite,inChar.myDataRef.myWeapons[1]);
      }
      else
      {
         ItemGenerator.setItemSprite(bodyCache.myBackup.mySprite,inChar.myDataRef.myWeapons[0]);
      }
      if(inChar.myDataRef.myCharacter == "tricky" && (inChar.myHealth > 0 || inChar.myStatus.substr(0,7) == "wounded"))
      {
         if(inChar.mySprite._currentframe <= 2)
         {
            inChar.myHeadStartX = -6.5;
            inChar.myHeadStartY = -2;
            inChar.myHeadRot = 0;
            inChar.myHand1StartX = handNoneFrontCache.myHand._x;
            inChar.myHand1StartY = handNoneFrontCache.myHand._y;
            inChar.myHand1Rot = handNoneFrontCache.myHand._rotation;
            inChar.myHand2StartX = handNoneBackCache.myHand._x;
            inChar.myHand2StartY = handNoneBackCache.myHand._y;
            inChar.myHand2Rot = handNoneBackCache.myHand._rotation;
         }
         headCache.headSprite._x = inChar.myHeadStartX + SwainMath.randomNumber(-15,15) / 10;
         headCache.headSprite._y = inChar.myHeadStartY + SwainMath.randomNumber(-15,15) / 10;
         headCache.headSprite._rotation = inChar.myHeadRot + SwainMath.randomNumber(-40,40) / 10;
         handNoneFrontCache.myHand._x = inChar.myHand1StartX + SwainMath.randomNumber(-15,15) / 10;
         handNoneFrontCache.myHand._y = inChar.myHand1StartY + SwainMath.randomNumber(-15,15) / 10;
         handNoneFrontCache.myHand._rotation = inChar.myHand1Rot + SwainMath.randomNumber(-40,40) / 10;
         handNoneBackCache.myHand._x = inChar.myHand2StartX + SwainMath.randomNumber(-15,15) / 10;
         handNoneBackCache.myHand._y = inChar.myHand2StartY + SwainMath.randomNumber(-15,15) / 10;
         handNoneBackCache.myHand._rotation = inChar.myHand2Rot + SwainMath.randomNumber(-40,40) / 10;
      }
      if(inChar.interactTarget != undefined)
      {
         inChar.mySprite.hisHead.gotoAndStop(inChar.interactTarget.myDataRef.myCharacter);
         inChar.mySprite.hisBody.gotoAndStop(inChar.interactTarget.myDataRef.myCharacter);
         if(inChar.mySprite.flipPartner && inChar.isFacingRight)
         {
            inChar.mySprite.hisHead.nextFrame();
            inChar.mySprite.hisBody.nextFrame();
         }
         inChar.mySprite.hisHand.myHand.gotoAndStop(inChar.interactTarget.myDataRef.handType);
         inChar.mySprite.hisHand2.myHand.gotoAndStop(inChar.interactTarget.myDataRef.handType);
      }
      if(inChar.headDamage > 3 || inChar.myDataRef.myHat[inChar.myHat] == undefined)
      {
         headCache.myHat._visible = false;
         headCache.myHat2._visible = false;
      }
      else
      {
         headCache.myHat._visible = true;
         headCache.myHat2._visible = true;
         headCache.myHat.gotoAndStop(inChar.myDataRef.myHat[inChar.myHat].myType);
         headCache.myHat2.gotoAndStop(inChar.myDataRef.myHat[inChar.myHat].myType);
         headCache.myHat.inHat.gotoAndStop(Math.ceil(inChar.myDataRef.myHat[inChar.myHat].myIntegrity));
         headCache.myHat2.inHat.gotoAndStop(Math.ceil(inChar.myDataRef.myHat[inChar.myHat].myIntegrity));
      }
      if(inChar.headDamage > 3 || inChar.myDataRef.myMask[inChar.myMask] == undefined)
      {
         headCache.myMask._visible = false;
      }
      else
      {
         headCache.myMask._visible = true;
         if(inChar.myDataRef.myMask[inChar.myMask].flipMe)
         {
            if(inChar.isFacingRight)
            {
               headCache.myMask.gotoAndStop(inChar.myDataRef.myMask[inChar.myMask].myType + "_R");
            }
            else
            {
               headCache.myMask.gotoAndStop(inChar.myDataRef.myMask[inChar.myMask].myType + "_L");
            }
         }
         else
         {
            headCache.myMask.gotoAndStop(inChar.myDataRef.myMask[inChar.myMask].myType);
         }
      }
      if(inChar.headDamage > 3 || inChar.myDataRef.myMouth[inChar.myMouth] == undefined)
      {
         headCache.myMouth._visible = false;
      }
      else
      {
         headCache.myMouth._visible = true;
         headCache.myMouth.gotoAndStop(inChar.myDataRef.myMouth[inChar.myMouth].myType);
      }
      if(inChar.myDataRef.myShirt[inChar.myShirt] == undefined)
      {
         bodyCache.myShirt._visible = false;
      }
      else
      {
         bodyCache.myShirt._visible = true;
         bodyCache.myShirt.gotoAndStop(inChar.myDataRef.myShirt[inChar.myShirt].myType);
         bodyCache.myShirt.inShirt.gotoAndStop(Math.ceil(inChar.myDataRef.myShirt[inChar.myShirt].myIntegrity));
      }
   }
   static function setPerspectiveScale(inX, inY, inRoom)
   {
      var _loc5_ = 100;
      if(inRoom.amStairs)
      {
         var _loc7_ = SwainMath.get_distance2(inX,inY,inRoom.myDL._x,inRoom.myDL._y) + SwainMath.get_distance2(inX,inY,inRoom.myUL._x,inRoom.myUL._y);
         var _loc9_ = SwainMath.get_distance2(inX,inY,inRoom.myDR._x,inRoom.myDR._y) + SwainMath.get_distance2(inX,inY,inRoom.myUR._x,inRoom.myUR._y);
         var _loc3_ = 1 - (_loc7_ - inRoom.leftWidth) / (inRoom.upWidth + inRoom.downWidth - inRoom.leftWidth);
         var _loc2_ = 1 - (_loc9_ - inRoom.rightWidth) / (inRoom.upWidth + inRoom.downWidth - inRoom.rightWidth);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > 1)
         {
            _loc3_ = 1;
         }
         var _loc8_ = inRoom.myDL._y * _loc3_ + inRoom.myDR._y * _loc2_;
         _loc5_ = 100 - (_loc8_ - inY + inRoom.ystart) / 15;
      }
      else
      {
         _loc5_ = 100 - (inRoom.myDL._y - inY + inRoom.ystart) / 15;
      }
      return _loc5_;
   }
   function attractToDoor(inDoor)
   {
      this.attractToMC(inDoor,"door");
      this.targetDoor = inDoor;
      this.myMission = "leave";
      this.doorLock = true;
      if(this.myRoster == MadnessRoster.playerRoster)
      {
         this._parent.followDoor = inDoor;
      }
      inDoor.keepDoorOpen(this.myDataRef);
   }
   function attractToMC(inMC, inInteractType)
   {
      this.myAimX = inMC._x;
      this.myAimY = inMC._y - 60;
      this.interactType = inInteractType;
      this.targetLock = true;
      this.ignoreRooms = false;
      this.intendedTarget = inMC;
      this.intendedX = this.intendedTarget._x;
      this.intendedY = this.intendedTarget._y;
      this.intendedRoom = this._parent.determineRoom(this.intendedX,this.intendedY);
      this.testAddToLockList(this.interactType,this.targetLock,this.intendedTarget,this.intendedX,this.intendedY);
   }
   static function setMyDepth(inMC, inNum)
   {
      var _loc2_ = 1;
      if(inMC.myDataRef.myScale != undefined)
      {
         _loc2_ /= inMC.myDataRef.myScale;
      }
      // 23/11/2026 dyzqy: Holy this is hella inefficient, doing CRAZY AMOUNT of decimal point calculations per FRAME, per GRUNT
      //            (TODO) Verify this doesn't break anything    
      var depth:Number = Math.floor(inNum * _loc2_ * 1000) + 100;
      while(inMC._parent.getInstanceAtDepth(depth) != undefined)
      {
         depth--;
      }
      inMC.swapDepths(depth);
   }
   function findClosestObstacle()
   {
      var _loc2_ = undefined;
      var _loc7_ = undefined;
      var _loc6_ = 999999999;
      var _loc5_ = undefined;
      var _loc4_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < MadnessObstacle.allObstacles.length)
      {
         _loc2_ = MadnessObstacle.allObstacles[_loc3_];
         if(_loc2_.myHealth > 0 && _loc2_.inUse == undefined && _loc2_.amCover)
         {
            if(this._x < _loc2_._x + _loc2_.myWidth / 2 + this.myWidth / 2 + _loc2_.zoneWidth && this._x > _loc2_._x - _loc2_.myWidth / 2 - this.myWidth / 2 - _loc2_.zoneWidth && this._y < _loc2_._y + _loc2_.myDepth / 2 + _loc2_.zoneDepth && this._y > _loc2_._y - _loc2_.myDepth / 2 - _loc2_.zoneDepth)
            {
               _loc4_.push(_loc2_);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc4_.length == 1)
      {
         _loc7_ = _loc4_[0];
      }
      else
      {
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc5_ = SwainMath.get_distance(this,_loc4_[_loc3_]);
            if(_loc5_ < _loc6_)
            {
               _loc6_ = _loc5_;
               _loc7_ = _loc4_[_loc3_];
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      return _loc7_;
   }
   function findClosestPickup(inPlayer)
   {
      var _loc2_ = undefined;
      var _loc8_ = undefined;
      var _loc6_ = 999999999;
      var _loc5_ = undefined;
      var _loc4_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < MadnessParticle.allPickups.length)
      {
         _loc2_ = MadnessParticle.allPickups[_loc3_];
         if(!inPlayer && this._x < _loc2_._x + 255 && this._x > _loc2_._x - 255 && this._y < _loc2_._y + 235 && this._y > _loc2_._y - 235 || inPlayer && this._x < _loc2_._x + 55 && this._x > _loc2_._x - 55 && this._y < _loc2_._y + 35 && this._y > _loc2_._y - 35)
         {
            _loc4_.push(_loc2_);
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc4_.length == 1)
      {
         _loc8_ = _loc4_[0];
      }
      else
      {
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc5_ = SwainMath.get_distance(this,_loc4_[_loc3_]);
            if(_loc5_ < _loc6_)
            {
               _loc6_ = _loc5_;
               _loc8_ = _loc4_[_loc3_];
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      return _loc8_;
   }
   function returnInvertValid()
   {
      return this.reloadTimer == -1 && (this.myAimX <= this._x && this.isFacingRight || this.myAimX >= this._x && !this.isFacingRight);
   }
   function swapGear()
   {
      this.myWeapon = 1 - this.myWeapon;
      this.myDataRef.myWeapon = this.myWeapon;
      this.rofTimer = 300;
   }
   function hitTactics(inWeapon, inAttacker, inBlock, inKillShot, inRange)
   {
      var _loc2_ = inWeapon.myROF / 6 * inAttacker.myDataRef.modHurtTactics;
      if(inWeapon.myCat == "rifle")
      {
         _loc2_ *= 2;
      }
      if(inWeapon.myCat == "smg")
      {
         _loc2_ *= 1.2;
      }
      if(inWeapon.myCat == "shotgun")
      {
         _loc2_ *= 1;
      }
      if(inWeapon.myCat == "pistol" || inWeapon.myCat == "revolver")
      {
         _loc2_ *= 1;
      }
      if(inWeapon.myCat == "heavy")
      {
         _loc2_ *= 0.5;
      }
      if(inWeapon.myCat == "electric")
      {
         _loc2_ *= 6;
      }
      this.tacDisplayTimer = 20;
      if(!inRange)
      {
         if(MadnessDataFile.havePerk("perkLowAcc3",this.myDataRef))
         {
            _loc2_ *= 0.5;
         }
         else if(MadnessDataFile.havePerk("perkLowAcc1",this.myDataRef))
         {
            _loc2_ *= 0.5;
         }
         else
         {
            _loc2_ *= 0.9;
         }
      }
      if(MadnessDataFile.havePerk("perkLowAcc2",this.myDataRef) && inWeapon.myCat == "melee")
      {
         _loc2_ *= 0.5;
      }
      if(MadnessDataFile.havePerk("perkCoverShoot",this.myDataRef) && this.targetObstacle.inUse == this && (this._x < this.targetObstacle._x && inAttacker._x > this.targetObstacle || this._x > this.targetObstacle._x && inAttacker._x < this.targetObstacle))
      {
         _loc2_ *= 0.5;
      }
      if(this.myDataRef.amSpecial && this.myStatus.substr(0,4) == "stun")
      {
         _loc2_ = 0;
      }
      if(inAttacker._x > this._x && (!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite) || inAttacker._x < this._x && (this.isFacingRight && !this.facingOpposite || !this.isFacingRight && this.facingOpposite))
      {
         _loc2_ *= 1.5;
      }
      if(inBlock)
      {
         _loc2_ *= 0.25;
      }
      if(this.mySpeedRight == 0 && this.mySpeedDown == 0 && !inBlock)
      {
         if(inWeapon.myCat == "smg" && MadnessDataFile.havePerk("perkSMGTacDamage",this.myDataRef))
         {
            _loc2_ *= 1.2;
         }
         if(inWeapon.myCat == "rifle" && MadnessDataFile.havePerk("perkRifleTacDamage",this.myDataRef))
         {
            _loc2_ *= 1.2;
         }
         _loc2_ *= 2;
      }
      if(inAttacker.myDataRef.amZombie)
      {
         _loc2_ *= 2;
      }
      if(this.myRoster == MadnessRoster.playerRoster && MadnessGameSelect.gameMode == "story")
      {
         _loc2_ = _loc2_ / 2 + _loc2_ * MadnessCharacter.damageDifficultyMod / 2;
      }
      this.myTactics -= _loc2_;
      if(_loc2_ > 0)
      {
         this.tacTimer = 0;
      }
      if(this.myTactics <= 0)
      {
         this.myTactics = 0;
      }
   }
   function damageMelee(inWeapon)
   {
      if(inWeapon.myCat == "melee" && inWeapon.myTag != "Unarmed")
      {
         inWeapon.myHealth -= 1;
         ItemGenerator.setItemSprite(this.mySprite.handNone_front.myGun,this.myDataRef.myWeapons[this.myWeapon]);
         ItemGenerator.setItemSprite(this.mySprite.handNone_back.myGun,this.myDataRef.myWeapons[this.myWeapon]);
         ItemGenerator.setItemSprite(this.mySprite.handShoot_front.myGun,this.myDataRef.myWeapons[this.myWeapon]);
         ItemGenerator.setItemSprite(this.mySprite.handShoot_back.myGun,this.myDataRef.myWeapons[this.myWeapon]);
         if(inWeapon.myHealth <= inWeapon.myHealthMax * 0.12 && inWeapon.broken == false)
         {
            inWeapon.broken = true;
            this.weaponBreakParticle(inWeapon);
         }
         if(inWeapon.myHealth <= 0)
         {
            this.myDataRef.myWeapons[this.myWeapon] = undefined;
            this.myStatus = "stun" + String(SwainMath.randomNumber(1,3));
            this.mySprite.gotoAndStop(this.myStatus);
            this.playSound("break");
         }
      }
   }
   function weaponBreakParticle(inWeapon)
   {
      if(this.amPlayer || !this.amPlayer && this._x > this._parent.myFollowTarget._x - 400 && this._x < this._parent.myFollowTarget._x + 400)
      {
         var _loc2_ = undefined;
         if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
         {
            _loc2_ = -1;
         }
         else
         {
            _loc2_ = 1;
         }
         var _loc3_ = SwainMath.randomNumber(-800,800) / 100;
         this._parent.createParticle(inWeapon.myType,"melee_piece",this._x + 28 * _loc2_,SwainMath.get_position(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),this.myAimX,this.myAimY),35,"y"),SwainMath.randomNumber(-60,-30) / 10 * _loc2_,SwainMath.randomNumber(-250,-150) / 10,SwainMath.calculate_rotation(this._x,this._y - this.myDataRef.myShootHeight * (this._yscale / 100),this.myAimX,this.myAimY),SwainMath.randomNumber(-900,900) / 10,0.7,this._y + _loc3_,100,this._yscale * _loc2_,true,90);
      }
   }
   function spitBlood(inMajor)
   {
      if(this.isFacingRight)
      {
         this.isFacingRight = false;
      }
      else
      {
         this.isFacingRight = true;
      }
      var _loc2_ = 0;
      while(_loc2_ < 3)
      {
         if(this.isFacingRight)
         {
            this.makeSparks(this._x - (this.mySprite._x + this.mySprite.myHead._x + 10),this._y + (this.mySprite._y + this.mySprite.myHead._y + 12),this._y,"drops_" + this.myDataRef.myBlood);
         }
         else
         {
            this.makeSparks(this._x + (this.mySprite._x + this.mySprite.myHead._x + 10),this._y + (this.mySprite._y + this.mySprite.myHead._y + 12),this._y,"drops_" + this.myDataRef.myBlood);
         }
         if(!inMajor)
         {
            _loc2_ = 4;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this.isFacingRight)
      {
         this.isFacingRight = false;
      }
      else
      {
         this.isFacingRight = true;
      }
      if(inMajor)
      {
         if(!this.isFacingRight)
         {
            this._parent.createEffect(this._x - (this.mySprite._x + this.mySprite.myHead._x + 14),this._y + (this.mySprite._y + this.mySprite.myHead._y + 13),"blood" + String(SwainMath.randomNumber(4,6)) + "_" + this.myBlood,100,100,-90);
         }
         else
         {
            this._parent.createEffect(this._x + (this.mySprite._x + this.mySprite.myHead._x + 14),this._y + (this.mySprite._y + this.mySprite.myHead._y + 13),"blood" + String(SwainMath.randomNumber(4,6)) + "_" + this.myBlood,100,100,90);
         }
      }
   }
   function useActivator()
   {
      this.targetActivator.activateMe();
   }
   function checkWhipRange()
   {
      if(!MadnessDataFile.havePerk("perkMeleePistolWhip",this.myDataRef) || this.lifeSpan < 45)
      {
         return false;
      }
      var _loc2_ = undefined;
      var _loc4_ = 0;
      while(_loc4_ < MadnessCharacter.allRosters.length)
      {
         var _loc3_ = 0;
         while(_loc3_ < MadnessCharacter.allRosters[_loc4_].myActiveMembers.length)
         {
            _loc2_ = MadnessCharacter.allRosters[_loc4_].myActiveMembers[_loc3_].mySprite;
            if(_loc2_.myFaction != this.myFaction)
            {
               if(_loc2_.myHealth > 0 && !_loc2_.amDodging)
               {
                  if(_loc2_._x > this._x && _loc2_._x < this._x + this.myDataRef.myUnarmed.myRange * this.myDataRef.myScale * 0.8 && (this.isFacingRight && !this.facingOpposite || !this.isFacingRight && this.facingOpposite) || _loc2_._x < this._x && _loc2_._x > this._x - this.myDataRef.myUnarmed.myRange * this.myDataRef.myScale * 0.8 && (!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite))
                  {
                     if(this.inMeleeRange(_loc2_))
                     {
                        return true;
                     }
                  }
               }
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
      return false;
   }
   function inMeleeRange(inTarget)
   {
      if(this.amPlayer)
      {
         return this._y > inTarget._y - 40 && this._y < inTarget._y + 40;
      }
      return this._y > inTarget._y - 20 * this.myDataRef.myScale && this._y < inTarget._y + 20 * this.myDataRef.myScale;
   }
   function inMeleeRangeAI(inTarget)
   {
      return this._y > inTarget._y - 40 + inTarget.mySpeedDown * 3 * this.slowmoSpeedMod * this.myDataRef.myScale && this._y < inTarget._y + 40 + inTarget.mySpeedDown * 3 * this.slowmoSpeedMod * this.myDataRef.myScale;
   }
   function shakeyCam(inNum)
   {
      this._parent.shakeyCam(inNum);
   }
   function amDead()
   {
      this.gotoAndStop(this._totalframes);
   }
   static function myPartOn(inPart, inValue, inCount)
   {
      if(inCount == undefined || inCount == 0)
      {
         inCount = 0;
         inPart.stop();
      }
      if(inCount == 6)
      {
         return false;
      }
      if(inPart._parent.myDataRef.myWeapons[inPart._parent.myWeapon] != undefined)
      {
         return inPart._parent.myDataRef.myWeapons[inPart._parent.myWeapon][inValue];
      }
      if(inPart._parent.myGun.myName != undefined)
      {
         return inPart._parent.myGun[inValue];
      }
      return MadnessCharacter.myPartOn(inPart._parent,inValue,inCount + 1);
   }
   function pickupGun()
   {
      this.myDataRef.myWeapons[this.myWeapon] = this.targetPickup.myGun;
      MadnessParticle.removePickup(this.targetPickup);
      if(this.myDataRef.myWeapons[this.myWeapon].melee)
      {
         this.playSound("swapmelee");
      }
      else if(this.myDataRef.myWeapons[this.myWeapon] != undefined)
      {
         this.playSound("swapgun");
      }
      if(MadnessLevel.currentLevel.myWorld == 0 && MadnessLevel.currentLevel.myLevel == 7 && this.myDataRef.myWeapons[this.myWeapon].myType == "binarysword")
      {
         MadnessMedals.unlockMedal("saviorsword");
      }
   }
   function initiatePickup()
   {
      this.targetLock = false;
      this.myStatus = "pickup";
      this.mySpeedDown = 0;
      this.mySpeedRight = 0;
      this.targetLock = false;
   }
   function throwWeapon()
   {
      var _loc6_ = this.myDataRef.myWeapons[this.myWeapon];
      if(_loc6_ != undefined)
      {
         var _loc3_ = undefined;
         if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
         {
            _loc3_ = -1;
         }
         else
         {
            _loc3_ = 1;
         }
         var _loc7_ = SwainMath.randomNumber(-300,300) / 100;
         var _loc4_ = 10;
         if(this.myDataRef.myWeapons[this.myWeapon].melee)
         {
            _loc4_ = 70;
         }
         var _loc8_ = - (25 + this.myDataRef.statSTR / 2 + 10 * Number(this.myDataRef.myWeapons[this.myWeapon].melee)) + (30 + this.myDataRef.statSTR / 2) * ((Math.abs(SwainMath.calculate_rotation(this._x,this._y,this.myAimX,this.myAimY)) - 20) / 90);
         var _loc9_ = (25 + this.myDataRef.statSTR / 2 + 10 * Number(this.myDataRef.myWeapons[this.myWeapon].melee)) * (90 - SwainMath.getRotDistance(Math.abs(SwainMath.calculate_rotation(this._x,this._y,this.myAimX,this.myAimY)),90)) / 90;
         var _loc2_ = new Object();
         var _loc5_ = undefined;
         if(this.mySprite.myHand)
         {
            _loc5_ = this.mySprite.myHand;
         }
         else
         {
            _loc5_ = this.mySprite.myHand2;
         }
         _loc2_.x = 0;
         _loc2_.y = 0;
         _loc5_.localToGlobal(_loc2_);
         this._parent.globalToLocal(_loc2_);
         this.myDataRef.myWeapons[this.myWeapon].myThrowerFaction = this.myFaction;
         this._parent.createParticle(_loc6_.myType,"thrown",_loc2_.x,_loc2_.y,_loc9_ * _loc3_,_loc8_,-20 * _loc3_ + SwainMath.randomNumber(-100,100) / 10,_loc4_ * _loc3_,0.5,this._y + _loc7_,100,this._yscale * _loc3_,true,90,this.myDataRef.myWeapons[this.myWeapon]);
         if(this.myRoster != MadnessRoster.playerRoster && this.myDataRef.myWeapons[this.myWeapon].myClips > 0)
         {
            this.myDataRef.myWeapons[this.myWeapon].myClips = 0;
         }
         if(this.myDataRef.myWeapons[this.myWeapon].amHook)
         {
            this.thrownHook = true;
         }
         this.myDataRef.myWeapons[this.myWeapon] = undefined;
      }
   }
   function launchGrenade()
   {
      var _loc3_ = undefined;
      if(!this.isFacingRight && !this.facingOpposite || this.isFacingRight && this.facingOpposite)
      {
         _loc3_ = -1;
      }
      else
      {
         _loc3_ = 1;
      }
      var _loc5_ = SwainMath.randomNumber(-300,300) / 100;
      var _loc6_ = 4;
      var _loc7_ = -45 + 45 * ((Math.abs(this._parent.playerAim._rotation) - 20) / 90);
      var _loc8_ = 40 * Math.abs(this._parent.playerAim._rotation / 90);
      var _loc2_ = new Object();
      var _loc4_ = undefined;
      if(this.mySprite.handShoot_front._visible)
      {
         _loc4_ = this.mySprite.handShoot_front;
      }
      else
      {
         _loc4_ = this.mySprite.handShoot_back;
      }
      _loc2_.x = 0;
      _loc2_.y = 0;
      _loc4_.myGun.myShootPoint.localToGlobal(_loc2_);
      this._parent.globalToLocal(_loc2_);
      this._parent.createParticle(this.myDataRef.myWeapons[this.myWeapon].myDamageType,"projectile",_loc2_.x,_loc2_.y,_loc8_ * _loc3_,_loc7_,this._parent.playerAim._rotation,_loc6_ * _loc3_,0.5,this._y + _loc5_,100,this._yscale * _loc3_,true,90,this.myDataRef.myWeapons[this.myWeapon]);
   }
   function applyKnockback(inSource, inPower, inReverseBlast)
   {
      if(this.myHealth > 0 && !this.noDamage && (inSource.myDataRef.myScale >= this.myDataRef.myScale || !this.myDataRef.bulletEater) && this.myStatus != "restrained")
      {
         this.myStatus = "knockback";
         this.dropGun();
         if(inSource._x < this._x && !this.isFacingRight || inSource._x > this._x && this.isFacingRight)
         {
            this.mySubStatus = "_1";
         }
         else
         {
            this.mySubStatus = "_2";
         }
         if(this.myDataRef.amZombie)
         {
            this.mySubStatus = "_zombie" + this.mySubStatus;
         }
         else if(this.myDataRef.headGearResurrect && this.myHealth == 1)
         {
            this.mySubStatus = "_res" + this.mySubStatus;
         }
         else if(this.myDataRef.noHands)
         {
            this.mySubStatus = "_nohands" + this.mySubStatus;
         }
         if(inSource._x < this._x)
         {
            this.mySpeedRight = inPower;
         }
         else
         {
            this.mySpeedRight = - inPower;
         }
         if(inReverseBlast)
         {
            this.mySpeedRight *= -1;
         }
      }
   }
   function meleeHealthHit(inAttacker, inWeapon)
   {
      if(this.myDataRef.myHat[0] != undefined && this.myDataRef.disarmHelm || this.blocking && this.freakOutTimer == 0)
      {
         this.meleeHealth -= 1;
         this.meleeHealthTimer = 90;
      }
      if(this.meleeHealth == 0 && this.myHealth > 0)
      {
         if(this.blocking)
         {
            this.disarmGun();
            this.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
         }
         else if(this.myDataRef.myHat[0] != undefined)
         {
            this.myDataRef.myHat[0].myIntegrity--;
            if(this.myDataRef.myHat[0].myIntegrity == 0)
            {
               this.disarmArmor(this.myDataRef.myHat[0]);
               if(this.myDataRef.amZombie || this.myDataRef.amAbom)
               {
                  this.myStatus = "stun_parry" + SwainMath.randomNumber(1,2);
               }
               else
               {
                  this.myStatus = "stun_helmet";
               }
            }
            else if(this.myDataRef.freakOut)
            {
               this.freakOutTimer = 300;
            }
         }
         this.meleeHealthTimer = 500;
         this.meleeHealth = 999;
         if(inAttacker.myDataRef.myScale >= this.myDataRef.myScale)
         {
            this.applyKnockback(inAttacker,15,false);
         }
         else if(this.myStatus.substr(0,4) != "stun")
         {
            this.mySprite.gotoAndStop("idle");
            this.myStatus = "stun" + SwainMath.randomNumber(4,5);
            this.mySprite.gotoAndStop(this.myStatus);
         }
         this.meleeHealth = this.myDataRef.meleeHealth;
      }
   }
   function determineGameSpeed()
   {
      this.myGameSpeed = _root.myGameSpeed;
      if(this.myStatus == "swap" && MadnessDataFile.havePerk("perkReload1",this.myDataRef))
      {
         this.myGameSpeed = this.myGameSpeed + 1;
      }
      if(this.slowMoActive && (this.myStatus.substr(0,5) == "melee" || this.myStatus.substr(0,7) == "unarmed") && MadnessDataFile.havePerk("perkBulletTime2",this.myDataRef))
      {
         this.myGameSpeed = this.myGameSpeed + 1;
      }
      if(this.myDataRef.myWeapons[this.myWeapon] == undefined && this.myStatus.substr(0,7) == "unarmed")
      {
         if(MadnessDataFile.havePerk("perkUnarmedSpeed3",this.myDataRef))
         {
            this.myGameSpeed = this.myGameSpeed + 1;
         }
         else if(MadnessDataFile.havePerk("perkUnarmedSpeed2",this.myDataRef) && this.mySprite._currentframe >= this.mySprite._totalframes - 8 && this.mouseHold)
         {
            this.myGameSpeed = this.myGameSpeed + 1;
         }
         else if(MadnessDataFile.havePerk("perkUnarmedSpeed1",this.myDataRef) && this.mySprite._currentframe >= this.mySprite._totalframes - 4 && this.mouseHold)
         {
            this.myGameSpeed = this.myGameSpeed + 1;
         }
      }
      if(this.meleeCombos <= 2 && this.myStatus.substr(0,5) == "melee" && this.mySprite._currentframe >= this.mySprite._totalframes - 7 && this.mouseHold)
      {
         this.myGameSpeed = this.myGameSpeed + 1;
      }
      if(this.myDataRef.amSlow)
      {
         this.myGameSpeed = 0;
      }
      if(this.slowMoActive && (this.myStatus == "run" || this.myStatus == "backtrack" || this.myStatus == "dash" || this.myStatus == "idle" || this.myStatus == "dodge") && (MadnessDataFile.havePerk("perkBulletTime1",this.myDataRef) || MadnessDataFile.havePerk("perkBulletTime4",this.myDataRef)))
      {
         this.myGameSpeed = this.myGameSpeed + 1;
      }
      this.slowmoSpeedMod = 0.4 + 0.6 * this.myGameSpeed;
      this.heavySpeedMod = 1;
      if(this.myDataRef.myWeapons[this.myWeapon].amHeavy && this.myDataRef.myScale <= 1)
      {
         this.heavySpeedMod = 0.7;
      }
      if(this.slowMoActive && MadnessDataFile.havePerk("perkBulletTime4",this.myDataRef))
      {
         this.slowmoSpeedMod += 0.3;
      }
   }
   function takeCover(inObs)
   {
      if(inObs != undefined)
      {
         this.myStatus = "cover";
         this.actionTimer = 0;
         this.mySpeedRight = 0;
         this.mySpeedDown = 0;
         this.toggleGuard = false;
         inObs.inUse = this;
      }
   }
   function deserterSurrender()
   {
      if(this.myRoster != this._parent.deserterRoster)
      {
         this.myRoster.removeCharacter(this.myDataRef);
         var _loc2_ = this._parent.deserterRoster;
         _loc2_.addCharacter(this.myDataRef);
         _loc2_.makeActive(this.myDataRef);
         if(this.myStatus == "idle" || this.myStatus == "run" || this.myStatus == "dash")
         {
            this.myStatus = "surrender";
            this.mySubStatus = "1";
            if(this.myDataRef.myWeapons[this.myWeapon] != undefined)
            {
               this.dropGun();
            }
         }
      }
   }
   static function doesUnitExist(inUnit)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < MadnessCharacter.allRosters.length)
      {
         var _loc1_ = 0;
         while(_loc1_ < MadnessCharacter.allRosters[_loc2_].myActiveMembers.length)
         {
            _loc3_ = MadnessCharacter.allRosters[_loc2_].myActiveMembers[_loc1_];
            if(_loc3_.myCharacter == inUnit)
            {
               return true;
            }
            _loc1_ = _loc1_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function aimFlash()
   {
      this.aimFlashTimer = -15;
      this.myColor = new Color(this);
   }
   function playSound(inSound)
   {
      SwainAudioPlayer.playSound(inSound,MadWorld.returnAudioPosition(this._x));
   }
   function reloadMe()
   {
      if(this.myDataRef.myWeapons[this.myWeapon].myAmmo < this.myDataRef.myWeapons[this.myWeapon].myAmmoMax)
      {
         this.myDataRef.myWeapons[this.myWeapon].myAmmo = this.myDataRef.myWeapons[this.myWeapon].myAmmoMax;
         this.myDataRef.myWeapons[this.myWeapon].myClips -= 1;
         this.playSound("reload");
      }
   }
   function returnAttackScore()
   {
      var _loc1_ = new Number();
      _loc1_ = 25;
      if(MadnessGameSelect.gameMode == "story")
      {
         _loc1_ -= 10 * MadnessCharacter.damageDifficultyMod;
      }
      return _loc1_;
   }
   function testAddToLockList(inType, inLock, inTarget, inX, inY)
   {
      this.myLockList.push(inType + ": " + inLock + " " + inTarget + " " + inX + "/" + inY);
   }
   function traceLockList()
   {
      trace("  ----- Lock List for unit " + this._name + ", aka " + this.myDataRef.myCharacter + " -----  ");
      var _loc2_ = 0;
      while(_loc2_ < this.myLockList.length)
      {
         trace(_loc2_ + ": " + this.myLockList[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      trace("  ---------------------------------------  ");
   }
   function checkNoRangeMelee()
   {
      return this.myAttackTarget._x < this._x && this.myAttackTarget._x > this._x - 120 || this.myAttackTarget._x > this._x && this.myAttackTarget._x < this._x + 120;
   }
   function canGrapple(inTarget)
   {
      return (this.myDataRef.amZombie || this.myDataRef.amAbom && !this.myDataRef.noHands) && this.myDataRef.myScale == inTarget.myDataRef.myScale && (inTarget.myStatus == "idle" || inTarget.myStatus == "run" || inTarget.myStatus == "backtrack" || inTarget.myStatus == "dash" || inTarget.myStatus == "restrained" && SwainMath.randomNumber(0,1) == 0 || inTarget.myStatus.substr(0,5) == "melee" && (!inTarget.myDataRef.myWeapons[inTarget.myWeapon].melee || inTarget._x > this._x && inTarget.isFacingRight || inTarget._x < this._x && !inTarget.isFacingRight));
   }
   function zombieBite()
   {
      this.myAttackTarget.amBleeding = true;
      this.playSound("injury");
      if(SwainMath.randomNumber(0,1) == 0)
      {
         this.myAttackTarget.bodyDamage += 1;
         this.myAttackTarget.bodySpray += 1;
         this.myAttackTarget.splatterCharacter(10,this.myAttackTarget.myBlood,this.myAttackTarget._x < this._x,this._x,this._y - 70,true);
      }
      else
      {
         this.myAttackTarget.headDamage += 1;
         this.myAttackTarget.headSpray += 1;
         this.myAttackTarget.splatterCharacter(10,this.myAttackTarget.myBlood,this.myAttackTarget._x < this._x,this._x,this._y - 70,true);
      }
      this.headSpray += 1;
      if(this.headSpray > 4)
      {
         this.headSpray = 4;
      }
      if(this.myAttackTarget.bodySpray > 4)
      {
         this.myAttackTarget.bodySpray = 4;
      }
      if(this.myAttackTarget.headSpray > 4)
      {
         this.myAttackTarget.headSpray = 4;
      }
      if(this.myAttackTarget.bodyDamage > 4)
      {
         this.myAttackTarget.bodyDamage = 4;
      }
      if(this.myAttackTarget.headDamage > 4)
      {
         this.myAttackTarget.bodyDamage = 4;
      }
   }
   function turnZombie()
   {
      if(!this.amPlayer && !this.myDataRef.noZombie && this.headDamage < 4 && !this.myDataRef.amSpecial && !this.myDataRef.amZombie && !this.myDataRef.amAbom && this.myDataRef.myScale == 1)
      {
         this.myDataRef.createNew(MadnessDataFile.returnZombieType(this.myDataRef.myCharacter));
         this.myRoster.removeCharacter(this.myDataRef);
         this.myRoster = this.myDataRef.myRoster = undefined;
         this.myFaction = this.myDataRef.myFaction = "zombie";
         MadWorld.thisWorld.applyFaction(this.myDataRef);
         this.myRoster.makeActive(this.myDataRef);
         this.myDataRef.healMeMinor();
         this.refreshStats();
         this.noDamage = false;
         this.mySubWalk = String(SwainMath.randomNumber(1,3));
         this.mySubIdle = String(SwainMath.randomNumber(1,3));
         this.myAttackTarget = undefined;
         this.myMission = "engage";
         this.resurrectFlashTimer = 30;
         this.myColor = new Color(this);
         this.resurrectFlashColor = [10,10,10];
         MadnessCharacter.adjustSprite();
         this.playSound("zombieres");
      }
      else
      {
         this.noDamage = true;
         this.myStatus = "dead";
         this.mySubStatus = "_zombie_bite";
      }
   }
   function resurrectFlash()
   {
      this.myDataRef.healMeMinor();
      this.refreshStats();
      this.noDamage = false;
      if(this.myDataRef.explodeDeath > 0 || this.myDataRef.explodeDeath == undefined)
      {
         this.resurrectFlashColor = [10,10,10];
         this.resurrectFlashTimer = 30;
         if(this.myDataRef.headGearResurrect)
         {
            this.myColor = new Color(this.mySprite.myHead.myPart);
         }
         else
         {
            this.myColor = new Color(this);
         }
         this.playSound("res1");
      }
      else
      {
         this.resurrectFlashTimer = 0;
         this.aimFlash();
         this.playSound("res2");
      }
   }
   function resurrectExplode()
   {
      if(this.myDataRef.explodeDeath != undefined)
      {
         if(this.myDataRef.explodeDeath > 0)
         {
            this.myDataRef.explodeDeath--;
         }
         else
         {
            MadnessCharacter.hitExplode("grenade_explode","floor",this,this._x,this._y,this._y,160,6,"explodewet",7,null,null,null);
            var _loc3_ = "chunk";
            if(this.myDataRef.amZombie)
            {
               _loc3_ += "_zombie";
            }
            var _loc2_ = 0;
            while(_loc2_ < 20)
            {
               MadWorld.thisWorld.createParticle(this.myBlood + SwainMath.randomNumber(1,3),_loc3_,this._x + SwainMath.randomNumber(-5,5),this._y - 10,SwainMath.randomNumber(-20,20),SwainMath.randomNumber(-30,-10),SwainMath.randomNumber(-180,180),SwainMath.randomNumber(-50,50) / 10,0.5,this._y + SwainMath.randomNumber(-800,800) / 100,100,SwainMath.randomNumber(70,100),false,90);
               this._parent.createParticle("spark" + SwainMath.randomNumber(1,2),"drops_" + this.myBlood,this._x + SwainMath.randomNumber(-5,5),this._y - 10,SwainMath.randomNumber(-20,20),SwainMath.randomNumber(-20,-10),SwainMath.randomNumber(-180,180),SwainMath.randomNumber(-50,50) / 10,0.5,this._y + SwainMath.randomNumber(-800,800) / 100,100,SwainMath.randomNumber(70,100),false,90);
               this._parent.createParticle(this.myBlood + SwainMath.randomNumber(1,3),"blood",this._x + SwainMath.randomNumber(-5,5),this._y - 10,SwainMath.randomNumber(-20,20),SwainMath.randomNumber(-20,-10),SwainMath.randomNumber(-180,180),SwainMath.randomNumber(-50,50) / 10,0.5,this._y + SwainMath.randomNumber(-800,800) / 100,100,SwainMath.randomNumber(70,100),false,90);
               _loc2_ = _loc2_ + 1;
            }
            this._visible = false;
            this.killMe();
            this.removeMe();
         }
      }
   }
   function resurrectionDeath(inAttacker)
   {
      this.myDataRef.healMeMinor();
      this.refreshStats();
      this.myHealth = 1;
      this.noDamage = false;
      this.applyKnockback(inAttacker,4,false);
   }
   static function hitExplode(inType, inScorch, inSource, inX, inY, inFloor, inRange, inDamage, inSound, inKnockback, inDir, inAutoHit, inSubDeath)
   {
      var _loc1_ = undefined;
      var _loc10_ = undefined;
      var _loc5_ = 0;
      while(_loc5_ < MadnessCharacter.allRosters.length)
      {
         var _loc2_ = 0;
         while(_loc2_ < MadnessCharacter.allRosters[_loc5_].myActiveMembers.length)
         {
            if(inAutoHit != null)
            {
               _loc1_ = inAutoHit;
               _loc2_ = _loc2_ - 1;
            }
            else
            {
               _loc1_ = MadnessCharacter.allRosters[_loc5_].myActiveMembers[_loc2_].mySprite;
            }
            if(!_loc1_.deadMan && _loc1_ != inSource && !_loc1_.amDodging && _loc1_ != _loc10_)
            {
               if(inAutoHit != null || SwainMath.get_distance2(inX,inFloor,_loc1_._x,_loc1_._y) < inRange)
               {
                  var _loc6_ = false;
                  if(_loc1_.myHealth > 0)
                  {
                     _loc6_ = true;
                  }
                  _loc1_.myHealth -= inDamage;
                  _loc1_.triggerBossFlee(inDamage);
                  if(_loc6_ && _loc1_.myHealth <= 0)
                  {
                     MadnessGameSelect.appropriateXP(inSource.myDataRef,_loc1_.myDataRef,"explode");
                  }
                  if(_loc1_.myHealth <= 0)
                  {
                     _loc1_.myStatus = "dead";
                     _loc1_.headDamage += SwainMath.randomNumber(0,3);
                     _loc1_.bodyDamage += SwainMath.randomNumber(0,3);
                     if(_loc1_.headDamage > 4)
                     {
                        _loc1_.headDamage = 4;
                     }
                     if(_loc1_.bodyDamage > 4)
                     {
                        _loc1_.bodyDamage = 4;
                     }
                     _loc1_.headSpray += SwainMath.randomNumber(0,3);
                     _loc1_.bodySpray += SwainMath.randomNumber(0,3);
                     if(_loc1_.headSpray > 4)
                     {
                        _loc1_.headSpray = 4;
                     }
                     if(_loc1_.bodySpray > 4)
                     {
                        _loc1_.bodySpray = 4;
                     }
                     if(_loc1_.myDataRef.headGearResurrect && _loc1_.headDamage < 4 && inSubDeath == null)
                     {
                        _loc1_.resurrectionDeath(inSource);
                     }
                  }
                  else if(inKnockback != null)
                  {
                     _loc1_.myDataRef.myScale = _loc1_.myDataRef.myScale + 1;
                     _loc1_.applyKnockback(inSource,inKnockback,false);
                     _loc1_.myDataRef.myScale--;
                  }
                  if(inSubDeath != null && _loc1_.myDataRef.myBoss == "" && !_loc1_.myDataRef.amSpecial)
                  {
                     if(_loc1_.myStatus == "dead")
                     {
                        _loc1_.mySubStatus = inSubDeath;
                     }
                  }
                  else
                  {
                     if(_loc1_.myStatus == "dead")
                     {
                        _loc1_.mySubStatus = "_fly" + SwainMath.randomNumber(1,4);
                     }
                     if(inSource._x < _loc1_._x)
                     {
                        _loc1_.mySpeedRight = inKnockback;
                     }
                     else
                     {
                        _loc1_.mySpeedRight = (- inDamage) * 0.65;
                     }
                  }
                  _loc1_.applyDeath();
                  _loc1_.magicFlashTimer = 20;
                  _loc1_.myColor = new Color(_loc1_);
               }
            }
            if(inAutoHit != null)
            {
               _loc10_ = inAutoHit;
               inAutoHit = null;
               if(inRange == -1)
               {
                  _loc2_ = 999999999;
                  _loc5_ = 9999999999999;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
      if(inType != null)
      {
         var _loc16_ = 1;
         if(inDir != null)
         {
            _loc16_ = inDir;
         }
         MadWorld.thisWorld.createEffect(inX,inY,inType,60 * _loc16_,60 * _loc16_,0);
      }
      if(inScorch != null)
      {
         var _loc14_ = undefined;
         var _loc15_ = undefined;
         if(inScorch == "wall")
         {
            _loc14_ = 90;
            _loc15_ = inY;
         }
         if(inScorch == "floor")
         {
            _loc14_ = 0;
            _loc15_ = inFloor;
         }
         if(inSource.myRoom.amStairs)
         {
            _loc14_ = -90 + inSource.myRoom.upAngle;
            _loc15_ = inSource._y;
         }
         MadWorld.thisWorld.createSplat(inSource._x,_loc15_,"grenade_scorch",_loc14_);
      }
      if(inKnockback != null)
      {
         MadWorld.thisWorld.shakeyCam(inKnockback * 0.5);
      }
      if(inSound != null)
      {
         SwainAudioPlayer.playSound(inSound,MadWorld.returnAudioPosition(inSource._x));
      }
   }
   function freeHands()
   {
      this.myDataRef.noHands = false;
      this.myDataRef.autoHit = false;
      this.myDataRef.myShirt[this.myShirt].myIntegrity = 1;
      this.mySprite.myHand._visible = this.mySprite.myHand2._visible = true;
   }
   function grappleSmack(inType)
   {
      if(inType == "unarmed")
      {
         this.playSound("blunt");
         this.myAttackTarget.myHealth -= this.myDataRef.myUnarmed.myDamage / 4;
      }
   }
   function castSpell()
   {
      if(this.myDataRef.myMagic == "jesus1")
      {
         if(this.magicLevel == 1)
         {
            var _loc2_ = undefined;
            var _loc3_ = this._x;
            if(!this.isFacingRight)
            {
               _loc2_ = -1;
            }
            else
            {
               _loc2_ = 1;
            }
            _loc3_ += 60 * this.myDataRef.myScale * _loc2_;
            MadnessCharacter.hitExplode(null,null,this,_loc3_,this._y,this._y,80,20,"explode",12,null,null,null);
            this.playSound("magic1_cast");
         }
         if(this.magicLevel == 2)
         {
            if(!this.isFacingRight)
            {
               _loc2_ = -1;
            }
            else
            {
               _loc2_ = 1;
            }
            var _loc6_ = SwainMath.randomNumber(-300,300) / 100;
            var _loc7_ = 0;
            var _loc4_ = 0;
            var _loc5_ = 35;
            this.playSound("magic2_cast");
            MadWorld.thisWorld.createParticle("magic1","projectile",this._x + 30 * _loc2_,this._y - 68 * this.myDataRef.myScale,_loc5_ * _loc2_,_loc4_,90 * _loc2_,_loc7_ * _loc2_,0.5,this._y + _loc6_,100,this._yscale * _loc2_,true,90,this.myDataRef.myWeapons[this.myWeapon]);
         }
      }
   }
   static function applyNecessaryStats(inChar, inData)
   {
      inChar.myMask = 0;
      inChar.myMouth = 0;
      inChar.myShirt = 0;
      inChar.myHat = 0;
      inChar.headDamage = 0;
      inChar.bodyDamage = 0;
      inChar.headSpray = 0;
      inChar.bodySpray = 0;
   }
   function wearHalo()
   {
      this.myDataRef.createArmor("halo");
      this.myDataRef.myDodge = "jesus";
      this.myDataRef.myMagic = "jesus1";
      this.myDataRef.applyStats(25,25,25,25,0,25,null,25,25,25,25,25,25,25,25);
      MadnessCharacter.adjustSprite(this);
      this.refreshStats();
      this.resurrectFlashTimer = 30;
      this.myColor = new Color(this);
      this.resurrectFlashColor = [10,10,10];
      this.playSound("magic2_explode");
   }
   function triggerBossFlee(inDamage)
   {
      if(this.myDataRef.bossFlee != undefined && inDamage > 0)
      {
         if(this.myHealth <= 0)
         {
            this.myHealth = 1;
         }
         if(!this.targetLock)
         {
            this.attractToDoor(this.myDataRef.bossFlee.mySprite);
            while(this.myDataRef.myEvents.length > 0)
            {
               if(this.myDataRef.myEvents[0].myType == "flee")
               {
                  this.myDataRef.myEvents[0].myAction();
               }
               this.myDataRef.myEvents.splice(0,1);
            }
         }
      }
   }
   function bossEvents(inEvent)
   {
      MadnessEvents.bossEvents(this,inEvent);
   }
   function amPressingMove()
   {
      return this.moveLeft || this.moveRight || this.moveUp || this.moveDown;
   }
}
