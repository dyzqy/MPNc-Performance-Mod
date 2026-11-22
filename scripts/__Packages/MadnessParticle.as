class MadnessParticle extends MovieClip
{
   var onEnterFrame;
   var myGun;
   var myThrower;
   var myFaction;
   var myType;
   var myCategory;
   var amDangerous;
   var mySprite;
   var myRotSpeed;
   var xSpeed;
   var ySpeed;
   var myBounce;
   var myFloor;
   var myStanding;
   var standRotation;
   var myRoom;
   var noGravity;
   var slowmoSpeedMod;
   var myLastRoom;
   var mySplat;
   var myColor;
   var myColorTransform;
   var myDataRef;
   var lineMC;
   var lineHookX;
   var lineHookY;
   var lineHandX;
   var lineHandY;
   static var gravity = 2.8;
   var totalBounces = new Number();
   var rolling = false;
   var floorLowered = false;
   var lifespan = 0;
   var collectible = false;
   var finished = false;
   var hookRecall = false;
   static var allPickups = new Array();
   function MadnessParticle()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init(inType, inCategory, inX, inY, inXSpeed, inYSpeed, inRot, inRotSpeed, inBounce, inFloor, inAlpha, inScale, inStanding, inStandRot, inDataRef)
   {
      this.myGun = inDataRef;
      this.myThrower = this.myGun.myOwner;
      this.myFaction = this.myGun.myThrowerFaction;
      this.myType = inType;
      this.myCategory = inCategory;
      if(this.myCategory == "thrown")
      {
         this.amDangerous = true;
         this.myCategory = "gun";
      }
      this.gotoAndStop(this.myCategory);
      this.mySprite.gotoAndStop(this.myType);
      if(this.myGun.upgradeSilencer)
      {
         this.mySprite.gotoAndStop(this.myType + "_silenced");
      }
      if(inCategory == "casing")
      {
         this.mySprite.mySprite.gotoAndStop(SwainMath.randomNumber(1,this.mySprite._totalframes));
      }
      if(this.myGun.melee)
      {
         ItemGenerator.setItemSprite(this.mySprite.mySprite,this.myGun);
      }
      this.mySprite._rotation = inRot;
      this.myRotSpeed = inRotSpeed;
      this.xSpeed = inXSpeed;
      this.ySpeed = inYSpeed;
      this.myBounce = inBounce;
      this.myFloor = inFloor;
      this._alpha = inAlpha;
      this._x = inX;
      this._y = inY;
      this.mySprite._xscale = inScale;
      if(inScale < 0)
      {
         this.mySprite._yscale = - inScale;
      }
      else
      {
         this.mySprite._yscale = inScale;
      }
      MadnessCharacter.setMyDepth(this,this.mySprite._yscale);
      this.myStanding = inStanding;
      this.standRotation = inStandRot;
      if(this.myCategory == "gun")
      {
         this.collectible = true;
      }
      if(this.myThrower != undefined)
      {
         this.myRoom = this.myThrower.mySprite.myRoom;
      }
      else
      {
         this.myRoom = this._parent.determineRoom(this._x,this.myFloor);
      }
      if(this.myGun.loggedX != undefined)
      {
         this._x = this.myGun.loggedX;
         this.myFloor = this.myGun.loggedY;
         this.mySprite._rotation = this.myGun.loggedRot;
         this.finished = this.myGun.loggedFinished;
         this.mySprite._xscale = this.myGun.loggedScaleX;
         this.mySprite._yscale = this.myGun.loggedScaleY;
      }
      if(this.myCategory == "gun")
      {
         var _loc3_ = false;
         var _loc2_ = 0;
         while(_loc2_ < this._parent.myRoomRef.myItems.length)
         {
            if(this._parent.myRoomRef.myItems[_loc2_] == this.myGun)
            {
               _loc3_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(!_loc3_)
         {
            this._parent.myRoomRef.myItems.push(this.myGun);
         }
      }
      this.noGravity = this.myType == "magic1";
      this.mySprite.inHat.gotoAndStop(this.mySprite.inHat._totalframes);
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
      if(this.finished)
      {
         this.killMe();
      }
      this.lifespan = this.lifespan + 1;
      this.slowmoSpeedMod = 0.4 + 0.6 * _root.myGameSpeed;
      this._x += this.xSpeed * this.slowmoSpeedMod;
      if(!this.rolling && !this.noGravity)
      {
         if(this.myCategory == "sparks" || this.myCategory.substr(0,4) == "drop")
         {
            this.ySpeed += MadnessParticle.gravity * this.slowmoSpeedMod * 0.7;
         }
         else
         {
            this.ySpeed += MadnessParticle.gravity * this.slowmoSpeedMod;
         }
      }
      this._y += this.ySpeed * this.slowmoSpeedMod;
      if(!this.finished)
      {
         if(this.myRoom.amStairs)
         {
            this.myFloor = SwainMath.get_position(this._x,this.myFloor,this.myRoom.upAngle,(0.4 * this.xSpeed + 0.6 * _root.myGameSpeed * this.xSpeed) * 1.38,"y");
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
            if(this.myFloor < this.myRoom.myUL._y && this.myFloor < this.myRoom.myUR._y)
            {
               this.myFloor += 5;
            }
            if(this.myFloor > this.myRoom.myDL._y && this.myFloor > this.myRoom.myDR._y)
            {
               this.myFloor -= 5;
            }
            while(SwainMath.calculate_rotation(this.myRoom.myUL._x,this.myRoom.myUL._y,this._x,this.myFloor) <= this.myRoom.upAngle && SwainMath.calculate_rotation(this.myRoom.myUL._x,this.myRoom.myUL._y,this._x,this.myFloor) > 0)
            {
               this.myFloor += 5;
               this.xSpeed *= 0.95;
            }
            while(SwainMath.calculate_rotation(this.myRoom.myDL._x,this.myRoom.myDL._y,this._x,this.myFloor) >= this.myRoom.downAngle)
            {
               this.myFloor -= 5;
               this.xSpeed *= 0.95;
            }
         }
         this.myLastRoom = this.myRoom;
         this.myRoom = this._parent.determineRoom(this._x,this.myFloor);
         if(this.myRoom == undefined)
         {
            this.myRoom = this.myLastRoom;
         }
         if(this._y > this.myFloor)
         {
            this._y = this.myFloor;
            this.hookRecallEnable();
            if(this.returnExplode())
            {
               this.hitExplode("floor",null);
            }
            if(this.myGun != undefined && this.ySpeed > 12 && this.myThrower != undefined)
            {
               SwainAudioPlayer.playSound("clang",MadWorld.returnAudioPosition(this._x));
            }
            this.removeDangerous();
            if(this.myCategory == "casing")
            {
               this.mySprite.mySprite.gotoAndStop(SwainMath.randomNumber(1,this.mySprite._totalframes));
            }
            if(this.myRoom.amStairs)
            {
               if(this.myRoom.upAngle < 90 && this.xSpeed > 0 || this.myRoom.upAngle > 90 && this.xSpeed < 0)
               {
                  this.xSpeed *= -1;
                  if(this.myGun != undefined)
                  {
                     SwainAudioPlayer.playSound("clang",MadWorld.returnAudioPosition(this._x));
                  }
                  if(this.returnExplode())
                  {
                     this.hitExplode("floor",null);
                  }
                  this.removeDangerous();
               }
            }
            if(this.myCategory == "blood")
            {
               this.mySprite._visible = false;
               var _loc10_ = this.attachMovie("madness_splat","mySplat",this.getNextHighestDepth());
               this.mySplat.gotoAndStop("floor" + SwainMath.randomNumber(1,3) + "_" + this.myType.substr(0,this.myType.length - 1));
               this.mySplat._xscale = this._xscale;
               this.mySplat._yscale = this._yscale;
               if(this.myRoom.amStairs)
               {
                  this.mySplat._rotation = -90 + this.myRoom.upAngle;
               }
               this.killMe("bmpBodies");
               if(this.xSpeed > 0)
               {
                  this.mySplat._xscale *= -1;
               }
            }
            if(this.ySpeed < 8)
            {
               this.rolling = true;
               this.ySpeed = 0;
            }
            else
            {
               this.ySpeed *= - this.myBounce;
               if(!this.myStanding)
               {
                  this.xSpeed = (this.xSpeed + this.xSpeed * this.myBounce) / 2;
               }
            }
            if(this.myStanding && SwainMath.getRotDistance(this.mySprite._rotation,this.standRotation) <= 90)
            {
               if(this.mySprite._rotation < this.standRotation)
               {
                  if(this.myRotSpeed > 0)
                  {
                     this.myRotSpeed += (- this.ySpeed) * 2;
                  }
                  else
                  {
                     this.myRotSpeed *= - this.myBounce;
                     if(this.xSpeed < 0 && !this.myRoom.amStairs)
                     {
                        this.xSpeed += (- this.ySpeed) * 0.5;
                     }
                  }
               }
               else if(this.myRotSpeed < 0)
               {
                  this.myRotSpeed -= (- this.ySpeed) * 2;
               }
               else
               {
                  this.myRotSpeed *= - this.myBounce;
                  if(this.xSpeed > 0 && !this.myRoom.amStairs)
                  {
                     this.xSpeed -= (- this.ySpeed) * 0.5;
                  }
               }
            }
            else if(this.mySprite._rotation < this.standRotation - 180)
            {
               if(this.myRotSpeed > 0)
               {
                  this.myRotSpeed -= (- this.ySpeed) * 2;
               }
               else
               {
                  this.myRotSpeed *= - this.myBounce;
                  if(this.xSpeed < 0 && !this.myRoom.amStairs)
                  {
                     this.xSpeed += (- this.ySpeed) * 0.5;
                  }
               }
            }
            else if(this.myRotSpeed < 0)
            {
               this.myRotSpeed += (- this.ySpeed) * 2;
            }
            else
            {
               this.myRotSpeed *= - this.myBounce;
               if(this.xSpeed > 0 && !this.myRoom.amStairs)
               {
                  this.xSpeed -= (- this.ySpeed) * 0.5;
               }
            }
         }
         if(this.myRoom.amStairs)
         {
            this.rolling = false;
         }
         if(this.xSpeed < 0 && (this._x <= this._parent.myRooms[0].myDL._x || this._x <= this._parent.myRooms[0].myUL._x) && SwainMath.calculate_rotation(this._parent.myRooms[0].myDL._x,this._parent.myRooms[0].myDL._y,this._x,this.myFloor) <= this._parent.myRooms[0].leftAngle || this.xSpeed > 0 && (this._x >= this._parent.myRooms[this._parent.myRooms.length - 1].myDR._x || this._x >= this._parent.myRooms[this._parent.myRooms.length - 1].myUR._x) && SwainMath.calculate_rotation(this._parent.myRooms[this._parent.myRooms.length - 1].myDR._x,this._parent.myRooms[this._parent.myRooms.length - 1].myDR._y,this._x,this.myFloor) >= this._parent.myRooms[this._parent.myRooms.length - 1].rightAngle)
         {
            this.xSpeed *= -1 * this.myBounce;
            this.myRotSpeed *= -1;
            this.hookRecallEnable();
            if(this.returnExplode())
            {
               this.hitExplode("wall",null);
            }
            if(this.myGun != undefined)
            {
               SwainAudioPlayer.playSound("clang",MadWorld.returnAudioPosition(this._x));
            }
            this.removeDangerous();
            if(this.myCategory == "blood")
            {
               this.mySprite._visible = false;
               _loc10_ = this.attachMovie("madness_splat","mySplat",this.getNextHighestDepth());
               this.mySplat.gotoAndStop("wall" + SwainMath.randomNumber(1,3) + "_" + this.myType.substr(0,this.myType.length - 1));
               this.mySplat._xscale = this._xscale;
               this.mySplat._yscale = this._yscale;
               this.killMe("bmpBodies");
               if(this.xSpeed < 0)
               {
               }
               if(this.xSpeed > 0)
               {
                  this.mySplat._xscale *= -1;
               }
            }
         }
         if(this.rolling)
         {
            this.xSpeed = (this.xSpeed + this.xSpeed * this.myBounce) / 2;
            if(!this.myStanding)
            {
               this.myRotSpeed = (this.myRotSpeed + this.myRotSpeed * this.myBounce) / 2;
            }
         }
         if(!this.finished && this.myStanding && this.myRotSpeed < 20 && this.myRotSpeed > -20 && this.rolling)
         {
            if(SwainMath.getRotDistance(this.mySprite._rotation,this.standRotation) <= 90)
            {
               if(this.mySprite._rotation < this.standRotation)
               {
                  this.myRotSpeed += 1.2;
               }
               else
               {
                  this.myRotSpeed -= 1.2;
               }
            }
            else if(this.mySprite._rotation < this.standRotation + 180)
            {
               this.myRotSpeed -= 1.2;
            }
            else
            {
               this.myRotSpeed += 1.2;
            }
         }
         if(this.myRotSpeed > 35)
         {
            this.myRotSpeed = 35;
         }
         if(this.myRotSpeed < -35)
         {
            this.myRotSpeed = -35;
         }
         this.mySprite._rotation += this.myRotSpeed * this.slowmoSpeedMod;
         if(this.ySpeed == 0 && (this.xSpeed < 2 && this.xSpeed > -2) && (!this.myStanding || this.myStanding && (SwainMath.getRotDistance(this.mySprite._rotation,this.standRotation) < 20 || SwainMath.getRotDistance(this.mySprite._rotation,this.standRotation + 180) < 20)))
         {
            this.ySpeed = 0;
            this.xSpeed = 0;
            this.myRotSpeed = 0;
            this.finished = true;
            this.cacheAsBitmap = true;
            this.killMe("bmpBodies");
         }
      }
      if(!this.finished && (this.amDangerous || this.myCategory == "projectile"))
      {
         var _loc3_ = undefined;
         var _loc6_ = false;
         var _loc9_ = 0;
         while(_loc9_ < MadnessCharacter.allRosters.length)
         {
            var _loc8_ = 0;
            while(_loc8_ < MadnessCharacter.allRosters[_loc9_].myActiveMembers.length)
            {
               _loc3_ = MadnessCharacter.allRosters[_loc9_].myActiveMembers[_loc8_].mySprite;
               if(_loc3_.myFaction != this.myFaction && !_loc3_.amDodging && !_loc3_.deadMan)
               {
                  if(this.myFloor > _loc3_._y - 40 && this.myFloor < _loc3_._y + 40)
                  {
                     if(this._x < _loc3_._x + _loc3_.myWidth / 2 && this._x > _loc3_._x - _loc3_.myWidth / 2)
                     {
                        if(this._y > _loc3_._y - _loc3_.myHeight && this._y < _loc3_._y)
                        {
                           var _loc5_ = new Object();
                           _loc5_.x = this._x;
                           _loc5_.y = this._y + 5;
                           this._parent.localToGlobal(_loc5_);
                           var _loc4_ = - Math.abs(this.xSpeed / 2);
                           while(_loc4_ < Math.abs(this.xSpeed / 2))
                           {
                              if(_loc3_.mySprite.myHead.myHit.hitTest(_loc5_.x + _loc4_,_loc5_.y,true))
                              {
                                 this.removeDangerous();
                                 if(this.returnExplode())
                                 {
                                    this.hitExplode("floor",_loc3_);
                                    _loc6_ = true;
                                    break;
                                 }
                                 var _loc7_ = undefined;
                                 if(this.myGun.melee)
                                 {
                                    _loc7_ = ItemGenerator.createWeapon(this.myGun.myType);
                                 }
                                 else
                                 {
                                    _loc7_ = ItemGenerator.unarmedWeapon();
                                 }
                                 if(this.myGun.amHook && this.myThrower.myScale >= _loc3_.myDataRef.myScale)
                                 {
                                    _loc3_.applyKnockback(this.myThrower.mySprite,SwainMath.get_distance(this.myThrower.mySprite,_loc3_) / 25,true);
                                    this.hookRecallEnable();
                                 }
                                 this.assignWeaponDamage(_loc7_,this.myGun);
                                 this.hitCharacter(_loc3_,_loc7_,true,this._x + _loc4_,this._y);
                                 _loc6_ = true;
                                 break;
                              }
                              if(_loc3_.mySprite.myBody.myHit.hitTest(_loc5_.x + _loc4_,_loc5_.y,true))
                              {
                                 this.removeDangerous();
                                 if(this.returnExplode())
                                 {
                                    this.hitExplode("floor",_loc3_);
                                    _loc6_ = true;
                                    break;
                                 }
                                 if(this.myGun.melee)
                                 {
                                    _loc7_ = ItemGenerator.createWeapon(this.myGun.myType);
                                 }
                                 else
                                 {
                                    _loc7_ = ItemGenerator.unarmedWeapon();
                                 }
                                 if(this.myGun.amHook && this.myThrower.myScale >= _loc3_.myDataRef.myScale)
                                 {
                                    _loc3_.applyKnockback(this.myThrower.mySprite,SwainMath.get_distance(this.myThrower.mySprite,_loc3_) / 25,true);
                                    this.hookRecallEnable();
                                 }
                                 this.assignWeaponDamage(_loc7_,this.myGun);
                                 this.hitCharacter(_loc3_,_loc7_,false,this._x + _loc4_,this._y);
                                 _loc6_ = true;
                                 break;
                              }
                              _loc4_ += 5;
                           }
                        }
                     }
                  }
               }
               if(_loc6_)
               {
                  break;
               }
               _loc8_ = _loc8_ + 1;
            }
            if(_loc6_)
            {
               break;
            }
            _loc9_ = _loc9_ + 1;
         }
      }
      if(this.myGun.amHook)
      {
         this.setHookLine();
         if(this.myThrower.mySprite._x < this._x)
         {
            if(this.ySpeed > 0)
            {
               this.xSpeed -= 4;
            }
            this.xSpeed -= 0.4;
            if(this.xSpeed > (this._x - this.myThrower.mySprite._x) * 0.8)
            {
               this.xSpeed = (this._x - this.myThrower.mySprite._x) * 0.8;
            }
         }
         else
         {
            if(this.ySpeed > 0)
            {
               this.xSpeed += 4;
            }
            this.xSpeed += 0.4;
            if(this.xSpeed < (this._x - this.myThrower.mySprite._x) * 0.8)
            {
               this.xSpeed = (this._x - this.myThrower.mySprite._x) * 0.8;
            }
         }
      }
      if(this.myGun.amHook)
      {
         MadnessCharacter.setMyDepth(this,this.myThrower.mySprite.getDepth() + 2);
      }
      else
      {
         MadnessCharacter.setMyDepth(this,this.mySprite._yscale);
      }
   }
   function killMe(inDestination)
   {
      if(!this.myGun.amHook)
      {
         if(this.myCategory == "gun" && !this.myGun.noPickup && (this.myThrower.myScale == 1 || this.myThrower == undefined))
         {
            MadnessParticle.allPickups.push(this);
            this.onEnterFrame = this.amDead;
            this.cacheAsBitmap = true;
            this.myColor = new Color(this);

            // 22/11/2026 dyzqy: This only needs to run once, not every frame! Moved it from amDead to here...
            this.logPositioning();
         }
         else if(this.myCategory != "sparks")
         {
            this._parent.drawToBitmap(this,inDestination);
            this.removeMovieClip();
            false;
         }
      }
   }
   // 22/11/2026 dyzqy: No need to change the color every single frame! Only when needed! :^
   var wasHighlited:Boolean = false;
   function amDead()
   {
      var isTarget:Boolean = MadnessRoster.playerRoster.teamLeader.mySprite.targetPickup == this;
      if(isTarget != this.wasHighlited)
      {
         this.wasHighlited = isTarget;

         if(isTarget)
         {
            if(this.myGun.myAmmo == 0 && this.myGun.myClips == 0) this.myColorTransform = {rb:250,gb:0,bb:0};
            else this.myColorTransform = {rb:0,gb:250,bb:0};
         }
         else this.myColorTransform = {rb:0,gb:0,bb:0};
         this.myColor.setTransform(this.myColorTransform);
      }
   }
   static function removePickup(inPickup)
   {
      var _loc1_ = 0;
      while(_loc1_ < inPickup._parent.myRoomRef.myItems.length)
      {
         if(inPickup._parent.myRoomRef.myItems[_loc1_] == inPickup.myGun)
         {
            inPickup._parent.myRoomRef.myItems.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc1_ = 0;
      while(_loc1_ < MadnessParticle.allPickups.length)
      {
         if(inPickup == MadnessParticle.allPickups[_loc1_])
         {
            MadnessParticle.allPickups[_loc1_].clearPositioning();
            MadnessParticle.allPickups.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      inPickup.removeMovieClip();
      false;
   }
   function removeMe(inArray)
   {
      var _loc2_ = 0;
      while(_loc2_ < inArray.length)
      {
         if(inArray[_loc2_] == this)
         {
            inArray.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function logPositioning()
   {
      if(this.myCategory == "gun")
      {
         this.myGun.loggedX = this._x;
         this.myGun.loggedY = this.myFloor;
         this.myGun.loggedRot = this.mySprite._rotation;
         this.myGun.loggedFinished = this.finished;
         this.myGun.loggedScaleX = this.mySprite._xscale;
         this.myGun.loggedScaleY = this.mySprite._yscale;
      }
   }
   function clearPositioning()
   {
      if(this.myCategory == "gun")
      {
         this.myGun.loggedX = undefined;
         this.myGun.loggedY = undefined;
         this.myGun.loggedRot = undefined;
         this.myGun.loggedFinished = undefined;
         this.myGun.loggedScaleX = undefined;
         this.myGun.loggedScaleY = undefined;
      }
   }
   function removeDangerous()
   {
      if(this.amDangerous)
      {
         this.amDangerous = false;
      }
   }
   function hitCharacter(inChar, inWeapon, headHit, hitX, hitY)
   {
      this.myDataRef.modDmg = 1;
      var _loc4_ = false;
      if(inChar.myHealth > 0)
      {
         _loc4_ = true;
      }
      MadnessCharacter.adjustSprite(inChar);
      if(inChar.myDataRef.thrownBlock)
      {
         inWeapon.myDamage = 0;
      }
      inChar.checkDamage(inWeapon,this,hitX,hitY,true,headHit);
      if(_loc4_ && inChar.myHealth <= 0)
      {
         MadnessGameSelect.appropriateXP(this.myThrower,inChar.myDataRef,"thrown");
      }
      this.removeDangerous();
      this.xSpeed *= -0.2;
      this.myRotSpeed *= -0.2;
      if(inWeapon.melee)
      {
         this.myGun.myHealth -= 2;
         ItemGenerator.setItemSprite(this.mySprite.mySprite,this.myGun);
         if(this.myGun.myHealth <= 0)
         {
            this.myGun.myHealth = 1;
         }
      }
      if(inWeapon.myDamageType == "blade")
      {
         SwainAudioPlayer.playSound("slash",MadWorld.returnAudioPosition(this._x));
      }
      if(inWeapon.myDamageType == "blunt" || inWeapon.myDamageType == "punch")
      {
         SwainAudioPlayer.playSound("blunt",MadWorld.returnAudioPosition(this._x));
      }
   }
   function hitExplode(inScorch, inAutoHit)
   {
      var _loc6_ = undefined;
      var _loc3_ = undefined;
      var _loc8_ = undefined;
      var _loc7_ = undefined;
      var _loc9_ = undefined;
      var _loc5_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      if(this.myType == "grenade")
      {
         _loc6_ = inScorch;
         _loc3_ = "grenade_explode";
         _loc8_ = "explode";
         _loc7_ = this.myGun.myDamage;
         _loc5_ = 10;
         _loc9_ = 170;
         _loc2_ = null;
         _loc4_ = null;
      }
      if(this.myType == "magic1")
      {
         _loc6_ = null;
         _loc3_ = "magic1_explode";
         _loc8_ = "magic2_explode";
         _loc7_ = 30;
         _loc5_ = 10;
         _loc9_ = -1;
         if(this.xSpeed < 0)
         {
            _loc2_ = -1;
         }
         else
         {
            _loc2_ = 1;
         }
         _loc4_ = "_magic1";
      }
      this._x -= this.xSpeed * 1.1;
      MadnessCharacter.hitExplode(_loc3_,_loc6_,this,this._x,this._y,this.myFloor,_loc9_,_loc7_,_loc8_,_loc5_,_loc2_,inAutoHit,_loc4_);
      this.removeMovieClip();
      false;
   }
   function assignWeaponDamage(inWeapon, inSource)
   {
      inWeapon.myDamage = inSource.myDamage / 2;
      inWeapon.myDamage += Math.abs((this.xSpeed + this.ySpeed - 20) / 2) / 4;
   }
   function hookRecallEnable()
   {
      if(this.myGun.amHook)
      {
         this.hookRecall = true;
         this.onEnterFrame = this.returnToSender;
      }
   }
   function returnToSender()
   {
      SwainMath.move_me(this,SwainMath.calculate_rotation(this._x,this._y,this.myThrower.mySprite._x,this.myThrower.mySprite._y - this.myThrower.myHeight / 2),45);
      this.mySprite._rotation += this.myRotSpeed * this.slowmoSpeedMod;
      MadnessCharacter.setMyDepth(this,this.myThrower.mySprite.getDepth() + 1);
      this.xSpeed = 50;
      this.ySpeed = 0;
      this.setHookLine();
      if(this._x < this.myThrower.mySprite._x + this.myThrower.myWidth / 2 + 10 && this._x > this.myThrower.mySprite._x - this.myThrower.myWidth / 2 - 10 && this._y < this.myThrower.mySprite._y && this._y > this.myThrower.mySprite._y - this.myThrower.myHeight - 10)
      {
         this.myThrower.mySprite.thrownHook = false;
         this.myThrower.mySprite.dropGun();
         this.myThrower.equipItem(this.myGun,this.myThrower.myWeapons[this.myThrower.myWeapon]);
         MadnessParticle.removePickup(this);
      }
   }
   function setHookLine()
   {
      this.lineMC.removeMovieClip();
      if(this.myThrower.mySprite._x != undefined)
      {
         var _loc2_ = new Object();
         _loc2_.x = 2;
         _loc2_.y = -20;
         this.mySprite.localToGlobal(_loc2_);
         this.globalToLocal(_loc2_);
         this.lineHookX = _loc2_.x;
         this.lineHookY = _loc2_.y;
         var _loc3_ = undefined;
         if(this.myThrower.mySprite.isFacingRight)
         {
            if(this.myThrower.mySprite.mySprite.handShoot_front._visible)
            {
               _loc3_ = this.myThrower.mySprite.mySprite.handShoot_front;
            }
            else if(this.myThrower.mySprite.mySprite.myHand._visible)
            {
               _loc3_ = this.myThrower.mySprite.mySprite.myHand;
            }
            else
            {
               _loc3_ = this.myThrower.mySprite.mySprite.handNone_front;
            }
         }
         else if(this.myThrower.mySprite.mySprite.handShoot_front._visible)
         {
            _loc3_ = this.myThrower.mySprite.mySprite.handShoot_back;
         }
         else if(this.myThrower.mySprite.mySprite.myHand2._visible)
         {
            _loc3_ = this.myThrower.mySprite.mySprite.myHand2;
         }
         else
         {
            _loc3_ = this.myThrower.mySprite.mySprite.handNone_back;
         }
         _loc2_.x = 0;
         _loc2_.y = 0;
         _loc3_.localToGlobal(_loc2_);
         this.globalToLocal(_loc2_);
         this.lineHandX = _loc2_.x;
         this.lineHandY = _loc2_.y;
         this.createEmptyMovieClip("lineMC",this.getNextHighestDepth());
         this.lineMC.lineStyle(0.25,0,100,true,"normal","square","miter",1);
         this.lineMC.moveTo(this.lineHookX,this.lineHookY);
         this.lineMC.curveTo(this.lineHookX - (this.lineHookX - this.lineHandX) / 2,this.lineHookY - (this.lineHookY - this.lineHandY) / 2 + Math.abs(50 - (Math.abs(this.xSpeed) + Math.abs(this.ySpeed))),this.lineHandX,this.lineHandY);
      }
   }
   function returnExplode()
   {
      return this.myType == "grenade" || this.myType == "magic1";
   }
}
