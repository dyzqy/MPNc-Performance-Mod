class MadWorld extends MovieClip
{
   var myRooms;
   var hitBitmapData1;
   var hitBitmapData2;
   var m1;
   var m2;
   var origin;
   var intersectRect1;
   var intersectRect2;
   var rosterCreationList;
   var noColliders;
   var onEnterFrame;
   var myStartRef;
   var myRoomRef;
   var currentX;
   var currentY;
   var r0_ul;
   var r0_dl;
   var myStart;
   var PHstart;
   var followDoor;
   var bmpBodies;
   var mcBodies;
   var leftMax;
   var rightMax;
   var downMax;
   var upMax;
   var wallHit;
   var floorHit;
   var followTarget;
   var deserterRoster;
   var nowServingWave;
   var myFollowX;
   var myFollowY;
   var roomLock;
   var myBG;
   var pickedRoom;
   var thisAngle;
   var aimLine;
   var bounds;
   var exitDoor;
   var amDone;
   var bracketSpeed;
   var mySource;
   var myTarget;
   var aimStart;
   var rotSpeed;
   var encircle;
   var bracket1;
   var bracket2;
   var PHstartEnemy;
   static var thisWorld;
   static var activeFactions;
   var gameStarted = false;
   var endRoom = false;
   var allDead = false;
   var endTimer = new Number();
   var endTimerMax = 20;
   var deadTimer = new Number();
   var deadTimerMax = 60;
   var roomTimer = new Number();
   var paused = false;
   var characterHold = false;
   var defaultX = 425;
   var defaultY = 265;
   var shakeCount = new Number();
   var testMakeTimer = new Number();
   var enemyCreationTimer = -20;
   var bmpOffset = 200;
   static var zombiesActive = false;
   function MadWorld()
   {
      super();
      this.myRooms = new Array();
      // 22/11/2026 dyzqy: These 2 are unused, so free memory :DD
      // this.hitBitmapData1 = new flash.display.BitmapData(Stage.width,Stage.height,true,0);
      // this.hitBitmapData2 = new flash.display.BitmapData(Stage.width,Stage.height,true,0);
      this.m1 = new flash.geom.Matrix();
      this.m2 = new flash.geom.Matrix();
      this.origin = new flash.geom.Point();
      this.intersectRect1 = new flash.geom.Rectangle();
      this.intersectRect2 = new flash.geom.Rectangle();
      this.rosterCreationList = new Array();
      this.noColliders = new Array();
      this.onEnterFrame = this.tick;
   }
   function init(inStartRef)
   {
      MadWorld.thisWorld = this;
      this.myStartRef = inStartRef;
      this.myRoomRef = this.myStartRef.myParent;
      _root.myGameSpeed = 1;
      if(MadnessGameSelect.myDifficulty == "easy")
      {
         MadnessCharacter.damageDifficultyMod = 0.3;
      }
      if(MadnessGameSelect.myDifficulty == "normal")
      {
         MadnessCharacter.damageDifficultyMod = 0.5;
      }
      if(MadnessGameSelect.myDifficulty == "hard")
      {
         MadnessCharacter.damageDifficultyMod = 1;
      }
      MadnessDoors.allDoors = new Array();
      MadnessObstacle.allObstacles = new Array();
      MadnessCharacter.allRosters = new Array();
      MadWorld.activeFactions = new Array();
      MadnessActivator.allActivators = new Array();
      MadnessActivator.aiActivators = new Array();
      MadnessSpawner.allSpawners = new Array();
      MadnessParticle.allPickups = new Array();
      this.gotoAndStop(this.myRoomRef.myType);
      this.currentX = this.defaultX;
      this.currentY = this.defaultY;
      this._x = this.currentX;
      this._y = this.currentY;
      var _loc4_ = 0;
      var _loc3_ = undefined;
      while(this["r" + _loc4_ + "_ur"] != undefined)
      {
         this["roomObj" + String(_loc4_)] = new Object();
         _loc3_ = this["roomObj" + String(_loc4_)];
         this.myRooms.push(_loc3_);
         _loc3_.roomNumber = _loc4_;
         if(_loc4_ == 0)
         {
            _loc3_.myUL = this.r0_ul;
            _loc3_.myDL = this.r0_dl;
         }
         else
         {
            _loc3_.myUL = this["r" + (_loc4_ - 1) + "_ur"];
            _loc3_.myDL = this["r" + (_loc4_ - 1) + "_dr"];
         }
         _loc3_.myUR = this["r" + _loc4_ + "_ur"];
         _loc3_.myDR = this["r" + _loc4_ + "_dr"];
         _loc3_.leftAngle = SwainMath.calculate_rotation(_loc3_.myDL._x - 0,_loc3_.myDL._y + 0,_loc3_.myUL._x - 0,_loc3_.myUL._y - 0);
         _loc3_.rightAngle = SwainMath.calculate_rotation(_loc3_.myDR._x + 0,_loc3_.myDR._y + 0,_loc3_.myUR._x + 0,_loc3_.myUR._y - 0);
         _loc3_.upAngle = SwainMath.calculate_rotation(_loc3_.myUL._x - 0,_loc3_.myUL._y - 0,_loc3_.myUR._x + 0,_loc3_.myUR._y - 0);
         _loc3_.downAngle = SwainMath.calculate_rotation(_loc3_.myDL._x - 0,_loc3_.myDL._y + 0,_loc3_.myDR._x + 0,_loc3_.myDR._y + 0);
         _loc3_.leftWidth = SwainMath.get_distance(_loc3_.myDL,_loc3_.myUL);
         _loc3_.rightWidth = SwainMath.get_distance(_loc3_.myDR,_loc3_.myUR);
         _loc3_.upWidth = SwainMath.get_distance(_loc3_.myUL,_loc3_.myUR);
         _loc3_.downWidth = SwainMath.get_distance(_loc3_.myDL,_loc3_.myDR);
         if(this["stairs" + _loc4_] != undefined)
         {
            _loc3_.amStairs = true;
         }
         if(_loc4_ == 0)
         {
            _loc3_.ystart = 0;
         }
         else if(this.myRooms[_loc4_ - 1].amStairs)
         {
            _loc3_.ystart = this.myRooms[_loc4_ - 1].ystart;
         }
         else
         {
            _loc3_.ystart = this.myRooms[_loc4_ - 1].myDL._y - this.myRooms[_loc4_ - 1].myDR._y + this.myRooms[_loc4_ - 1].ystart;
         }
         _loc4_ = _loc4_ + 1;
      }
      this.myStart = this.PHstart;
      this.myStart._visible = false;
      this.myStart.myDataRef = inStartRef;
      this.myStart.myDataRef.mySprite = this.myStart;
      var _loc7_ = 0;
      while(_loc7_ < this.myRoomRef.myActivators.length)
      {
         var _loc14_ = this.attachMovie("madness_activator","activator" + _loc7_,this.getNextHighestDepth());
         _loc14_.init(this["PHactivator" + String(_loc7_)],this.myRoomRef.myActivators[_loc7_]);
         _loc7_ = _loc7_ + 1;
      }
      MadnessActivator.bombActive = false;
      _loc7_ = 0;
      while(_loc7_ < this.myRoomRef.myDoors.length)
      {
         var _loc13_ = this.attachMovie("madness_doors","door" + _loc7_,this.getNextHighestDepth());
         _loc13_.init(this["PHdoor" + String(_loc7_)],this.myRoomRef.myDoors[_loc7_]);
         MadnessDoors.allDoors.push(_loc13_);
         _loc7_ = _loc7_ + 1;
      }
      this.followDoor = this.myStartRef.mySprite;
      if(this.myRoomRef.bmpBodies == undefined)
      {
         this.bmpBodies = new flash.display.BitmapData(this._width + this.bmpOffset * 2,this._height + this.bmpOffset * 2,true,11141290);
         this.myRoomRef.bmpBodies = this.bmpBodies;
      }
      else
      {
         this.bmpBodies = this.myRoomRef.bmpBodies;
      }
      this.createEmptyMovieClip("mcBodies",this.getNextHighestDepth());
      this.mcBodies.attachBitmap(this.bmpBodies,this.mcBodies.getNextHighestDepth(),"auto",true);
      this.mcBodies._x = - this.bmpOffset;
      this.mcBodies._y = - this.bmpOffset;
      _loc7_ = 10;
      while(_loc7_ > 0)
      {
         _loc7_ = _loc7_ - 1;
      }
      _loc7_ = 0;
      while(_loc7_ < this.myRoomRef.myObstacles.length)
      {
         var _loc11_ = this.attachMovie("madness_obstacle","obstacle" + _loc7_,this.getNextHighestDepth());
         _loc11_.init(this["PHobstacle" + String(_loc7_)],this.myRoomRef.myObstacles[_loc7_]);
         MadnessObstacle.allObstacles.push(_loc11_);
         _loc7_ = _loc7_ + 1;
      }
      _loc7_ = 0;
      while(_loc7_ < this.myRoomRef.mySpawners.length)
      {
         var _loc12_ = this.attachMovie("madness_spawner","spawner" + _loc7_,this.getNextHighestDepth());
         trace("Made: " + _loc12_);
         _loc12_.init(this["PHspawner" + String(_loc7_)],this.myRoomRef.mySpawners[_loc7_],false);
         _loc7_ = _loc7_ + 1;
      }
      _loc7_ = 0;
      while(_loc7_ < this.myRoomRef.myItems.length)
      {
         var _loc6_ = this.myRoomRef.myItems[_loc7_];
         this.createParticle(_loc6_.myType,"gun",_loc6_.loggedX,_loc6_.loggedY,0,0,_loc6_.loggedRot,0,0,_loc6_.loggedY,100,_loc6_.loggedScale,true,-90,_loc6_);
         _loc7_ = _loc7_ + 1;
      }
      if(this.myRooms[0].myDL._x < this.myRooms[0].myUL._x)
      {
         this.leftMax = this.myRooms[0].myDL._x - 50;
      }
      else
      {
         this.leftMax = this.myRooms[0].myUL._x - 50;
      }
      if(this.myRooms[this.myRooms.length - 1].myDR._x > this.myRooms[this.myRooms.length - 1].myUR._x)
      {
         this.rightMax = this.myRooms[this.myRooms.length - 1].myDR._x + 50;
      }
      else
      {
         this.rightMax = this.myRooms[this.myRooms.length - 1].myUR._x + 50;
      }
      var _loc5_ = this.myRooms[0].myDL._y;
      _loc7_ = 0;
      while(_loc7_ < this.myRooms.length)
      {
         if(this.myRooms[_loc7_].myDL._y > _loc5_)
         {
            _loc5_ = this.myRooms[_loc7_].myDL._y;
         }
         if(this.myRooms[_loc7_].myDR._y > _loc5_)
         {
            _loc5_ = this.myRooms[_loc7_].myDR._y;
         }
         _loc7_ = _loc7_ + 1;
      }
      _loc5_ += 60;
      this.downMax = _loc5_;
      _loc5_ = this.myRooms[0].myUL._y;
      _loc7_ = 0;
      while(_loc7_ < this.myRooms.length)
      {
         if(this.myRooms[_loc7_].myUL._y < _loc5_)
         {
            _loc5_ = this.myRooms[_loc7_].myUL._y;
         }
         if(this.myRooms[_loc7_].myUR._y < _loc5_)
         {
            _loc5_ = this.myRooms[_loc7_].myUR._y;
         }
         _loc7_ = _loc7_ + 1;
      }
      _loc5_ -= 260;
      this.upMax = _loc5_;
      this.createEmptyMovieClip("wallHit",this.getNextHighestDepth());
      this.wallHit.beginFill(16711680);
      this.wallHit.moveTo(this.myRooms[0].myDL._x - 100,this.myRooms[0].myDL._y);
      this.wallHit.lineTo(this.myRooms[0].myDL._x,this.myRooms[0].myDL._y);
      this.wallHit.lineTo(this.myRooms[0].myUL._x,this.myRooms[0].myUL._y);
      this.wallHit.lineTo(this.myRooms[0].myUL._x,this.myRooms[0].myUL._y - 100);
      var _loc9_ = undefined;
      var _loc8_ = undefined;
      _loc7_ = 0;
      while(_loc7_ < this.myRooms.length)
      {
         if(this.myRooms[_loc7_].amStairs || this.myRooms[_loc7_ + 1].amStairs)
         {
            _loc9_ = this.myRooms[_loc7_].myUR._x;
            _loc8_ = this.myRooms[_loc7_].myUR._y - 200;
         }
         else
         {
            _loc9_ = this.myRooms[_loc7_].myUR._x;
            _loc8_ = this.myRooms[_loc7_].myUR._y - 100;
         }
         this.wallHit.lineTo(_loc9_,_loc8_);
         _loc7_ = _loc7_ + 1;
      }
      this.wallHit.lineTo(this.myRooms[this.myRooms.length - 1].myUR._x,this.myRooms[this.myRooms.length - 1].myUR._y);
      this.wallHit.lineTo(this.myRooms[this.myRooms.length - 1].myDR._x,this.myRooms[this.myRooms.length - 1].myDR._y);
      this.wallHit.lineTo(this.myRooms[this.myRooms.length - 1].myDR._x + 100,this.myRooms[this.myRooms.length - 1].myDR._y);
      this.wallHit.lineTo(this.myRooms[this.myRooms.length - 1].myDR._x + 100,this.myRooms[this.myRooms.length - 1].myDR._y - 500);
      this.wallHit.lineTo(this.myRooms[0].myDL._x - 100,this.myRooms[this.myRooms.length - 1].myDR._y - 500);
      this.wallHit.lineTo(this.myRooms[0].myDL._x - 100,this.myRooms[0].myDL._y);
      this.wallHit.endFill();
      this.wallHit._visible = false;
      this.createEmptyMovieClip("floorHit",this.getNextHighestDepth());
      this.floorHit.beginFill(65280);
      this.floorHit.moveTo(this.myRooms[0].myDL._x - 50,this.myRooms[0].myDL._y);
      this.floorHit.lineTo(this.myRooms[0].myDL._x,this.myRooms[0].myDL._y);
      this.floorHit.lineTo(this.myRooms[0].myDR._x,this.myRooms[0].myDR._y);
      _loc7_ = 0;
      while(_loc7_ < this.myRooms.length)
      {
         _loc9_ = this.myRooms[_loc7_].myDR._x;
         _loc8_ = this.myRooms[_loc7_].myDR._y;
         this.floorHit.lineTo(_loc9_,_loc8_);
         _loc7_ = _loc7_ + 1;
      }
      this.floorHit.lineTo(this.myRooms[this.myRooms.length - 1].myDR._x,this.myRooms[this.myRooms.length - 1].myDR._y);
      this.floorHit.lineTo(this.myRooms[this.myRooms.length - 1].myDR._x + 50,this.myRooms[this.myRooms.length - 1].myDR._y);
      this.floorHit.lineTo(this.myRooms[this.myRooms.length - 1].myDR._x + 50,this.myRooms[this.myRooms.length - 1].myDR._y + 500);
      this.floorHit.lineTo(this.myRooms[0].myDL._x - 50,this.myRooms[this.myRooms.length - 1].myDR._y + 500);
      this.floorHit.lineTo(this.myRooms[0].myDL._x - 50,this.myRooms[0].myDL._y);
      this.floorHit.endFill();
      this.floorHit._visible = false;
      MadnessRoster.playerRoster.rosterName = "playerRoster";
      if(this.myStartRef.amStartPoint)
      {
         this.createSprite(MadnessRoster.playerRoster.teamLeader,this.myStart,this.myStart._x + SwainMath.randomNumber(-20,20),this.myStart._y + SwainMath.randomNumber(-40,40));
      }
      else
      {
         this.myStartRef.mySprite.addCharacter(MadnessRoster.playerRoster.teamLeader,"enter");
      }
      _loc7_ = 0;
      while(_loc7_ < MadnessRoster.playerRoster.myActiveMembers.length)
      {
         if(MadnessRoster.playerRoster.myActiveMembers[_loc7_] != MadnessRoster.playerRoster.teamLeader)
         {
            if(this.myStartRef.amStartPoint)
            {
               this.createSprite(MadnessRoster.playerRoster.myActiveMembers[_loc7_],this.myStart,this.myStart._x + SwainMath.randomNumber(-70,70),this.myStart._y + SwainMath.randomNumber(-30,30));
            }
            else
            {
               this.myStartRef.mySprite.addCharacter(MadnessRoster.playerRoster.myActiveMembers[_loc7_],"enter");
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      MadWorld.activeFactions.push(MadnessRoster.playerRoster.teamFaction);
      this.followTarget = MadnessRoster.playerRoster.teamLeader.mySprite;
      MadnessCharacter.allRosters.push(MadnessRoster.playerRoster);
      var _loc15_ = this.attachMovie("player_aim","playerAim",this.getNextHighestDepth());
      _loc15_.swapDepths(100000);
      _loc7_ = 0;
      while(_loc7_ < this.myRoomRef.myCharacters.length)
      {
         if(this.myRoomRef.myCharacters[_loc7_].myRoster != MadnessRoster.playerRoster)
         {
            this.applyFaction(this.myRoomRef.myCharacters[_loc7_]);
         }
         var _loc10_ = this.inventExistingNPCStartPoint(this.myRoomRef.myCharacters[_loc7_].startupPoint);
         this.createSprite(this.myRoomRef.myCharacters[_loc7_],_loc10_,_loc10_._x + SwainMath.randomNumber(-10,10),_loc10_._y + SwainMath.randomNumber(-10,10));
         _loc7_ = _loc7_ + 1;
      }
      this.rosterCreationList = this.myRoomRef.myRosters;
      this.deserterRoster = new MadnessRoster();
      this.deserterRoster.init("deserters");
      MadnessCharacter.allRosters.push(this.deserterRoster);
      if(this.myRoomRef.myTrack != undefined)
      {
         SwainAudioPlayer.playTrack(this.myRoomRef.myTrack);
      }
      else
      {
         SwainAudioPlayer.playTrack(MadnessLevel.currentLevel.myTrack);
      }
      if(MadnessGameSelect.gameMode == "arena")
      {
         if(MadnessGameSelect.subGameMode == "standard")
         {
            this.nowServingWave = MadnessLevel.currentLevel.totalWaves;
         }
         if(MadnessGameSelect.subGameMode == "zombie")
         {
            this.nowServingWave = MadnessLevel.currentLevel.totalWaves;
         }
      }
   }
   function tick()
   {
      this.roomTimer = this.roomTimer + 1;
      if(this.followTarget != undefined)
      {
         this.myFollowX = this.followTarget._x;
         this.myFollowY = this.followTarget._y;
      }
      else
      {
         this.followTarget = MadnessRoster.playerRoster.teamLeader.mySprite;
         if(this.myFollowX == undefined)
         {
            this.myFollowX = this.followDoor._x;
            this.myFollowY = this.followDoor._y;
         }
      }
      if(this.myFollowY - 50 < - this.defaultY + 230 - (this.currentY - this.defaultY))
      {
         this.currentY = - this.defaultY + 230 - (this.myFollowY - 50) + this.defaultY;
      }
      if(this.myFollowY - 50 > this.defaultY - 230 - (this.currentY - this.defaultY))
      {
         this.currentY = this.defaultY - 230 - (this.myFollowY - 50) + this.defaultY;
      }
      if(this.currentY > - this.upMax)
      {
         this.currentY = - this.upMax;
      }
      if(this.currentY < - this.downMax + this.defaultY * 2)
      {
         this.currentY = - this.downMax + this.defaultY * 2;
      }
      if(this.myFollowX < - this.defaultX + 400 - (this.currentX - this.defaultX))
      {
         this.currentX = - this.defaultX + 400 - this.myFollowX + this.defaultX;
      }
      if(this.myFollowX > this.defaultX - 400 - (this.currentX - this.defaultX))
      {
         this.currentX = this.defaultX - 400 - this.myFollowX + this.defaultX;
      }
      if(this.currentX < - this.rightMax + this.defaultX * 2)
      {
         this.currentX = - this.rightMax + this.defaultX * 2;
      }
      if(this.currentX > - this.leftMax)
      {
         this.currentX = - this.leftMax;
      }
      this._x = this.currentX;
      this._y = this.currentY;
      if(this.shakeCount > 0)
      {
         this._x += SwainMath.randomNumber(- this.shakeCount,this.shakeCount);
         this._y += SwainMath.randomNumber(- this.shakeCount,this.shakeCount);
         this.shakeCount = this.shakeCount - 1;
      }
      var _loc3_ = undefined;
      MadWorld.zombiesActive = false;
      var _loc6_ = 0;
      while(_loc6_ < MadnessCharacter.allRosters.length)
      {
         _loc3_ = MadnessCharacter.allRosters[_loc6_];
         if(_loc3_.teamFaction == "zombie" || _loc3_.teamFaction == "abom")
         {
            MadWorld.zombiesActive = true;
         }
         if(_loc3_.myActiveMembers.length == 0 && _loc3_ != MadnessRoster.playerRoster && _loc3_.teamFaction != "deserters")
         {
            this.runRosterEvents(_loc3_);
            if(_loc3_ == this["npcRoster_" + _loc3_.teamFaction])
            {
               this["npcRoster_" + _loc3_.teamFaction] = undefined;
               delete this["npcRoster_" + _loc3_.teamFaction];
            }
            else
            {
               MadnessLevel.removeRoster(this.myRoomRef,_loc3_);
            }
            MadnessCharacter.allRosters.splice(_loc6_,1);
            this.enemyCreationTimer = 0;
            if(MadWorld.factionGone(_loc3_.teamFaction))
            {
               var _loc5_ = 0;
               while(_loc5_ < MadWorld.activeFactions.length)
               {
                  if(MadWorld.activeFactions[_loc5_] == _loc3_.teamFaction)
                  {
                     MadWorld.activeFactions.splice(_loc5_,1);
                     if(MadWorld.activeFactions.length == 1)
                     {
                        _root.myGameSpeed = 1;
                     }
                     break;
                  }
                  _loc5_ = _loc5_ + 1;
               }
            }
            _loc6_ = _loc6_ - 1;
         }
         _loc6_ = _loc6_ + 1;
      }
      if(!this.paused)
      {
         this.enemyCreationTimer = this.enemyCreationTimer + 1;
      }
      if(this.enemyCreationTimer > 20 && !this.paused)
      {
         var _loc8_ = false;
         _loc6_ = 0;
         while(_loc6_ < this.rosterCreationList.length)
         {
            _loc3_ = this.rosterCreationList[_loc6_];
            if(!this.factionExists(_loc3_.teamFaction) && !this.returnUnregisteredFaction(_loc3_.teamFaction))
            {
               MadWorld.activeFactions.push(_loc3_.teamFaction);
               _loc8_ = true;
            }
            else if(SwainMath.randomNumber(0,65 - MadnessLevel.currentLevel.myDifficulty * 2) <= 0 && this.doorsEmpty())
            {
               var _loc7_ = 0;
               var _loc4_ = 0;
               while(_loc4_ < MadnessCharacter.allRosters.length)
               {
                  if(MadnessCharacter.allRosters[_loc4_].teamFaction == _loc3_.teamFaction)
                  {
                     _loc7_ += MadnessCharacter.allRosters[_loc4_].myActiveMembers.length;
                  }
                  _loc4_ = _loc4_ + 1;
               }
               if(_loc7_ <= MadnessLevel.currentLevel.myDifficulty / 2 && _loc7_ < 4)
               {
                  _loc8_ = true;
               }
            }
            else if(MadnessGameSelect.gameMode == "arena")
            {
               break;
            }
            if(_loc8_)
            {
               MadnessCharacter.allRosters.push(_loc3_);
               MadnessLevel.removeRoster(this.myRoomRef,_loc3_);
               this.createRosterEnemies(_loc3_);
               _loc6_ = 9999999;
               break;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      if(!this.gameStarted)
      {
         _loc6_ = 0;
         while(_loc6_ < MadnessRoster.playerRoster.myActiveMembers.length)
         {
            if(MadnessRoster.playerRoster.myActiveMembers[_loc6_].mySprite != undefined)
            {
               this.gameStarted = true;
               break;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      if(this.gameStarted)
      {
         this.allDead = true;
         this.deadTimer = this.deadTimer + 1;
         if(MadnessRoster.playerRoster.teamLeader.myHealth > 0)
         {
            this.deadTimer = 0;
            this.allDead = false;
         }
      }
      if(this.deadTimer > this.deadTimerMax)
      {
         this.deadTimer = 0;
         this.allDead = false;
      }
      _loc6_ = 0;
      while(_loc6_ < MadnessCharacter.allRosters.length)
      {
         if(MadnessCharacter.allRosters[_loc6_].teamFireScore > 0)
         {
            MadnessCharacter.allRosters[_loc6_].teamFireScore -= 1 + _root.myGameSpeed;
            if(MadnessCharacter.allRosters[_loc6_].teamFireScore < 0)
            {
               MadnessCharacter.allRosters[_loc6_].teamFireScore = 0;
            }
         }
         _loc6_ = _loc6_ + 1;
      }
      if(this.myRoomRef.myObjective == "clear" && MadWorld.activeFactions.length == 1 && MadWorld.activeFactions[0] == "player" && this.rosterCreationList.length == 0)
      {
         MadnessLevel.completeObjectiveCheck(this.myRoomRef,"clear");
      }
      if(this.gameStarted && !this.endRoom)
      {
         if(this.endTimer > 0 || MadnessLevel.levelVictory)
         {
            this.endTimer = this.endTimer + 1;
         }
      }
      if(!this.allDead && this.endTimer > this.endTimerMax)
      {
         this.leaveRoom();
      }
      if(_root.myGameSpeed == 0)
      {
         this.slowMoActive();
      }
      if(this.enemiesAllDead() && !MadnessActivator.bombActive)
      {
         this.roomLock = false;
      }
      else
      {
         this.roomLock = true;
      }
      if(MadnessGameSelect.gameMode == "arena")
      {
         this.myBG.nowServing.currentWaveTEXT.text = "Wave " + String(this.nowServingWave);
      }
   }
   function determineRoom(inX, inY)
   {
      this.pickedRoom = -1;
      if(inX < this.myRooms[0].myUL._x || inX < this.myRooms[0].myDL._x)
      {
         this.pickedRoom = 0;
      }
      else if(inX > this.myRooms[this.myRooms.length - 1].myUR._x || inX > this.myRooms[this.myRooms.length - 1].myDR._x)
      {
         this.pickedRoom = this.myRooms.length - 1;
      }
      if(this.pickedRoom == -1)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.myRooms.length)
         {
            if(inX < this.myRooms[_loc2_].myUR._x && inX < this.myRooms[_loc2_].myDR._x && inX > this.myRooms[_loc2_].myUL._x && inX > this.myRooms[_loc2_].myDL._x && inY < this.myRooms[_loc2_].myDR._y && inY < this.myRooms[_loc2_].myDL._y && inY > this.myRooms[_loc2_].myUR._y && inY > this.myRooms[_loc2_].myUL._y)
            {
               this.pickedRoom = _loc2_;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(this.pickedRoom == -1)
      {
         _loc2_ = 0;
         while(_loc2_ < this.myRooms.length)
         {
            this.thisAngle = SwainMath.calculate_rotation(this.myRooms[_loc2_].myDL._x,this.myRooms[_loc2_].myDL._y,inX,inY);
            if(this.thisAngle >= this.myRooms[_loc2_].leftAngle - 2)
            {
               this.thisAngle = SwainMath.calculate_rotation(this.myRooms[_loc2_].myDR._x,this.myRooms[_loc2_].myDR._y,inX,inY);
               if(this.thisAngle <= this.myRooms[_loc2_].rightAngle + 2)
               {
                  this.thisAngle = 360 + SwainMath.calculate_rotation(this.myRooms[_loc2_].myUL._x,this.myRooms[_loc2_].myUL._y,inX,inY);
                  if(this.thisAngle >= this.myRooms[_loc2_].upAngle - 2)
                  {
                     this.thisAngle = SwainMath.calculate_rotation(this.myRooms[_loc2_].myDL._x,this.myRooms[_loc2_].myDL._y,inX,inY);
                     if(this.thisAngle <= this.myRooms[_loc2_].downAngle + 2)
                     {
                        this.pickedRoom = _loc2_;
                        break;
                     }
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return this.myRooms[this.pickedRoom];
   }
   function determineZ(inMC)
   {
   }
   function makeBullet(inMC, inRotOffset, inLength, inTargX, inTargY, inX, inY, inTracer)
   {
      var _loc2_ = new Object();
      var _loc14_ = undefined;
      var _loc6_ = this.attachMovie("madness_tracer_" + inTracer,"bullet" + SwainMath.randomNumber(0,9999999),this.getNextHighestDepth());
      var _loc7_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc8_ = undefined;
      var _loc15_ = undefined;
      if(inMC.myAimX >= inMC._x)
      {
         _loc7_ = inMC.mySprite.handShoot_front;
      }
      if(inMC.myAimX <= inMC._x)
      {
         _loc7_ = inMC.mySprite.handShoot_back;
      }
      if(inX != null)
      {
         _loc5_ = inX;
         _loc4_ = inY;
      }
      else
      {
         _loc2_.x = 0;
         _loc2_.y = 0;
         _loc7_.myGun.myShootPoint.localToGlobal(_loc2_);
         this.globalToLocal(_loc2_);
         _loc5_ = _loc2_.x;
         _loc4_ = _loc2_.y;
      }
      _loc8_ = SwainMath.get_distance2(_loc5_,_loc4_,inTargX,inTargY);
      _loc6_._rotation = SwainMath.calculate_rotation(_loc5_,_loc4_,inTargX,inTargY);
      _loc6_._x = _loc5_;
      _loc6_._y = _loc4_;
      _loc6_.myMask._yscale = _loc8_;
   }
   function checkLineHit(inStartX, inStartY, inDistance, inAngle, inTarget)
   {
      this.aimLine._x = inStartX;
      this.aimLine._y = inStartY;
      this.aimLine._rotation = inAngle;
      this.aimLine._yscale = inDistance;
      this.hitBitmapData1.fillRect(this.hitBitmapData1.rectangle,0);
      this.hitBitmapData2.fillRect(this.hitBitmapData2.rectangle,0);
      this.bounds = this.aimLine.getBounds(_root);
      this.intersectRect1.x = this.bounds.xMin;
      this.intersectRect1.y = this.bounds.yMin;
      this.intersectRect1.right = this.bounds.xMax;
      this.intersectRect1.bottom = this.bounds.yMax;
      this.bounds = inTarget.getBounds(_root);
      this.intersectRect2.x = this.bounds.xMin;
      this.intersectRect2.y = this.bounds.yMin;
      this.intersectRect2.right = this.bounds.xMax;
      this.intersectRect2.bottom = this.bounds.yMax;
      this.intersectRect1.intersection(this.intersectRect2);
      this.m1 = this.aimLine.transform.concatenatedMatrix;
      this.m1.translate(- this.intersectRect1.x,- this.intersectRect1.y);
      this.m2 = inTarget.transform.concatenatedMatrix;
      this.m2.translate(- this.intersectRect1.x,- this.intersectRect1.y);
      this.intersectRect1.offset(- this.intersectRect1.x,- this.intersectRect1.y);
      this.hitBitmapData1.draw(this.aimLine,this.m1,null,null,this.intersectRect1);
      this.hitBitmapData2.draw(inTarget,this.m2,null,null,this.intersectRect1);
      return this.hitBitmapData2.hitTest(this.origin,128,this.hitBitmapData1,this.origin,128);
   }
   function createEffect(inX, inY, inEffect, inScaleLow, inScaleHigh, inRotation)
   {
      var _loc2_ = this.attachMovie("madness_effect","newEffect" + SwainMath.randomNumber(0,999999),this.getNextHighestDepth());
      _loc2_.gotoAndStop(inEffect);
      _loc2_._x = inX;
      _loc2_._y = inY;
      _loc2_._xscale = SwainMath.randomNumber(inScaleLow,inScaleHigh);
      _loc2_._yscale = _loc2_._xscale;
      _loc2_._rotation = inRotation;
   }
   function drawToBitmap(inObject, inTarget)
   {
      var _loc2_ = new flash.geom.Matrix();
      _loc2_.scale(inObject._xscale / 100,inObject._yscale / 100);
      _loc2_.translate(inObject._x + this.bmpOffset,inObject._y + this.bmpOffset);
      this[inTarget].draw(inObject,_loc2_);
   }
   function createParticle(inType, inCategory, inX, inY, inXSpeed, inYSpeed, inRot, inRotSpeed, inBounce, inFloor, inAlpha, inScale, inStanding, inStandRot, inDataRef)
   {
      var _loc2_ = this.attachMovie("madness_particle","prtcl" + SwainMath.randomNumber(0,99999999),this.getNextHighestDepth());
      _loc2_.init(inType,inCategory,inX,inY,inXSpeed,inYSpeed,inRot,inRotSpeed,inBounce,inFloor,inAlpha,inScale,inStanding,inStandRot,inDataRef);
   }
   function createSplat(inX, inY, inType, inRot)
   {
      var _loc2_ = this.attachMovie("madness_splat","newBulletHole",this.getNextHighestDepth());
      _loc2_.gotoAndStop(inType);
      _loc2_.mySprite.gotoAndStop(SwainMath.randomNumber(1,_loc2_.mySprite._totalframes));
      if(inRot != undefined)
      {
         _loc2_.mySprite._rotation = inRot;
      }
      _loc2_._x = inX;
      _loc2_._y = inY;
      this.drawToBitmap(_loc2_,"bmpBodies");
      _loc2_.removeMovieClip();
      false;
   }
   function bulletWallHit(inX, inY)
   {
      return this.wallHit.hitTest(inX + this._x,inY + this._y,true);
   }
   function bulletFloorHit(inX, inY)
   {
      return this.floorHit.hitTest(inX + this._x,inY + this._y,true);
   }
   function applyFaction(inChar)
   {
      inChar.myRoster = this["npcRoster_" + inChar.myFaction];
      if(inChar.myRoster == undefined)
      {
         this["npcRoster_" + inChar.myFaction] = new MadnessRoster();
         inChar.myRoster = this["npcRoster_" + inChar.myFaction];
         inChar.myRoster.init(inChar.myFaction);
         inChar.myRoster.rosterName = "npcRoster_" + inChar.myFaction;
         MadnessCharacter.allRosters.push(inChar.myRoster);
      }
      if(!this.factionExists(inChar.myRoster.teamFaction) && !this.returnUnregisteredFaction(inChar.myRoster.teamFaction))
      {
         MadWorld.activeFactions.push(inChar.myRoster.teamFaction);
      }
      inChar.myRoster.addCharacter(inChar);
   }
   function createSprite(inChar, inDoor, inX, inY)
   {
      if(inChar.myRoster == undefined)
      {
         this.applyFaction(inChar);
      }
      inChar.myRoster.makeActive(inChar);
      if(inChar.myRoster == MadnessRoster.playerRoster)
      {
         _root.gameMenu.init();
      }
      var _loc4_ = this.attachMovie("madness_character","sprite" + String(SwainMath.randomNumber(0,99999999)),this.getNextHighestDepth());
      _loc4_.init(inChar,inChar.myRoster,inChar.myFaction,inChar == MadnessRoster.playerRoster.teamLeader,"UNUSED",inDoor,inX,inY);
      if(this.myRoomRef == MadnessLevel.myRooms[0] && inChar.myObjective != undefined)
      {
         MadnessLevel.completeObjectiveCheck(inChar,"rescue");
      }
      if(inChar == MadnessRoster.playerRoster.teamLeader)
      {
         MadnessLevel.completeObjectiveCheck(this.myRoomRef,"enter");
      }
      if(inChar == MadnessRoster.playerRoster.teamLeader)
      {
         this.runRoomEvents();
      }
      if(inChar.noCollide)
      {
         this.noColliders.push(inChar.mySprite);
      }
   }
   function leaveRoom()
   {
      if(!MadnessTransition.transitionLock && !MadnessActivator.bombActive)
      {
         if(this.exitDoor.myDataRef.myConnection == MadnessRoster.storeRoster && this.exitDoor.myDataRef.myConnection != undefined)
         {
            _root.createTransition("fade","arena_menu",null);
         }
         else if(MadnessLevel.levelVictory && !MadnessLevel.levelFailed)
         {
            if(MadnessPopup.returnSkipable())
            {
               MadnessGameSelect.beatStage(MadnessLevel.currentLevel.myWorld,MadnessLevel.currentLevel.myLevel);
               MadnessPopup.addPopup("lines","AREA COMPLETE",null,440,170,undefined,90,this.leaveRoomFunction,null);
            }
         }
         else
         {
            MadnessLevel.completeObjectiveCheck(this.exitDoor.myDataRef,"exit");
            if(!MadnessLevel.levelVictory && !MadnessLevel.levelFailed)
            {
               _root.createTransition("slide","room",this.exitDoor.myDataRef.myConnection);
            }
         }
      }
   }
   function leaveRoomFunction()
   {
      if(MadnessLevel.currentLevel.myCutsceneEnd != undefined && !MadnessLevel.levelFailed)
      {
         MadnessCutscene.storeCutsceneInfo(MadnessLevel.currentLevel.myCutsceneEnd,MadnessGameSelect.gameMode + "_menu",MadnessLevel.startPoint);
         _root.createTransition("endgame","cutscene",null);
      }
      else
      {
         _root.createTransition("endgame",MadnessGameSelect.gameMode + "_menu",null);
      }
   }
   function gameOver()
   {
      if(!MadnessTransition.transitionLock)
      {
         _root.createTransition("fade","menu",null);
      }
   }
   function playerDies()
   {
      if(!MadnessLevel.levelFailed)
      {
         if(MadnessGameSelect.gameMode == "arena")
         {
            MadnessEvents.arena_1_dead();
            MadnessLevel.levelFailed = true;
         }
         if(MadnessGameSelect.gameMode == "story")
         {
            if(MadnessCharacter.playerLives == 0 && _root.mcScreenCap == undefined)
            {
               if(!MadnessLevel.levelFailed && !MadnessTransition.transitionLock)
               {
                  MadnessLevel.levelVictory = false;
                  MadnessLevel.levelFailed = true;
                  MadnessPopup.closeAll();
                  MadnessPopup.addPopup("lines","MISSION FAILED",null,440,170,undefined,90,this.leaveRoomFunction,null);
               }
            }
            else
            {
               MadnessCharacter.playerLives--;
               this.deadGlitchEnding();
            }
         }
      }
   }
   function deadGlitchEnding()
   {
      if(_root.mcScreenCap == undefined || _root.mcScreenCap.myPurpose != "recover")
      {
         var _loc4_ = new flash.display.BitmapData(_root._width + this.bmpOffset * 2,_root._height + this.bmpOffset * 2,true,11141290);
         _root.createEmptyMovieClip("mcScreenCap",_root.getNextHighestDepth());
         _root.mcScreenCap.attachBitmap(_loc4_,_root.mcScreenCap.getNextHighestDepth(),"auto",true);
         _root.mcScreenCap.attachMovie("death_glitch","deathGlitch",this.getNextHighestDepth());
         _root.mcScreenCap.startX = - this.bmpOffset;
         _root.mcScreenCap.startY = - this.bmpOffset;
         _root.mcScreenCap._x = - this.bmpOffset;
         _root.mcScreenCap._y = - this.bmpOffset;
         _root.mcScreenCap.myTimer = 190;
         _root.mcScreenCap.myColorTransform = new Object();
         _root.mcScreenCap.myPurpose = "recover";
         var _loc3_ = new flash.geom.Matrix();
         _loc3_.scale(_root._xscale / 100,_root._yscale / 100);
         _loc3_.translate(_root._x + this.bmpOffset,_root._y + this.bmpOffset);
         _loc4_.draw(_root,_loc3_);
         _root.mcScreenCap.onEnterFrame = function()
         {
            _root.mcScreenCap.myTimer -= 2.5;
            _root.mcScreenCap.myColorTransform = {rb:SwainMath.randomNumber(90,100),gb:0,bb:0};
            _root.mcScreenCap.myColor = new Color(_root.mcScreenCap);
            _root.mcScreenCap.myColor.setTransform(_root.mcScreenCap.myColorTransform);
            _root.mcScreenCap._alpha = _root.mcScreenCap.myTimer;
            if(SwainMath.randomNumber(0,5) == 0 && _root.mcScreenCap.myTimer < 190)
            {
               _root.mcScreenCap._alpha = _root.mcScreenCap.myTimer / 2;
            }
            _root.mcScreenCap._x = _root.mcScreenCap.startX + SwainMath.randomNumber(-60,60) / 10;
            _root.mcScreenCap._y = _root.mcScreenCap.startY + SwainMath.randomNumber(-60,60) / 10;
            if(_root.mcScreenCap.myTimer <= 0)
            {
               SwainAudioPlayer.stopSound("static");
               _root.mcScreenCap.removeMovieClip();
            }
         };
      }
   }
   function deadContinueEnding()
   {
   }
   function deadArenaEnding()
   {
   }
   function slowMoActive()
   {
      if(_root.mcSlowmo == undefined)
      {
         var _loc4_ = new flash.display.BitmapData(_root._width + this.bmpOffset * 2,_root._height + this.bmpOffset * 2,true,11141290);
         _root.createEmptyMovieClip("mcSlowmo",_root.getNextHighestDepth());
         _root.mcSlowmo.attachBitmap(_loc4_,_root.mcSlowmo.getNextHighestDepth(),"auto",true);
         _root.mcSlowmo._alpha = 60;
         _root.mcSlowmo._x = - this.bmpOffset;
         _root.mcSlowmo._y = - this.bmpOffset;
         var _loc3_ = new flash.geom.Matrix();
         _loc3_.scale(_root._xscale / 100,_root._yscale / 100);
         _loc3_.translate(_root._x + this.bmpOffset,_root._y + this.bmpOffset);
         _loc4_.draw(_root,_loc3_);
         _root.mcSlowmo.onEnterFrame = function()
         {
            _root.mcSlowmo._alpha -= 7;
            if(_root.mcSlowmo._alpha <= 10)
            {
               _root.mcSlowmo.removeMovieClip();
            }
         };
      }
   }
   function slowMoClose()
   {
      if(_root.mcSlowmo != undefined)
      {
         _root.mcSlowmo.removeMovieClip();
      }
   }
   function createRosterEnemies(inRoster)
   {
      var _loc1_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < inRoster.myActiveMembers.length)
      {
         _loc1_ = MadnessDoors.allDoors[SwainMath.randomNumber(0,MadnessDoors.allDoors.length - 1)];
         while(_loc1_.myDataRef.noSpawn || _loc1_ == undefined)
         {
            _loc1_ = MadnessDoors.allDoors[SwainMath.randomNumber(0,MadnessDoors.allDoors.length - 1)];
         }
         _loc1_.addCharacter(inRoster.myActiveMembers[_loc2_],"enter");
         _loc2_ = _loc2_ + 1;
      }
   }
   static function factionGone(inFac)
   {
      var _loc1_ = 0;
      while(_loc1_ < MadnessCharacter.allRosters.length)
      {
         if(MadnessCharacter.allRosters[_loc1_].teamFaction == inFac)
         {
            return false;
         }
         _loc1_ = _loc1_ + 1;
      }
      return true;
   }
   function enemiesAllDead()
   {
      var _loc2_ = 0;
      while(_loc2_ < MadnessSpawner.allSpawners.length)
      {
         if(MadnessSpawner.allSpawners[_loc2_].myFaction != "player")
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.rosterCreationList.length)
      {
         if(this.rosterCreationList[_loc2_].teamFaction != "player" && this.rosterCreationList[_loc2_].teamFaction != "deserters")
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      return MadWorld.activeFactions.length == 1;
   }
   function runRoomEvents()
   {
      while(this.myRoomRef.myEvents.length > 0)
      {
         if(this.myRoomRef.myEvents[0].myType == "function")
         {
            this.myRoomRef.myEvents[0].myAction();
         }
         this.myRoomRef.myEvents.splice(0,1);
      }
   }
   function runRosterEvents(inRoster)
   {
      while(inRoster.myEvents.length > 0)
      {
         if(inRoster.myEvents[0].myType == "function")
         {
            inRoster.myEvents[0].myAction();
         }
         inRoster.myEvents.splice(0,1);
      }
   }
   function shakeyCam(inNum)
   {
      if(inNum > this.shakeCount)
      {
         this.shakeCount = inNum;
      }
   }
   function gunItemDrop(inX, inY, inScale, inGun)
   {
      this.createParticle(inGun.myType,"gun",inX,inY - 90,SwainMath.randomNumber(-20,20) / 10,0,-90,0,0.3,inY,100,inScale,true,90,inGun);
   }
   function createAimReticle(inSource, inTarget)
   {
      var _loc2_ = this.attachMovie("aim_reticle","aimReticle",this.getNextHighestDepth());
      var aimStart = inSource.aimTimer;
      var _loc3_ = 300;
      var bracketSpeed = _loc3_ / aimStart;
      _loc3_ += 50;
      _loc2_.bracketSpeed = bracketSpeed;
      _loc2_.mySource = inSource;
      _loc2_.myTarget = inTarget;
      _loc2_.rotSpeed = 0;
      _loc2_.aimStart = aimStart;
      _loc2_.bracket1._y = - _loc3_;
      _loc2_.bracket2._y = _loc3_;
      _loc2_.amDone = false;
      _loc2_._alpha = 0;
      _loc2_._x = inTarget._x;
      _loc2_._y = inTarget._y;
      _loc2_.onEnterFrame = function()
      {
         if(!this.amDone && !this._parent.paused)
         {
            if(this._alpha < 100)
            {
               this._alpha += this.bracketSpeed * (1 + this.mySource.myGameSpeed);
            }
            this._x = this.myTarget._x;
            this._y = this.myTarget._y - 40;
            if(this.mySource.aimTimer < this.aimStart / 2)
            {
               this.rotSpeed = this.aimStart / 2 / this.mySource.aimTimer * 4.7;
               this._rotation += this.rotSpeed;
            }
            if(this.encircle._alpha < 100)
            {
               this.encircle._alpha += this.rotSpeed;
            }
            this.bracket1._y += this.bracketSpeed * (1 + this.mySource.myGameSpeed);
            this.bracket2._y -= this.bracketSpeed * (1 + this.mySource.myGameSpeed);
            if(!(this.myTarget.myHealth > 0 && this.mySource.aimTimer > -1 && MadnessCharacter.aimingSprite != undefined))
            {
               this.amDone = true;
               this.rotSpeed = 30;
            }
         }
         if(this.amDone)
         {
            this.bracket1._y -= this.bracketSpeed * (3 + this.mySource.myGameSpeed);
            this.bracket2._y += this.bracketSpeed * (3 + this.mySource.myGameSpeed);
            this.rotSpeed *= 0.7;
            this._rotation += this.rotSpeed;
            this._alpha -= 10;
            if(this._alpha <= 0)
            {
               this.removeMovieClip();
            }
         }
      };
   }
   function inventExistingNPCStartPoint(inStartPoint)
   {
      var _loc3_ = this.myRooms[SwainMath.randomNumber(0,this.myRooms.length - 1)];
      var _loc7_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc6_ = undefined;
      if(inStartPoint && this.PHstartEnemy != undefined)
      {
         _loc5_ = this.PHstartEnemy._x - 80;
         _loc6_ = this.PHstartEnemy._x + 80;
         _loc7_ = this.PHstartEnemy._y - 50;
         _loc4_ = this.PHstartEnemy._y + 50;
      }
      else
      {
         _loc7_ = _loc3_.myUL._y;
         if(_loc7_ > _loc3_.myUR._y)
         {
            _loc7_ = _loc3_.myUR._y;
         }
         _loc4_ = _loc3_.myDL._y;
         if(_loc4_ < _loc3_.myDR._y)
         {
            _loc4_ = _loc3_.myDR._y;
         }
         _loc5_ = _loc3_.myUL._x;
         if(_loc5_ > _loc3_.myDL._x)
         {
            _loc5_ = _loc3_.myDL._x;
         }
         _loc6_ = _loc3_.myUR._x;
         if(_loc6_ < _loc3_.myDR._x)
         {
            _loc6_ = _loc3_.myDR._x;
         }
      }
      var _loc2_ = new MovieClip();
      while(this.determineRoom(_loc2_._x,_loc2_._y) == undefined || this.determineRoom(_loc2_._x,_loc2_._y) == -1)
      {
         _loc2_._x = SwainMath.randomNumber(_loc5_,_loc6_);
         _loc2_._y = SwainMath.randomNumber(_loc7_,_loc4_);
      }
      return _loc2_;
   }
   static function returnRandomSpot()
   {
      return MadWorld.thisWorld.inventExistingNPCStartPoint(false);
   }
   function factionExists(inFaction)
   {
      var _loc1_ = 0;
      while(_loc1_ < MadWorld.activeFactions.length)
      {
         if(MadWorld.activeFactions[_loc1_] == inFaction)
         {
            return true;
         }
         _loc1_ = _loc1_ + 1;
      }
      return false;
   }
   function doorsEmpty()
   {
      var _loc1_ = 0;
      while(_loc1_ < MadnessDoors.allDoors.length)
      {
         if(MadnessDoors.allDoors[_loc1_].mySprites.length > 0 || MadnessDoors.allDoors[_loc1_].myEnterers.length > 0)
         {
            return false;
         }
         _loc1_ = _loc1_ + 1;
      }
      return true;
   }
   static function freezeCharacters(inFreeze)
   {
      MadWorld.thisWorld.characterHold = inFreeze;
   }
   function pauseGame()
   {
      this.paused = true;
      KeyManager.lockKeys();
      MadnessRoster.playerRoster.teamLeader.mySprite.mouseLock = true;
      MadnessRoster.playerRoster.teamLeader.mySprite.mouseHold = false;
   }
   function unpauseGame()
   {
      this.paused = false;
      KeyManager.lockKeys();
      if(!MadnessRoster.playerRoster.teamLeader.mySprite.mouseHold)
      {
         MadnessRoster.playerRoster.teamLeader.mySprite.mouseLock = false;
      }
   }
   static function returnAudioPosition(inX)
   {
      inX += MadWorld.thisWorld._x;
      inX -= Stage.width / 2;
      inX *= 0.16;
      if(inX < -100)
      {
         inX = -100;
      }
      if(inX > 100)
      {
         inX = 100;
      }
      return inX;
   }
   function processForeignRoster(inRoster)
   {
      while(inRoster.length > 0)
      {
         this.rosterCreationList.push(inRoster[0]);
         inRoster.splice(0,1);
      }
   }
   function returnUnregisteredFaction(inFaction)
   {
      return inFaction == "deserter" || inFaction == "neutral";
   }
}
