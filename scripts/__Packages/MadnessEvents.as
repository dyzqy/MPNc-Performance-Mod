class MadnessEvents
{
   function MadnessEvents()
   {
   }
   static function world_0_0_prison()
   {
      MadnessLevel.myRooms[2].myDoors[0].noSpawn = false;
      MadnessLevel.currentLevel.disableDoorSpawn(2,1);
      MadnessLevel.myRooms[3].myDoors[0].noSpawn = false;
      MadnessLevel.currentLevel.disableDoorSpawn(3,3);
      MadnessLevel.myRooms[4].myDoors[0].noSpawn = false;
      MadnessLevel.currentLevel.disableDoorSpawn(4,2);
      MadnessLevel.currentLevel.disableDoorSpawn(5,1);
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[2],"civ","enemy","ranged",3,false,2);
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[1],"agent","enemy","ranged",6,false,4);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[2],["agent","civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["agent","civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["agent","civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","agent"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","agent","agent","agent","agent"],"enemy","ranged",0);
      MadnessPopup.addPopup("help","Someone will have heard that. Time to bail!",null,400,120,MadnessLevel.myRooms[6].myDoors[0].mySprite,150,null,null,null,null);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[5],MadnessEvents.world_0_0_tutorial7);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[4],MadnessEvents.world_0_0_tutorial8);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[3],MadnessEvents.world_0_0_tutorial9);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[0],MadnessEvents.world_0_0_unlock2);
   }
   static function world_0_0_tutorial1()
   {
      _root.medal1Disable = false;
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("help","You\'ll be operating this mission as " + MadnessRoster.playerRoster.teamLeader.myName + ". This man is a badass killing machine, so you should have no problem rescuing Sanford and Deimos.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,210,MadnessEvents.world_0_0_tutorial1b,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","WASD Moves. Use doors by pressing SPACE [Guard] next to them.",null,500,120,MadnessLevel.myRooms[0].myDoors[0].mySprite,200,null,null);
   }
   static function world_0_0_tutorial1b()
   {
   }
   static function world_0_0_tutorial2()
   {
      MadnessPopup.addPopup("help","These idiots just got in your way. Click MOUSE 1 and aim with your mouse to show them why that was a bad idea.",null,400,120,MadnessLevel.myRooms[1].myCharacters[0].mySprite,200,null,null);
      MadnessPopup.addBuffer(3);
      MadnessPopup.addPopup("help","To swap weapons with your sidearm, press Q.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,220,null,null);
   }
   static function world_0_0_tutorial3()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("help","Activate this panel with your SPACE bar to get that door open.",null,400,120,MadnessLevel.myRooms[2].myActivators[0].mySprite.mySprite.myBox,2200,null,null);
   }
   static function world_0_0_tutorial3b()
   {
      MadnessPopup.closeAll();
   }
   static function world_0_0_tutorial4()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("help","Take cover behind objects such as this one by pressing SPACE while holding a ranged weapon.",null,400,120,MadnessLevel.myRooms[3].myObstacles[0].mySprite,150,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","You\'ll be protected from enemy fire so long as you\'re not shooting your own weapon.",null,400,120,undefined,120,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","Pressing SPACE again will leave cover.",null,400,120,undefined,150,null,null);
   }
   static function world_0_0_tutorial5()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("help","You may have noticed that you\'re a difficult target to hit. This is due to your TAC-BAR.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,160,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","Your TAC-BAR indicates your battle prowess and natural ability to avoid enemy fire. Keep it from hitting empty, and you\'ll never take a bullet.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,220,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","Some enemies have TAC-BARs, too. Being fired on from behind or at close range will decimate their (and your!) bar.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,200,null,null);
      MadnessPopup.addBuffer(50);
      MadnessPopup.addPopup("help","Ok, I\'m done talking about the TAC-BAR. Go that way.",null,400,120,MadnessLevel.myRooms[4].myDoors[2].mySprite,120,null,null);
      MadnessPopup.addBuffer(100);
      MadnessPopup.addPopup("help","No...really. I\'m done now. This is it.",null,400,120,undefined,120,null,null);
      MadnessPopup.addBuffer(100);
      MadnessPopup.addPopup("help","The real Hank would have finished this tutorial by now. You should know that.",null,400,120,undefined,120,MadnessEvents.world_0_0_unlock1,null);
   }
   static function world_0_0_unlock1()
   {
      MadnessMedals.unlockMedal("tutorialtext");
   }
   static function world_0_0_unlock2()
   {
      if(_root.medal1Disable == false)
      {
         MadnessMedals.unlockMedal("mercy");
      }
   }
   static function world_0_0_closeMedal1()
   {
      _root.medal1Disable = true;
   }
   static function world_0_0_tutorial6()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("help","Did you notice that SPACE dodges or blocks when holding a ranged or melee weapon?",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,150,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","Blocking will reduce TAC-BAR damage, while dodging will outright prevent it.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,150,null,null);
   }
   static function world_0_0_tutorial7()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","Pro-Tip: Double tap a direction to dash.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,150,null,null);
   }
   static function world_0_0_tutorial8()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","See that red bar up top? Yeah, that one.",null,400,120,_root.gameMenu.tutTarget,110,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","That\'s your Bullet-Time. Kills power it. When it\'s full, press SHIFT to activate it.",null,400,120,_root.gameMenu.tutTarget,190,null,null);
   }
   static function world_0_0_tutorial9()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","Press R to reload. Be careful! This dumps your current clip and all leftover ammo in it.",null,400,120,_root.gameMenu.tutTarget,170,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("help","To drop your weapon or pick up a new one from the floor, press E.",null,400,120,_root.gameMenu.tutTarget,190,null,null);
   }
   static function world_0_1_0()
   {
      if(MadnessRoster.playerRoster.teamLeader.myCharacter == "sanford")
      {
         MadnessPopup.addBuffer(15);
         MadnessPopup.addPopup("help","Sanford always equips a special hook weapon. Throw it like any weapon, but it\'ll come back...sometimes with a snared enemy in tow.",null,400,120,MadnessRoster.playerRoster.teamLeader.mySprite.mySprite.myBody,210,null,null);
      }
   }
   static function world_0_1_6()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["civ"],"enemy","ranged",1);
   }
   static function world_0_2_5()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["agent","civ"],"enemy","ranged",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["agent","civ"],"enemy","ranged",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["agent","civ"],"enemy","ranged",1);
   }
   static function world_0_2_9()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","civ"],"enemy","ranged",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["agent","civ"],"enemy","ranged",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","civ"],"enemy","ranged",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["civ","civ","civ"],"enemy","ranged",0);
   }
   static function world_0_1_3_A()
   {
      MadnessLevel.myRooms[3].myObstacles[0].noClip = true;
   }
   static function world_0_3_4()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["civ","civ","civ"],"enemy","ranged",0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["agent","civ","agent"],"enemy","ranged",2);
   }
   static function world_0_3_6()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["agent","civ","agent"],"enemy","ranged",2);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["civ","civ","civ","civ"],"enemy","melee",2);
   }
   static function world_0_3_10()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["civ","civ","civ","civ"],"enemy","melee",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","civ","agent"],"enemy","ranged",2);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["agent","civ","agent"],"enemy","ranged",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["civ","civ","agent","civ"],"enemy","ranged",2);
   }
   static function world_0_3_13()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[11],["agent","civ","agent"],"enemy","ranged",2);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[11],["civ","civ","civ","civ","civ","civ"],"enemy","ranged",1);
   }
   static function world_0_4_2_A()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","There must be some way to lower those spikes around here. Better start looking.",null,400,120,MadnessLevel.myRooms[2].myObstacles[0].mySprite,170,null,null);
   }
   static function world_0_4_11_A()
   {
      MadnessLevel.myRooms[2].myObstacles[0].noClip = true;
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[2],MadnessEvents.world_0_4_11_B);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","Wonder what that did? Better head back.",null,400,120,null,170,null,null);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[2],["agent","agent","civ"],"enemy","ranged",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[2],["agent","agent","agent","civ"],"enemy","melee",8);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[2],["agent","agent","agent","civ"],"enemy","ranged",3);
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[8],"agent","enemy","ranged",4,false,4);
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[9],"agent","enemy","ranged",3,false,3);
   }
   static function world_0_4_11_B()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","It seems activating the terminal has lowered those spikes.",null,400,120,MadnessLevel.myRooms[2].myObstacles[0].mySprite,170,null,null);
   }
   static function world_0_5_8_A()
   {
      MadnessPopup.addBuffer(90);
      MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_0_5_8_B,null);
   }
   static function world_0_5_8_B()
   {
      if(MadnessCharacter.doesUnitExist("fatboy"))
      {
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["civ","civ"],"enemy","ranged",3);
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[8].myRosters[0],MadnessEvents.world_0_5_8_A);
      }
   }
   static function world_0_5_14_A()
   {
      if(!MadnessLevel.levelVictory)
      {
         MadnessPopup.addBuffer(90);
         MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_0_5_14_B,null);
      }
   }
   static function world_0_5_14_B()
   {
      if(MadnessCharacter.doesUnitExist("fatboy"))
      {
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[14],["agent","agent"],"enemy","ranged",3);
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[14].myRosters[0],MadnessEvents.world_0_5_14_A);
      }
   }
   static function world_0_6_4_A()
   {
      MadnessPopup.addBuffer(120);
      MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_0_6_4_B,null);
   }
   static function world_0_6_4_B()
   {
      if(MadnessCharacter.doesUnitExist("fatboy"))
      {
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["agent","agent"],"enemy","ranged",5);
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[4].myRosters[MadnessLevel.myRooms[4].myRosters.length - 1],MadnessEvents.world_0_6_4_A);
      }
   }
   static function world_0_6_9_A()
   {
      if(!MadnessLevel.levelVictory)
      {
         MadnessPopup.addBuffer(120);
         MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_0_6_9_B,null);
      }
   }
   static function world_0_6_9_B()
   {
      if(MadnessCharacter.doesUnitExist("fatboy"))
      {
         MadnessLevel.currentLevel.myDifficulty = 3;
         if(SwainMath.randomNumber(0,1) == 0)
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent","agent2"],"enemy","ranged",7);
         }
         else
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent3"],"enemy","ranged",7);
         }
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[9].myRosters[0],MadnessEvents.world_0_6_9_A);
      }
   }
   static function world_0_7_4_A()
   {
      MadnessLevel.myRooms[3].myObstacles[0].noClip = true;
      MadnessLevel.myRooms[3].myObstacles[0].alreadyClosed = true;
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["agent2","agent2"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["agent","agent2"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["agent","agent","agent"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["agent2","agent2"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[3],["agent"],"enemy","ranged",4);
   }
   static function world_0_7_7_A()
   {
      MadnessLevel.myRooms[6].myObstacles[0].noClip = true;
      MadnessLevel.myRooms[6].myObstacles[0].alreadyClosed = true;
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[7],["agent","agent2","agent2"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[7],["agent","agent"],"enemy","ranged",8);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","agent","agent","agent2"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","agent","agent","agent"],"enemy","melee",15);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","agent2","agent2"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent","agent"],"enemy","ranged",8);
   }
   static function world_0_7_9_A()
   {
      if(!MadnessLevel.levelVictory)
      {
         MadnessPopup.addBuffer(120);
         MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_0_7_9_B,null);
      }
   }
   static function world_0_7_9_B()
   {
      if(MadnessCharacter.doesUnitExist("fatboy"))
      {
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent2"],"enemy","ranged",6);
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[9].myRosters[MadnessLevel.myRooms[9].myRosters.length - 1],MadnessEvents.world_0_7_9_A);
      }
   }
   static function world_0_7_10_A()
   {
      MadnessLevel.myRooms[9].myObstacles[0].noClip = true;
      MadnessLevel.myRooms[9].myObstacles[0].alreadyClosed = true;
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[10],["agent","agent","agent2","agent2"],"enemy","ranged",8);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[10],["agent","agent2","agent","agent"],"enemy","ranged",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[10],["agent","agent","agent2","agent2"],"enemy","ranged",8);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[10],["agent","agent2","agent"],"enemy","melee",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent2","agent2"],"enemy","ranged",8);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent2","agent","agent"],"enemy","melee",15);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent2","agent3"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["fatboy"],"enemy","fatboy",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent","agent"],"enemy","ranged",8);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[9].myRosters[5],MadnessEvents.world_0_7_9_A);
   }
   static function world_0_7_12_A()
   {
      MadnessPopup.addBuffer(120);
      MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_0_7_12_B,null);
   }
   static function world_0_7_12_B()
   {
      if(MadnessCharacter.doesUnitExist("fatboy"))
      {
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["agent","agent2","agent2"],"enemy","ranged",6);
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[12].myRosters[MadnessLevel.myRooms[12].myRosters.length - 1],MadnessEvents.world_0_7_12_A);
      }
   }
   static function world_0_7_13_A()
   {
      MadnessLevel.myRooms[12].myObstacles[0].noClip = true;
      MadnessLevel.myRooms[12].myObstacles[0].alreadyClosed = true;
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["agent","agent","agent3"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["agent"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["agent2","agent","agent3"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["agent3","agent2","agent2"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["agent","agent2","agent2"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["agent","agent","agent3"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["agent2","agent2"],"enemy","ranged",10);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["agent3","agent3","agent3"],"enemy","ranged",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["fatboy"],"enemy","fatboy",10);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["agent","agent"],"enemy","ranged",8);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[12].myRosters[5],MadnessEvents.world_0_7_12_A);
   }
   static function world_0_7_15_A()
   {
      if(!MadnessLevel.levelVictory)
      {
         MadnessPopup.addBuffer(120);
         MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_0_7_15_B,null);
      }
   }
   static function world_0_7_15_B()
   {
      if(MadnessCharacter.doesUnitExist("mag"))
      {
         MadnessLevel.currentLevel.myDifficulty = 3;
         if(SwainMath.randomNumber(0,2) == 0)
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[15],["agent","agent","agent2","agent"],"enemy","ranged",8);
         }
         else if(SwainMath.randomNumber(0,1) == 0)
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[15],["agent2","agent2","agent"],"enemy","ranged",8);
         }
         else
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[15],["agent2","agent","agent"],"enemy","ranged",8);
         }
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[15].myRosters[0],MadnessEvents.world_0_7_15_A);
      }
   }
   static function world_1_0_15()
   {
      MadnessPopup.addBuffer(20);
      MadnessPopup.addPopup("talk","SOMETHING WRONG, DR.CHRISTOFF?",null,600,120,MadnessLevel.myRooms[15].myCharacters[0],110,null,null);
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("talk","NOT ANYMORE",null,250,120,MadnessRoster.playerRoster.teamLeader,110,MadnessEvents.world_1_0_15b,null);
   }
   static function world_1_0_15b()
   {
      if(MadnessLevel.myRooms[14].myEvents.length > 0)
      {
         MadnessLevel.currentLevel.unlockDoor(15,0);
      }
   }
   static function world_1_0_15c()
   {
      MadnessLevel.myRooms[14].myEvents = new Array();
      MadnessLevel.currentLevel.lockDoor(15,0);
      MadnessPopup.addBuffer(30,MadnessEvents.world_1_0_15d);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[14],["zombie","zombie"],"zombie","unarmed",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["zombie"],"zombie","unarmed",1);
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[13],"zombie","zombie","unarmed",1,false,1);
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[14],"zombie","zombie","unarmed",1,false,1);
      MadnessLevel.myRooms[14].mySpawners[0].myTrigger = "open";
      MadnessLevel.myRooms[14].mySpawners[0].myUnit = undefined;
      MadnessLevel.myRooms[14].mySpawners[1].myTrigger = "open";
      MadnessLevel.myRooms[14].mySpawners[1].myUnit = undefined;
      MadnessLevel.myRooms[13].mySpawners[0].myTrigger = "open";
      MadnessLevel.myRooms[13].mySpawners[0].myUnit = undefined;
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[13],MadnessEvents.world_1_0_13);
   }
   static function world_1_0_15d()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[15],["zombie_scientist"],"zombie","scientist",1);
      MadnessLevel.currentLevel.unlockDoor(15,0);
      MadnessPopup.addBuffer(10,MadnessEvents.world_1_0_15e);
      MadnessPopup.addPopup("talk","OH, HEY JIM...",null,600,120,MadnessLevel.myRooms[15].myCharacters[0],60,null,null);
      MadnessPopup.addBuffer(5);
      MadnessPopup.addPopup("talk","JIM...?!",null,600,120,MadnessLevel.myRooms[15].myCharacters[0],60,MadnessEvents.world_1_0_15f,null);
      MadnessLevel.currentLevel.unlockDoor(13,2);
   }
   static function world_1_0_15e()
   {
      MadnessLevel.currentLevel.lockDoor(15,0);
   }
   static function world_1_0_15f()
   {
      SwainAudioPlayer.playTrack("zombie2");
      MadnessLevel.currentLevel.applyTrack("zombie2",MadnessLevel.currentLevel);
      MadnessLevel.currentLevel.unlockDoor(15,0);
   }
   static function world_1_0_14()
   {
      MadnessPopup.addBuffer(120);
      MadnessPopup.addPopup("talk","DID YOU CATCH THE GAME LAST NIGHT?",null,250,120,MadnessLevel.myRooms[14].myCharacters[1],110,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","SURE DID",null,250,120,MadnessLevel.myRooms[14].myCharacters[0],110,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","WHO DO YOU THINK WILL TAKE IT THIS YEAR?",null,250,120,MadnessLevel.myRooms[14].myCharacters[1],110,null,null);
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("talk",". . .",null,250,120,MadnessLevel.myRooms[14].myCharacters[0],110,null,null);
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("talk","UH...NEVADA?",null,250,120,MadnessLevel.myRooms[14].myCharacters[0],110,null,null);
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("talk",". . .",null,250,120,MadnessLevel.myRooms[14].myCharacters[1],110,null,null);
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("talk","YEAH...",null,250,120,MadnessLevel.myRooms[14].myCharacters[1],110,MadnessEvents.world_1_0_14b,null);
   }
   static function world_1_0_14b()
   {
   }
   static function world_1_0_13()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("help","Uh oh, Zombehs! If they grab you, it\'s time to panic! Throw them off by mashing your movement keys before your Tac-Bar runs out - zombie bites will deplete your health instantly!",null,400,120,MadnessLevel.myRooms[13].myCharacters[MadnessLevel.myRooms[13].myCharacters.length - 1],300,null,null);
   }
   static function world_1_0_11()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","CONTAINMENT HAS BEEN BREACHED!",null,600,120,MadnessLevel.myRooms[11].myCharacters[0],120,MadnessEvents.world_1_0_11b,null);
   }
   static function world_1_0_11b()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[11],["scientist","scientist"],"player","scientist",1);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[11],["zombie_scientist","zombie_scientist"],"zombie","scientist",1);
   }
   static function world_1_0_10()
   {
      MadnessLevel.currentLevel.unlockDoor(10,0);
      MadnessLevel.myRooms[10].mySpawners[0].amActive = MadnessLevel.myRooms[10].mySpawners[0].mySprite.amActive = true;
      MadnessLevel.myRooms[10].mySpawners[1].amActive = MadnessLevel.myRooms[10].mySpawners[1].mySprite.amActive = true;
      MadnessLevel.myRooms[10].mySpawners[0].myTimer = MadnessLevel.myRooms[10].mySpawners[0].mySprite.myTimer = MadnessLevel.myRooms[10].mySpawners[0].mySprite.thisFrame = 128;
      MadnessLevel.myRooms[10].mySpawners[1].myTimer = MadnessLevel.myRooms[10].mySpawners[1].mySprite.myTimer = MadnessLevel.myRooms[10].mySpawners[1].mySprite.thisFrame = 128;
      MadnessLevel.myRooms[10].mySpawners[0].myTrigger = MadnessLevel.myRooms[10].mySpawners[0].mySprite.myTrigger = "open";
      MadnessLevel.myRooms[10].mySpawners[1].myTrigger = MadnessLevel.myRooms[10].mySpawners[1].mySprite.myTrigger = "open";
      MadnessSpawner.allSpawners.push(MadnessLevel.myRooms[10].mySpawners[0].mySprite);
      MadnessSpawner.allSpawners.push(MadnessLevel.myRooms[10].mySpawners[1].mySprite);
   }
   static function world_1_0_8()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","SORRY, DOC. YOU\'RE A LIABILITY.",null,400,130,MadnessLevel.myRooms[8].myCharacters[0],120,null,null);
      var _loc1_ = 0;
      while(_loc1_ < MadnessLevel.myRooms[11].myCharacters.length)
      {
         if(MadnessLevel.myRooms[11].myCharacters[_loc1_].myCharacter == "agent_classic")
         {
            MadnessLevel.myRooms[11].myCharacters[_loc1_].myFaction = "enemy";
            MadnessLevel.myRooms[11].myCharacters[_loc1_].myRoster = undefined;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   static function world_1_0_1()
   {
      MadnessPopup.addBuffer(15,MadnessEvents.world_1_0_1b);
      MadnessPopup.addPopup("talk","EXCUSE ME, GENTLEMEN",null,400,150,MadnessRoster.playerRoster.teamLeader,120,null,null);
   }
   static function world_1_0_1b()
   {
      var _loc1_ = 0;
      while(_loc1_ < MadnessLevel.myRooms[1].myCharacters.length)
      {
         MadnessLevel.myRooms[11].myCharacters[_loc1_].myMission = "engage";
         _loc1_ = _loc1_ + 1;
      }
   }
   static function world_1_0_1c()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("talk","THANK YOU FOR YOUR COOPERATION",null,400,150,MadnessRoster.playerRoster.teamLeader,120,null,null);
   }
   static function world_1_1_0()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","I CAN TRUST HOFNARR...",null,400,140,MadnessRoster.playerRoster.teamLeader,110,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","...JUST HOPE IT\'S MUTUAL",null,400,140,MadnessRoster.playerRoster.teamLeader,110,null,null);
   }
   static function world_1_1_1()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","HOLD IT, TRAITOR",null,500,160,MadnessLevel.myRooms[1].myCharacters[1],90,null,null);
   }
   static function world_1_1_6()
   {
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("talk","I\'LL HANDLE THIS",null,600,160,MadnessRoster.playerRoster.myActiveMembers[1],90,null,null);
   }
   static function world_1_1_6b()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","You do not have clearance to use this terminal.",null,600,160,MadnessLevel.myRooms[6].myActivators[0].mySprite,160,null,null);
   }
   static function world_1_1_8()
   {
      MadnessLevel.currentLevel.lockDoor(8,0);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","YOU\'VE MADE QUITE A MESS, CHRISTOFF",null,600,160,MadnessLevel.myRooms[8].myCharacters[0],100,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","THEY\'VE GONE TOO FAR",null,400,160,MadnessRoster.playerRoster.teamLeader,70,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","IF WE DON\'T STOP THIS NOW...",null,400,160,MadnessRoster.playerRoster.teamLeader,30,MadnessEvents.world_1_1_8b,null);
      MadnessPopup.addPopup("talk","IF WE DON\'T STOP THIS NOW...",null,400,160,MadnessRoster.playerRoster.teamLeader,60,null,null);
      MadnessPopup.addBuffer(60);
      MadnessPopup.addPopup("talk","I SEE WE HAVE NO OTHER CHOICE",null,600,160,MadnessLevel.myRooms[8].myCharacters[0],100,null,null);
   }
   static function world_1_1_8b()
   {
      MadnessLevel.myRooms[8].myCharacters[0].myRoster.makeActive(MadnessLevel.myRooms[8].myCharacters[0]);
      MadnessLevel.currentLevel.unlockDoor(8,0);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic"],"enemy","melee",10);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",10);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",10);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[6],MadnessEvents.world_1_1_6);
   }
   static function world_1_1_15()
   {
      MadnessPopup.addBuffer(60);
      MadnessPopup.addPopup("help","Remember, the easiest way to wear down an enemy\'s Tac-Bar is with melee, unarmed, or rear attacks.",null,400,120,null,170,null,null,null,null);
   }
   static function world_1_1_16()
   {
      MadnessPopup.addBuffer(50);
      MadnessPopup.addPopup("talk","YA KNOW PHOBOS WILL FINISH US FOR THIS...",null,600,160,MadnessRoster.playerRoster.myActiveMembers[1],120,null,null);
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("talk","PHOBOS BETTER WATCH HIS BACK",null,500,160,MadnessRoster.playerRoster.teamLeader,90,null,null);
   }
   static function world_1_2_0()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","EVERYTHING DEPENDS ON YOU NOW",null,500,160,MadnessRoster.playerRoster.myMembers[1],110,null,null);
   }
   static function world_1_2_0b()
   {
      MadnessLevel.currentLevel.unlockDoor(0,0);
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("talk","GOOD LUCK, OLD FRIEND",null,500,160,MadnessRoster.playerRoster.myMembers[1],110,null,null);
      MadnessLevel.myRooms[0].myCharacters[0].myRoster.removeCharacter(MadnessLevel.myRooms[0].myCharacters[0]);
      MadnessLevel.myRooms[0].myCharacters.splice(0,1);
   }
   static function world_1_2_1()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("talk","IT\'S A LONG WAY UP...",null,400,160,MadnessRoster.playerRoster.teamLeader,66,null,null);
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("talk","*SIGH*",null,400,160,MadnessRoster.playerRoster.teamLeader,50,null,null);
   }
   static function world_1_2_2()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("talk",". . .",null,400,160,MadnessRoster.playerRoster.teamLeader,60,null,null);
   }
   static function world_1_2_8()
   {
      MadnessPopup.addBuffer(15);
      MadnessPopup.addPopup("talk","INTRUDER!",null,600,160,MadnessLevel.myRooms[8].myCharacters[0],60,null,null);
   }
   static function world_1_2_9()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","THEY\'RE GETTING LOOSE!",null,550,160,MadnessLevel.myRooms[8].myCharacters[0],60,null,null);
   }
   static function world_1_2_19()
   {
      if(MadnessCharacter.doesUnitExist("mag2"))
      {
         MadnessPopup.addBuffer(120);
         MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_1_2_19b,null);
      }
   }
   static function world_1_2_19b()
   {
      if(MadnessCharacter.doesUnitExist("mag2"))
      {
         MadnessLevel.currentLevel.myDifficulty = 3;
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[19],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",12);
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[19].myRosters[MadnessLevel.myRooms[19].myRosters.length - 1],MadnessEvents.world_1_2_19);
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[19],["abom","abom"],"abom","unarmed",3);
      }
   }
   static function world_1_2_spikes1()
   {
      MadnessLevel.myRooms[3].myObstacles[0].noClip = true;
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["abom","abom"],"abom","unarmed",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["abom"],"abom","unarmed",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["abom","abom"],"abom","unarmed",3);
   }
   static function world_1_2_spikes2()
   {
      MadnessLevel.myRooms[3].myObstacles[1].noClip = true;
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["abom","abom"],"abom","unarmed",3);
   }
   static function world_1_2_spikes3()
   {
      MadnessLevel.myRooms[11].myObstacles[0].noClip = true;
      var _loc1_ = 0;
      while(_loc1_ < MadnessLevel.myRooms[12].mySpawners.length)
      {
         MadnessLevel.myRooms[12].mySpawners[_loc1_].amActive = true;
         _loc1_ = _loc1_ + 1;
      }
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[10],["abom","abom"],"abom","unarmed",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[10],["abom","abom"],"abom","unarmed",3);
   }
   static function world_1_2_spikes4()
   {
      MadnessLevel.myRooms[16].myObstacles[0].noClip = true;
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[17],["abom","abom","abom","abom"],"abom","unarmed",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[16],["abom","abom"],"abom","unarmed",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[16],["abom","abom","abom"],"abom","unarmed",3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[16],["abom","abom","abom"],"abom","unarmed",3);
   }
   static function world_1_3_0()
   {
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("talk","WHAT THE HELL IS THIS?!",null,400,160,MadnessRoster.playerRoster.teamLeader,70,null,null);
   }
   static function world_1_3_1()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","IT\'S CHRISTOFF!",null,600,160,MadnessLevel.myRooms[1].myCharacters[0],60,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","RELEASE THE PATIENTS!",null,600,160,MadnessLevel.myRooms[1].myCharacters[1],90,MadnessEvents.world_1_3_1b,null);
   }
   static function world_1_3_1b()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["patient","patient","patient"],"enemy","unarmed",3);
   }
   static function world_1_3_spikes1()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[7],["patient","agent_classic","patient"],"enemy","ranged",6);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["experiment"],"enemy","unarmed",14);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent_classic","agent_classic","agent_classic"],"enemy","melee",14);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["patient","agent_classic","patient"],"enemy","ranged",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[6],["agent_classic","experiment","agent_classic"],"enemy","unarmed",7);
      MadnessLevel.myRooms[6].myObstacles[0].noClip = true;
   }
   static function world_1_3_10()
   {
      MadnessPopup.addBuffer(20);
      MadnessPopup.addPopup("talk","SO, IT APPEARS THE RUMORS ARE TRUE",null,400,160,MadnessLevel.myRooms[10].myCharacters[0],60,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","YOUR TENURE IS OVER, PHOBOS",null,600,160,MadnessRoster.playerRoster.teamLeader,90,MadnessEvents.world_1_3_1b,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","WE\'LL SEE, WON\'T WE?",null,400,160,MadnessLevel.myRooms[10].myCharacters[0],60,null,null);
   }
   static function world_1_3_10FLEE()
   {
      MadnessPopup.addPopup("talk","SEE YOU SOON, DOCTOR",null,400,160,MadnessLevel.myRooms[10].myCharacters[0],90,null,null);
   }
   static function world_1_3_10b()
   {
      if(MadnessCharacter.doesUnitExist("phobos"))
      {
         MadnessPopup.addBuffer(20);
         MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_1_3_10c,null);
      }
   }
   static function world_1_3_10c()
   {
      if(MadnessCharacter.doesUnitExist("phobos"))
      {
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[10],["patient","patient","agent_classic","agent_classic"],"enemy","ranged",9);
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[10].myRosters[0],MadnessEvents.world_1_3_10b);
      }
   }
   static function world_1_4_1()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","Your Bullet-Time is now a Magic Bar, for casting spells.",null,400,120,_root.gameMenu.tutTarget,120,null,null,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","Tap SHIFT to unleash a slam attack, or hold it to launch a Nexus bolt.",null,400,120,MadnessRoster.playerRoster.teamLeader,150,null,null,null,null);
      MadnessPopup.addBuffer(30);
      MadnessPopup.addPopup("help","I SAID PRESS SHIFT. I know you weren\'t listening.",null,400,120,MadnessRoster.playerRoster.teamLeader,120,null,null,null,null);
   }
   static function world_1_4_2()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("help","Before you lies the source of all Nexus power. Reclaim it and redeem yourself!",null,400,120,MadnessLevel.myRooms[2].myActivators[0].mySprite,160,null,null,null,null);
   }
   static function world_1_4_spikes1()
   {
      MadnessPopup.closeAll();
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[1],"agent_classic","enemy","ranged",8,false,2);
      var _loc1_ = 0;
      while(_loc1_ < MadnessLevel.myRooms[1].mySpawners.length)
      {
         MadnessLevel.myRooms[1].mySpawners[_loc1_].amActive = true;
         _loc1_ = _loc1_ + 1;
      }
      MadnessLevel.myRooms[1].myObstacles[0].noClip = true;
      MadnessPopup.addBuffer(20);
      MadnessPopup.addPopup("help","You feel Nexus power coursing through you. Your abilities have all significantly improved!",null,400,120,MadnessRoster.playerRoster.teamLeader,160,null,null,null,null);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[1],MadnessEvents.world_1_4_1);
   }
   static function world_1_4_spikes2()
   {
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[5],"patient","enemy","ranged",8,false,2);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["zombie","zombie_agent_classic"],"zombie","zombie",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[5],["patient","patient"],"abom","unarmed",5);
      MadnessLevel.myRooms[5].myObstacles[0].noClip = true;
   }
   static function world_1_4_spikes3()
   {
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[9],"zombie","zombie","zombie",8,false,2);
      MadnessLevel.currentLevel.createNPC(MadnessLevel.myRooms[9],"patient","enemy","ranged",8,false,2);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["zombie","zombie_agent_classic"],"zombie","zombie",12);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["zombie","zombie_agent_classic"],"zombie","zombie",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["abom","abom"],"abom","unarmed",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["abom","abom"],"abom","unarmed",5);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent_classic","agent_classic","riot"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["agent_classic","agent_classic","patient"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[9],["experiment"],"enemy","unarmed",7);
      MadnessLevel.myRooms[9].myObstacles[0].noClip = true;
   }
   static function world_1_4_spikes4()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["patient","patient"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["patient","patient","patient"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["agent_classic","agent_classic","riot"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",12);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["agent_classic","agent_classic","riot"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["experiment","patient"],"enemy","unarmed",7);
      MadnessLevel.myRooms[13].myObstacles[0].noClip = true;
   }
   static function world_1_5_0()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","IT\'S JUDGMENT DAY FOR PROJECT NEXUS",null,600,150,MadnessRoster.playerRoster.teamLeader,120,null,null);
   }
   static function world_1_5_1()
   {
      MadnessPopup.addPopup("talk","HOLD THEM OFF!",null,600,150,MadnessLevel.myRooms[1].myCharacters[0],90,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","THE NEXUS HAS NEARLY REGAINED CONTROL",null,600,150,MadnessLevel.myRooms[1].myCharacters[0],120,null,null);
   }
   static function world_1_5_2()
   {
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","NEXUS CONTROL IS ENTACT!",null,600,150,MadnessLevel.myRooms[2].myCharacters[0],120,null,null);
   }
   static function world_1_5_4()
   {
      MadnessLevel.currentLevel.unlockDoor(2,3);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["patient","zombie_agent_classic"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[4],["zombie_agent_classic","patient","zombie_agent_classic"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[2],["agent_classic","zombie_agent_classic","zombie_agent_classic"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[2],["abom","abom","abom"],"enemy","unarmed",7);
   }
   static function world_1_5_spikes1()
   {
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["zombie_scientist","zombie","zombie"],"enemy","zombie",12);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["zombie_agent_classic","zombie","zombie"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["zombie_agent_classic","zombie_scientist","zombie_scientist"],"enemy","zombie",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["zombie_agent_classic","zombie_scientist","zombie_scientist"],"enemy","zombie",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["zombie_riot","zombie","zombie_riot"],"enemy","zombie",12);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[13],["zombie_scientist","zombie","zombie_riot"],"enemy","zombie",12);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["patient","zombie_agent_classic"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["zombie_agent_classic","patient","zombie_agent_classic"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["zombie_agent_classic","agent_classic","riot"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["agent_classic","zombie","agent_classic"],"enemy","ranged",12);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["zombie_agent_classic","agent_classic","riot"],"enemy","ranged",7);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[12],["experiment","patient"],"enemy","unarmed",7);
      MadnessLevel.myRooms[12].myObstacles[0].noClip = true;
   }
   static function world_1_5_18()
   {
      MadWorld.freezeCharacters(true);
      MadnessLevel.myRooms[18].myCharacters[0].mySprite.isFacingRight = MadnessLevel.myRooms[18].myCharacters[1].mySprite.isFacingRight = MadnessLevel.myRooms[18].myCharacters[2].mySprite.isFacingRight = true;
      MadnessLevel.myRooms[18].myCharacters[0].mySprite.myAimX = MadnessLevel.myRooms[18].myCharacters[0].mySprite._x + 20;
      MadnessLevel.myRooms[18].myCharacters[1].mySprite.myAimX = MadnessLevel.myRooms[18].myCharacters[1].mySprite._x + 20;
      MadnessLevel.myRooms[18].myCharacters[2].mySprite.myAimX = MadnessLevel.myRooms[18].myCharacters[2].mySprite._x + 20;
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","DO YOU SEE NOW, CHRISTOFF?",null,300,170,MadnessLevel.myRooms[18].myCharacters[0],100,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","DO YOU UNDERSTAND?!",null,300,170,MadnessLevel.myRooms[18].myCharacters[0],100,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","SO LONG AS I LIVE, THE NEXUS CONTROLS ALL!",null,300,170,MadnessLevel.myRooms[18].myCharacters[0],110,null,null);
      MadnessPopup.addBuffer(10);
      MadnessPopup.addPopup("talk","OH, I\'M WORKING ON THAT",null,600,170,MadnessRoster.playerRoster.teamLeader,30,MadnessEvents.world_1_5_18b,null);
      MadnessPopup.addPopup("talk","OH, I\'M WORKING ON THAT",null,600,170,MadnessRoster.playerRoster.teamLeader,130,null,null);
   }
   static function world_1_5_18b()
   {
      MadnessLevel.myRooms[18].myCharacters[0].standStill = MadnessLevel.myRooms[18].myCharacters[1].standStill = MadnessLevel.myRooms[18].myCharacters[2].standStill = false;
      MadWorld.freezeCharacters(false);
      MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[18],["abom","riot","zombie_riot","patient"],"enemy","none",12);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[18].myRosters[0],MadnessEvents.world_1_5_18c);
   }
   static function world_1_5_18c()
   {
      if(MadnessCharacter.doesUnitExist("phobos"))
      {
         MadnessPopup.addBuffer(20);
         MadnessPopup.addPopup("buffer","",null,400,120,null,30,MadnessEvents.world_1_5_18d,null);
      }
   }
   static function world_1_5_18d()
   {
      if(MadnessCharacter.doesUnitExist("phobos"))
      {
         if(SwainMath.randomNumber(0,3) == 0)
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[18],["patient","agent_classic","zombie_agent_classic","agent_classic"],"enemy","ranged",10);
         }
         else if(SwainMath.randomNumber(0,2) == 0)
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[18],["abom","agent_classic","zombie_agent_classic","agent_classic"],"enemy","ranged",10);
         }
         else if(SwainMath.randomNumber(0,1) == 0)
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[18],["abom","patient","agent_classic","agent_classic"],"enemy","ranged",10);
         }
         else
         {
            MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[18],["zombie_riot","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",10);
         }
         MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[18].myRosters[0],MadnessEvents.world_1_5_18c);
      }
   }
   static function world_1_5_18_END()
   {
      MadnessPopup.addPopup("talk","GOODNIGHT, PHOBOS",null,250,120,MadnessRoster.playerRoster.teamLeader,110,null,null);
   }
   static function arena_1_tutorial()
   {
      _root.newArena = false;
      MadnessPopup.addBuffer(10,null);
      MadnessPopup.addPopup("help","Welcome to Project Nexus, Test Subject 1v02P_6, aka \"" + MadnessRoster.playerRoster.teamLeader.myName + "\".",null,440,100,_root.newWorld.myBG.window1.madnessGuy,140,null,null);
      MadnessPopup.addBuffer(10,null);
      MadnessPopup.addPopup("help","Today you\'ll be helping us to move combat science forward by engaging in a controlled battle experiment.",null,440,100,_root.newWorld.myBG.window1.madnessGuy,170,null,null);
      MadnessPopup.addBuffer(10,null);
      MadnessPopup.addPopup("help","If you should perish during the experiment, you will retain your progress, thanks to advances in regenerative cloning. You will, however, return to the beginning of the experiment.",null,440,100,_root.newWorld.myBG.window1.madnessGuy,250,null,null);
      MadnessPopup.addBuffer(10,null);
      MadnessPopup.addPopup("help","Press the button on the wall to let us know when you\'re ready to begin. You may also return to the Armory when the experiment is not in progress. Good luck, test subject.",null,440,100,MadnessLevel.myRooms[0].myActivators[0].mySprite.mySprite.myBox,230,null,null);
   }
   static function arena_1_START()
   {
      if(MadnessRoster.playerRoster.teamLeader.myWeapons[MadnessRoster.playerRoster.teamLeader.mySprite.myWeapon].melee)
      {
         MadnessRoster.playerRoster.teamLeader.myStartup = "startup1";
      }
      else if(MadnessRoster.playerRoster.teamLeader.myWeapons[MadnessRoster.playerRoster.teamLeader.mySprite.myWeapon] != undefined)
      {
         MadnessRoster.playerRoster.teamLeader.myStartup = "startup3";
      }
      else
      {
         MadnessRoster.playerRoster.teamLeader.myStartup = "startup2b";
      }
      MadnessLevel.currentLevel.lockDoor(0,0);
      MadnessPopup.closeAll();
      MadnessPopup.addBuffer(10,null);
      MadnessPopup.addPopup("lines","WAVE " + String(MadnessLevel.currentLevel.totalWaves),null,440,170,undefined,90,MadnessEvents.arena_1_waves,null);
   }
   static function arena_1_waves()
   {
      var _loc3_ = 8;
      var _loc2_ = Math.ceil(MadnessLevel.currentLevel.totalWaves / 3);
      var _loc1_ = 1;
      while(_loc1_ <= _loc3_)
      {
         MadnessLevel.currentLevel.createRoster(MadnessLevel.myRooms[0],CharacterGenerator.returnWaveList(MadnessLevel.currentLevel.totalWaves,_loc1_),"enemy",ItemGenerator.returnWaveLoadout(MadnessLevel.currentLevel.totalWaves,_loc1_),_loc2_ - Math.floor(_loc1_ / 5));
         MadnessLevel.myRooms[0].myRosters[MadnessLevel.myRooms[0].myRosters.length - 1].arenanum = _loc1_;
         _loc1_ = _loc1_ + 1;
      }
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[0].myRosters[MadnessLevel.myRooms[0].myRosters.length - 1],MadnessEvents.arena_1_clear);
   }
   static function arena_1_clear()
   {
      MadnessPopup.addPopup("lines","WAVE COMPLETE",null,440,170,undefined,90,null,null);
      MadnessPopup.addBuffer(70,MadnessEvents.arena_1_pause);
      MadnessPopup.addPopup("arena","",null,440,100,undefined,50,MadnessEvents.arena_1_reset,null);
   }
   static function arena_1_dead()
   {
      MadnessLevel.currentLevel.totalWaves = 1;
      MadnessSaveData.saveGame();
      MadnessPopup.addBuffer(20,MadnessEvents.arena_1_pause);
      MadnessPopup.addPopup("arena","",null,440,100,undefined,50,MadnessEvents.arena_1_resetB,null);
   }
   static function arena_1_pause()
   {
      MadWorld.thisWorld.pauseGame();
   }
   static function arena_1_reset()
   {
      MadnessLevel.currentLevel.unlockDoor(0,0);
      MadnessLevel.currentLevel.addEvent(MadnessLevel.myRooms[0].myActivators[0],MadnessEvents.arena_1_START);
      if(MadnessRoster.playerRoster.teamLeader.myWaves < MadnessLevel.currentLevel.totalWaves)
      {
         MadnessRoster.playerRoster.teamLeader.myWaves = MadnessLevel.currentLevel.totalWaves;
      }
      if(_root.arenaWaves < MadnessLevel.currentLevel.totalWaves)
      {
         _root.arenaWaves = MadnessLevel.currentLevel.totalWaves;
      }
      MadnessRoster.playerRoster.teamLeader.applyXP(_root.earnedXP);
      _root.earnedXP = 0;
      MadnessRoster.playerRoster.myCash += _root.earnedCash;
      _root.earnedCash = 0;
      MadnessRoster.playerRoster.myCash = Math.floor(MadnessRoster.playerRoster.myCash);
      MadnessLevel.currentLevel.totalWaves = MadnessLevel.currentLevel.totalWaves + 1;
      CharacterGenerator.storePopulator();
      ItemGenerator.storePopulator();
      if(!MadnessTransition.transitionLock)
      {
         _root.createTransition("fade","arena_menu",null);
      }
      MadnessLevel.levelVictory = false;
      MadnessLevel.levelFailed = false;
   }
   static function arena_1_resetB()
   {
      MadnessRoster.playerRoster.teamLeader.applyXP(_root.earnedXP);
      _root.earnedXP = 0;
      MadnessRoster.playerRoster.myCash += _root.earnedCash;
      _root.earnedCash = 0;
      MadnessRoster.playerRoster.myCash = Math.floor(MadnessRoster.playerRoster.myCash);
      CharacterGenerator.storePopulator();
      ItemGenerator.storePopulator();
      if(!MadnessTransition.transitionLock)
      {
         _root.createTransition("fade","arena_menu",null);
      }
      MadnessLevel.levelVictory = false;
      MadnessLevel.levelFailed = false;
   }
   static function arena_1_store()
   {
      if(!MadnessTransition.transitionLock)
      {
         _root.createTransition("fade","arena_menu",null);
      }
   }
   static function bossEvents(inChar, inEvent)
   {
      if(inChar.myDataRef.myBoss == "mag1")
      {
         if(inEvent == "start")
         {
            inChar.isFacingRight = false;
            inChar._parent.attachMovie("start_point","bossStart",inChar._parent.getNextHighestDepth());
            inChar._parent.bossStart._x = inChar._parent.WPbossfall._x;
            inChar._parent.bossStart._y = inChar._parent.WPbossfall._y;
            inChar._parent.bossStart.startFacing = inChar.isFacingRight;
            inChar._parent.bossStart._visible = false;
         }
         if(inEvent == "tick")
         {
            if(inChar.myDataRef.myBossPhase == 0)
            {
               if(inChar.myStatus == "idle" || inChar.myStatus == "run" || inChar.myStatus == "backtrack")
               {
                  if(inChar._x < MadnessRoster.playerRoster.teamLeader.mySprite._x)
                  {
                     inChar.isFacingRight = true;
                  }
                  else
                  {
                     inChar.isFacingRight = false;
                  }
               }
            }
         }
         if(inEvent == "kill_boss")
         {
            if(inChar.myDataRef.myBossPhase == 0)
            {
               inChar.myDataRef.myBossPhase = 1;
               inChar.myStatus = "dead";
               inChar.mySubStatus = "_stagger_mag1";
               inChar.isFacingRight = inChar._parent.bossStart.startFacing;
               inChar.mySprite.gotoAndStop(inChar.myStatus + inChar.mySubStatus);
               inChar.dropGun();
               inChar.myDataRef.myWeapons[0].myOwner = undefined;
               inChar.myDataRef.myWeapons[0] = undefined;
               inChar.myDataRef.myHealth = 1e+22;
               inChar.myHealth = 1e+22;
            }
            if(inChar.myDataRef.myBossPhase == 4)
            {
               inChar.myDataRef.myBossPhase = 1;
               inChar.myStatus = "dead";
               inChar.mySubStatus = "_mag1";
               inChar.isFacingRight = inChar._parent.bossStart.startFacing;
               inChar.mySprite.gotoAndStop(inChar.myStatus + inChar.mySubStatus);
               inChar.dropGun();
               inChar.myDataRef.myWeapons[0].myOwner = undefined;
               inChar.myDataRef.myWeapons[0] = undefined;
            }
         }
         if(inEvent == "death1")
         {
            inChar.myDataRef.myBossPhase = 2;
            inChar.myStatus = "run";
            inChar.myMission = "retreat";
            inChar.mySpeed *= 2;
            inChar.myAccel *= 2;
            inChar.mySubStatus = "_wounded";
            inChar.isFacingRight = inChar._parent.bossStart.startFacing;
            inChar.mySprite.gotoAndStop(inChar.myStatus + inChar.mySubStatus);
            inChar.myDataRef.myHealth = 1e+22;
            inChar.myHealth = 1e+22;
            inChar.attractToMC(inChar._parent.bossStart,"");
         }
         if(inEvent == "go_to")
         {
            if(inChar.myDataRef.myBossPhase == 2)
            {
               inChar.myDataRef.myBossPhase = 3;
               inChar.myDataRef.equipItem(ItemGenerator.createWeapon("ppk",false),0);
               inChar.myDataRef.myWeapons[0].noPickup = true;
               inChar.myDataRef.myWeapons[0].myDamage *= 3;
               inChar.myDataRef.myWeapons[0].myClips = 2000;
               inChar.myStatus = "dead";
               inChar.isFacingRight = inChar._parent.bossStart.startFacing;
               inChar.mySubStatus = "_stagger_mag2";
               inChar.mySprite.gotoAndStop(inChar.myStatus + inChar.mySubStatus);
               inChar.myDataRef.myHealth = 1e+22;
               inChar.myHealth = 1e+22;
            }
         }
         if(inEvent == "death2")
         {
            inChar.myDataRef.myBossPhase = 4;
            inChar.myStatus = "incap";
            inChar.mySubStatus = "_mag";
            inChar.myMission = "engage";
            inChar.rofTimer = 9999;
            inChar.reloadTimer = -1;
            inChar.isFacingRight = inChar._parent.bossStart.startFacing;
            inChar.myWidth = inChar.myHeight * inChar.myDataRef.myScale;
            inChar.myDataRef.myWidth = inChar.myWidth;
            inChar.mySprite.gotoAndStop(inChar.myStatus + inChar.mySubStatus);
            inChar.myDataRef.myHealth = inChar.myDataRef.myHealthMax / 2;
            inChar.myHealth = inChar.myDataRef.myHealthMax / 2;
            inChar.myDataRef.myHealthMax = inChar.myDataRef.myHealth;
            inChar.myHealthMax = inChar.myHealth;
         }
         if(inEvent == "death3")
         {
            inChar.myDataRef.myBossPhase = 5;
         }
      }
      if(inChar.myDataRef.myBoss == "mag2")
      {
         if(inEvent == "start")
         {
            inChar.myMission = "engage";
            MadnessLevel.currentLevel.myDifficulty = 2;
            inChar.isFacingRight = false;
            inChar._parent.attachMovie("start_point","bossStart",inChar._parent.getNextHighestDepth());
            inChar._parent.bossStart._x = inChar._parent.WPbossfall._x;
            inChar._parent.bossStart._y = inChar._parent.WPbossfall._y;
            inChar._parent.bossStart.startFacing = inChar.isFacingRight;
            inChar._parent.bossStart._visible = false;
         }
         if(inEvent == "tick")
         {
         }
         if(inEvent == "kill_boss")
         {
            if(inChar.myDataRef.myBossPhase == 0)
            {
               inChar.myDataRef.myBossPhase = 1;
               inChar.myStatus = "dead";
               inChar.mySubStatus = "_mag2";
               inChar.isFacingRight = inChar._parent.bossStart.startFacing;
               inChar.mySprite.gotoAndStop(inChar.myStatus + inChar.mySubStatus);
               inChar.dropGun();
               inChar.myDataRef.myWeapons[0].myOwner = undefined;
               inChar.myDataRef.myWeapons[0] = undefined;
               MadnessLevel.currentLevel.applyTrack(MadnessLevel.currentLevel.myTrack,MadnessLevel.myRooms[19]);
               SwainAudioPlayer.playTrack(MadWorld.thisWorld.myRoomRef.myTrack);
            }
         }
      }
   }
}
