class MadnessLevel
{
   var myLevel;
   var myWorld;
   var defaultDoor;
   var totalWaves;
   var myDifficulty;
   var myName;
   var myDescription;
   var myCutsceneStart;
   var myCutsceneEnd;
   var startPointNPC;
   var startupChance;
   var currentStartup;
   static var currentLevel;
   static var levelVictory;
   static var levelFailed;
   static var startPoint;
   static var totalRooms;
   static var doorList = new Array();
   static var myRooms = new Array();
   static var myObjectives = new Array();
   static var badguyShoppingList = new Array();
   function MadnessLevel()
   {
   }
   function generateLevel(inWorld, inLevel)
   {
      MadnessLevel.currentLevel = this;
      this.myLevel = inLevel;
      this.myWorld = inWorld;
      MadnessLevel.levelVictory = false;
      MadnessLevel.levelFailed = false;
      MadnessLevel.myRooms = new Array();
      MadnessLevel.myObjectives = new Array();
      MadnessRoster.playerRoster = new MadnessRoster();
      MadnessRoster.playerRoster.init("player");
      this.generateRooms(inWorld,inLevel);
   }
   function generateRooms(inWorld, inLevel)
   {
      MadnessLevel.myRooms = new Array();
      MadnessLevel.myObjectives = new Array();
      MadnessLevel.totalRooms = new Number();
      MadnessLevel.doorList = new Array();
      if(inWorld == 0)
      {
         this.defaultDoor = "door";
         if(inLevel == 0)
         {
            this.level0_0();
         }
         else if(inLevel == 1)
         {
            this.level0_1();
         }
         else if(inLevel == 2)
         {
            this.level0_2();
         }
         else if(inLevel == 3)
         {
            this.level0_3();
         }
         else if(inLevel == 4)
         {
            this.level0_4();
         }
         else if(inLevel == 5)
         {
            this.level0_5();
         }
         else if(inLevel == 6)
         {
            this.level0_6();
         }
         else if(inLevel == 7)
         {
            this.level0_7();
         }
      }
      else if(inWorld == 1)
      {
         this.defaultDoor = "sidedoor";
         if(inLevel == 0)
         {
            this.level1_0();
         }
         else if(inLevel == 1)
         {
            this.level1_1();
         }
         else if(inLevel == 2)
         {
            this.level1_2();
         }
         else if(inLevel == 3)
         {
            this.level1_3();
         }
         else if(inLevel == 4)
         {
            this.level1_4();
         }
         else if(inLevel == 5)
         {
            this.level1_5();
         }
      }
   }
   function generateArena(inStartWave)
   {
      trace("Begun, " + inStartWave);
      MadnessLevel.currentLevel = this;
      MadnessLevel.levelVictory = false;
      MadnessLevel.levelFailed = false;
      MadnessLevel.myRooms = new Array();
      MadnessLevel.myObjectives = new Array();
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      this.totalWaves = inStartWave;
      this.myDifficulty = Math.floor(this.totalWaves / 2);
      if(MadnessGameSelect.subGameMode == "standard")
      {
         _loc4_ = 1;
         this.addRooms(_loc4_,MadnessGameSelect.gameMode);
         this.defaultDoor = "door";
         _loc5_ = [5];
         this.addDoors(MadnessLevel.myRooms,_loc5_);
         this.setDoorDir(0,0,"down");
         MadnessLevel.myRooms[0].myDoors[0].myConnection = MadnessRoster.storeRoster;
         this.addStartPointDoor(MadnessLevel.myRooms[0].myDoors[0]);
         this.disableDoorSpawn(0,0);
         if(_root.newArena)
         {
            this.addEvent(MadnessLevel.myRooms[0],MadnessEvents.arena_1_tutorial);
         }
         this.setDoorDir(0,1,"right");
         this.setDoorDir(0,2,"down");
         this.setDoorDir(0,3,"down");
         this.setDoorDir(0,4,"left");
         this.addActivator(0,"panel");
         this.addEvent(MadnessLevel.myRooms[0].myActivators[0],MadnessEvents.arena_1_START);
         this.addObstacle(0,"barrel");
         this.addObstacle(0,"barrel");
         var _loc3_ = this.totalWaves;
         while(_loc3_ > 8)
         {
            _loc3_ -= 8;
         }
         if(_loc3_ == 7)
         {
            _loc3_ = 8;
         }
         this.applyTrack("stage" + _loc3_,this);
      }
      if(MadnessGameSelect.subGameMode == "zombie")
      {
         _loc4_ = 1;
         this.addRooms(_loc4_,MadnessGameSelect.gameMode);
         this.defaultDoor = "sidedoor";
         _loc5_ = [6];
         this.addDoors(MadnessLevel.myRooms,_loc5_);
         this.setDoorDir(0,0,"down");
         MadnessLevel.myRooms[0].myDoors[0].myConnection = MadnessRoster.storeRoster;
         this.addStartPointDoor(MadnessLevel.myRooms[0].myDoors[0]);
         this.disableDoorSpawn(0,0);
         this.setDoorDir(0,1,"right");
         this.setDoorDir(0,2,"down");
         this.setDoorDir(0,3,"down");
         this.setDoorDir(0,4,"down");
         this.setDoorDir(0,5,"left");
         this.addActivator(0,"panel");
         this.addEvent(MadnessLevel.myRooms[0].myActivators[0],MadnessEvents.arena_1_START);
         this.addObstacle(0,"box1");
         this.addObstacle(0,"box2");
         this.applyTrack("zombie1",this);
      }
   }
   function level0_0()
   {
      this.myName = "[1-A] Jail";
      this.myDescription = " In order to bring about the destruction of the Nexus Project and the Nexus Training Program, Hank has been hired to enlist the help of incarcerated agents Sanford and Deimos.";
      this.myDifficulty = 4;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("hank");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("dragonsword",false),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      _loc2_.myWeapons[0].myClips = 4;
      _loc2_.myStartup = "startup3";
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessLevel.totalRooms = 7;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,2,4,3,2,4];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorType(0,0,"blast");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"left");
      this.setDoorType(1,0,"blast");
      this.disableDoorSpawn(1,0);
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"left");
      this.disableDoorSpawn(2,0);
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"down");
      this.setDoorDir(3,2,"down");
      this.setDoorDir(3,3,"left");
      this.disableDoorSpawn(3,0);
      this.setDoorDir(4,0,"right");
      this.setDoorDir(4,1,"down");
      this.setDoorDir(4,2,"left");
      this.disableDoorSpawn(4,0);
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"left");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(6,1,"down");
      this.setDoorType(6,1,"spikesJail");
      this.disableDoorSpawn(6,1);
      this.disableClose(6,1);
      this.setDoorDir(6,2,"down");
      this.setDoorType(6,2,"spikesJail");
      this.disableDoorSpawn(6,2);
      this.disableClose(6,2);
      this.setDoorDir(6,3,"left");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(3,3,"---",4,0);
      this.connectDoors(4,2,"---",5,0);
      this.connectDoors(5,1,"---",6,0);
      this.addEvent(MadnessLevel.myRooms[0],MadnessEvents.world_0_0_tutorial1);
      this.addEvent(MadnessLevel.myRooms[1],MadnessEvents.world_0_0_tutorial2);
      this.addEvent(MadnessLevel.myRooms[2],MadnessEvents.world_0_0_tutorial3);
      this.addEvent(MadnessLevel.myRooms[3],MadnessEvents.world_0_0_tutorial4);
      this.addEvent(MadnessLevel.myRooms[4],MadnessEvents.world_0_0_tutorial5);
      this.addEvent(MadnessLevel.myRooms[5],MadnessEvents.world_0_0_tutorial6);
      this.addActivator(2,"panel");
      this.connectActivator(2,0,"---",MadnessLevel.myRooms[2].myDoors[1],"unlock");
      this.addEvent(MadnessLevel.myRooms[2].myActivators[0],MadnessEvents.world_0_0_tutorial3b);
      this.addActivator(5,"lockerLeft");
      this.addActivator(6,"panel");
      this.connectActivator(6,0,"---",MadnessLevel.myRooms[6].myDoors[1],"unlock");
      this.addActivator(6,"panel");
      this.connectActivator(6,1,"---",MadnessLevel.myRooms[6].myDoors[2],"unlock");
      this.addEvent(MadnessLevel.myRooms[6].myActivators[1],MadnessEvents.world_0_0_prison);
      this.addActivator(6,"panel");
      this.addObstacle(2,"empty1");
      this.addObstacle(3,"barrel");
      this.addObstacle(5,"empty2");
      this.createNPC(MadnessLevel.myRooms[1],"civ","enemy","melee",5,true,3);
      this.createNPC(MadnessLevel.myRooms[1],"agent","enemy","melee",5,true,1);
      this.createNPC(MadnessLevel.myRooms[2],"civ","enemy","unarmed",0,true,1);
      this.createNPC(MadnessLevel.myRooms[4],"civ","enemy","unarmed",0,true,3);
      this.createNPC(MadnessLevel.myRooms[4],"agent","enemy","unarmed",0,true,1);
      this.setStartup("stun_surprise",0);
      this.createNPC(MadnessLevel.myRooms[5],"coward","enemy","unarmed",0,true,1);
      this.addEvent(MadnessLevel.myRooms[5].myCharacters[0],MadnessEvents.world_0_0_closeMedal1);
      this.resetStartup();
      this.createNPC(MadnessLevel.myRooms[6].myDoors[1],"agent","traitors","unarmed",0,true,1);
      this.createNPC(MadnessLevel.myRooms[6],"agent","enemy","unarmed",0,true,2);
      this.addEvent(MadnessLevel.myRooms[6].myDoors[1].myCharacters[0],MadnessEvents.world_0_0_closeMedal1);
      this.createRoster(MadnessLevel.myRooms[2],["civ","civ"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[3],["agent","civ","civ","civ"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[3],["agent","civ","civ","civ"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[3],["agent","civ","civ","civ"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent","civ"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[4],["agent","civ","civ","civ"],"enemy","ranged",0);
      this.addNPC(MadnessLevel.myRooms[6].myDoors[2],MadnessRoster.playerRoster.myMembers[MadnessRoster.playerRoster.myMembers.length - 2],true);
      this.addNPC(MadnessLevel.myRooms[6].myDoors[2],MadnessRoster.playerRoster.myMembers[MadnessRoster.playerRoster.myMembers.length - 1],true);
      this.addItem(MadnessLevel.myRooms[5].myActivators[0],ItemGenerator.createWeapon("sr3",false));
      this.makeObjective(MadnessRoster.playerRoster.myMembers[MadnessRoster.playerRoster.myMembers.length - 2],"rescue",true,false);
      this.makeObjective(MadnessRoster.playerRoster.myMembers[MadnessRoster.playerRoster.myMembers.length - 1],"rescue",true,false);
      this.myCutsceneStart = "cutscene_world0_start";
      this.applyTrack("stage1",this);
   }
   function level0_1()
   {
      this.myName = "[1-B] Armory";
      this.myDescription = " We\'re in danger of Nexus Units advancing their equipment loadouts. Hank is required elsewhere, so Sanford and Deimos will have to infiltrate the Armory and put an end to the Nexus weapon stockpile.";
      this.myDifficulty = 1;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hook",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",true),1);
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",true),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("beretta",true),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      MadnessLevel.totalRooms = 12;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,2,3,2,3,1,2,4,3,2,3];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"left");
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"left");
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"down");
      this.setDoorDir(3,2,"left");
      this.setDoorDir(4,0,"right");
      this.setDoorDir(4,1,"down");
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"down");
      this.setDoorDir(5,2,"down");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(7,0,"down");
      this.setDoorDir(7,1,"down");
      this.setDoorDir(8,0,"right");
      this.setDoorDir(8,1,"down");
      this.setDoorDir(8,2,"down");
      this.setDoorDir(8,3,"left");
      this.setDoorDir(9,0,"down");
      this.setDoorDir(9,1,"down");
      this.setDoorDir(9,2,"left");
      this.setDoorDir(10,0,"right");
      this.setDoorDir(10,1,"left");
      this.setDoorDir(11,0,"right");
      this.setDoorDir(11,1,"down");
      this.setDoorDir(11,2,"left");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(3,1,"---",4,0);
      this.connectDoors(3,2,"---",5,0);
      this.connectDoors(5,1,"---",7,0);
      this.connectDoors(5,2,"---",6,0);
      this.connectDoors(7,1,"---",8,2);
      this.connectDoors(8,1,"---",9,0);
      this.connectDoors(9,1,"---",10,0);
      this.connectDoors(10,1,"---",11,0);
      this.addEvent(MadnessLevel.myRooms[0],MadnessEvents.world_0_1_0);
      this.addEvent(MadnessLevel.myRooms[6],MadnessEvents.world_0_1_6);
      this.addActivator(2,"bomb_crate");
      this.addActivator(3,"panel");
      this.addEvent(MadnessLevel.myRooms[3].myActivators[0],MadnessEvents.world_0_1_3_A);
      this.addActivator(4,"bomb_crate");
      this.addActivator(6,"lockerLeft");
      this.addActivator(6,"bomb_crate");
      this.addActivator(11,"bomb_crate");
      this.addObstacle(1,"empty1");
      this.addObstacle(1,"empty1");
      this.addObstacle(3,"spikes1");
      this.addObstacle(11,"empty1");
      this.setStartup("stun_surprise",0);
      this.createNPC(MadnessLevel.myRooms[1],"civ","enemy","ranged",0,true,0);
      this.resetStartup();
      this.createRoster(MadnessLevel.myRooms[1],["civ"],"enemy","ranged",0);
      this.createNPC(MadnessLevel.myRooms[2],"civ","enemy","unarmed",0,true,3);
      this.createNPC(MadnessLevel.myRooms[3],"civ","enemy","unarmed",0,true,3);
      this.createRoster(MadnessLevel.myRooms[3],["civ","civ","civ"],"enemy","melee",0);
      this.createNPC(MadnessLevel.myRooms[4],"civ","enemy","melee",0,true,1);
      this.createNPC(MadnessLevel.myRooms[5],"civ","enemy","melee",0,true,4);
      this.createRoster(MadnessLevel.myRooms[5],["civ","civ"],"enemy","unarmed",0);
      this.createRoster(MadnessLevel.myRooms[5],["civ","civ","civ"],"enemy","ranged",0);
      this.createNPC(MadnessLevel.myRooms[7],"civ","enemy","unarmed",1,true,2);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ"],"enemy","melee",1);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[8],"civ","enemy","melee",1,true,2);
      this.createRoster(MadnessLevel.myRooms[8],["civ","agent","agent"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[8],["civ","agent","agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[8],["civ","civ","civ"],"enemy","melee",0);
      this.createRoster(MadnessLevel.myRooms[9],["civ","agent","agent"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[9],["civ","agent","agent"],"enemy","ranged",3);
      this.createNPC(MadnessLevel.myRooms[11],"civ","enemy","melee",3,true,3);
      this.createNPC(MadnessLevel.myRooms[11],"agent","enemy","ranged",3,true,2);
      this.createRoster(MadnessLevel.myRooms[11],["civ","agent"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[11],["civ","civ","civ","civ","agent"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[11],["civ","agent","agent"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[11],["civ","agent","agent"],"enemy","ranged",3);
      this.addItem(MadnessLevel.myRooms[6].myActivators[0],ItemGenerator.createWeapon("deagle",false));
      this.addItem(MadnessLevel.myRooms[6].myActivators[0],ItemGenerator.createWeapon("97k",false));
      this.makeObjective(MadnessLevel.myRooms[2].myActivators[0],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[2],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[4].myActivators[0],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[4],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[6].myActivators[1],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[6],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[11].myActivators[0],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[11],"clear",true,false);
      this.applyTrack("stage2",this);
   }
   function level0_2()
   {
      this.myName = "[1-C] Com-Tower";
      this.myDescription = " Opposition is getting stiff. The probability of hitting the Headquarters of Project Nexus with any reliability will be nil unless we can disrupt its communications array.";
      this.myDifficulty = 2;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hook",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",true),1);
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",true),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("beretta",true),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      MadnessLevel.totalRooms = 10;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,3,3,4,2,2,3,2,2,2];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"down");
      this.setDoorDir(1,2,"left");
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"down");
      this.setDoorDir(2,2,"left");
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"down");
      this.setDoorDir(3,2,"down");
      this.setDoorDir(3,3,"left");
      this.setDoorDir(4,0,"right");
      this.setDoorDir(4,1,"left");
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"left");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(6,1,"down");
      this.setDoorDir(6,2,"left");
      this.setDoorDir(7,0,"right");
      this.setDoorDir(7,1,"down");
      this.setDoorDir(8,0,"right");
      this.setDoorDir(8,1,"left");
      this.setDoorDir(9,0,"right");
      this.setDoorDir(9,1,"down");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(1,2,"---",3,0);
      this.connectDoors(3,2,"---",6,0);
      this.connectDoors(3,3,"---",4,0);
      this.connectDoors(4,1,"---",5,0);
      this.connectDoors(6,1,"---",7,0);
      this.connectDoors(6,2,"---",8,0);
      this.connectDoors(8,1,"---",9,0);
      this.addEvent(MadnessLevel.myRooms[5],MadnessEvents.world_0_2_5);
      this.addEvent(MadnessLevel.myRooms[9],MadnessEvents.world_0_2_9);
      this.addActivator(5,"bomb_power");
      this.addActivator(7,"lockerRight");
      this.addActivator(9,"lockerLeft");
      this.addActivator(9,"bomb_power");
      this.setStartup("stun_surprise",0);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[0],"civ","enemy","ranged",0,true,3);
      this.endStartNPC();
      this.resetStartup();
      this.createNPC(MadnessLevel.myRooms[1],"civ","enemy","melee",2,true,4);
      this.createRoster(MadnessLevel.myRooms[1],["civ","civ"],"enemy","melee",3);
      this.createNPC(MadnessLevel.myRooms[2],"civ","enemy","unarmed",2,true,3);
      this.createNPC(MadnessLevel.myRooms[2],"agent","enemy","melee",4,true,2);
      this.createRoster(MadnessLevel.myRooms[2],["civ","agent","agent"],"enemy","ranged",3);
      this.createNPC(MadnessLevel.myRooms[3],"civ","enemy","ranged",3,true,2);
      this.createRoster(MadnessLevel.myRooms[3],["agent","civ","civ"],"enemy","melee",4);
      this.createRoster(MadnessLevel.myRooms[3],["civ"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[4],"civ","enemy","melee",3,true,1);
      this.createNPC(MadnessLevel.myRooms[4],"agent","enemy","ranged",4,true,2);
      this.createRoster(MadnessLevel.myRooms[4],["agent","civ","civ"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[5],"civ","enemy","ranged",3,true,4);
      this.createNPC(MadnessLevel.myRooms[5],"civ","enemy","ranged",9,true,5);
      this.createRoster(MadnessLevel.myRooms[5],["agent","agent","agent"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[5],["agent","agent","agent"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[5],["agent","agent","agent","agent"],"enemy","melee",9);
      this.createRoster(MadnessLevel.myRooms[5],["agent","agent","agent","agent","agent","agent"],"enemy","ranged",3);
      this.createNPC(MadnessLevel.myRooms[7],"civ","enemy","melee",3,true,4);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ","civ"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","agent"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[8],"agent","enemy","ranged",4,true,3);
      this.createNPC(MadnessLevel.myRooms[9],"civ","enemy","melee",4,true,2);
      this.createNPC(MadnessLevel.myRooms[9],"agent","enemy","melee",4,true,2);
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent"],"enemy","melee",4);
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent"],"enemy","melee",6);
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent","agent"],"enemy","melee",9);
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent","agent","agent","agent"],"enemy","ranged",3);
      this.addItem(MadnessLevel.myRooms[7].myActivators[0],ItemGenerator.createWeapon("beretta",false));
      this.addItem(MadnessLevel.myRooms[7].myActivators[0],ItemGenerator.createWeapon("carbonknife",false));
      this.addItem(MadnessLevel.myRooms[9].myActivators[0],ItemGenerator.createWeapon("spas12",false));
      this.makeObjective(MadnessLevel.myRooms[5].myActivators[0],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[5],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[9].myActivators[1],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[9],"clear",true,false);
      this.applyTrack("stage3",this);
   }
   function level0_3()
   {
      this.myName = "[1-D] Barracks";
      this.myDescription = " With Nexus Units reeling from the satelite blackout, we may now launch a stealth strike directly against their most precious and plentiful resource: their manpower. Kill them all!";
      this.myDifficulty = 2;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hook",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",true),1);
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",true),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("beretta",true),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      MadnessLevel.totalRooms = 14;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,2,3,2,3,3,2,4,3,2,3,2,2];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"left");
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"left");
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"down");
      this.setDoorDir(3,2,"left");
      this.setDoorDir(4,0,"right");
      this.setDoorDir(4,1,"down");
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"down");
      this.setDoorDir(5,2,"down");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(6,1,"down");
      this.setDoorDir(6,2,"left");
      this.setDoorDir(7,0,"right");
      this.setDoorDir(7,1,"left");
      this.setDoorDir(8,0,"right");
      this.setDoorDir(8,1,"down");
      this.setDoorDir(8,2,"down");
      this.setDoorDir(8,3,"left");
      this.setDoorDir(9,0,"right");
      this.setDoorDir(9,1,"down");
      this.setDoorDir(9,2,"left");
      this.setDoorDir(10,0,"right");
      this.setDoorDir(10,1,"down");
      this.setDoorDir(11,0,"right");
      this.setDoorDir(11,1,"down");
      this.setDoorDir(11,2,"down");
      this.setDoorDir(12,0,"right");
      this.setDoorDir(12,1,"left");
      this.setDoorDir(13,0,"right");
      this.setDoorDir(13,1,"left");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(3,1,"---",4,0);
      this.connectDoors(3,2,"---",5,0);
      this.connectDoors(5,1,"---",6,0);
      this.connectDoors(5,2,"---",7,0);
      this.connectDoors(7,1,"---",8,0);
      this.connectDoors(8,1,"---",9,0);
      this.connectDoors(8,2,"---",10,0);
      this.connectDoors(8,3,"---",11,0);
      this.connectDoors(11,1,"---",12,0);
      this.connectDoors(11,2,"---",13,0);
      this.addEvent(MadnessLevel.myRooms[4],MadnessEvents.world_0_3_4);
      this.addEvent(MadnessLevel.myRooms[6],MadnessEvents.world_0_3_6);
      this.addEvent(MadnessLevel.myRooms[10],MadnessEvents.world_0_3_10);
      this.addEvent(MadnessLevel.myRooms[13],MadnessEvents.world_0_3_13);
      this.addActivator(3,"lockerRight");
      this.addActivator(3,"lockerRight");
      this.addActivator(5,"lockerRight");
      this.addActivator(8,"lockerLeft");
      this.addActivator(9,"lockerRight");
      this.addActivator(13,"lockerRight");
      this.addObstacle(4,"empty1");
      this.addObstacle(5,"empty3");
      this.addObstacle(8,"empty1");
      this.addObstacle(9,"empty3");
      this.addObstacle(10,"empty1");
      this.addObstacle(13,"empty3");
      this.setStartup("stun_surprise",0);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[0],"civ","enemy","ranged",2,true,1);
      this.endStartNPC();
      this.resetStartup();
      this.createNPC(MadnessLevel.myRooms[1],"civ","enemy","melee",4,true,2);
      this.createNPC(MadnessLevel.myRooms[1],"agent","enemy","ranged",4,true,1);
      this.createRoster(MadnessLevel.myRooms[1],["agent","civ","agent"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[1],["agent","agent","agent"],"enemy","ranged",3);
      this.createNPC(MadnessLevel.myRooms[2],"agent","enemy","ranged",5,true,3);
      this.createRoster(MadnessLevel.myRooms[2],["civ","civ","civ"],"enemy","melee",3);
      this.createRoster(MadnessLevel.myRooms[2],["civ"],"enemy","melee",7);
      this.createNPC(MadnessLevel.myRooms[3],"civ","enemy","unarmed",4,true,1);
      this.createNPC(MadnessLevel.myRooms[4],"civ","enemy","melee",4,true,1);
      this.createNPC(MadnessLevel.myRooms[4],"civ","enemy","ranged",5,true,2);
      this.createRoster(MadnessLevel.myRooms[4],["civ"],"enemy","melee",1);
      this.createNPC(MadnessLevel.myRooms[5],"civ","enemy","melee",4,true,2);
      this.createNPC(MadnessLevel.myRooms[5],"agent","enemy","ranged",4,true,1);
      this.createRoster(MadnessLevel.myRooms[5],["civ","civ","civ","civ"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[5],["civ"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[5],["civ","civ","civ","civ"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[5],["civ","civ"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[5],["civ","civ","civ","civ"],"enemy","ranged",0);
      this.createNPC(MadnessLevel.myRooms[6],"agent","enemy","ranged",5,true,3);
      this.createNPC(MadnessLevel.myRooms[7],"civ","enemy","melee",5,true,1);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ","civ"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ","civ","civ"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ","civ"],"enemy","ranged",1);
      this.createNPC(MadnessLevel.myRooms[8],"civ","enemy","melee",5,true,1);
      this.createNPC(MadnessLevel.myRooms[8],"agent","enemy","ranged",5,true,2);
      this.createRoster(MadnessLevel.myRooms[8],["agent","agent","civ","civ"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[8],["agent","agent","civ","civ"],"enemy","ranged",6);
      this.createNPC(MadnessLevel.myRooms[10],"civ","enemy","melee",5,true,3);
      this.createNPC(MadnessLevel.myRooms[10],"civ","enemy","unarmed",5,true,3);
      this.createNPC(MadnessLevel.myRooms[10],"agent","enemy","unarmed",5,true,1);
      this.createNPC(MadnessLevel.myRooms[11],"civ","enemy","melee",5,true,1);
      this.createNPC(MadnessLevel.myRooms[11],"civ","enemy","unarmed",4,true,1);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","civ"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","agent","agent"],"enemy","ranged",6);
      this.createRoster(MadnessLevel.myRooms[11],["agent"],"enemy","ranged",6);
      this.createNPC(MadnessLevel.myRooms[12],"agent","enemy","ranged",2,true,2);
      this.createNPC(MadnessLevel.myRooms[12],"agent","enemy","melee",6,true,2);
      this.createRoster(MadnessLevel.myRooms[12],["agent","agent"],"enemy","ranged",3);
      this.createNPC(MadnessLevel.myRooms[13],"agent","enemy","ranged",0,true,2);
      this.createNPC(MadnessLevel.myRooms[13],"agent","enemy","ranged",4,true,2);
      this.createRoster(MadnessLevel.myRooms[13],["agent","civ","civ","civ"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[13],["agent","agent","civ","civ"],"enemy","melee",10);
      this.createRoster(MadnessLevel.myRooms[13],["agent","agent","agent","civ"],"enemy","ranged",6);
      this.createRoster(MadnessLevel.myRooms[13],["agent","agent","agent","agent"],"enemy","ranged",9);
      this.createRoster(MadnessLevel.myRooms[13],["agent","agent","agent","civ"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[13],["agent","agent","agent","agent"],"enemy","ranged",9);
      this.addItem(MadnessLevel.myRooms[3].myActivators[1],ItemGenerator.createWeapon("glock20",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[1],ItemGenerator.createWeapon("spas12",false));
      this.addItem(MadnessLevel.myRooms[5].myActivators[0],ItemGenerator.createWeapon("l337sword",false));
      this.addItem(MadnessLevel.myRooms[9].myActivators[0],ItemGenerator.createWeapon("ppk",false));
      this.addItem(MadnessLevel.myRooms[9].myActivators[0],ItemGenerator.createWeapon("500long",false));
      this.addItem(MadnessLevel.myRooms[13].myActivators[0],ItemGenerator.createWeapon("tmp",false));
      this.makeObjective(MadnessLevel.myRooms[4],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[6],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[10],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[13],"clear",true,false);
      this.applyTrack("stage4",this);
   }
   function level0_4()
   {
      this.myName = "[1-E] Recon Hut";
      this.myDescription = " With the Communication Tower down and the Barracks totally obliterated, the Nexus has been forced to adapt. Engineers have been dispatched to convert a nearby Recon Hut into a new Com-Tower. Disable the facility.";
      this.myDifficulty = 3;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hook",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",true),1);
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",true),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("beretta",true),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      MadnessLevel.totalRooms = 12;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,3,2,3,3,2,1,2,2,2,2];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"left");
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"down");
      this.setDoorDir(2,2,"left");
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"left");
      this.setDoorDir(4,0,"right");
      this.setDoorDir(4,1,"down");
      this.setDoorDir(4,2,"left");
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"down");
      this.setDoorDir(5,2,"left");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(6,1,"left");
      this.setDoorDir(7,0,"left");
      this.setDoorDir(8,0,"right");
      this.setDoorDir(8,1,"down");
      this.setDoorDir(9,0,"right");
      this.setDoorDir(9,1,"down");
      this.setDoorDir(10,0,"right");
      this.setDoorDir(10,1,"down");
      this.setDoorDir(11,0,"right");
      this.setDoorDir(11,1,"down");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",8,0);
      this.connectDoors(2,2,"---",3,0);
      this.connectDoors(3,1,"---",4,0);
      this.connectDoors(4,1,"---",5,1);
      this.connectDoors(5,0,"---",6,1);
      this.connectDoors(6,0,"---",7,0);
      this.connectDoors(8,1,"---",9,0);
      this.connectDoors(9,1,"---",10,0);
      this.connectDoors(10,1,"---",11,0);
      this.addEvent(MadnessLevel.myRooms[2],MadnessEvents.world_0_4_2_A);
      this.addActivator(2,"lockerRight");
      this.addActivator(6,"lockerLeft");
      this.addActivator(7,"bomb_powerLeft");
      this.addActivator(11,"lockerLeft");
      this.addActivator(11,"terminalRight");
      this.addEvent(MadnessLevel.myRooms[11].myActivators[1],MadnessEvents.world_0_4_11_A);
      this.addObstacle(1,"empty1");
      this.addObstacle(2,"spikes1");
      this.addObstacle(3,"empty3");
      this.addObstacle(6,"empty0");
      this.addObstacle(7,"empty1");
      this.addObstacle(8,"empty1");
      this.addObstacle(8,"empty3");
      this.addObstacle(9,"empty0");
      this.addObstacle(11,"empty1");
      this.addObstacle(11,"empty3");
      this.createNPC(MadnessLevel.myRooms[1],"civ","enemy","melee",6,true,1);
      this.createNPC(MadnessLevel.myRooms[1],"civ","enemy","unarmed",2,true,1);
      this.createNPC(MadnessLevel.myRooms[3],"civ","enemy","unarmed",3,true,1);
      this.createNPC(MadnessLevel.myRooms[3],"agent","enemy","ranged",2,true,1);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent","civ"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent"],"enemy","melee",8);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent","agent","civ"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent","agent","agent"],"enemy","melee",8);
      this.createNPC(MadnessLevel.myRooms[4],"agent","enemy","ranged",4,true,1);
      this.createRoster(MadnessLevel.myRooms[4],["agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent","agent","civ"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[4],["agent","civ"],"enemy","melee",3);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent","agent"],"enemy","melee",8);
      this.createNPC(MadnessLevel.myRooms[5],"agent","enemy","ranged",4,true,3);
      this.createRoster(MadnessLevel.myRooms[5],["agent","agent","civ"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[6],"agent","enemy","ranged",4,true,2);
      this.createRoster(MadnessLevel.myRooms[6],["agent","agent","civ"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[6],["agent","agent","agent","agent"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[6],["agent"],"enemy","ranged",3);
      this.createNPC(MadnessLevel.myRooms[7],"civ","enemy","melee",4,true,1);
      this.createNPC(MadnessLevel.myRooms[7],"agent","enemy","ranged",4,true,4);
      this.createNPC(MadnessLevel.myRooms[7],"agent2","enemy","ranged",8,true,1);
      this.createNPC(MadnessLevel.myRooms[8],"agent","enemy","ranged",0,true,2);
      this.createNPC(MadnessLevel.myRooms[9],"agent","enemy","ranged",3,true,3);
      this.createNPC(MadnessLevel.myRooms[9],"agent","enemy","ranged",5,true,2);
      this.createRoster(MadnessLevel.myRooms[10],["agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[10],["agent","agent2"],"enemy","melee",12);
      this.createRoster(MadnessLevel.myRooms[10],["agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[10],["agent"],"enemy","melee",3);
      this.createRoster(MadnessLevel.myRooms[10],["agent","agent"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[10],["agent"],"enemy","ranged",3);
      this.createNPC(MadnessLevel.myRooms[11],"agent2","enemy","ranged",6,true,2);
      this.createNPC(MadnessLevel.myRooms[11],"agent","enemy","ranged",3,true,3);
      this.createRoster(MadnessLevel.myRooms[11],["agent2","agent","agent"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[11],["agent","civ"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[11],["agent2","agent","civ"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent"],"enemy","melee",3);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent2","civ"],"enemy","ranged",6);
      this.createRoster(MadnessLevel.myRooms[11],["civ","agent","agent2"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[11],["agent2","agent2"],"enemy","ranged",5);
      this.addItem(MadnessLevel.myRooms[2].myActivators[0],ItemGenerator.createWeapon("machette",false));
      this.addItem(MadnessLevel.myRooms[2].myActivators[0],ItemGenerator.createWeapon("beretta",false));
      this.addItem(MadnessLevel.myRooms[6].myActivators[0],ItemGenerator.createWeapon("357snub",false));
      this.addItem(MadnessLevel.myRooms[6].myActivators[0],ItemGenerator.createWeapon("500snub",false));
      this.addItem(MadnessLevel.myRooms[11].myActivators[0],ItemGenerator.createWeapon("oa93",false));
      this.addItem(MadnessLevel.myRooms[11].myActivators[0],ItemGenerator.createWeapon("mp5k",false));
      this.addItem(MadnessLevel.myRooms[11].myActivators[0],ItemGenerator.createWeapon("m203",false));
      this.makeObjective(MadnessLevel.myRooms[7].myActivators[0],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[7],"clear",true,false);
      this.applyTrack("stage5",this);
   }
   function level0_5()
   {
      this.myName = "[1-F] Stronghold";
      this.myDescription = " Intercepted transmissions report the deployment of new G03LM Mk1 units for training at the Nexus Stronghold. Infiltrate the facility, learn what you can, and elminate this new threat.";
      this.myDifficulty = 3;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hook",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",true),1);
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",true),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("beretta",true),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      MadnessLevel.totalRooms = 15;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,2,3,2,2,3,2,3,2,2,3,2,2,3];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"left");
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"left");
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"down");
      this.setDoorDir(3,2,"left");
      this.setDoorDir(4,0,"right");
      this.setDoorDir(4,1,"left");
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"down");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(6,1,"down");
      this.setDoorDir(6,2,"left");
      this.setDoorDir(7,0,"right");
      this.setDoorDir(7,1,"left");
      this.setDoorDir(8,0,"right");
      this.setDoorDir(8,1,"down");
      this.setDoorDir(8,2,"left");
      this.setDoorDir(9,0,"right");
      this.setDoorDir(9,1,"left");
      this.setDoorDir(10,0,"right");
      this.setDoorDir(10,1,"left");
      this.setDoorDir(11,0,"right");
      this.setDoorDir(11,1,"down");
      this.setDoorDir(11,2,"left");
      this.setDoorDir(12,0,"right");
      this.setDoorDir(12,1,"left");
      this.setDoorDir(13,0,"right");
      this.setDoorDir(13,1,"left");
      this.setDoorDir(14,0,"right");
      this.setDoorDir(14,1,"down");
      this.setDoorDir(14,2,"down");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(3,1,"---",4,0);
      this.connectDoors(3,2,"---",6,0);
      this.connectDoors(4,1,"---",5,0);
      this.connectDoors(6,2,"---",7,0);
      this.connectDoors(7,1,"---",8,0);
      this.connectDoors(8,1,"---",9,0);
      this.connectDoors(8,2,"---",10,0);
      this.connectDoors(10,1,"---",11,0);
      this.connectDoors(11,1,"---",12,0);
      this.connectDoors(11,2,"---",13,0);
      this.connectDoors(13,1,"---",14,0);
      this.addActivator(1,"lockerRight");
      this.addActivator(3,"lockerLeft");
      this.addActivator(4,"lockerRight");
      this.addActivator(5,"lockerRight");
      this.addActivator(7,"lockerLeft");
      this.addActivator(9,"lockerRight");
      this.addActivator(9,"lockerRight");
      this.addActivator(10,"lockerLeft");
      this.addActivator(11,"lockerLeft");
      this.addActivator(12,"lockerRight");
      this.addActivator(12,"lockerRight");
      this.addActivator(12,"lockerRight");
      this.addActivator(13,"lockerRight");
      this.addObstacle(1,"empty1");
      this.addObstacle(1,"empty3");
      this.addObstacle(4,"empty1");
      this.addObstacle(4,"empty3");
      this.addObstacle(5,"empty3");
      this.addObstacle(5,"empty1");
      this.addObstacle(8,"empty1");
      this.addObstacle(9,"empty1");
      this.addObstacle(11,"empty4");
      this.addObstacle(12,"empty1");
      this.addObstacle(12,"empty1");
      this.addObstacle(13,"empty1");
      this.addObstacle(14,"empty1");
      this.addObstacle(14,"empty1");
      this.setStartup("stun_surprise",0);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[0],"agent","enemy","ranged",6,true,2);
      this.endStartNPC();
      this.resetStartup();
      this.createNPC(MadnessLevel.myRooms[1],"agent","enemy","melee",7,true,3);
      this.createNPC(MadnessLevel.myRooms[2],"agent","enemy","melee",7,true,3);
      this.createNPC(MadnessLevel.myRooms[2],"agent2","enemy","ranged",6,true,1);
      this.createRoster(MadnessLevel.myRooms[2],["agent","agent","agent2"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[3],"agent","enemy","ranged",6,true,2);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent","agent"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[3],["agent"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent","agent2","agent"],"enemy","ranged",5);
      this.createNPC(MadnessLevel.myRooms[4],"agent","enemy","ranged",4,true,1);
      this.createNPC(MadnessLevel.myRooms[4],"agent2","enemy","ranged",7,true,1);
      this.createRoster(MadnessLevel.myRooms[5],["agent","agent2","agent2","agent","agent"],"enemy","melee",8);
      this.createRoster(MadnessLevel.myRooms[5],["agent"],"enemy","melee",12);
      this.createNPC(MadnessLevel.myRooms[6],"agent","enemy","ranged",6,true,4);
      this.createNPC(MadnessLevel.myRooms[8],"fatboy","enemy","fatboy",10,false,1);
      MadnessLevel.myRooms[8].myCharacters[0].giveItem(ItemGenerator.createWeapon("mp5",false),0);
      MadnessLevel.myRooms[8].myCharacters[0].myWeapons[0].myClips = 3;
      MadnessLevel.myRooms[8].myCharacters[0].giveItem(ItemGenerator.createWeapon("mallet",false),1);
      this.createNPC(MadnessLevel.myRooms[8],"agent","enemy","ranged",3,true,2);
      this.createRoster(MadnessLevel.myRooms[8],["civ","civ"],"enemy","ranged",4);
      this.addEvent(MadnessLevel.myRooms[8].myRosters[0],MadnessEvents.world_0_5_8_A);
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent","agent"],"enemy","melee",8);
      this.createNPC(MadnessLevel.myRooms[10],"agent","enemy","melee",6,true,2);
      this.createNPC(MadnessLevel.myRooms[10],"agent","enemy","unarmed",6,true,1);
      this.createRoster(MadnessLevel.myRooms[10],["agent","agent","agent","agent","agent"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[10],["agent","agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[10],["agent","agent","agent","agent","agent","agent"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[11],"agent2","enemy","melee",10,true,2);
      this.createNPC(MadnessLevel.myRooms[11],"agent","enemy","ranged",6,true,1);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","agent","agent","agent","agent"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","agent","agent","agent"],"enemy","ranged",0);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent"],"enemy","ranged",0);
      this.createNPC(MadnessLevel.myRooms[12],"civ","enemy","ranged",2,true,4);
      this.createNPC(MadnessLevel.myRooms[12],"agent","enemy","ranged",6,true,1);
      this.createRoster(MadnessLevel.myRooms[12],["agent2","agent","agent","agent2"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[12],["agent","agent","agent2","agent","agent","agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[12],["agent","agent2","agent","agent","agent2","agent"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[14],"agent","enemy","melee",7,true,3);
      this.createRoster(MadnessLevel.myRooms[14],["fatboy"],"enemy","fatboy",0);
      MadnessLevel.myRooms[15].myRosters[0].myActiveMembers[0].giveItem(ItemGenerator.createWeapon("mp5",false),0);
      MadnessLevel.myRooms[15].myRosters[0].myActiveMembers[0].myWeapons[0].myClips = 3;
      MadnessLevel.myRooms[15].myRosters[0].myActiveMembers[0].giveItem(ItemGenerator.createWeapon("mallet",false),1);
      this.createRoster(MadnessLevel.myRooms[14],["agent","agent"],"enemy","ranged",4);
      this.addEvent(MadnessLevel.myRooms[14].myRosters[1],MadnessEvents.world_0_5_14_A);
      this.addItem(MadnessLevel.myRooms[1].myActivators[0],ItemGenerator.createWeapon("glock20",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[0],ItemGenerator.createWeapon("glock20",false));
      this.addItem(MadnessLevel.myRooms[5].myActivators[0],ItemGenerator.createWeapon("bowieknife",false));
      this.addItem(MadnessLevel.myRooms[5].myActivators[0],ItemGenerator.createWeapon("ironsword",false));
      this.addItem(MadnessLevel.myRooms[5].myActivators[0],ItemGenerator.createWeapon("hk2",false));
      this.addItem(MadnessLevel.myRooms[9].myActivators[0],ItemGenerator.createWeapon("ak74u",false));
      this.addItem(MadnessLevel.myRooms[9].myActivators[0],ItemGenerator.createWeapon("carbonsword",false));
      this.addItem(MadnessLevel.myRooms[12].myActivators[0],ItemGenerator.createWeapon("ak74",false));
      this.addItem(MadnessLevel.myRooms[12].myActivators[2],ItemGenerator.createWeapon("prokiller460",false));
      this.addItem(MadnessLevel.myRooms[12].myActivators[2],ItemGenerator.createWeapon("prokiller460",false));
      this.makeObjective(MadnessLevel.myRooms[14],"clear",true,false);
      this.applyTrack("stage6",this);
   }
   function level0_6()
   {
      this.myName = "[1-G] Bar";
      this.myDescription = " It\'s time to prepare for the final assault on the Nexus Headquarters. A nearby bar is operating as a front for a munitions depot, and hitting this location will benefit us twofold: we\'ll be well-equipped for the final battle, and Nexus morale will plummet.";
      this.myDifficulty = 4;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hook",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",true),1);
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",true),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("beretta",true),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      MadnessLevel.totalRooms = 10;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,3,2,2,3,3,2,2,4];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"left");
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"down");
      this.setDoorDir(2,2,"left");
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"left");
      this.setDoorDir(4,0,"right");
      this.setDoorDir(4,1,"left");
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"down");
      this.setDoorDir(5,2,"left");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(6,1,"down");
      this.setDoorDir(6,2,"left");
      this.setDoorDir(7,0,"right");
      this.setDoorDir(7,1,"down");
      this.setDoorDir(8,0,"right");
      this.setDoorDir(8,1,"left");
      this.setDoorDir(9,0,"right");
      this.setDoorDir(9,1,"down");
      this.setDoorDir(9,2,"down");
      this.setDoorDir(9,3,"left");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(2,2,"---",4,0);
      this.connectDoors(4,1,"---",5,0);
      this.connectDoors(5,2,"---",6,0);
      this.connectDoors(6,2,"---",7,0);
      this.connectDoors(7,1,"---",8,0);
      this.connectDoors(8,1,"---",9,0);
      this.addActivator(2,"lockerLeft");
      this.addActivator(3,"lockerRight");
      this.addActivator(3,"lockerRight");
      this.addActivator(3,"lockerRight");
      this.addActivator(6,"lockerRight");
      this.addObstacle(1,"empty0");
      this.addObstacle(1,"empty3");
      this.addObstacle(2,"empty1");
      this.addObstacle(4,"empty1");
      this.addObstacle(6,"empty3");
      this.addObstacle(6,"empty0");
      this.addObstacle(7,"empty0");
      this.addObstacle(7,"empty0");
      this.addObstacle(7,"empty3");
      this.addObstacle(7,"empty3");
      this.addObstacle(7,"empty3");
      this.addObstacle(8,"empty4");
      this.addObstacle(9,"empty3");
      this.addObstacle(9,"empty3");
      this.addObstacle(9,"empty0");
      this.addObstacle(9,"empty0");
      this.addObstacle(9,"empty0");
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[0],"agent","enemy","ranged",10,true,2);
      this.endStartNPC();
      this.createRoster(MadnessLevel.myRooms[0],["agent","agent","agent"],"enemy","unarmed",2);
      this.createRoster(MadnessLevel.myRooms[0],["agent","agent"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[0],["agent","agent","agent"],"enemy","melee",2);
      this.createRoster(MadnessLevel.myRooms[0],["agent2","agent2","agent2"],"enemy","melee",15);
      this.createNPC(MadnessLevel.myRooms[1],"agent","enemy","ranged",6,true,4);
      this.createRoster(MadnessLevel.myRooms[1],["agent2","agent2","agent"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[1],["agent2","agent"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[2],"agent","enemy","ranged",6,true,2);
      this.createNPC(MadnessLevel.myRooms[2],"agent2","enemy","ranged",6,true,1);
      this.createNPC(MadnessLevel.myRooms[3],"agent","enemy","ranged",3,true,2);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent2","agent","agent"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[3],["agent","agent","agent"],"enemy","ranged",6);
      this.createNPC(MadnessLevel.myRooms[4],"agent","enemy","ranged",3,true,2);
      this.createNPC(MadnessLevel.myRooms[4],"agent3","enemy","ranged",6,true,1);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent2","agent"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[4],["agent2","agent"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent2","agent"],"enemy","melee",8);
      this.createRoster(MadnessLevel.myRooms[4],["fatboy"],"enemy","fatboy",10);
      MadnessLevel.myRooms[4].myRosters[3].myActiveMembers[0].giveItem(ItemGenerator.createWeapon("mp5",false),0);
      MadnessLevel.myRooms[4].myRosters[3].myActiveMembers[0].myWeapons[0].myClips = 3;
      MadnessLevel.myRooms[4].myRosters[3].myActiveMembers[0].giveItem(ItemGenerator.createWeapon("mallet",false),1);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent"],"enemy","ranged",5);
      this.addEvent(MadnessLevel.myRooms[4].myRosters[4],MadnessEvents.world_0_6_4_A);
      this.createNPC(MadnessLevel.myRooms[5],"agent","enemy","ranged",5,true,4);
      this.createRoster(MadnessLevel.myRooms[5],["agent2","agent2"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[5],["agent2","agent","agent","agent","agent"],"enemy","ranged",4);
      this.setStartup("startup_bottle2",1);
      this.createNPC(MadnessLevel.myRooms[6],"civ","enemy","bottle",5,false,3);
      this.createRoster(MadnessLevel.myRooms[6],["civ","civ","civ"],"enemy","bottle",5);
      this.createRoster(MadnessLevel.myRooms[6],["civ","civ"],"enemy","bottle",4);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[7],"civ","enemy","bottle",5,false,3);
      this.createNPC(MadnessLevel.myRooms[7],"luis","enemy","bottle",5,false,1);
      this.createNPC(MadnessLevel.myRooms[7],"swain","enemy","bottle",5,false,1);
      this.createNPC(MadnessLevel.myRooms[7],"krinkels","enemy","bottle",5,false,1);
      this.createNPC(MadnessLevel.myRooms[7],"cheshyre","enemy","bottle",5,false,1);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ"],"enemy","bottle",5);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ"],"enemy","bottle",4);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ","civ"],"enemy","bottle",5);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ","civ","civ"],"enemy","bottle",4);
      this.createRoster(MadnessLevel.myRooms[7],["civ","civ","civ","civ"],"enemy","bottle",5);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[8],"civ","enemy","bottle",5,false,4);
      this.createRoster(MadnessLevel.myRooms[8],["civ","civ","civ"],"enemy","bottle",5);
      this.createRoster(MadnessLevel.myRooms[8],["civ","civ","civ","civ"],"enemy","bottle",5);
      this.createRoster(MadnessLevel.myRooms[8],["civ","civ","civ"],"enemy","bottle",5);
      this.resetStartup();
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[9],"fatman","enemy","unarmed",5,false,1);
      MadnessLevel.myRooms[9].myCharacters[0].giveItem(ItemGenerator.createWeapon("megahammer",false),0);
      MadnessLevel.myRooms[9].myCharacters[0].giveItem(ItemGenerator.createWeapon("chaingun",false),1);
      this.endStartNPC();
      this.setStartup("startup_bottle2",1);
      this.createNPC(MadnessLevel.myRooms[9],"civ","enemy","bottle",5,false,8);
      this.resetStartup();
      this.createRoster(MadnessLevel.myRooms[9],["agent","agent","agent","agent2"],"enemy","ranged",7);
      this.addEvent(MadnessLevel.myRooms[9].myRosters[0],MadnessEvents.world_0_6_9_A);
      this.addItem(MadnessLevel.myRooms[2].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[2].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[2].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[1],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[1],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[1],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[3].myActivators[2],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[6].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[6].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.addItem(MadnessLevel.myRooms[6].myActivators[0],ItemGenerator.createWeapon("bottle",false));
      this.makeObjective(MadnessLevel.myRooms[9],"clear",true,false);
      this.applyTrack("club1",this);
      this.applyTrack("club2",MadnessLevel.myRooms[0]);
      this.applyTrack("boss1",MadnessLevel.myRooms[9]);
   }
   function level0_7()
   {
      this.myName = "[1-H] Nexus H.Q.";
      this.myDescription = " Agents Sanford and Deimos will follow Hank into the heart of Project Nexus and eliminate all threats. The Nexus Training Program is still a mystery to us. Discover what you can, and take no prisoners.";
      this.myDifficulty = 4;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("hank");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("dragonsword",false),1);
      _loc2_.myWeapons[0].myClips = 4;
      _loc2_.myStartup = "startup3";
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("sanford");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hook",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",true),1);
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("deimos");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",true),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("beretta",true),1);
      _loc2_.myWeapons[0].upgradeSight = true;
      _loc2_.myWeapons[0].upgradeLaser = true;
      _loc2_.myWeapons[0].myColor = 1;
      _loc2_.myWeapons[1].upgradeSight = false;
      _loc2_.myWeapons[1].upgradeLaser = true;
      _loc2_.myWeapons[1].myColor = 1;
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[0]);
      ItemGenerator.applyUpgrades(_loc2_.myWeapons[1]);
      MadnessLevel.totalRooms = 16;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,2,3,2,2,3,1,2,3,2,2,3,2,2,3];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir(0,0,"left");
      this.setDoorDir(1,0,"right");
      this.setDoorDir(1,1,"left");
      this.setDoorDir(2,0,"right");
      this.setDoorDir(2,1,"left");
      this.setDoorDir(3,0,"right");
      this.setDoorDir(3,1,"down");
      this.setDoorDir(3,2,"left");
      this.setDoorDir(4,0,"down");
      this.setDoorDir(4,1,"left");
      this.setDoorDir(5,0,"right");
      this.setDoorDir(5,1,"left");
      this.setDoorDir(6,0,"right");
      this.setDoorDir(6,1,"down");
      this.setDoorDir(6,2,"left");
      this.setDoorDir(7,0,"left");
      this.setDoorDir(8,0,"right");
      this.setDoorDir(8,1,"left");
      this.setDoorDir(9,0,"right");
      this.setDoorDir(9,1,"down");
      this.setDoorDir(9,2,"left");
      this.setDoorDir(10,0,"down");
      this.setDoorDir(10,1,"left");
      this.setDoorDir(11,0,"right");
      this.setDoorDir(11,1,"left");
      this.setDoorDir(12,0,"right");
      this.setDoorDir(12,1,"down");
      this.setDoorDir(12,2,"left");
      this.setDoorDir(13,0,"right");
      this.setDoorDir(13,1,"left");
      this.setDoorDir(14,0,"right");
      this.setDoorDir(14,1,"left");
      this.setDoorDir(15,0,"right");
      this.setDoorDir(15,1,"down1");
      this.setDoorDir(15,2,"down2");
      this.setDoorType(15,1,"elevator");
      this.setDoorType(15,2,"elevator");
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,1);
      this.connectDoors(3,0,"---",4,1);
      this.connectDoors(3,2,"---",5,0);
      this.connectDoors(5,1,"---",6,1);
      this.connectDoors(6,0,"---",7,0);
      this.connectDoors(6,2,"---",8,0);
      this.connectDoors(8,1,"---",9,1);
      this.connectDoors(9,0,"---",10,1);
      this.connectDoors(9,2,"---",11,0);
      this.connectDoors(11,1,"---",12,1);
      this.connectDoors(12,0,"---",13,1);
      this.connectDoors(12,2,"---",14,0);
      this.connectDoors(14,1,"---",15,0);
      this.addActivator(4,"terminalLeft");
      this.addEvent(MadnessLevel.myRooms[4].myActivators[0],MadnessEvents.world_0_7_4_A);
      this.addActivator(4,"wallsafe");
      this.addActivator(7,"terminalLeft");
      this.addEvent(MadnessLevel.myRooms[7].myActivators[0],MadnessEvents.world_0_7_7_A);
      this.addActivator(7,"lockerRight");
      this.addActivator(7,"lockerRight");
      this.addActivator(10,"terminalLeft");
      this.addEvent(MadnessLevel.myRooms[10].myActivators[0],MadnessEvents.world_0_7_10_A);
      this.addActivator(13,"terminalLeft");
      this.addEvent(MadnessLevel.myRooms[13].myActivators[0],MadnessEvents.world_0_7_13_A);
      this.addActivator(14,"lockerLeft");
      this.addItem(MadnessLevel.myRooms[4].myActivators[1],ItemGenerator.createWeapon("binarysword",false));
      this.addItem(MadnessLevel.myRooms[7].myActivators[1],ItemGenerator.createWeapon("deagle",false));
      this.addItem(MadnessLevel.myRooms[7].myActivators[1],ItemGenerator.createWeapon("dragonsword",false));
      this.addItem(MadnessLevel.myRooms[7].myActivators[2],ItemGenerator.createWeapon("mp5",false));
      this.addItem(MadnessLevel.myRooms[7].myActivators[2],ItemGenerator.createWeapon("mp7",false));
      this.addItem(MadnessLevel.myRooms[14].myActivators[0],ItemGenerator.createWeapon("ar15",false));
      this.addItem(MadnessLevel.myRooms[14].myActivators[0],ItemGenerator.createWeapon("m16",false));
      this.addItem(MadnessLevel.myRooms[14].myActivators[0],ItemGenerator.createWeapon("hk416",false));
      this.addObstacle(1,"empty4");
      this.addObstacle(1,"empty1");
      this.addObstacle(3,"spikes1");
      this.addObstacle(4,"empty4");
      this.addObstacle(4,"empty4");
      this.addObstacle(5,"empty0");
      this.addObstacle(6,"spikes1");
      this.addObstacle(7,"empty4");
      this.addObstacle(7,"empty0");
      this.addObstacle(9,"spikes1");
      this.addObstacle(10,"empty1");
      this.addObstacle(11,"empty0");
      this.addObstacle(12,"spikes1");
      this.addObstacle(12,"empty1");
      this.addObstacle(13,"empty4");
      this.addObstacle(14,"empty1");
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[0],"agent","enemy","ranged",8,false,3);
      this.createNPC(MadnessLevel.myRooms[0],"agent2","enemy","ranged",14,false,1);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[1],"agent2","enemy","ranged",8,false,3);
      this.createNPC(MadnessLevel.myRooms[1],"agent3","enemy","ranged",14,false,1);
      this.createRoster(MadnessLevel.myRooms[1],["agent","agent","agent"],"enemy","melee",12);
      this.createRoster(MadnessLevel.myRooms[1],["agent","agent2","agent2"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[2],"agent2","enemy","ranged",10,false,3);
      this.createRoster(MadnessLevel.myRooms[2],["agent","agent","agent"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[2],["agent","agent2"],"enemy","melee",12);
      this.createRoster(MadnessLevel.myRooms[2],["agent","agent","agent"],"enemy","melee",4);
      this.createRoster(MadnessLevel.myRooms[2],["agent","agent2","agent3"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[4],"agent2","enemy","ranged",8,false,4);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent","agent"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[4],["agent","agent","agent3"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[5],"agent","enemy","ranged",8,false,1);
      this.createNPC(MadnessLevel.myRooms[5],"agent2","enemy","melee",12,false,2);
      this.createNPC(MadnessLevel.myRooms[7],"agent2","enemy","ranged",8,false,4);
      this.createNPC(MadnessLevel.myRooms[8],"agent","enemy","ranged",8,false,1);
      this.createNPC(MadnessLevel.myRooms[8],"agent2","enemy","melee",15,false,2);
      this.createRoster(MadnessLevel.myRooms[8],["agent","agent","agent"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[8],["agent2","agent2","agent"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[10],"agent2","enemy","melee",18,false,7);
      this.createNPC(MadnessLevel.myRooms[11],"agent2","enemy","ranged",10,false,2);
      this.createNPC(MadnessLevel.myRooms[11],"agent3","enemy","ranged",17,false,1);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","agent","agent","agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","agent","agent","agent"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","agent","agent"],"enemy","ranged",3);
      this.createRoster(MadnessLevel.myRooms[11],["agent","agent","agent","agent","agent"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[13],"agent3","enemy","ranged",8,false,3);
      this.createRoster(MadnessLevel.myRooms[13],["agent","agent","agent2"],"enemy","melee",3);
      this.createRoster(MadnessLevel.myRooms[13],["agent","agent"],"enemy","ranged",5);
      this.createNPC(MadnessLevel.myRooms[14],"agent2","enemy","melee",8,false,2);
      this.createNPC(MadnessLevel.myRooms[14],"agent3","enemy","ranged",19,false,2);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[15],"mag","enemy","melee",8,true,1);
      MadnessLevel.myRooms[15].myCharacters[0].giveItem(ItemGenerator.createWeapon("ppkmag",false),0);
      MadnessLevel.myRooms[15].myCharacters[0].myWeapons[0].myClips = 9999999;
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[15],"agent2","enemy","melee",8,false,6);
      this.createNPC(MadnessLevel.myRooms[14],"agent","enemy","ranged",19,false,5);
      this.createRoster(MadnessLevel.myRooms[15],["agent","agent","agent","agent","agent"],"enemy","ranged",3);
      this.addEvent(MadnessLevel.myRooms[15].myRosters[0],MadnessEvents.world_0_7_15_A);
      this.makeObjective(MadnessLevel.myRooms[15],"clear",true,false);
      this.applyTrack("stage8",this);
      this.applyTrack("boss1",MadnessLevel.myRooms[15]);
      this.myCutsceneEnd = "cutscene_world0_end";
   }
   function level1_0()
   {
      this.myName = "[1.5-A] Sci-Post";
      this.myDescription = " Fifteen years ago, Project Nexus was the highlight of Nevada\'s research into ressurective cloning, thanks to the efforts of Dr.Christoff, the program\'s chief scientist. Reports vary, but something is said to have gone terribly wrong...";
      this.myDifficulty = 4;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("jesus2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.bodyType = "scientist";
      MadnessLevel.totalRooms = 16;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,3,3,3,2,3,1,3,2,2,3,2,3,2,1];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[15]);
      this.setDoorDir2(0,["right"]);
      this.setDoorDir2(1,["right","left"]);
      this.setDoorDir2(2,["right","left","down"]);
      this.setDoorDir2(3,["right","down","left"]);
      this.setDoorDir2(4,["right","down","left"]);
      this.setDoorDir2(5,["right","left"]);
      this.disableDoorSpawn(5,0);
      this.setDoorDir2(6,["right","down","left"]);
      this.disableDoorSpawn(6,0);
      this.setDoorDir2(7,["left"]);
      this.setDoorDir2(8,["right","down","left"]);
      this.disableDoorSpawn(8,2);
      this.setDoorDir2(9,["right","left"]);
      this.setDoorDir2(10,["right","left"]);
      this.lockDoor(10,0);
      this.setDoorDir2(11,["right","down","down"]);
      this.disableDoorSpawn(11,2);
      this.setDoorDir2(12,["right","left"]);
      this.setDoorDir2(13,["right","down","down"]);
      this.lockDoor(13,2);
      this.disableDoorSpawn(13,0);
      this.setDoorDir2(14,["right","left"]);
      this.setDoorDir2(15,["left"]);
      this.lockDoor(15,0);
      this.connectDoors(0,0,"---",1,1);
      this.connectDoors(1,0,"---",2,1);
      this.connectDoors(2,0,"---",3,2);
      this.connectDoors(3,1,"---",4,0);
      this.connectDoors(3,0,"---",5,1);
      this.connectDoors(5,0,"---",6,2);
      this.connectDoors(6,1,"---",7,0);
      this.connectDoors(6,0,"---",8,0);
      this.connectDoors(8,1,"---",9,0);
      this.connectDoors(8,2,"---",10,0);
      this.connectDoors(10,1,"---",11,0);
      this.connectDoors(11,1,"---",12,0);
      this.connectDoors(11,2,"---",13,2);
      this.connectDoors(13,1,"---",14,0);
      this.connectDoors(13,0,"---",15,0);
      this.addEvent(MadnessLevel.myRooms[15],MadnessEvents.world_1_0_15);
      this.addEvent(MadnessLevel.myRooms[14],MadnessEvents.world_1_0_14);
      this.addEvent(MadnessLevel.myRooms[11],MadnessEvents.world_1_0_11);
      this.addEvent(MadnessLevel.myRooms[8],MadnessEvents.world_1_0_8);
      this.addEvent(MadnessLevel.myRooms[1],MadnessEvents.world_1_0_1);
      this.addActivator(1,"lockerLeft");
      this.addActivator(4,"lockerLeft");
      this.addActivator(5,"lockerLeft");
      this.addActivator(5,"lockerRight");
      this.addActivator(6,"lockerLeft");
      this.addActivator(7,"lockerLeft");
      this.addActivator(7,"lockerLeft");
      this.addActivator(8,"lockerRight");
      this.addActivator(9,"lockerLeft");
      this.addActivator(9,"lockerLeft");
      this.addActivator(10,"lockerLeft");
      this.addActivator(10,"terminal2Right");
      this.addEvent(MadnessLevel.myRooms[10].myActivators[1],MadnessEvents.world_1_0_10);
      this.addActivator(14,"lockerLeft");
      this.addActivator(14,"lockerRight");
      this.addActivator2(15,["terminal2Left","lockerLeft"]);
      this.addEvent(MadnessLevel.myRooms[15].myActivators[0],MadnessEvents.world_1_0_15c);
      this.addWeaponToLocker(15,1,["ppk","bowieknife","glock20"]);
      this.addWeaponToLocker(14,0,["97k","ironknife"]);
      this.addWeaponToLocker(14,1,["500snub","357snub"]);
      this.addWeaponToLocker(10,0,["baton","baton","baton"]);
      this.addWeaponToLocker(9,1,["prokiller460"]);
      this.addWeaponToLocker(7,1,["browning","glock20","97k"]);
      this.addWeaponToLocker(6,0,["mp7"]);
      this.addWeaponToLocker(5,0,["mp5","oa93"]);
      this.addWeaponToLocker(5,1,["axe","spas12"]);
      this.addWeaponToLocker(1,0,["fiveseven","bowieknife"]);
      this.addSpawner2(5,["metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(5,0,"---",_loc2_,"timer",100,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(5,1,"---",_loc2_,"timer",40,true,"zombie");
      this.addSpawner2(10,["metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(10,0,"---",_loc2_,"open",1,false,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(10,1,"---",_loc2_,"open",1,false,"zombie");
      this.addSpawner2(13,["metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(13,0,"---",_loc2_,"timer",80,false,"zombie");
      this.addSpawner2(14,["metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(14,0,"---",_loc2_,"timer",80,false,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(14,1,"---",_loc2_,"timer",10,false,"zombie");
      this.addObstacle(5,"box1");
      this.addObstacle(14,"box1b");
      this.addObstacle(15,"box2");
      this.addObstacle(1,"empty4");
      this.addObstacle(1,"empty1");
      this.addObstacle(2,"empty4");
      this.addObstacle(3,"empty0");
      this.addObstacle(3,"empty1");
      this.addObstacle(4,"empty1");
      this.addObstacle(4,"empty0");
      this.addObstacle(5,"empty1");
      this.addObstacle(7,"empty1");
      this.addObstacle(7,"empty0");
      this.addObstacle(8,"empty1");
      this.addObstacle(9,"empty1");
      this.addObstacle(12,"empty1");
      this.addObstacle(13,"empty1");
      this.addObstacle(14,"empty4");
      this.addObstacle(15,"empty4");
      this.createNPC(MadnessLevel.myRooms[15],"scientist","player","lab",1,false,2);
      this.createNPC(MadnessLevel.myRooms[14],"scientist","player","lab",1,false,3);
      this.createNPC(MadnessLevel.myRooms[13],"scientist","player","lab",1,false,4);
      this.setStartup("stun_surprise",0);
      this.createNPC(MadnessLevel.myRooms[12],"zombie","zombie","unarmed",1,false,1);
      this.createRoster(MadnessLevel.myRooms[12],["scientist"],"player","lab",1);
      this.createRoster(MadnessLevel.myRooms[12],["zombie"],"zombie","zombie",1);
      this.createNPC(MadnessLevel.myRooms[11],"agent_classic","player","ranged",1,true,2);
      this.createNPC(MadnessLevel.myRooms[11],"scientist","player","lab",1,false,2);
      this.resetStartup();
      this.createNPC(MadnessLevel.myRooms[11],"zombie","zombie","unarmed",1,false,2);
      this.createNPC(MadnessLevel.myRooms[9],"scientist","player","lab",1,false,2);
      MadnessLevel.myRooms[9].myCharacters[0].traitBravery = MadnessLevel.myRooms[9].myCharacters[1].traitBravery = -1;
      this.createNPC(MadnessLevel.myRooms[9],"agent_classic","enemy","ranged",1,false,2);
      this.createRoster(MadnessLevel.myRooms[9],["zombie"],"zombie","zombie",2);
      this.createNPC(MadnessLevel.myRooms[8],"agent_classic","enemy","ranged",1,false,1);
      this.createNPC(MadnessLevel.myRooms[8],"scientist","player","lab",1,false,3);
      MadnessLevel.myRooms[8].myCharacters[1].traitBravery = MadnessLevel.myRooms[8].myCharacters[2].traitBravery = -1;
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",1);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[7],"scientist","player","lab",1,false,2);
      MadnessLevel.myRooms[7].myCharacters[0].traitBravery = MadnessLevel.myRooms[7].myCharacters[1].traitBravery = -1;
      this.createNPC(MadnessLevel.myRooms[6],"agent_classic","enemy","ranged",1,false,3);
      this.createRoster(MadnessLevel.myRooms[6],["agent_classic"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[5],"zombie","zombie","zombie",1,false,4);
      this.createRoster(MadnessLevel.myRooms[5],["agent_classic"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[4],"scientist","player","lab",1,false,2);
      MadnessLevel.myRooms[4].myCharacters[0].traitBravery = MadnessLevel.myRooms[4].myCharacters[1].traitBravery = -1;
      this.createNPC(MadnessLevel.myRooms[4],"agent_classic","enemy","ranged",1,false,3);
      this.createRoster(MadnessLevel.myRooms[4],["agent_classic","agent_classic"],"enemy","melee",2);
      this.createNPC(MadnessLevel.myRooms[3],"agent_classic","enemy","ranged",1,false,4);
      this.createRoster(MadnessLevel.myRooms[3],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[3],["agent_classic","agent_classic","agent_classic"],"enemy","melee",8);
      this.createNPC(MadnessLevel.myRooms[2],"scientist","player","lab",1,false,2);
      MadnessLevel.myRooms[2].myCharacters[0].traitBravery = MadnessLevel.myRooms[2].myCharacters[1].traitBravery = -1;
      this.createRoster(MadnessLevel.myRooms[2],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",9);
      this.createRoster(MadnessLevel.myRooms[2],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",6);
      this.setStartup("stun_surprise",0);
      this.createNPC(MadnessLevel.myRooms[1],"agent_classic","enemy","ranged",1,false,4);
      this.resetStartup();
      this.createRoster(MadnessLevel.myRooms[1],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",6);
      this.addEvent(MadnessLevel.myRooms[1].myRosters[0],MadnessEvents.world_1_0_1c);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[0],"agent_classic","enemy","ranged",1,false,4);
      this.endStartNPC();
      this.createRoster(MadnessLevel.myRooms[0],["zombie","zombie","zombie_scientist"],"zombie","zombie",6);
      this.createRoster(MadnessLevel.myRooms[0],["zombie_scientist"],"zombie","lab",1);
      this.createRoster(MadnessLevel.myRooms[0],["zombie_agent_classic","zombie","zombie_scientist"],"zombie","zombie",6);
      this.makeObjective(MadnessLevel.myRooms[0],"clear",true,false);
      this.myCutsceneStart = "cutscene_world1_start";
      this.applyTrack("menu",this);
   }
   function level1_1()
   {
      this.myName = "[1.5-B] Quarters";
      this.myDescription = " In the distance lay the Science Tower, the seat of all Nexus research, and only the eccentric Dr.Hofnarr had high-level access. Christoff\'s treason would be short-lived if Hofnarr could not be convinced to turn against the organization.";
      this.myDifficulty = 3;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("jesus2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("glock20",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("carbonsword",false),1);
      _loc2_.myWeapons[0].myClips = 3;
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("tricky2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("ironknife",false),1);
      MadnessLevel.totalRooms = 17;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,3,2,3,3,2,3,3,2,1,2,3,1,3,2,2,1];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir2(0,["left"]);
      this.setDoorDir2(1,["right","down","left"]);
      this.setDoorDir2(2,["right","down"]);
      this.setDoorDir2(3,["right","left","down"]);
      this.setDoorDir2(4,["right","left","down"]);
      this.setDoorDir2(5,["right","left"]);
      this.setDoorDir2(6,["right","down","left"]);
      this.setDoorDir2(7,["right","down","left"]);
      this.setDoorDir2(8,["right","left"]);
      this.setDoorDir2(9,["right"]);
      this.setDoorDir2(10,["right","down"]);
      this.setDoorDir2(11,["right","down","left"]);
      this.setDoorDir2(12,["right"]);
      this.setDoorDir2(13,["right","down","left"]);
      this.lockDoor(13,0);
      this.setDoorDir2(14,["right","left"]);
      this.setDoorDir2(15,["right","left"]);
      this.setDoorDir2(16,["left"]);
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(1,2,"---",3,0);
      this.connectDoors(3,1,"---",4,0);
      this.connectDoors(4,1,"---",5,0);
      this.connectDoors(5,1,"---",6,0);
      this.connectDoors(6,1,"---",7,0);
      this.connectDoors(6,2,"---",10,0);
      this.connectDoors(7,1,"---",8,0);
      this.connectDoors(7,2,"---",9,0);
      this.connectDoors(10,1,"---",11,0);
      this.connectDoors(11,2,"---",12,0);
      this.connectDoors(11,1,"---",13,1);
      this.connectDoors(13,2,"---",14,0);
      this.connectDoors(13,0,"---",15,1);
      this.connectDoors(15,0,"---",16,0);
      this.addEvent(MadnessLevel.myRooms[0],MadnessEvents.world_1_1_0);
      this.addEvent(MadnessLevel.myRooms[1],MadnessEvents.world_1_1_1);
      this.addEvent(MadnessLevel.myRooms[6],MadnessEvents.world_1_1_6b);
      this.addEvent(MadnessLevel.myRooms[8],MadnessEvents.world_1_1_8);
      this.addEvent(MadnessLevel.myRooms[15],MadnessEvents.world_1_1_15);
      this.addEvent(MadnessLevel.myRooms[16],MadnessEvents.world_1_1_16);
      this.addActivator2(2,["lockerRight","lockerRight","lockerRight"]);
      this.addActivator2(3,["lockerRight"]);
      this.addActivator2(4,["lockerRight"]);
      this.addActivator2(6,["terminalRightAI"]);
      this.connectActivator(6,0,"---",MadnessLevel.myRooms[6].myDoors[2],"unlock");
      this.addActivator2(7,["lockerLeft","lockerLeft"]);
      this.addActivator2(9,["lockerRight","lockerRight"]);
      this.addActivator2(12,["lockerRight"]);
      this.addActivator2(14,["lockerRight","terminalRightAI"]);
      this.connectActivator(14,1,"---",MadnessLevel.myRooms[13].myDoors[0],"unlock");
      this.addActivator2(16,["lockerLeft","terminalLeftAI"]);
      this.addWeaponToLocker(2,0,["mp7","fiveseven"]);
      this.addWeaponToLocker(2,2,["deagle"]);
      this.addWeaponToLocker(3,0,["l337sword"]);
      this.addWeaponToLocker(4,0,["glock20","prokiller460"]);
      this.addWeaponToLocker(7,0,["browning","fiveseven"]);
      this.addWeaponToLocker(9,1,["fiveseven"]);
      this.addWeaponToLocker(12,0,["browning","carbonsword"]);
      this.addWeaponToLocker(14,0,["500snub","uzi"]);
      this.addWeaponToLocker(16,0,["pipe","baton","ppk"]);
      this.addObstacle(10,"box2b");
      this.addObstacle(10,"box1");
      this.addObstacle(16,"box1");
      this.addObstacle(1,"empty1");
      this.addObstacle(1,"empty4");
      this.addObstacle(2,"empty4");
      this.addObstacle(3,"empty1");
      this.addObstacle(4,"empty4");
      this.addObstacle(4,"empty1");
      this.addObstacle(5,"empty3");
      this.addObstacle(5,"empty1");
      this.addObstacle(8,"empty4");
      this.addObstacle(8,"empty3");
      this.addObstacle(9,"empty4");
      this.addObstacle(10,"empty4");
      this.addObstacle(10,"empty3");
      this.addObstacle(12,"empty0");
      this.addObstacle(12,"empty4");
      this.addObstacle(13,"empty0");
      this.addObstacle(14,"empty1");
      this.addObstacle(15,"empty1");
      this.addObstacle(15,"empty4");
      this.addObstacle(15,"empty1");
      this.setStartup("stun_surprise",0);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[1],"agent_classic","enemy","ranged",1,true,3);
      this.createNPC(MadnessLevel.myRooms[1],"scientist","neutral","lab",1,false,2);
      MadnessLevel.myRooms[1].myCharacters[3].traitBravery = MadnessLevel.myRooms[1].myCharacters[4].traitBravery = -1;
      this.endStartNPC();
      this.resetStartup();
      this.createRoster(MadnessLevel.myRooms[1],["agent_classic","agent_classic","agent_classic"],"enemy","melee",1);
      this.createNPC(MadnessLevel.myRooms[2],"agent_classic","enemy","ranged",1,true,2);
      this.createRoster(MadnessLevel.myRooms[2],["agent_classic","agent_classic"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[3],"agent_classic","enemy","ranged",1,true,2);
      this.createRoster(MadnessLevel.myRooms[3],["agent_classic","agent_classic"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[4],"scientist","neutral","lab",1,false,2);
      MadnessLevel.myRooms[4].myCharacters[0].traitBravery = MadnessLevel.myRooms[4].myCharacters[1].traitBravery = -1;
      this.createNPC(MadnessLevel.myRooms[4],"agent_classic","enemy","ranged",2,true,2);
      this.createRoster(MadnessLevel.myRooms[4],["agent_classic","agent_classic"],"enemy","ranged",2);
      this.createNPC(MadnessLevel.myRooms[5],"agent_classic","enemy","ranged",3,true,3);
      this.createRoster(MadnessLevel.myRooms[5],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",4);
      this.createNPC(MadnessLevel.myRooms[7],"scientist","neutral","lab",1,false,4);
      MadnessLevel.myRooms[7].myCharacters[0].traitBravery = MadnessLevel.myRooms[7].myCharacters[1].traitBravery = MadnessLevel.myRooms[7].myCharacters[2].traitBravery = -1;
      this.createNPC(MadnessLevel.myRooms[9],"scientist","neutral","lab",1,false,2);
      MadnessLevel.myRooms[8].myCharacters[0].traitBravery = MadnessLevel.myRooms[8].myCharacters[1].traitBravery = -1;
      this.createNPC(MadnessLevel.myRooms[9],"agent_classic","enemy","ranged",4,true,1);
      this.createRoster(MadnessLevel.myRooms[9],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",2);
      this.createRoster(MadnessLevel.myRooms[9],["agent_classic","agent_classic"],"enemy","melee",9);
      this.createRoster(MadnessLevel.myRooms[9],["agent_classic","agent_classic"],"enemy","ranged",4);
      this.addNPC(MadnessLevel.myRooms[8],MadnessRoster.playerRoster.myMembers[1],true);
      this.createNPC(MadnessLevel.myRooms[10],"agent_classic","enemy","ranged",4,true,3);
      this.createRoster(MadnessLevel.myRooms[10],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[10],["agent_classic","agent_classic"],"enemy","melee",12);
      this.createRoster(MadnessLevel.myRooms[10],["agent_classic","agent_classic","riot"],"enemy","ranged",6);
      this.createNPC(MadnessLevel.myRooms[11],"riot","enemy","ranged",10,true,2);
      this.createNPC(MadnessLevel.myRooms[11],"agent_classic","enemy","ranged",5,true,2);
      this.createNPC(MadnessLevel.myRooms[12],"agent_classic","enemy","ranged",4,true,3);
      this.createRoster(MadnessLevel.myRooms[12],["agent_classic","agent_classic"],"enemy","melee",12);
      this.createNPC(MadnessLevel.myRooms[13],"agent_classic","enemy","ranged",2,true,4);
      this.createNPC(MadnessLevel.myRooms[14],"agent_classic","enemy","melee",2,true,3);
      this.createNPC(MadnessLevel.myRooms[14],"riot","enemy","ranged",9,true,1);
      this.createNPC(MadnessLevel.myRooms[15],"agent_classic","enemy","ranged",2,true,3);
      this.createRoster(MadnessLevel.myRooms[15],["riot","riot"],"enemy","ranged",10);
      this.createRoster(MadnessLevel.myRooms[15],["riot","agent_classic"],"enemy","ranged",10);
      this.createNPC(MadnessLevel.myRooms[16],"agent_classic","enemy","melee",2,true,6);
      this.createNPC(MadnessLevel.myRooms[16],"riot","enemy","ranged",9,true,2);
      this.makeObjective(MadnessLevel.myRooms[16].myActivators[1],"use",true,false);
      this.makeObjective(MadnessLevel.myRooms[16],"clear",true,false);
      this.makeObjective(MadnessLevel.myRooms[8].myCharacters[0],"survive",true,false);
      this.applyTrack("stage2",this);
      this.applyTrack("menu",MadnessLevel.myRooms[0]);
   }
   function level1_2()
   {
      this.myName = "[1.5-C] Muto-Lab";
      this.myDescription = " Once again on his own, Dr.Christoff began his race to the top of the tower. The outbreak would not be contained for long, and the experiments of Project Nexus proved to be more dangerous than their creators.";
      this.myDifficulty = 3;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("jesus2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("deagle",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("ironsword",false),1);
      _loc2_.myWeapons[0].myClips = 3;
      _loc2_.myStartup = "startup3";
      _loc2_.createArmor("shades12");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("tricky2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("ironknife",false),1);
      MadnessLevel.totalRooms = 21;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [1,2,2,4,2,2,2,1,3,2,2,3,2,2,2,2,3,3,1,2,2];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPoint(MadnessLevel.myRooms[0]);
      this.setDoorDir2(0,["left"]);
      this.lockDoor(0,0);
      this.setDoorDir2(1,["right","left"]);
      this.setDoorDir2(2,["right","left"]);
      this.setDoorDir2(3,["right","down","down","left"]);
      this.setDoorDir2(4,["right","left"]);
      this.setDoorDir2(5,["left","right"]);
      this.setDoorDir2(6,["right","left"]);
      this.setDoorDir2(7,["right"]);
      this.setDoorDir2(8,["right","left","down"]);
      this.setDoorDir2(9,["right","left"]);
      this.setDoorDir2(10,["right","down"]);
      this.setDoorDir2(11,["right","down","left"]);
      this.setDoorDir2(12,["right","left"]);
      this.setDoorDir2(13,["right","left"]);
      this.setDoorDir2(14,["right","left"]);
      this.setDoorDir2(15,["right","left"]);
      this.setDoorDir2(16,["right","down","left"]);
      this.setDoorDir2(17,["right","left","down"]);
      this.setDoorDir2(18,["right"]);
      this.setDoorDir2(19,["right","left"]);
      this.setDoorDir2(20,["down","left"]);
      this.connectDoors(0,0,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(3,1,"---",4,1);
      this.connectDoors(3,2,"---",6,0);
      this.connectDoors(3,3,"---",8,0);
      this.connectDoors(4,0,"---",5,0);
      this.connectDoors(6,1,"---",7,0);
      this.connectDoors(8,1,"---",9,0);
      this.connectDoors(9,1,"---",10,0);
      this.connectDoors(10,1,"---",11,1);
      this.connectDoors(11,2,"---",12,0);
      this.connectDoors(11,0,"---",15,1);
      this.connectDoors(12,1,"---",13,0);
      this.connectDoors(13,1,"---",14,0);
      this.connectDoors(15,0,"---",16,2);
      this.connectDoors(16,1,"---",17,0);
      this.connectDoors(16,0,"---",19,1);
      this.connectDoors(17,1,"---",18,0);
      this.connectDoors(19,0,"---",20,1);
      this.addEvent(MadnessLevel.myRooms[0],MadnessEvents.world_1_2_0);
      this.addEvent(MadnessLevel.myRooms[1],MadnessEvents.world_1_2_1);
      this.addEvent(MadnessLevel.myRooms[2],MadnessEvents.world_1_2_2);
      this.addEvent(MadnessLevel.myRooms[8],MadnessEvents.world_1_2_8);
      this.addEvent(MadnessLevel.myRooms[9],MadnessEvents.world_1_2_9);
      this.addActivator2(0,["panelAI"]);
      this.addEvent(MadnessLevel.myRooms[0].myActivators[0],MadnessEvents.world_1_2_0b);
      this.addActivator2(2,["terminalRight","terminalRight"]);
      this.addActivator2(4,["lockerLeft","lockerLeft"]);
      this.addActivator2(5,["terminal2Left"]);
      this.addEvent(MadnessLevel.myRooms[5].myActivators[0],MadnessEvents.world_1_2_spikes1);
      this.addActivator2(6,["lockerLeft"]);
      this.addActivator2(7,["lockerRight","terminal2Right"]);
      this.addEvent(MadnessLevel.myRooms[7].myActivators[1],MadnessEvents.world_1_2_spikes2);
      this.addActivator2(13,["lockerLeft"]);
      this.addActivator2(14,["lockerLeft","lockerLeft","terminal2Right"]);
      this.addEvent(MadnessLevel.myRooms[14].myActivators[2],MadnessEvents.world_1_2_spikes3);
      this.addActivator2(15,["lockerRight"]);
      this.addActivator2(16,["lockerLeft"]);
      this.addActivator2(17,["lockerRight"]);
      this.addActivator2(18,["terminal2Right"]);
      this.addEvent(MadnessLevel.myRooms[18].myActivators[0],MadnessEvents.world_1_2_spikes4);
      this.addActivator2(19,["lockerRight"]);
      this.addWeaponToLocker(4,0,["prokiller460","switchblade"]);
      this.addWeaponToLocker(4,1,["machette","hammer"]);
      this.addWeaponToLocker(6,0,["beretta","357long"]);
      this.addWeaponToLocker(13,0,["billyclub","billyclub","billyclub"]);
      this.addWeaponToLocker(14,0,["ak74","spas12"]);
      this.addWeaponToLocker(14,1,["hk416","ppk","ppk"]);
      this.addWeaponToLocker(15,0,["fiveseven","browning"]);
      this.addWeaponToLocker(17,0,["l337sword","automagv"]);
      this.addWeaponToLocker(19,0,["ak74u","mp40"]);
      this.addSpawner2(7,["metalDoor","metalDoor","windowLeft"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("abom");
      this.setSpawner(7,0,"---",_loc2_,"timer",110,true,"abom");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("abom");
      this.setSpawner(7,1,"---",_loc2_,"timer",120,true,"abom");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(7,2,"---",_loc2_,"timer",80,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      this.addSpawner2(9,["metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("abom");
      this.setSpawner(9,0,"---",_loc2_,"timer",30,true,"abom");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("abom");
      this.setSpawner(9,1,"---",_loc2_,"timer",70,true,"abom");
      this.addSpawner2(12,["zipline","zipline","zipline","zipline","zipline"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(12,0,"---",_loc2_,"timer",50,false,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(12,1,"---",_loc2_,"timer",60,false,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("pm9",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(12,2,"---",_loc2_,"timer",65,false,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp5",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(12,3,"---",_loc2_,"timer",72,false,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp5k",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(12,4,"---",_loc2_,"timer",80,false,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      this.addSpawner2(16,["zipline","zipline","zipline","zipline","zipline"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(16,0,"---",_loc2_,"timer",30,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(16,1,"---",_loc2_,"timer",45,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("pm9",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(16,2,"---",_loc2_,"timer",60,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp5",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(16,3,"---",_loc2_,"timer",68,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp5k",false),1);
      this.addSpawner2(20,["windowRight","zipline","zipline"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(20,0,"---",_loc2_,"timer",50,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(20,1,"---",_loc2_,"timer",60,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("hk2",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("agent_classic");
      this.setSpawner(20,2,"---",_loc2_,"timer",70,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      this.addObstacle2(3,["spikes1","spikes1"]);
      this.addObstacle2(11,["spikes2"]);
      this.addObstacle2(16,["spikes2"]);
      this.addObstacle(1,"box1");
      this.addObstacle(12,"box2b");
      this.addObstacle(20,"box2b");
      this.addObstacle(1,"empty0");
      this.addObstacle(1,"empty4");
      this.addObstacle(1,"empty1");
      this.addObstacle(4,"empty1");
      this.addObstacle(4,"empty0");
      this.addObstacle(5,"empty3");
      this.addObstacle(5,"empty3");
      this.addObstacle(8,"empty4");
      this.addObstacle(9,"empty4");
      this.addObstacle(9,"empty4");
      this.addObstacle(11,"empty1");
      this.addObstacle(12,"empty1");
      this.addObstacle(14,"empty0");
      this.addObstacle(15,"empty4");
      this.addObstacle(15,"empty4");
      this.addObstacle(17,"empty4");
      this.addObstacle(18,"empty1");
      this.addObstacle(19,"empty1");
      this.addObstacle(19,"empty1");
      this.addObstacle(20,"empty1");
      this.addNPC(MadnessLevel.myRooms[0],MadnessRoster.playerRoster.myMembers[1],true);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[3],"abom","abom","unarmed",3,true,2);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[4],"abom","abom","unarmed",3,true,1);
      this.createRoster(MadnessLevel.myRooms[4],["abom","abom"],"abom","unarmed",1);
      this.createNPC(MadnessLevel.myRooms[5],"abom","abom","unarmed",3,true,1);
      this.createNPC(MadnessLevel.myRooms[6],"abom","abom","unarmed",3,true,2);
      this.createRoster(MadnessLevel.myRooms[6],["abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[6],["abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[6],["abom"],"abom","unarmed",1);
      this.createNPC(MadnessLevel.myRooms[8],"riot","enemy","ranged",9,true,2);
      this.createNPC(MadnessLevel.myRooms[8],"agent_classic","enemy","ranged",4,true,4);
      this.createNPC(MadnessLevel.myRooms[9],"riot","enemy","ranged",9,true,2);
      this.createNPC(MadnessLevel.myRooms[9],"agent_classic","enemy","ranged",4,true,1);
      this.createNPC(MadnessLevel.myRooms[9],"abom","abom","unarmed",3,true,1);
      this.createRoster(MadnessLevel.myRooms[9],["abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[9],["abom","abom","abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[9],["abom","abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[10],["riot","riot","agent_classic"],"enemy","ranged",10);
      this.createRoster(MadnessLevel.myRooms[10],["abom","abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[10],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",6);
      this.createNPC(MadnessLevel.myRooms[11],"agent_classic","enemy","ranged",6,true,2);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[11],"abom","abom","unarmed",3,true,3);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[12],"agent_classic","enemy","ranged",6,true,3);
      this.createRoster(MadnessLevel.myRooms[12],["abom"],"abom","unarmed",1);
      this.createNPC(MadnessLevel.myRooms[13],"agent_classic","enemy","ranged",6,true,3);
      this.createRoster(MadnessLevel.myRooms[13],["abom","abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[13],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",5);
      this.createNPC(MadnessLevel.myRooms[14],"agent_classic","enemy","ranged",6,true,2);
      this.createRoster(MadnessLevel.myRooms[14],["abom","abom"],"abom","unarmed",1);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[16],"abom","abom","unarmed",3,false,1);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[17],"abom","abom","unarmed",3,false,4);
      this.createRoster(MadnessLevel.myRooms[17],["abom","abom"],"abom","unarmed",1);
      this.createNPC(MadnessLevel.myRooms[18],"agent_classic","enemy","ranged",12,true,3);
      this.createRoster(MadnessLevel.myRooms[18],["abom","abom","abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[18],["abom"],"abom","unarmed",1);
      this.createRoster(MadnessLevel.myRooms[18],["abom","abom","abom"],"abom","unarmed",1);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[19],"mag2","abom","unarmed",4,true,1);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[19],"agent_classic","enemy","ranged",12,true,2);
      this.createRoster(MadnessLevel.myRooms[19],["agent_classic","agent_classic"],"enemy","ranged",3);
      this.addEvent(MadnessLevel.myRooms[19].myRosters[0],MadnessEvents.world_1_2_19);
      this.createRoster(MadnessLevel.myRooms[19],["abom","abom"],"abom","unarmed",1);
      this.makeObjective(MadnessLevel.myRooms[20].myDoors[0],"exit",true,false);
      this.applyTrack("zombie1",this);
      this.applyTrack("boss1",MadnessLevel.myRooms[19]);
      this.applyTrack("menu",MadnessLevel.myRooms[0]);
      this.applyTrack("menu",MadnessLevel.myRooms[1]);
      this.applyTrack("menu",MadnessLevel.myRooms[2]);
   }
   function level1_3()
   {
      this.myName = "[1.5-D] Chapel";
      this.myDescription = " Continuing his ascent, Christoff waded through hordes of Nexus abominations. He cringed at what his science had been used to create, eager to reach the end of his climb and make those responsible pay for what they had done.";
      this.myDifficulty = 4;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("jesus2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("hk2",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("ironsword",false),1);
      _loc2_.myWeapons[0].myClips = 3;
      _loc2_.myStartup = "startup3";
      _loc2_.createArmor("shades12");
      MadnessLevel.totalRooms = 14;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [2,2,2,2,2,2,3,2,2,2,2,2,2,2];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPointDoor(MadnessLevel.myRooms[0].myDoors[0]);
      this.setDoorDir2(0,["down","left"]);
      this.setDoorDir2(1,["right","left"]);
      this.setDoorDir2(2,["right","left"]);
      this.setDoorDir2(3,["right","left"]);
      this.setDoorDir2(4,["right","left"]);
      this.setDoorDir2(5,["right","down"]);
      this.setDoorDir2(6,["right","down","left"]);
      this.setDoorDir2(7,["right","left"]);
      this.setDoorDir2(8,["right","left"]);
      this.setDoorDir2(9,["right","left"]);
      this.setDoorDir2(10,["right","left"]);
      this.setDoorDir2(11,["right","left"]);
      this.setDoorDir2(12,["right","left"]);
      this.setDoorDir2(13,["down","left"]);
      this.connectDoors(0,1,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(3,1,"---",4,0);
      this.connectDoors(4,1,"---",5,0);
      this.connectDoors(5,1,"---",6,1);
      this.connectDoors(6,2,"---",7,0);
      this.connectDoors(6,0,"---",9,1);
      this.connectDoors(7,1,"---",8,0);
      this.connectDoors(9,0,"---",10,1);
      this.connectDoors(10,0,"---",11,1);
      this.connectDoors(11,0,"---",12,1);
      this.connectDoors(12,0,"---",13,1);
      this.addEvent(MadnessLevel.myRooms[0],MadnessEvents.world_1_3_0);
      this.addEvent(MadnessLevel.myRooms[1],MadnessEvents.world_1_3_1);
      this.addEvent(MadnessLevel.myRooms[10],MadnessEvents.world_1_3_10);
      this.addActivator2(2,["lockerRight"]);
      this.addActivator2(4,["lockerLeft"]);
      this.addActivator2(7,["lockerRight","lockerRight","lockerRight"]);
      this.addActivator2(8,["lockerLeft","terminalRight"]);
      this.addEvent(MadnessLevel.myRooms[8].myActivators[1],MadnessEvents.world_1_3_spikes1);
      this.addActivator2(10,["lockerLeft"]);
      this.addActivator2(13,["lockerLeft"]);
      this.addWeaponToLocker(2,0,["thompson","tar21"]);
      this.addWeaponToLocker(4,0,["crowbar","p1445"]);
      this.addWeaponToLocker(7,0,["glock20"]);
      this.addWeaponToLocker(7,1,["luger","uzi"]);
      this.addWeaponToLocker(7,2,["g36","gclub","glock20"]);
      this.addWeaponToLocker(8,0,["357long","ar15"]);
      this.addWeaponToLocker(10,0,["carbonknife"]);
      this.addWeaponToLocker(13,0,["fiveseven","mallet","usas12"]);
      this.addSpawner2(0,["metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(0,0,"---",_loc2_,"timer",10,true,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(0,1,"---",_loc2_,"open",1,false,"enemy");
      this.addSpawner2(2,["metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(2,0,"---",_loc2_,"timer",40,true,"enemy");
      this.addSpawner2(9,["metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(9,0,"---",_loc2_,"timer",120,true,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(9,1,"---",_loc2_,"open",40,true,"enemy");
      this.addSpawner2(12,["metalDoor","metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(12,0,"---",_loc2_,"timer",300,true,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(12,1,"---",_loc2_,"timer",200,true,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(12,2,"---",_loc2_,"open",20,true,"enemy");
      this.addSpawner2(13,["metalDoor","metalDoor"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(13,0,"---",_loc2_,"timer",30,true,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("patient");
      this.setSpawner(13,1,"---",_loc2_,"open",50,true,"enemy");
      this.addObstacle2(6,["spikes2"]);
      this.addObstacle(1,"box2b");
      this.addObstacle(1,"box1");
      this.addObstacle(9,"box1");
      this.addObstacle(1,"empty1");
      this.addObstacle(3,"empty1");
      this.addObstacle(3,"empty1");
      this.addObstacle(4,"empty4");
      this.addObstacle(4,"empty1");
      this.addObstacle(7,"empty0");
      this.addObstacle(8,"empty0");
      this.addObstacle(9,"empty4");
      this.addObstacle(9,"empty1");
      this.addObstacle(10,"empty1");
      this.addObstacle(11,"empty1");
      this.addObstacle(11,"empty1");
      this.addObstacle(12,"empty1");
      this.createNPC(MadnessLevel.myRooms[1],"riot","enemy","ranged",8,false,2);
      this.createNPC(MadnessLevel.myRooms[2],"agent_classic","enemy","ranged",5,false,3);
      this.createNPC(MadnessLevel.myRooms[3],"riot","enemy","ranged",6,false,2);
      this.createNPC(MadnessLevel.myRooms[3],"patient","enemy","unarmed",5,false,2);
      this.createNPC(MadnessLevel.myRooms[4],"agent_classic","enemy","melee",15,false,3);
      this.createNPC(MadnessLevel.myRooms[4],"patient","enemy","unarmed",3,false,1);
      this.createRoster(MadnessLevel.myRooms[4],["patient","patient","patient"],"enemy","unarmed",3);
      this.createRoster(MadnessLevel.myRooms[4],["patient","patient"],"enemy","melee",8);
      this.createNPC(MadnessLevel.myRooms[5],"patient","enemy","melee",8,false,3);
      this.createRoster(MadnessLevel.myRooms[5],["patient","patient","agent_classic","agent_classic"],"enemy","melee",8);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[6],"patient","enemy","unarmed",8,false,1);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[8],"patient","enemy","unarmed",8,false,2);
      this.createRoster(MadnessLevel.myRooms[8],["patient","patient","agent_classic","agent_classic"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[8],["patient","patient","agent_classic","agent_classic"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[8],["experiment"],"enemy","unarmed",8);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic"],"enemy","ranged",8);
      this.createNPC(MadnessLevel.myRooms[9],"experiment","enemy","unarmed",8,false,1);
      this.createNPC(MadnessLevel.myRooms[9],"agent_classic","enemy","ranged",8,false,3);
      this.createRoster(MadnessLevel.myRooms[9],["agent_classic","agent_classic"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[9],["patient","patient"],"enemy","ranged",8);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[10],"phobos","enemy","none",8,false,1);
      MadnessLevel.myRooms[10].myCharacters[0].bossFlee = MadnessLevel.myRooms[10].myDoors[0];
      this.addFleeEvent(MadnessLevel.myRooms[10].myCharacters[0],MadnessEvents.world_1_3_10FLEE);
      this.endStartNPC();
      this.createRoster(MadnessLevel.myRooms[10],["patient","patient","agent_classic","agent_classic"],"enemy","ranged",8);
      this.addEvent(MadnessLevel.myRooms[10].myRosters[0],MadnessEvents.world_1_3_10b);
      this.createRoster(MadnessLevel.myRooms[11],["patient","agent_classic","patient"],"enemy","ranged",9);
      this.createRoster(MadnessLevel.myRooms[11],["patient","agent_classic","agent_classic"],"enemy","ranged",9);
      this.createNPC(MadnessLevel.myRooms[12],"experiment","enemy","unarmed",8,false,2);
      this.createRoster(MadnessLevel.myRooms[12],["patient","agent_classic","agent_classic","agent_classic"],"enemy","melee",15);
      this.createRoster(MadnessLevel.myRooms[12],["patient","agent_classic","agent_classic","agent_classic"],"enemy","melee",15);
      this.createRoster(MadnessLevel.myRooms[12],["patient","patient","patient"],"enemy","melee",15);
      this.createRoster(MadnessLevel.myRooms[12],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[12],["patient","agent_classic","agent_classic"],"enemy","melee",15);
      this.createRoster(MadnessLevel.myRooms[12],["patient","agent_classic","agent_classic"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[12],["patient","agent_classic","patient"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[12],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[12],["agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",5);
      this.createRoster(MadnessLevel.myRooms[12],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",5);
      this.createNPC(MadnessLevel.myRooms[13],"patient","enemy","unarmed",8,false,2);
      this.makeObjective(MadnessLevel.myRooms[13].myDoors[0],"exit",true,false);
      this.applyTrack("zombie2",this);
   }
   function level1_4()
   {
      this.myName = "[1.5-E] Vaults";
      this.myDescription = " Nevada itself was on the brink of collapse under the weight of the Project\'s perverted science. Time was running out, and with no way to know what terrible thing the Nexus would throw at him next, Dr.Christoff prepared for the worst.";
      this.myDifficulty = 4;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("jesus2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp5",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("l337sword",false),1);
      _loc2_.myWeapons[0].myClips = 2;
      _loc2_.myStartup = "startup3";
      _loc2_.createArmor("shades12");
      MadnessLevel.totalRooms = 17;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [2,3,2,3,2,3,2,2,2,3,2,2,2,3,1,2,2];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPointDoor(MadnessLevel.myRooms[0].myDoors[0]);
      this.setDoorDir2(0,["down","left"]);
      this.setDoorDir2(1,["right","down","left"]);
      this.setDoorDir2(2,["right","down"]);
      this.setDoorDir2(3,["right","down","left"]);
      this.setDoorDir2(4,["right","left"]);
      this.setDoorDir2(5,["right","down","left"]);
      this.setDoorDir2(6,["left","down"]);
      this.setDoorDir2(7,["right","left"]);
      this.setDoorDir2(8,["right","down"]);
      this.setDoorDir2(9,["right","down","left"]);
      this.setDoorDir2(10,["right","down"]);
      this.setDoorDir2(11,["right","down"]);
      this.setDoorDir2(12,["right","left"]);
      this.setDoorDir2(13,["right","down","left"]);
      this.setDoorDir2(14,["left"]);
      this.setDoorDir2(15,["right","left"]);
      this.setDoorDir2(16,["down","left"]);
      this.connectDoors(0,1,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(1,2,"---",3,0);
      this.connectDoors(3,1,"---",4,1);
      this.connectDoors(4,0,"---",5,2);
      this.connectDoors(5,1,"---",6,0);
      this.connectDoors(5,0,"---",7,1);
      this.connectDoors(7,0,"---",8,0);
      this.connectDoors(8,1,"---",9,0);
      this.connectDoors(9,1,"---",10,0);
      this.connectDoors(9,2,"---",11,0);
      this.connectDoors(11,1,"---",12,1);
      this.connectDoors(12,0,"---",13,2);
      this.connectDoors(13,1,"---",14,0);
      this.connectDoors(13,0,"---",15,1);
      this.connectDoors(15,0,"---",16,1);
      this.addEvent(MadnessLevel.myRooms[2],MadnessEvents.world_1_4_2);
      this.addActivator2(2,["jesusStand"]);
      this.addEvent(MadnessLevel.myRooms[2].myActivators[0],MadnessEvents.world_1_4_spikes1);
      MadnessLevel.myRooms[2].myActivators[0].myAnimation = "use_halo";
      this.addActivator2(5,["lockerRight"]);
      this.addActivator2(6,["lockerRight","terminal2Left"]);
      this.addEvent(MadnessLevel.myRooms[6].myActivators[1],MadnessEvents.world_1_4_spikes2);
      this.addActivator2(9,["lockerRight"]);
      this.addActivator2(10,["terminal2Right"]);
      this.addEvent(MadnessLevel.myRooms[10].myActivators[0],MadnessEvents.world_1_4_spikes3);
      this.addActivator2(11,["lockerLeft"]);
      this.addActivator2(13,["lockerRight","lockerRight"]);
      this.addActivator2(14,["lockerLeft","terminal2Left"]);
      this.addEvent(MadnessLevel.myRooms[14].myActivators[1],MadnessEvents.world_1_4_spikes4);
      this.addActivator2(15,["lockerRight"]);
      this.addWeaponToLocker(5,0,["tangsword","500long","sr3"]);
      this.addWeaponToLocker(6,0,["500long","mp40","dragonsword"]);
      this.addWeaponToLocker(9,0,["tmp","spas12"]);
      this.addWeaponToLocker(11,0,["500long","ecannon","bat"]);
      this.addWeaponToLocker(13,0,["500long","500long","thompson"]);
      this.addWeaponToLocker(13,1,["bat","500long"]);
      this.addWeaponToLocker(14,0,["500long","ak74"]);
      this.addWeaponToLocker(15,0,["mp5","dragonsword"]);
      this.addSpawner2(1,["ground3","ground1"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(1,0,"---",_loc2_,"timer",90,false,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(1,1,"---",_loc2_,"timer",130,false,"zombie");
      this.addSpawner2(2,["ground1","ground2","ground3"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(2,0,"---",_loc2_,"timer",70,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(2,1,"---",_loc2_,"timer",100,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(2,2,"---",_loc2_,"timer",90,true,"zombie");
      this.addSpawner2(4,["ground3","ground2"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(4,0,"---",_loc2_,"timer",110,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(4,1,"---",_loc2_,"timer",130,true,"zombie");
      this.addSpawner2(9,["zipline","zipline"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(9,0,"---",_loc2_,"timer",130,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(9,1,"---",_loc2_,"timer",140,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("hk2",false),1);
      this.addSpawner2(10,["ground3","ground1","ground3"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(10,0,"---",_loc2_,"timer",20,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(10,1,"---",_loc2_,"timer",90,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(10,2,"---",_loc2_,"timer",130,true,"zombie");
      this.addSpawner2(14,["windowRight","zipline","zipline","zipline","zipline"]);
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(14,0,"---",_loc2_,"timer",300,true,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(14,1,"---",_loc2_,"timer",140,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("tmp",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(14,2,"---",_loc2_,"timer",155,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp7",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(14,3,"---",_loc2_,"timer",390,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("hk2",false),1);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("riot");
      this.setSpawner(14,4,"---",_loc2_,"timer",400,true,"enemy");
      _loc2_.giveItem(ItemGenerator.createWeapon("mp5k",false),1);
      this.addSpawner2(15,["ground3","ground1","ground3","ground2","ground3","ground1"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(15,0,"---",_loc2_,"timer",30,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(15,1,"---",_loc2_,"timer",60,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(15,2,"---",_loc2_,"timer",130,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(15,3,"---",_loc2_,"timer",240,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie");
      this.setSpawner(15,4,"---",_loc2_,"timer",390,true,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(15,5,"---",_loc2_,"timer",420,true,"zombie");
      this.addObstacle2(1,["spikes1"]);
      this.addObstacle2(5,["spikes2"]);
      this.addObstacle2(9,["spikes1"]);
      this.addObstacle2(13,["spikes2"]);
      this.addObstacle(2,"box2b");
      this.addObstacle(5,"box2b");
      this.addObstacle(5,"box1b");
      this.addObstacle(10,"box2");
      this.addObstacle(2,"empty1");
      this.addObstacle(4,"empty1");
      this.addObstacle(5,"empty1");
      this.addObstacle(6,"empty1");
      this.addObstacle(7,"empty0");
      this.addObstacle(7,"empty1");
      this.addObstacle(8,"empty0");
      this.addObstacle(9,"empty4");
      this.addObstacle(9,"empty4");
      this.addObstacle(10,"empty1");
      this.addObstacle(10,"empty4");
      this.addObstacle(10,"empty1");
      this.addObstacle(13,"empty1");
      this.addObstacle(13,"empty0");
      this.addObstacle(14,"empty4");
      this.addObstacle(14,"empty4");
      this.addObstacle(15,"empty1");
      this.addObstacle(15,"empty4");
      this.createNPC(MadnessLevel.myRooms[0],"agent_classic","enemy","ranged",5,true,2);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[1],"agent_classic","enemy","ranged",5,true,3);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[2],"agent_classic","enemy","ranged",5,false,4);
      this.createNPC(MadnessLevel.myRooms[3],"patient","enemy","ranged",6,false,4);
      this.createRoster(MadnessLevel.myRooms[3],["patient","patient"],"enemy","ranged",10);
      this.createNPC(MadnessLevel.myRooms[4],"patient","enemy","ranged",8,false,2);
      this.createRoster(MadnessLevel.myRooms[4],["patient","patient"],"enemy","ranged",14);
      this.createRoster(MadnessLevel.myRooms[4],["agent_classic","agent_classic"],"enemy","ranged",10);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[5],"agent_classic","enemy","ranged",5,false,1);
      this.createNPC(MadnessLevel.myRooms[5],"riot","enemy","ranged",5,false,2);
      this.createNPC(MadnessLevel.myRooms[5],"patient","enemy","ranged",5,false,1);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[6],"patient","enemy","ranged",8,false,2);
      this.createNPC(MadnessLevel.myRooms[6],"agent_classic","enemy","ranged",8,false,2);
      this.createRoster(MadnessLevel.myRooms[6],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[6],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[6],["patient","riot","patient"],"enemy","ranged",9);
      this.createRoster(MadnessLevel.myRooms[6],["zombie_riot","zombie","zombie_agent_classic"],"zombie","zombie",10);
      this.createNPC(MadnessLevel.myRooms[7],"experiment","enemy","unarmed",8,false,1);
      this.createNPC(MadnessLevel.myRooms[7],"patient","enemy","ranged",8,false,3);
      this.createRoster(MadnessLevel.myRooms[7],["patient","riot","riot"],"enemy","ranged",9);
      this.createRoster(MadnessLevel.myRooms[8],["zombie_riot","zombie","zombie"],"zombie","zombie",4);
      this.createRoster(MadnessLevel.myRooms[8],["zombie","zombie_riot","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[8],["zombie_agent_classic","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[8],["patient","riot","riot"],"enemy","ranged",9);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[9],"zombie_agent_classic","zombie","zombie",5,false,1);
      this.createNPC(MadnessLevel.myRooms[9],"zombie_riot","zombie","zombie",5,false,2);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[10],"zombie_riot","zombie","zombie",5,false,2);
      this.createRoster(MadnessLevel.myRooms[10],["zombie","zombie_riot","zombie"],"zombie","zombie",4);
      this.createRoster(MadnessLevel.myRooms[10],["zombie","zombie_riot","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[10],["riot","riot"],"enemy","ranged",9);
      this.createNPC(MadnessLevel.myRooms[11],"patient","enemy","ranged",8,false,2);
      this.createNPC(MadnessLevel.myRooms[11],"riot","enemy","ranged",12,false,2);
      this.createRoster(MadnessLevel.myRooms[11],["agent_classic","agent_classic","agent_classic"],"enemy","ranged",4);
      this.createRoster(MadnessLevel.myRooms[11],["experiment","patient"],"enemy","unarmed",9);
      this.createRoster(MadnessLevel.myRooms[11],["zombie_agent_classic","zombie_agent_classic"],"zombie","zombie",10);
      this.createNPC(MadnessLevel.myRooms[12],"patient","enemy","ranged",12,false,4);
      this.createRoster(MadnessLevel.myRooms[12],["experiment","patient"],"enemy","unarmed",9);
      this.createRoster(MadnessLevel.myRooms[12],["zombie","zombie_agent_classic","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[12],["zombie_agent_classic","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[12],["zombie_riot","zombie","zombie"],"zombie","zombie",10);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[13],"zombie_agent_classic","zombie","zombie",5,false,4);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[14],"agent_classic","enemy","ranged",15,false,3);
      this.createRoster(MadnessLevel.myRooms[14],["zombie_agent_classic","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[14],["zombie_riot","zombie","zombie"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[14],["riot","riot"],"enemy","ranged",9);
      this.createNPC(MadnessLevel.myRooms[15],"riot","enemy","ranged",7,false,2);
      this.createRoster(MadnessLevel.myRooms[15],["zombie_scientist","zombie_riot","zombie_scientist"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[15],["zombie_agent_classic","zombie_agent_classic"],"zombie","zombie",8);
      this.createRoster(MadnessLevel.myRooms[15],["zombie","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[15],["zombie_agent_classic","zombie_agent_classic"],"zombie","zombie",8);
      this.createRoster(MadnessLevel.myRooms[15],["zombie_scientist","zombie_riot","zombie_scientist"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[15],["zombie","zombie","zombie_agent_classic"],"zombie","zombie",10);
      this.createRoster(MadnessLevel.myRooms[15],["zombie_agent_classic","zombie_riot","zombie_agent_classic"],"zombie","zombie",10);
      this.createNPC(MadnessLevel.myRooms[16],"zombie_agent_classic","zombie","zombie",6,false,3);
      this.makeObjective(MadnessLevel.myRooms[16].myDoors[0],"exit",true,false);
      this.applyTrack("zombie1",this);
   }
   function level1_5()
   {
      this.myName = "[1.5-F] Solarium";
      this.myDescription = " The bulk of the tower now miles beneath his feet, Christoff set his sights upon his prize: the very artifact powering Project Nexus itself. With it in his posession, he would finally strip the program and its insidious masters of all power. God help them!";
      this.myDifficulty = 5;
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew("jesus2");
      MadnessRoster.playerRoster.addCharacter(_loc2_);
      MadnessRoster.playerRoster.makeActive(_loc2_);
      _loc2_.giveItem(ItemGenerator.createWeapon("500long",false),0);
      _loc2_.giveItem(ItemGenerator.createWeapon("ironsword",false),1);
      _loc2_.myWeapons[0].myClips = 3;
      _loc2_.myStartup = "startup3";
      _loc2_.createArmor("shades12");
      _loc2_.createArmor("halo");
      _loc2_.myDodge = "jesus";
      _loc2_.myMagic = "jesus1";
      MadnessLevel.totalRooms = 19;
      this.addRooms(MadnessLevel.totalRooms,MadnessGameSelect.gameMode);
      MadnessLevel.doorList = [2,3,4,2,2,2,3,3,3,2,3,2,3,4,3,2,2,2,2];
      this.addDoors(MadnessLevel.myRooms,MadnessLevel.doorList);
      this.addStartPointDoor(MadnessLevel.myRooms[0].myDoors[0]);
      this.setDoorDir2(0,["down","left"]);
      this.setDoorDir2(1,["right","left","down"]);
      this.setDoorDir2(2,["right","down","down","left"]);
      this.lockDoor(2,3);
      this.disableDoorSpawn(2,3);
      this.setDoorDir2(3,["right","left"]);
      this.setDoorDir2(4,["right","left"]);
      this.setDoorDir2(5,["right","left"]);
      this.setDoorDir2(6,["right","left","down"]);
      this.setDoorDir2(7,["down","down","left"]);
      this.setDoorDir2(8,["right","left","down"]);
      this.setDoorDir2(9,["right","left"]);
      this.setDoorDir2(10,["down","left","down"]);
      this.setDoorDir2(11,["right","left"]);
      this.setDoorDir2(12,["right","down","left"]);
      this.setDoorDir2(13,["down","right","down","left"]);
      this.setDoorDir2(14,["right","down","down"]);
      this.setDoorDir2(15,["right","left"]);
      this.setDoorDir2(16,["right","left"]);
      this.setDoorDir2(17,["right","left"]);
      this.setDoorDir2(18,["left","right"]);
      this.connectDoors(0,1,"---",1,0);
      this.connectDoors(1,1,"---",2,0);
      this.connectDoors(2,1,"---",3,0);
      this.connectDoors(2,2,"---",4,0);
      this.connectDoors(2,3,"---",5,0);
      this.connectDoors(5,1,"---",6,0);
      this.connectDoors(6,1,"---",7,0);
      this.connectDoors(7,1,"---",8,1);
      this.connectDoors(8,0,"---",9,1);
      this.connectDoors(9,0,"---",10,1);
      this.connectDoors(10,0,"---",11,0);
      this.connectDoors(11,1,"---",12,0);
      this.connectDoors(12,1,"---",13,0);
      this.connectDoors(12,2,"---",14,0);
      this.connectDoors(14,1,"---",15,0);
      this.connectDoors(15,1,"---",16,1);
      this.connectDoors(16,0,"---",17,1);
      this.connectDoors(17,0,"---",18,0);
      this.addEvent(MadnessLevel.myRooms[0],MadnessEvents.world_1_5_0);
      this.addEvent(MadnessLevel.myRooms[1],MadnessEvents.world_1_5_1);
      this.addEvent(MadnessLevel.myRooms[2],MadnessEvents.world_1_5_2);
      this.addEvent(MadnessLevel.myRooms[18],MadnessEvents.world_1_5_18);
      this.addActivator2(3,["lockerRight","lockerRight"]);
      this.addActivator2(4,["lockerRight","terminalRight"]);
      this.addEvent(MadnessLevel.myRooms[4].myActivators[1],MadnessEvents.world_1_5_4);
      this.addActivator2(5,["lockerRight","lockerRight"]);
      this.addActivator2(6,["lockerLeft"]);
      this.addActivator2(8,["lockerRight"]);
      this.addActivator2(9,["terminalRight"]);
      this.connectActivator(9,0,"---",MadnessLevel.myRooms[9].myDoors[0],"unlock");
      this.addActivator2(11,["lockerLeft"]);
      this.addActivator2(12,["lockerRight","terminalRight"]);
      this.connectActivator(12,1,"---",MadnessLevel.myRooms[12].myDoors[2],"unlock");
      this.addActivator2(13,["terminal2Right"]);
      this.addEvent(MadnessLevel.myRooms[13].myActivators[0],MadnessEvents.world_1_5_spikes1);
      this.addActivator2(14,["lockerLeft"]);
      this.addActivator2(15,["lockerLeft"]);
      this.addActivator2(16,["lockerLeft"]);
      this.addActivator2(17,["lockerLeft"]);
      this.addWeaponToLocker(3,0,["ironknife","97k","fiveseven"]);
      this.addWeaponToLocker(3,1,["fiveseven","l337sword"]);
      this.addWeaponToLocker(4,0,["browning","pm9"]);
      this.addWeaponToLocker(5,0,["sr3","ironknife"]);
      this.addWeaponToLocker(5,1,["500long"]);
      this.addWeaponToLocker(6,0,["l337sword","fnfal","oa93"]);
      this.addWeaponToLocker(8,0,["uzi","crowbar"]);
      this.addWeaponToLocker(11,0,["auto9","500long"]);
      this.addWeaponToLocker(12,0,["ironknife","500long"]);
      this.addWeaponToLocker(14,0,["baton","aug"]);
      this.addWeaponToLocker(15,0,["500long"]);
      this.addWeaponToLocker(16,0,["pm9"]);
      this.addWeaponToLocker(17,0,["m16","97k","500long"]);
      this.addSpawner2(1,["ground3","ground1","ground2","ground1"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(1,0,"---",_loc2_,"open",20,false,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(1,1,"---",_loc2_,"timer",80,false,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_riot");
      this.setSpawner(1,2,"---",_loc2_,"timer",40,false,"zombie");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_riot");
      this.setSpawner(1,3,"---",_loc2_,"timer",110,false,"zombie");
      this.addSpawner2(2,["ground3","ground1"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(2,0,"---",_loc2_,"timer",60,false,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_riot");
      this.setSpawner(2,1,"---",_loc2_,"timer",70,false,"enemy");
      this.addSpawner2(12,["ground3","ground1","ground2","ground1"]);
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(12,0,"---",_loc2_,"timer",20,false,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_scientist");
      this.setSpawner(12,1,"---",_loc2_,"timer",30,false,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_riot");
      this.setSpawner(12,2,"---",_loc2_,"timer",90,false,"enemy");
      _loc2_ = new MadnessDataFile();
      _loc2_.createNew("zombie_agent_classic");
      this.setSpawner(12,3,"---",_loc2_,"timer",103,false,"enemy");
      this.addObstacle2(12,["spikes1"]);
      this.addObstacle(6,"box2b");
      this.addObstacle(8,"box2b");
      this.addObstacle(8,"box1b");
      this.addObstacle(0,"empty0");
      this.addObstacle(1,"empty0");
      this.addObstacle(2,"empty4");
      this.addObstacle(2,"empty4");
      this.addObstacle(3,"empty1");
      this.addObstacle(3,"empty1");
      this.addObstacle(4,"empty0");
      this.addObstacle(5,"empty0");
      this.addObstacle(5,"empty1");
      this.addObstacle(6,"empty1");
      this.addObstacle(6,"empty1");
      this.addObstacle(7,"empty0");
      this.addObstacle(8,"empty0");
      this.addObstacle(8,"empty1");
      this.addObstacle(8,"empty1");
      this.addObstacle(9,"empty3");
      this.addObstacle(10,"empty4");
      this.addObstacle(11,"empty1");
      this.addObstacle(13,"empty0");
      this.addObstacle(14,"empty1");
      this.addObstacle(16,"empty0");
      this.addObstacle(16,"empty4");
      this.addObstacle(17,"empty4");
      this.createNPC(MadnessLevel.myRooms[1],"riot","enemy","ranged",10,true,2);
      this.createRoster(MadnessLevel.myRooms[1],["zombie_riot","zombie_agent_classic"],"zombie","zombie",10);
      this.createNPC(MadnessLevel.myRooms[2],"riot","enemy","ranged",10,false,1);
      this.createNPC(MadnessLevel.myRooms[2],"agent_classic","enemy","ranged",10,false,2);
      this.createRoster(MadnessLevel.myRooms[2],["zombie_riot","zombie_agent_classic"],"enemy","zombie",10);
      this.createNPC(MadnessLevel.myRooms[3],"agent_classic","enemy","ranged",10,false,5);
      this.createNPC(MadnessLevel.myRooms[5],"experiment","enemy","unarmed",10,false,1);
      this.createRoster(MadnessLevel.myRooms[5],["patient","patient","patient"],"enemy","ranged",12);
      this.createNPC(MadnessLevel.myRooms[6],"abom","enemy","unarmed",10,false,4);
      this.createNPC(MadnessLevel.myRooms[6],"agent_classic","enemy","ranged",12,false,4);
      this.createRoster(MadnessLevel.myRooms[6],["abom","abom","abom","abom","abom"],"enemy","none",12);
      this.createRoster(MadnessLevel.myRooms[6],["abom","patient","abom","abom","abom"],"enemy","none",12);
      this.createRoster(MadnessLevel.myRooms[6],["abom","abom","riot","abom","abom"],"enemy","none",12);
      this.createNPC(MadnessLevel.myRooms[8],"agent_classic","enemy","ranged",12,false,4);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","melee",18);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",10);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","melee",18);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",10);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","melee",18);
      this.createRoster(MadnessLevel.myRooms[8],["agent_classic","agent_classic","agent_classic","agent_classic","agent_classic"],"enemy","ranged",12);
      this.createNPC(MadnessLevel.myRooms[9],"riot","enemy","ranged",10,false,2);
      this.createNPC(MadnessLevel.myRooms[9],"zombie_riot","enemy","zombie",10,false,2);
      this.createNPC(MadnessLevel.myRooms[10],"riot","enemy","ranged",10,false,4);
      this.createRoster(MadnessLevel.myRooms[10],["riot","riot","patient","patient"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[10],["riot","agent_classic","patient","patient"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[10],["riot","agent_classic","patient","patient"],"enemy","ranged",8);
      this.createRoster(MadnessLevel.myRooms[10],["agent_classic","riot","patient","agent_classic"],"enemy","ranged",8);
      this.createNPC(MadnessLevel.myRooms[11],"experiment","enemy","unarmed",10,false,2);
      this.createNPC(MadnessLevel.myRooms[14],"zombie_riot","enemy","zombie",10,false,4);
      this.createRoster(MadnessLevel.myRooms[14],["abom","abom","abom","patient"],"enemy","unarmed",8);
      this.createRoster(MadnessLevel.myRooms[14],["abom","riot","abom","abom"],"enemy","none",8);
      this.createRoster(MadnessLevel.myRooms[14],["abom","zombie_scientist","abom","abom"],"enemy","none",8);
      this.createRoster(MadnessLevel.myRooms[14],["abom","abom","abom","abom"],"enemy","none",8);
      this.createRoster(MadnessLevel.myRooms[16],["experiment","experiment"],"enemy","none",8);
      this.setStartNPC();
      this.createNPC(MadnessLevel.myRooms[18],"phobos","enemy","none",15,false,1);
      MadnessLevel.myRooms[18].myCharacters[0].giveItem(ItemGenerator.createWeapon("tmp",false),1);
      this.addEvent(MadnessLevel.myRooms[18].myCharacters[0],MadnessEvents.world_1_5_18_END);
      this.endStartNPC();
      this.createNPC(MadnessLevel.myRooms[18],"riot","enemy","none",10,false,2);
      MadnessLevel.myRooms[18].myCharacters[0].standStill = MadnessLevel.myRooms[18].myCharacters[1].standStill = MadnessLevel.myRooms[18].myCharacters[2].standStill = true;
      MadnessLevel.myRooms[18].myCharacters[1].loggedX = 600;
      MadnessLevel.myRooms[18].myCharacters[2].loggedX = 650;
      MadnessLevel.myRooms[18].myCharacters[1].loggedY = 600;
      MadnessLevel.myRooms[18].myCharacters[2].loggedY = 750;
      this.makeObjective(MadnessLevel.myRooms[18],"clear",true,false);
      this.myCutsceneEnd = "cutscene_world1_end";
      this.applyTrack("zombie3",this);
      this.applyTrack("boss1",MadnessLevel.myRooms[18]);
   }
   function addRooms(inRooms, inMode)
   {
      var _loc3_ = 0;
      while(_loc3_ < inRooms)
      {
         var _loc2_ = new Object();
         MadnessLevel.myRooms.push(_loc2_);
         _loc2_.myNumber = _loc3_;
         _loc2_.myDoors = new Array();
         _loc2_.myActivators = new Array();
         _loc2_.myCharacters = new Array();
         _loc2_.myRosters = new Array();
         _loc2_.mySpawners = new Array();
         _loc2_.myEvents = new Array();
         _loc2_.myItems = new Array();
         _loc2_.myObstacles = new Array();
         if(inMode == "story")
         {
            _loc2_.myType = "room" + this.myWorld + "_" + this.myLevel + "_" + _loc3_;
         }
         if(inMode == "arena")
         {
            if(MadnessGameSelect.subGameMode == "standard")
            {
               _loc2_.myType = "arena1";
            }
            if(MadnessGameSelect.subGameMode == "zombie")
            {
               _loc2_.myType = "arena2";
            }
         }
         _loc2_.myRosters = new Array();
         _loc2_.bmpBodies = undefined;
         _loc3_ = _loc3_ + 1;
      }
   }
   function addDoors(inRooms, inDoors)
   {
      var _loc3_ = 0;
      while(_loc3_ < inRooms.length)
      {
         var _loc4_ = 0;
         while(_loc4_ < inDoors[_loc3_])
         {
            var _loc2_ = new Object();
            inRooms[_loc3_].myDoors.push(_loc2_);
            _loc2_.myConnection = undefined;
            _loc2_.mySprite = undefined;
            _loc2_.amStartPoint = false;
            _loc2_.myParent = inRooms[_loc3_];
            _loc2_.myType = this.defaultDoor;
            _loc2_.myDir = "";
            _loc2_.amLocked = false;
            _loc2_.myCharacters = new Array();
            _loc2_.noSpawn = false;
            _loc4_ = _loc4_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function connectDoors(inRoom1, inDoor1, UNUSED, inRoom2, inDoor2)
   {
      MadnessLevel.myRooms[inRoom1].myDoors[inDoor1].myConnection = MadnessLevel.myRooms[inRoom2].myDoors[inDoor2];
      MadnessLevel.myRooms[inRoom2].myDoors[inDoor2].myConnection = MadnessLevel.myRooms[inRoom1].myDoors[inDoor1];
   }
   function setDoorDir(inRoom, inDoor, inDir)
   {
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].myDir = inDir;
   }
   function setDoorDir2(inRoom, inDoorArray)
   {
      var _loc2_ = 0;
      while(_loc2_ < inDoorArray.length)
      {
         this.setDoorDir(inRoom,_loc2_,inDoorArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setDoorType(inRoom, inDoor, inType)
   {
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].myType = inType;
   }
   function disableDoorSpawn(inRoom, inDoor)
   {
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].noSpawn = true;
   }
   function disableClose(inRoom, inDoor)
   {
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].noClose = true;
   }
   function lockDoor(inRoom, inDoor)
   {
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].amLocked = true;
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].mySprite.amLocked = true;
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].myConnection.amLocked = true;
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].myConnection.mySprite.amLocked = true;
   }
   function unlockDoor(inRoom, inDoor)
   {
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].amLocked = false;
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].mySprite.amLocked = false;
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].myConnection.amLocked = false;
      MadnessLevel.myRooms[inRoom].myDoors[inDoor].myConnection.mySprite.amLocked = false;
   }
   function addStartPoint(inRoom)
   {
      inRoom.startPoint = new Object();
      inRoom.startPoint.mySprite = undefined;
      inRoom.startPoint.amStartPoint = true;
      inRoom.startPoint.myParent = inRoom;
      inRoom.startPoint.myDir = "right";
      MadnessLevel.startPoint = inRoom.startPoint;
   }
   function addStartPointDoor(inDoor)
   {
      MadnessLevel.startPoint = inDoor;
   }
   function addSpawner(inRoom, myType)
   {
      var _loc1_ = new Object();
      MadnessLevel.myRooms[inRoom].mySpawners.push(_loc1_);
      _loc1_.myUnit = undefined;
      _loc1_.myTrigger = undefined;
      _loc1_.myTimer = undefined;
      _loc1_.mySprite = undefined;
      _loc1_.myFaction = "enemy";
      _loc1_.amActive = false;
      _loc1_.myParent = inRoom;
      _loc1_.myType = myType;
      _loc1_.myEvents = new Array();
   }
   function addSpawner2(inRoom, inSpawnArray)
   {
      var _loc2_ = 0;
      while(_loc2_ < inSpawnArray.length)
      {
         this.addSpawner(inRoom,inSpawnArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setSpawner(inRoom, inSpawner, UNUSED, inUnit, inTrigger, inTimer, inActive, inFaction)
   {
      MadnessLevel.myRooms[inRoom].mySpawners[inSpawner].myUnit = inUnit;
      MadnessLevel.myRooms[inRoom].mySpawners[inSpawner].myTrigger = inTrigger;
      MadnessLevel.myRooms[inRoom].mySpawners[inSpawner].myTimer = inTimer;
      MadnessLevel.myRooms[inRoom].mySpawners[inSpawner].amActive = inActive;
      MadnessLevel.myRooms[inRoom].mySpawners[inSpawner].myFaction = inFaction;
   }
   function addActivator(inRoom, myType)
   {
      var _loc1_ = new Object();
      MadnessLevel.myRooms[inRoom].myActivators.push(_loc1_);
      _loc1_.myTarget = undefined;
      _loc1_.mySprite = undefined;
      _loc1_.myParent = inRoom;
      _loc1_.myType = myType;
      _loc1_.myEvents = new Array();
      _loc1_.myItems = new Array();
      _loc1_.myAnimation = "use";
   }
   function addActivator2(inRoom, inActArray)
   {
      var _loc2_ = 0;
      while(_loc2_ < inActArray.length)
      {
         this.addActivator(inRoom,inActArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function connectActivator(inRoom, inActivator, UNUSED, inTarget, inAction)
   {
      var _loc1_ = new Object();
      MadnessLevel.myRooms[inRoom].myActivators[inActivator].myEvents.push(_loc1_);
      _loc1_.myType = inAction;
      _loc1_.myTarget = inTarget;
      if(inAction == "unlock")
      {
         inTarget.amLocked = true;
         inTarget.myConnection.amLocked = true;
      }
      if(inAction == "treasure")
      {
      }
   }
   function addEvent(inTarget, inEvent)
   {
      var _loc1_ = new Object();
      inTarget.myEvents.push(_loc1_);
      _loc1_.myType = "function";
      _loc1_.myAction = inEvent;
   }
   function addFleeEvent(inTarget, inEvent)
   {
      var _loc1_ = new Object();
      inTarget.myEvents.push(_loc1_);
      _loc1_.myType = "flee";
      _loc1_.myAction = inEvent;
   }
   function addObstacle(inRoom, myType)
   {
      var _loc1_ = new Object();
      MadnessLevel.myRooms[inRoom].myObstacles.push(_loc1_);
      _loc1_.mySprite = undefined;
      _loc1_.myParent = inRoom;
      _loc1_.myType = myType;
      _loc1_.myEvents = new Array();
   }
   function addObstacle2(inRoom, inObstArray)
   {
      var _loc2_ = 0;
      while(_loc2_ < inObstArray.length)
      {
         this.addObstacle(inRoom,inObstArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function makeObjective(inTarget, inType, inRequired, inHidden)
   {
      if(inType != "survive")
      {
         MadnessLevel.myObjectives.push(inTarget);
      }
      inTarget.myObjective = inType;
      inTarget.objectiveRequired = inRequired;
      inTarget.objectiveHidden = inHidden;
   }
   function linkObjective(inThing, inObjective, inReaction)
   {
   }
   static function completeObjectiveCheck(inTarget, inType)
   {
      var _loc4_ = false;
      var _loc3_ = 0;
      while(_loc3_ < MadnessLevel.myObjectives.length)
      {
         if(inTarget == MadnessLevel.myObjectives[_loc3_] && inTarget != undefined)
         {
            if(inType == inTarget.myObjective && inType != undefined)
            {
               if(inType == "rescue")
               {
               }
               if(inType == "clear")
               {
               }
               if(inType == "use")
               {
               }
               if(inType == "kill")
               {
               }
               if(inType == "exit")
               {
               }
               if(inType == "enter")
               {
               }
               if(inType == "survive")
               {
               }
               inTarget.myObjective = undefined;
               MadnessLevel.myObjectives.splice(_loc3_,1);
               _loc4_ = true;
               break;
            }
            if(inType == "kill" && (inTarget.myObjective == "rescue" || inTarget.myObjective == "survive") && !MadnessLevel.levelFailed)
            {
               MadnessLevel.levelFailed = true;
               MadnessPopup.closeAll();
               MadnessPopup.addPopup("lines","MISSION FAILED",null,440,170,undefined,90,MadWorld.thisWorld.leaveRoomFunction,null);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < MadnessLevel.myObjectives.length)
      {
         if(MadnessLevel.myObjectives[_loc3_].objectiveRequired)
         {
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc4_ && (_loc3_ == MadnessLevel.myObjectives.length || MadnessLevel.myObjectives.length == 0))
      {
         MadnessLevel.levelVictory = true;
         if(MadnessLevel.currentLevel.myWorld == 0 && MadnessLevel.currentLevel.myLevel == 7)
         {
            if(MadnessGameSelect.myDifficulty == "easy")
            {
               MadnessMedals.unlockMedal("easy0");
            }
            if(MadnessGameSelect.myDifficulty == "normal")
            {
               MadnessMedals.unlockMedal("normal0");
            }
            if(MadnessGameSelect.myDifficulty == "hard")
            {
               MadnessMedals.unlockMedal("hard0");
               if(MadnessRoster.playerRoster.teamLeader.myCharacter != "hank")
               {
                  MadnessMedals.unlockMedal("hard0b");
               }
            }
         }
      }
   }
   function createNPC(inRoom, inChar, inFaction, inLoadout, inLevel, inSurprised, inTotalGuys)
   {
      var _loc3_ = 0;
      while(_loc3_ < inTotalGuys)
      {
         var _loc2_ = new MadnessDataFile();
         _loc2_.createNew(inChar);
         ItemGenerator.equipLoadout(_loc2_,inLoadout,inLevel);
         _loc2_.amSurprised = inSurprised;
         _loc2_.startupPoint = this.startPointNPC;
         if(SwainMath.randomNumber(0,this.startupChance) == 0)
         {
            _loc2_.myStartup = this.currentStartup;
         }
         _loc2_.myFaction = inFaction;
         _loc2_.myEvents = new Array();
         this.addNPC(inRoom,_loc2_,inSurprised);
         _loc3_ = _loc3_ + 1;
      }
   }
   function addNPC(inRoom, inChar, inSurprised)
   {
      if(inSurprised)
      {
         inChar.myWeapons[1] = undefined;
         inChar.myWeapon = 1;
      }
      inRoom.myCharacters.push(inChar);
   }
   static function removeNPC(inRoom, inChar)
   {
      var _loc1_ = 0;
      while(_loc1_ < inRoom.myCharacters.length)
      {
         if(inChar == inRoom.myCharacters[_loc1_])
         {
            inRoom.myCharacters.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   function createRoster(inRoom, inCreateArray, inFaction, inLoadout, inLevel)
   {
      var _loc3_ = new MadnessRoster();
      _loc3_.init(inFaction);
      var _loc2_ = 0;
      while(_loc2_ < inCreateArray.length)
      {
         var _loc1_ = new MadnessDataFile();
         _loc1_.createNew(inCreateArray[_loc2_]);
         _loc3_.addCharacter(_loc1_);
         _loc3_.makeActive(_loc1_);
         ItemGenerator.equipLoadout(_loc1_,inLoadout,inLevel);
         _loc1_.amSurprised = false;
         _loc2_ = _loc2_ + 1;
      }
      inRoom.myRosters.push(_loc3_);
   }
   static function removeRoster(inRoom, inRoster)
   {
      var _loc1_ = 0;
      while(_loc1_ < inRoom.myRosters.length)
      {
         if(inRoster == inRoom.myRosters[_loc1_])
         {
            inRoom.myRosters.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   function addItem(inTarget, inItem)
   {
      inItem.myColor = SwainMath.randomNumber(1,2);
      inTarget.myItems.push(inItem);
   }
   function addWeaponToLocker(inRoom, inLocker, inWeapons)
   {
      var _loc2_ = 0;
      while(_loc2_ < inWeapons.length)
      {
         this.addItem(MadnessLevel.myRooms[inRoom].myActivators[inLocker],ItemGenerator.createWeapon(inWeapons[_loc2_],false));
         _loc2_ = _loc2_ + 1;
      }
   }
   function setStartup(inStart, inChance)
   {
      this.currentStartup = inStart;
      this.startupChance = inChance;
   }
   function resetStartup()
   {
      this.currentStartup = undefined;
   }
   function setStartNPC()
   {
      this.startPointNPC = true;
   }
   function endStartNPC()
   {
      this.startPointNPC = false;
   }
   function applyTrack(inTrack, inDestination)
   {
      inDestination.myTrack = inTrack;
   }
}
