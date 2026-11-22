class MadnessAI
{
   static var myTarget;
   static var myLeader;
   static var world;
   static var findRange;
   static var thisWeapon;
   function MadnessAI()
   {
   }
   static function setActions(inChar)
   {
      inChar.moveUp = false;
      inChar.moveDown = false;
      inChar.moveLeft = false;
      inChar.moveRight = false;
      inChar.toggleAction = false;
      inChar.toggleReload = false;
      inChar.togglePickup = false;
      inChar.toggleSlowmo = false;
      inChar.mouseClick = false;
      inChar.mouseHold = false;
      inChar.shootReady = false;
      MadnessAI.myTarget = inChar.myAttackTarget;
      if(MadnessAI.myTarget._x == undefined)
      {
         MadnessAI.myTarget = undefined;
      }
      MadnessAI.myLeader = inChar.myRoster.teamLeader.mySprite;
      if(MadnessAI.myLeader._x == undefined)
      {
         MadnessAI.myLeader = undefined;
      }
      MadnessAI.world = inChar._parent;
      if(MadWorld.activeFactions.length == 1)
      {
         if(inChar.myMission == "engage" && SwainMath.randomNumber(0,inChar.traitDistracted) == 0 || inChar.myRoster != MadnessRoster.playerRoster)
         {
            if(MadnessAI.myLeader == inChar)
            {
               inChar.myMission = "follow";
            }
            else
            {
               inChar.myMission = "follow";
            }
            inChar.intendedX = undefined;
         }
         MadnessAI.myTarget = undefined;
      }
      if(MadnessLevel.currentLevel.myWorld == 1 && MadnessLevel.currentLevel.myLevel == 0 && MadWorld.thisWorld.myRoomRef == MadnessLevel.myRooms[15] && inChar.myFaction == "zombie")
      {
         inChar.myMission = "engage";
         if(MadnessAI.myTarget == MadnessRoster.playerRoster.teamLeader.mySprite && MadnessCharacter.allRosters[1].myActiveMembers[0].mySprite != undefined)
         {
            MadnessAI.myTarget = MadnessCharacter.allRosters[1].myActiveMembers[0].mySprite;
         }
      }
      if((inChar.myFaction != "neutral" || inChar.myDataRef.attackNeutrals) && MadWorld.activeFactions.length > 1 && PulseTimer.getActive(inChar.myPulseNumber,3))
      {
         if(inChar.myMission == "follow" || inChar.myMission == "patrol")
         {
            if(inChar.myDataRef.autoAware || inChar.myHealth < inChar.myHealthMax || inChar.myTactics < inChar.myTacticsMax || inChar.myRoster == MadnessRoster.playerRoster)
            {
               inChar.myMission = "engage";
               inChar.intendedX = undefined;
               inChar.pathFind = false;
            }
            else
            {
               var _loc6_ = 0;
               while(_loc6_ < MadnessCharacter.allRosters.length)
               {
                  var _loc5_ = 0;
                  while(_loc5_ < MadnessCharacter.allRosters[_loc6_].myActiveMembers.length)
                  {
                     var _loc3_ = 50 + inChar.myDataRef.traitAwareness * 100;
                     if(MadnessCharacter.allRosters[_loc6_].teamFaction != inChar.myFaction)
                     {
                        if(MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x > inChar._x && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x < inChar._x + _loc3_ && (inChar.isFacingRight && !inChar.facingOpposite || !inChar.isFacingRight && inChar.facingOpposite) || MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x < inChar._x && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x > inChar._x - _loc3_ && (!inChar.isFacingRight && !inChar.facingOpposite || inChar.isFacingRight && inChar.facingOpposite) || MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x > inChar._x - _loc3_ * 1.5 && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x < inChar._x + _loc3_ * 1.5 && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite.rofTimer < 6 && !MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].myWeapons[MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_]
                        .myWeapon].upgradeSilencer)
                        {
                           inChar.myMission = "engage";
                           inChar.intendedX = undefined;
                           inChar.pathFind = false;
                        }
                     }
                     else if(!inChar.myDataRef.amZombie && MadnessCharacter.allRosters[_loc6_] == inChar.myRoster && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite.myMission == "engage" && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x > inChar._x - _loc3_ * 0.4 && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite._x < inChar._x + _loc3_ * 0.4)
                     {
                        inChar.myMission = "engage";
                        inChar.intendedX = undefined;
                        inChar.pathFind = false;
                     }
                     _loc5_ = _loc5_ + 1;
                  }
                  _loc6_ = _loc6_ + 1;
               }
            }
         }
      }
      if(MadnessAI.myTarget.myFaction == inChar.myFaction)
      {
         MadnessAI.myTarget = undefined;
      }
      if(MadnessAI.myTarget == undefined || (inChar.myRoster != MadnessRoster.playerRoster && (MadnessAI.myTarget != MadnessRoster.playerRoster.teamLeader || MadWorld.zombiesActive) && SwainMath.randomNumber(0,inChar.traitDistracted * 10) == 0 || SwainMath.randomNumber(0,inChar.traitDistracted * 20) == 0) && inChar.aimTimer == -1)
      {
         if(inChar.myStatus == "cover" || inChar.myStatus == "block" || inChar.myStatus == "idle" || inChar.myStatus == "run" || inChar.myStatus == "tactics" || inChar.myStatus == "backtrack" || inChar.myStatus == "dash")
         {
            if(inChar.myMission == "engage" || inChar.myMission == "surrender")
            {
               var _loc4_ = undefined;
               var _loc7_ = 99999999999999;
               _loc6_ = 0;
               while(_loc6_ < MadnessCharacter.allRosters.length)
               {
                  if(MadnessCharacter.allRosters[_loc6_].teamFaction != inChar.myFaction && (MadnessCharacter.allRosters[_loc6_].teamFaction != "neutral" || inChar.myDataRef.attackNeutrals) && MadnessCharacter.allRosters[_loc6_].teamFaction != "deserters")
                  {
                     _loc5_ = 0;
                     while(_loc5_ < MadnessCharacter.allRosters[_loc6_].myActiveMembers.length)
                     {
                        _loc4_ = SwainMath.get_distance(inChar,MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite);
                        if(!MadWorld.zombiesActive && MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite.amPlayer && MadWorld.activeFactions.length <= 2 && SwainMath.randomNumber(0,5) > 0 && inChar.myMission != "surrender")
                        {
                           _loc4_ *= 0.1;
                        }
                        if(_loc4_ < _loc7_)
                        {
                           _loc7_ = _loc4_;
                           MadnessAI.myTarget = MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_].mySprite;
                           _loc4_ = _loc7_;
                        }
                        _loc5_ = _loc5_ + 1;
                     }
                  }
                  _loc6_ = _loc6_ + 1;
               }
            }
         }
      }
      if(inChar.myStatus.substr(0,7) == "wounded")
      {
         if(MadnessAI.myTarget._x > inChar._x && MadnessAI.myTarget._x < inChar._x + 200)
         {
            inChar.moveLeft = true;
         }
         if(MadnessAI.myTarget._x < inChar._x && MadnessAI.myTarget._x > inChar._x - 200)
         {
            inChar.moveRight = true;
         }
      }
      if(inChar.myMission == "patrol")
      {
         if(!inChar.pathFind)
         {
            inChar.missionTimer = inChar.missionTimer + 1;
            if(inChar.missionTimer > 10 && inChar.myStatus == "idle")
            {
               if(SwainMath.randomNumber(0,90 + inChar.myDataRef.traitDistracted * 5) == 1 || inChar.missionTimer > 90 + inChar.myDataRef.traitDistracted * 5)
               {
                  var _loc15_ = undefined;
                  var _loc11_ = undefined;
                  var _loc10_ = undefined;
                  inChar.intendedX = undefined;
                  inChar.intendedY = undefined;
                  var _loc14_ = MadWorld.returnRandomSpot();
                  _loc11_ = _loc14_._x;
                  _loc10_ = _loc14_._y;
                  _loc15_ = MadWorld.thisWorld.determineRoom(_loc11_,_loc10_);
                  inChar.intendedX = _loc11_;
                  inChar.intendedY = _loc10_;
                  inChar.intendedRoom = _loc15_;
                  inChar.pathFind = true;
                  inChar.ignoreRooms = false;
                  inChar.missionTimer = 0;
               }
            }
         }
      }
      if(inChar.myMission == "roam")
      {
         if(!inChar.pathFind)
         {
            if(inChar.myRoom == MadnessAI.world.myRooms[0])
            {
               inChar.intendedTarget = MadnessAI.world.door2;
            }
            else
            {
               inChar.intendedTarget = MadnessAI.world.door1;
            }
            inChar.intendedX = inChar.intendedTarget._x;
            inChar.intendedY = inChar.intendedTarget._y;
            inChar.intendedRoom = MadnessAI.world.determineRoom(inChar.intendedX,inChar.intendedY);
            inChar.pathFind = true;
            inChar.ignoreRooms = false;
         }
         if(!inChar.pathFind)
         {
         }
      }
      if(inChar.myMission == "engage")
      {
         if(inChar.myDataRef.amSurprised)
         {
            inChar.myDataRef.amSurprised = false;
         }
         inChar.inRange = false;
         if(MadnessAI.myTarget.myStatus != "dead" && (inChar.myRoster.teamAttacker._x == undefined || SwainMath.randomNumber(0,2) == 0))
         {
            if(inChar.myRoster == MadnessRoster.playerRoster || inChar.myDataRef.selfShoot || inChar.myDataRef.myWeapons[inChar.myWeapon].melee || inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined || SwainMath.randomNumber(0,inChar.myRoster.teamFireScore) < 20)
            {
               if(inChar.myDataRef.amZombie || inChar.myDataRef.amAbom)
               {
                  MadnessAI.findRange = 136 * ((inChar.myDataRef.myScale - 1) * 0.5 + 1);
               }
               else
               {
                  MadnessAI.findRange = inChar.myDataRef.myWeapons[inChar.myWeapon].myRange * (1 + (11 - MadnessAI.getModdedSkill(inChar,"traitBravery")) / 3);
                  if(MadnessAI.findRange > 600 || inChar.myDataRef.noRange)
                  {
                     MadnessAI.findRange = 600;
                  }
                  if(inChar.myDataRef.myWeapons[inChar.myWeapon].melee)
                  {
                     MadnessAI.findRange = inChar.myDataRef.myWeapons[inChar.myWeapon].myRange * inChar.myDataRef.myScale;
                  }
                  if(inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined)
                  {
                     MadnessAI.findRange = inChar.myDataRef.myUnarmed.myRange * inChar.myDataRef.myScale;
                  }
               }
               if(MadnessAI.myTarget.invincibleTimer <= 0 && MadnessAI.myTarget != undefined && MadnessAI.myTarget._x < inChar._x + MadnessAI.findRange && MadnessAI.myTarget._x > inChar._x - MadnessAI.findRange)
               {
                  if(!inChar.myDataRef.amZombie && !inChar.myDataRef.amAbom && !inChar.myDataRef.myWeapons[inChar.myWeapon].melee && inChar.myDataRef.myWeapons[inChar.myWeapon] != undefined)
                  {
                     if(!(inChar.lastHitTimer < 60 && inChar.myDataRef.hitStopAttack))
                     {
                        inChar.inRange = true;
                     }
                  }
                  else if(inChar.myDataRef.amZombie && inChar.inMeleeRange(MadnessAI.myTarget) || !inChar.myDataRef.amZombie && inChar.inMeleeRangeAI(MadnessAI.myTarget))
                  {
                     inChar.inRange = true;
                  }
               }
            }
         }
         if(inChar.inRange)
         {
            inChar.shootReady = true;
         }
         if(!inChar.myDataRef.amZombie && !inChar.myDataRef.amAbom && inChar.aimTimer == -1 && inChar.targetObstacle == undefined && !inChar.myDataRef.myWeapons[inChar.myWeapon].melee && inChar.myDataRef.myWeapons[inChar.myWeapon] != undefined)
         {
            if(SwainMath.randomNumber(0,700 - inChar.myDataRef.traitCover * 70) == 0 && !inChar.myDataRef.amSlow)
            {
               _loc6_ = 0;
               while(_loc6_ < MadnessObstacle.allObstacles.length)
               {
                  if(!MadnessObstacle.allObstacles[_loc6_].inUse && MadnessObstacle.allObstacles[_loc6_].amCover)
                  {
                     if(MadnessObstacle.allObstacles[_loc6_]._x < inChar._x + 300 + inChar.myDataRef.traitCover * 5 && MadnessObstacle.allObstacles[_loc6_]._x > inChar._x - 300 - inChar.myDataRef.traitCover * 5)
                     {
                        if(MadnessAI.myTarget._x > inChar._x && MadnessObstacle.allObstacles[_loc6_]._x > inChar._x || MadnessAI.myTarget._x < inChar._x && MadnessObstacle.allObstacles[_loc6_]._x < inChar._x)
                        {
                           inChar.attractToMC(MadnessObstacle.allObstacles[_loc6_],"cover");
                           if(MadnessAI.myTarget._x > inChar._x)
                           {
                              inChar.intendedX = inChar.intendedTarget._x - SwainMath.randomNumber(inChar.intendedTarget.myWidth * 0.5,inChar.intendedTarget.myWidth * 0.9);
                           }
                           else
                           {
                              inChar.intendedX = inChar.intendedTarget._x + SwainMath.randomNumber(inChar.intendedTarget.myWidth * 0.5,inChar.intendedTarget.myWidth * 0.9);
                           }
                           inChar.intendedY = inChar.intendedTarget._y + SwainMath.randomNumber(5,20);
                           break;
                        }
                     }
                  }
                  _loc6_ = _loc6_ + 1;
               }
            }
         }
         if(!inChar.myDataRef.amZombie && inChar.targetObstacle != undefined && inChar.targetObstacle.inUse != undefined)
         {
            MadnessAI.thisWeapon = MadnessAI.myTarget.myDataRef.myWeapons[MadnessAI.myTarget.myWeapon];
            inChar.toggleGuard = false;
            if(MadnessAI.thisWeapon.melee || MadnessAI.thisWeapon == undefined || MadnessAI.myTarget._x == undefined || MadnessAI.myTarget._x < inChar._x && inChar._x < inChar.targetObstacle._x || MadnessAI.myTarget._x > inChar._x && inChar._x > inChar.targetActivator._x)
            {
               if(SwainMath.randomNumber(0,inChar.myDataRef.traitDistracted * 10) == 0)
               {
                  inChar.toggleGuard = true;
               }
            }
         }
         else if(MadnessAI.myTarget.myStatus.substr(0,5) == "magic" || MadnessAI.myTarget.myStatus.substr(0,5) == "melee" || MadnessAI.myTarget.myStatus.substr(0,7) == "unarmed" || !MadnessAI.thisWeapon.melee && (MadnessAI.myTarget.rofTimer == 1 || MadnessAI.myTarget.rofTimer < 30 && MadnessDataFile.havePerk("perkBlock1",inChar.myDataRef)))
         {
            if(!inChar.myDataRef.amZombie && !inChar.myDataRef.amSlow && inChar.aimTimer == -1 && !inChar.myDataRef.noDodge)
            {
               if((MadnessAI.thisWeapon.melee || MadnessAI.thisWeapon == undefined) && inChar.myDataRef.myWeapons[inChar.myWeapon].melee && (SwainMath.randomNumber(0,20 - MadnessAI.getModdedSkill(inChar,"traitCombatSkill") * 2) <= 0 || inChar.lifeSpan < 15) || (MadnessAI.thisWeapon.melee || MadnessAI.thisWeapon == undefined) && (SwainMath.randomNumber(0,(15 - MadnessAI.getModdedSkill(inChar,"traitCombatSkill")) * 9) <= 0 || inChar.lifeSpan < 15) || !(MadnessAI.thisWeapon.melee || MadnessAI.thisWeapon == undefined) && (SwainMath.randomNumber(0,(11 - MadnessAI.getModdedSkill(inChar,"traitCombatSkill")) * 4) <= 0 || inChar.lifeSpan < 15))
               {
                  if(inChar.myDataRef.myWeapons[inChar.myWeapon].melee && (MadnessAI.thisWeapon.melee || MadnessAI.thisWeapon == undefined || !MadnessAI.thisWeapon.melee && MadnessDataFile.havePerk("perkBlock1",inChar.myDataRef)) || !inChar.myDataRef.myWeapons[inChar.myWeapon].melee && MadnessAI.getModdedSkill(inChar,"traitCombatSkill") > 1)
                  {
                     if(MadnessAI.thisWeapon.melee && MadnessAI.myTarget.inMeleeRange(inChar) && (inChar._x > MadnessAI.myTarget._x && inChar._x < MadnessAI.myTarget._x + MadnessAI.thisWeapon.myRange && MadnessAI.myTarget.isFacingRight || inChar._x < MadnessAI.myTarget._x && inChar._x > MadnessAI.myTarget._x - MadnessAI.thisWeapon.myRange && !MadnessAI.myTarget.isFacingRight) || !MadnessAI.thisWeapon.melee && SwainMath.getRotDistance(SwainMath.calculate_rotation(MadnessAI.myTarget._x,MadnessAI.myTarget._y,inChar._x,inChar._y),SwainMath.calculate_rotation(MadnessAI.myTarget._x,MadnessAI.myTarget._y - MadnessAI.myTarget.myDataRef.myShootHeight,MadnessAI.myTarget.myAimX,MadnessAI.myTarget.myAimY)) < 30)
                     {
                        inChar.toggleGuard = true;
                     }
                  }
               }
            }
         }
         else
         {
            inChar.toggleGuard = false;
         }
         if(inChar._x < MadnessAI.myTarget._x && !inChar.isFacingRight && !inChar.pathFind && SwainMath.randomNumber(0,inChar.traitDistracted * 2) == 0)
         {
            inChar.moveRight = true;
         }
         if(inChar._x > MadnessAI.myTarget._x && inChar.isFacingRight && !inChar.pathFind && SwainMath.randomNumber(0,inChar.traitDistracted * 2) == 0)
         {
            inChar.moveLeft = true;
         }
         if(inChar._x < MadnessAI.myTarget._x && inChar.intendedX > MadnessAI.myTarget._x || inChar._x > MadnessAI.myTarget._x && inChar.intendedX < MadnessAI.myTarget._x)
         {
            inChar.pathFind = false;
         }
         if(!inChar.myDataRef.amZombie && inChar.myStatus == "idle" && SwainMath.randomNumber(0,(11 - inChar.traitDistracted / 2) * 2) <= 0)
         {
            inChar.intendedX = inChar._x + SwainMath.randomNumber(-30,30);
            inChar.intendedY = inChar._y + SwainMath.randomNumber(-50,50);
            // TODO: To fix or not to fix? This is a bug with the original game and I don't really wanna touch original game logic
            inChar.intendedRoom = MadnessAI.world.determineRoom(inChar.intendedY,inChar.intendedY);
            inChar.pathFind = true;
            inChar.ignoreRooms = false;
            if(inChar.intendedRoom == -1)
            {
               inChar.intendedX = undefined;
               inChar.intendedY = undefined;
               inChar.intendedTarget = undefined;
               inChar.pathFind = false;
               inChar.ignoreRooms = false;
            }
         }
         if(inChar.myDataRef.amZombie || inChar.myDataRef.amAbom)
         {
            MadnessAI.findRange = 80 * ((inChar.myDataRef.myScale - 1) * 0.2 + 1);
         }
         else
         {
            MadnessAI.findRange = inChar.myDataRef.myWeapons[inChar.myWeapon].myRange * 0.95 + 20 + inChar.myAttackTarget.myWidth / 2;
            if(inChar.myDataRef.myWeapons[inChar.myWeapon].myAmmo == 0)
            {
               MadnessAI.findRange = inChar.myDataRef.myWeapons[inChar.myWeapon].myRange * 3;
            }
            if(MadnessAI.findRange > 600)
            {
               MadnessAI.findRange = 600;
            }
            if(inChar.myDataRef.myWeapons[inChar.myWeapon].melee)
            {
               MadnessAI.findRange = inChar.myDataRef.myWeapons[inChar.myWeapon].myRange * 0.9;
            }
            else if(inChar.myDataRef.meleeShy)
            {
               MadnessAI.findRange *= 1.5;
               if(MadnessAI.findRange < 400)
               {
                  MadnessAI.findRange = 400;
               }
            }
            if(inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined)
            {
               MadnessAI.findRange = inChar.myDataRef.myUnarmed.myRange * 0.9;
            }
         }
         if((!inChar.inRange || SwainMath.randomNumber(0,inChar.traitDistracted * 30) == 0 && inChar.myDataRef.myWeapons[inChar.myWeapon].myROF > 15 || (inChar.myDataRef.myWeapons[inChar.myWeapon].melee || inChar.myDataRef.meleeShy && MadnessAI.myTarget.myDataRef.myWeapons[MadnessAI.myTarget.myWeapon].melee || inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined) && !inChar.inRange) && !inChar.pathFind)
         {
            var _loc9_ = undefined;
            var _loc8_ = 25;
            if(inChar.myDataRef.myWeapons[inChar.myWeapon].melee)
            {
               _loc8_ = 5;
            }
            var _loc12_ = MadnessAI.findRange;
            if(inChar._x < MadnessAI.myTarget._x)
            {
               _loc9_ = SwainMath.randomNumber((- (90 + _loc8_)) * 10,(- (90 - _loc8_)) * 10) / 10;
               _loc11_ = SwainMath.get_position(MadnessAI.myTarget._x,MadnessAI.myTarget._y,_loc9_,_loc12_,"x");
               _loc10_ = SwainMath.get_position(MadnessAI.myTarget._x,MadnessAI.myTarget._y,_loc9_,_loc12_,"y");
            }
            else
            {
               _loc9_ = SwainMath.randomNumber((90 - _loc8_) * 10,(90 + _loc8_) * 10) / 10;
               _loc11_ = SwainMath.get_position(MadnessAI.myTarget._x,MadnessAI.myTarget._y,_loc9_,_loc12_,"x");
               _loc10_ = SwainMath.get_position(MadnessAI.myTarget._x,MadnessAI.myTarget._y,_loc9_,_loc12_,"y");
            }
            var _loc13_ = MadnessAI.world.determineRoom(_loc11_,_loc10_);
            if(_loc13_ != undefined && _loc13_ != -1 && !MadnessObstacle.returnInsideObstacle(_loc11_,_loc10_,inChar.myWidth))
            {
               if(_loc8_ < 80)
               {
                  _loc8_ += 2;
               }
               inChar.intendedX = _loc11_;
               inChar.intendedY = _loc10_;
               inChar.intendedTarget = undefined;
               inChar.intendedRoom = _loc13_;
               inChar.pathFind = true;
               inChar.ignoreRooms = false;
            }
            else
            {
               inChar.intendedX = undefined;
               inChar.intendedY = undefined;
               inChar.intendedTarget = undefined;
               inChar.pathFind = false;
               inChar.ignoreRooms = false;
            }
         }
      }
      else
      {
         inChar.inRange = false;
      }
      if(inChar.myMission == "retreat")
      {
      }
      if(inChar.myMission == "follow")
      {
         if(MadnessAI.myLeader != undefined)
         {
            if((inChar.intendedX == undefined || PulseTimer.getActive(inChar.myPulseNumber,1)) && SwainMath.get_distance(inChar,MadnessAI.myLeader) > 150)
            {
               if(MadnessAI.myLeader._x > inChar._x)
               {
                  inChar.intendedX = MadnessAI.myLeader._x - SwainMath.randomNumber(60,120);
                  inChar.intendedY = MadnessAI.myLeader._y + SwainMath.randomNumber(-30,30);
               }
               else
               {
                  inChar.intendedX = MadnessAI.myLeader._x + SwainMath.randomNumber(60,120);
                  inChar.intendedY = MadnessAI.myLeader._y + SwainMath.randomNumber(-30,30);
               }
               inChar.intendedTarget = MadnessAI.myLeader;
               inChar.intendedRoom = MadnessAI.world.determineRoom(inChar.intendedX,inChar.intendedY);
               inChar.pathFind = true;
               inChar.ignoreRooms = false;
            }
         }
      }
      if(MadnessAI.myTarget._x != undefined)
      {
         inChar.myAimX = MadnessAI.myTarget._x;
         inChar.myAimY = MadnessAI.myTarget._y - MadnessAI.myTarget.myDataRef.myHeight + 30;
      }
      else if(inChar.rofTimer > inChar.myDataRef.myWeapons[inChar.myWeapon].myROF || inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined || inChar.rofTimer <= 1)
      {
         MadnessAI.myTarget = undefined;
         if(!inChar.isFacingRight)
         {
            inChar.myAimX = inChar._x - 50;
         }
         else
         {
            inChar.myAimX = inChar._x + 50;
         }
         inChar.myAimY = inChar._y - inChar.myDataRef.myShootHeight - 15;
      }
      if(inChar.lifeSpan > 30)
      {
         inChar.shotTimer = inChar.shotTimer + 1;
         if(inChar.inRange && ((inChar.myStatus == "dash" || inChar.myDataRef.amZombie || inChar.myDataRef.amAbom) && SwainMath.randomNumber(0,8) == 0 || SwainMath.randomNumber(0,60 - inChar.traitTriggerFinger * 5) == 0 || inChar.myDataRef.myWeapons[inChar.myWeapon].myROF <= 10 && SwainMath.randomNumber(-4,inChar.traitTriggerFinger) > 0 && inChar.rofTimer < inChar.myDataRef.myWeapons[inChar.myWeapon].myROF + 2))
         {
            inChar.shotTimer = 0;
            inChar.mouseClick = true;
            inChar.mouseHold = true;
         }
      }
      if(inChar.myDataRef.myWeapons[inChar.myWeapon].myAmmo == 0 && inChar.myDataRef.myWeapons[inChar.myWeapon].myClips > 0)
      {
         if(inChar.aimTimer == -1)
         {
            inChar.toggleReload = true;
         }
      }
      if(SwainMath.randomNumber(0,inChar.traitDistracted * 4) == 0)
      {
         if(inChar.myDataRef.myWeapons[inChar.myWeapon].myAmmo == 0 && inChar.myDataRef.myWeapons[inChar.myWeapon].myClips == 0 && MadWorld.activeFactions.length > 1)
         {
            if(!MadnessDataFile.havePerk("perkSidearm1",inChar.myDataRef) || inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myAmmo == 0 && inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myClips == 0)
            {
               inChar.dropGun();
            }
         }
         if(!inChar.myDataRef.noWieldGuns && !inChar.myDataRef.amSurprised && inChar.aimTimer == -1)
         {
            if(inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myAmmo > 0 || inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myClips > 0 || inChar.myDataRef.myWeapons[1 - inChar.myWeapon].melee || inChar.myDataRef.myWeapons[1 - inChar.myWeapon] == undefined || inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myAmmo > 0 || inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myClips > 0)
            {
               if(inChar.myDataRef.myWeapons[inChar.myWeapon].myAmmo == 0 && inChar.myDataRef.myWeapons[inChar.myWeapon].myClips == 0 || inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined && inChar.myDataRef.myWeapons[1 - inChar.myWeapon] != undefined && MadWorld.activeFactions.length > 1)
               {
                  inChar.toggleAction = true;
               }
               if(inChar.myDataRef.traitCombatSkill > 8 && MadnessAI.myTarget != undefined && inChar.myMission == "engage" && SwainMath.randomNumber(0,inChar.myDataRef.traitDistracted * 10) >= 0)
               {
                  if(MadnessAI.returnIsMelee(inChar,"hand") && MadnessAI.returnIsGun(inChar,"back") && (MadnessAI.myTarget._x < inChar._x - 150 * inChar.myDataRef.myScale || MadnessAI.myTarget._x > inChar._x + 150 * inChar.myDataRef.myScale) || MadnessAI.returnIsGun(inChar,"hand") && inChar.myDataRef.myWeapons[1 - inChar.myWeapon].melee && MadnessAI.myTarget._x > inChar._x - 150 * inChar.myDataRef.myScale && MadnessAI.myTarget._x < inChar._x + 150 * inChar.myDataRef.myScale)
                  {
                     inChar.toggleAction = true;
                  }
               }
            }
         }
         if(inChar.myMission == "engage" && inChar.aimTimer == -1)
         {
            if(inChar.myDataRef.freakOut)
            {
               if(inChar.freakOutTimer > 0 && inChar.myWeapon == 0 || inChar.freakOutTimer == 0 && inChar.myWeapon == 1)
               {
                  if(inChar.myDataRef.myWeapons[0] != undefined && inChar.myDataRef.myWeapons[1] != undefined)
                  {
                     inChar.toggleAction = true;
                  }
               }
            }
            else if(SwainMath.randomNumber(0,120) == 0 && inChar.myDataRef.myWeapons[1 - inChar.myWeapon] != undefined && (inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myAmmo > 0 || inChar.myDataRef.myWeapons[1 - inChar.myWeapon].melee))
            {
               inChar.toggleAction = true;
            }
         }
         if(inChar.myFaction != "neutral" && !inChar.myDataRef.noWieldGuns && !inChar.thrownHook && inChar.myDataRef.myScale == 1 && !inChar.targetLock && inChar.myDataRef.myLevel >= 5 && SwainMath.randomNumber(0,inChar.traitDistracted * 3 - inChar.myDataRef.myLevel) <= 0 && inChar.myDataRef.myWeapons[inChar.myWeapon] == undefined && (inChar.myDataRef.myWeapons[1 - inChar.myWeapon] == undefined || inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myAmmo == 0 && inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myClips == 0))
         {
            inChar.targetPickup = inChar.findClosestPickup();
            if(inChar.targetPickup != undefined && (inChar.targetPickup.myGun.myAmmo > 0 || inChar.targetPickup.myGun.myClips > 0))
            {
               inChar.attractToMC(inChar.targetPickup,"pickup");
            }
         }
         if(MadnessActivator.aiActivators.length > 0 && MadWorld.activeFactions.length == 1 && inChar.myRoster == MadnessRoster.playerRoster)
         {
            inChar.targetActivator = MadnessActivator.aiActivators[0];
            inChar.attractToMC(inChar.targetActivator,"activator");
         }
         if(inChar.myStatus == "restrained")
         {
            _loc6_ = 0;
            while(_loc6_ < 1 || _loc6_ < 3 && inChar.myDataRef.grabBreaker)
            {
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.toggleAction = SwainMath.randomNumber(0,1) == 0;
               }
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.togglePickup = SwainMath.randomNumber(0,1) == 0;
               }
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.toggleGuard = SwainMath.randomNumber(0,1) == 0;
               }
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.toggleSlowmo = SwainMath.randomNumber(0,1) == 0;
               }
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.moveUp = SwainMath.randomNumber(0,1) == 0;
               }
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.moveDown = SwainMath.randomNumber(0,1) == 0;
               }
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.moveLeft = SwainMath.randomNumber(0,1) == 0;
               }
               if(SwainMath.randomNumber(0,18 - inChar.myDataRef.traitCombatSkill) <= 0)
               {
                  inChar.moveRight = SwainMath.randomNumber(0,1) == 0;
               }
               _loc6_ = _loc6_ + 1;
            }
         }
      }
      if(inChar.myDataRef.myCharacter == "fatboy")
      {
         if(inChar.myDataRef.myWeapons[inChar.myWeapon].melee && inChar.myDataRef.myHat[0] == undefined && inChar.myDataRef.myWeapons[1 - inChar.myWeapon].myAmmo > 0)
         {
            if(inChar._y < MadnessAI.myTarget._y + 20 && inChar._y > MadnessAI.myTarget._y - 20 && (!inChar.isFacingRight && MadnessAI.myTarget._x < inChar._x || inChar.isFacingRight && MadnessAI.myTarget._x > inChar._x))
            {
               inChar.togglePickup = true;
            }
         }
      }
      if(inChar.myDataRef.myWeapons[inChar.myWeapon].myType == "hook")
      {
         if(inChar._y < MadnessAI.myTarget._y + 20 && inChar._y > MadnessAI.myTarget._y - 20 && (!inChar.isFacingRight && MadnessAI.myTarget._x < inChar._x || inChar.isFacingRight && MadnessAI.myTarget._x > inChar._x))
         {
            if(MadnessAI.myTarget._x > inChar._x + 130 && MadnessAI.myTarget._x < inChar._x + 500 || MadnessAI.myTarget._x < inChar._x - 130 && MadnessAI.myTarget._x > inChar._x - 500)
            {
               inChar.togglePickup = true;
            }
         }
      }
      if(!inChar.hittingObstacle)
      {
      }
      if((inChar.myMission == "engage" || MadWorld.activeFactions.length == 1 || inChar.myFaction == "neutral") && inChar.myDataRef.traitBravery == -1)
      {
         inChar.myMission = "surrender";
         inChar.deserterSurrender();
      }
      if(inChar.myDataRef.amZombie)
      {
         if(inChar.myMission != "engage")
         {
            inChar.myDataRef.traitAwareness += 0.005;
            var _loc2_ = undefined;
            _loc6_ = 0;
            while(_loc6_ < MadnessCharacter.allRosters.length)
            {
               if(MadnessCharacter.allRosters[_loc6_].teamFaction != inChar.myRoster.teamFaction)
               {
                  _loc5_ = 0;
                  while(_loc5_ < MadnessCharacter.allRosters[_loc6_].myActiveMembers.length)
                  {
                     _loc2_ = MadnessCharacter.allRosters[_loc6_].myActiveMembers[_loc5_];
                     if(_loc2_.rofTimer < 6 && !_loc2_.myDataRef.myWeapons[_loc2_.myWeapon].melee && _loc2_.myDataRef.myWeapons[_loc2_.myWeapon] != undefined && !_loc2_.myDataRef.myWeapons[_loc2_.myWeapon].upgradeSilencer)
                     {
                        inChar.myDataRef.traitAwareness += 0.4;
                        if(_loc2_.myDataRef.myWeapons[_loc2_.myWeapon].amHeavy)
                        {
                           inChar.myDataRef.traitAwareness += 0.5;
                        }
                     }
                     _loc5_ = _loc5_ + 1;
                  }
               }
               _loc6_ = _loc6_ + 1;
            }
         }
      }
      inChar.myAttackTarget = MadnessAI.myTarget;
      if(inChar.myDataRef.noDodge)
      {
         inChar.toggleGuard = false;
      }
   }


   
   static function getModdedSkill(inChar, inSkill)
   {
      var _loc1_ = inChar.myDataRef[inSkill];
      if(inChar.myRoster.teamLeader != inChar.myDataRef)
      {
         if(inChar.myRoster == MadnessRoster.playerRoster)
         {
            if(inChar.myRoster.teamLeader.statLEAD != undefined)
            {
               _loc1_ += Math.floor(inChar.myRoster.teamLeader.statLEAD / 5);
            }
         }
         else if(MadnessRoster.playerRoster.teamLeader.statLEAD)
         {
            _loc1_ -= Math.floor(MadnessRoster.playerRoster.teamLeader.statLEAD / 5);
         }
      }
      if(_loc1_ > 10)
      {
         _loc1_ = 10;
      }
      if(_loc1_ < 1)
      {
         _loc1_ = 1;
      }
      return _loc1_;
   }
   static function returnIsGun(inChar, inEquipped)
   {
      var _loc1_ = undefined;
      if(inEquipped == "hand")
      {
         _loc1_ = inChar.myWeapon;
      }
      else
      {
         _loc1_ = 1 - inChar.myWeapon;
      }
      return !inChar.myDataRef.myWeapons[_loc1_].melee && inChar.myDataRef.myWeapons[_loc1_] != undefined;
   }
   static function returnIsMelee(inChar, inEquipped)
   {
      var _loc1_ = undefined;
      if(inEquipped == "hand")
      {
         _loc1_ = inChar.myWeapon;
      }
      else
      {
         _loc1_ = 1 - inChar.myWeapon;
      }
      return inChar.myDataRef.myWeapons[_loc1_].melee || inChar.myDataRef.myWeapons[_loc1_] == undefined;
   }
}
