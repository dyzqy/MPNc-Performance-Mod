class MadnessSaveData
{
   static var lastSaveName = "MadnessTest3";
   static var saveName = "MadnessGame2";
   function MadnessSaveData()
   {
   }
   static function newGame()
   {
      var _loc2_ = MadnessGameSelect.gameMode;
      if(_loc2_ == "story")
      {
         MadnessGameSelect.storyProgressWorld0 = [false,false,false,false,false,false,false,false];
         MadnessGameSelect.storyProgressWorld1 = [false,false,false,false,false,false];
      }
      if(_loc2_ == "arena")
      {
         MadnessRoster.playerRoster = new MadnessRoster();
         MadnessRoster.playerRoster.init("player");
         var _loc3_ = new MadnessDataFile();
         _loc3_.createNew("arena",false);
         MadnessRoster.playerRoster.addCharacter(_loc3_);
         MadnessRoster.playerRoster.makeActive(_loc3_);
         MadnessRoster.playerRoster.makeLeader(_loc3_);
         MadnessRoster.playerRoster.myCash = 0;
         _root.earnedXP = new Number();
         _root.earnedCash = new Number();
         MadnessRoster.storeRoster = new MadnessRoster();
         MadnessRoster.storeRoster.init("store");
         CharacterGenerator.storePopulator();
         ItemGenerator.storePopulator();
         _root.newArena = true;
         _root.generateArena(1);
         var _loc4_ = SharedObject.getLocal(_loc2_ + MadnessSaveData.saveName);
         _root.arenaKills = _loc4_.data.arenaKills;
         _root.arenaWaves = _loc4_.data.arenaWaves;
         if(_root.arenaKills == undefined)
         {
            _root.arenaKills = 0;
         }
         if(_root.arenaWaves == undefined)
         {
            _root.arenaWaves = 0;
         }
      }
      trace("New Game!");
      MadnessSaveData.saveGame(_loc2_);
   }
   static function saveGame()
   {
      var _loc8_ = MadnessGameSelect.gameMode;
      var _loc3_ = SharedObject.getLocal(_loc8_ + MadnessSaveData.saveName);
      _loc3_.clear();
      _loc3_.data.haveSaved = true;
      if(_loc8_ == "story")
      {
         _loc3_.data.storyProgressWorld0 = MadnessGameSelect.storyProgressWorld0;
         _loc3_.data.storyProgressWorld1 = MadnessGameSelect.storyProgressWorld1;
         _loc3_.data.storyProgressWorld2 = MadnessGameSelect.storyProgressWorld2;
         _loc3_.data.storyProgressWorld3 = MadnessGameSelect.storyProgressWorld3;
      }
      if(_loc8_ == "arena")
      {
         var _loc4_ = new Array();
         var _loc2_ = 0;
         while(_loc2_ < MadnessRoster.playerRoster.myWeapons.length)
         {
            _loc4_.push(ItemGenerator.replicateWeapon(MadnessRoster.playerRoster.myWeapons[_loc2_]));
            _loc2_ = _loc2_ + 1;
         }
         var _loc5_ = new Array();
         var _loc10_ = undefined;
         _loc2_ = 0;
         while(_loc2_ < MadnessRoster.playerRoster.myArmor.length)
         {
            _loc5_.push(ItemGenerator.createArmor(MadnessRoster.playerRoster.myArmor[_loc2_].myType));
            _loc2_ = _loc2_ + 1;
         }
         var _loc9_ = undefined;
         _loc9_ = MadnessDataFile.replicateCharacter(MadnessRoster.playerRoster.teamLeader);
         var _loc7_ = new Array();
         _loc2_ = 0;
         while(_loc2_ < MadnessRoster.playerRoster.myActiveMembers.length)
         {
            if(MadnessRoster.playerRoster.myActiveMembers[_loc2_] != MadnessRoster.playerRoster.teamLeader)
            {
               _loc7_.push(MadnessDataFile.replicateCharacter(MadnessRoster.playerRoster.myActiveMembers[_loc2_]));
            }
            _loc2_ = _loc2_ + 1;
         }
         var _loc6_ = new Array();
         _loc2_ = 0;
         while(_loc2_ < MadnessRoster.playerRoster.myMembers.length)
         {
            if(!MadnessRoster.playerRoster.returnActiveCharacter(MadnessRoster.playerRoster.myMembers[_loc2_]))
            {
               _loc6_.push(MadnessDataFile.replicateCharacter(MadnessRoster.playerRoster.myMembers[_loc2_]));
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc3_.data.myWeaponsList = _loc4_;
         _loc3_.data.myArmorList = _loc5_;
         _loc3_.data.teamLeader = _loc9_;
         _loc3_.data.myActiveMembers = _loc7_;
         _loc3_.data.myInactiveMembers = _loc6_;
         _loc3_.data.myCash = MadnessRoster.playerRoster.myCash;
         _loc3_.data.currentWave = MadnessLevel.currentLevel.totalWaves;
         _loc3_.data.arenaKills = _root.arenaKills;
         _loc3_.data.arenaWaves = _root.arenaWaves;
         _loc3_.data.newArena = _root.newArena;
         _loc3_.data.dataTester = "FILE INTEGRITY INTACT";
         MadnessGameSelect.checkKillMedals();
      }
      _loc3_.flush(1000000);
      trace("File Saved! Total size: " + _loc3_.getSize() * 0.001 + " kb");
   }
   static function loadGame()
   {
      var _loc5_ = MadnessGameSelect.gameMode;
      var _loc2_ = SharedObject.getLocal(_loc5_ + MadnessSaveData.saveName);
      if(!MadnessSaveData.testSaveExists())
      {
         MadnessSaveData.newGame(_loc5_);
         trace("No Data");
      }
      else
      {
         if(_loc5_ == "story")
         {
            MadnessGameSelect.storyProgressWorld0 = _loc2_.data.storyProgressWorld0;
            MadnessGameSelect.storyProgressWorld1 = _loc2_.data.storyProgressWorld1;
            MadnessGameSelect.storyProgressWorld2 = _loc2_.data.storyProgressWorld2;
            MadnessGameSelect.storyProgressWorld3 = _loc2_.data.storyProgressWorld3;
            if(MadnessGameSelect.storyProgressWorld0 == undefined)
            {
               MadnessGameSelect.storyProgressWorld0 = [false,false,false,false,false,false,false,false];
            }
            if(MadnessGameSelect.storyProgressWorld1 == undefined)
            {
               MadnessGameSelect.storyProgressWorld1 = [false,false,false,false,false,false];
            }
            if(MadnessGameSelect.storyProgressWorld2 == undefined)
            {
               MadnessGameSelect.storyProgressWorld2 = [false];
            }
            if(MadnessGameSelect.storyProgressWorld3 == undefined)
            {
               MadnessGameSelect.storyProgressWorld3 = [false];
            }
         }
         if(_loc5_ == "arena")
         {
            MadnessRoster.playerRoster = new MadnessRoster();
            MadnessRoster.playerRoster.init("player");
            var _loc3_ = 0;
            while(_loc3_ < _loc2_.data.myWeaponsList.length)
            {
               MadnessRoster.playerRoster.addWeapon(ItemGenerator.replicateWeapon(_loc2_.data.myWeaponsList[_loc3_]));
               _loc3_ = _loc3_ + 1;
            }
            var _loc6_ = undefined;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.data.myArmorList.length)
            {
               MadnessRoster.playerRoster.addArmor(ItemGenerator.createArmor(_loc2_.data.myArmorList[_loc3_].myType));
               _loc3_ = _loc3_ + 1;
            }
            _loc2_.data.teamLeader.amSpecial = true;
            var _loc4_ = MadnessDataFile.replicateCharacter(_loc2_.data.teamLeader);
            MadnessRoster.playerRoster.addCharacter(_loc4_);
            MadnessRoster.playerRoster.makeActive(_loc4_);
            MadnessRoster.playerRoster.makeLeader(_loc4_);
            _loc3_ = 0;
            while(_loc3_ < _loc2_.data.myActiveMembers.length)
            {
               _loc2_.data.myActiveMembers[_loc3_].amSpecial = true;
               _loc4_ = MadnessDataFile.replicateCharacter(_loc2_.data.myActiveMembers[_loc3_]);
               MadnessRoster.playerRoster.addCharacter(_loc4_);
               MadnessRoster.playerRoster.makeActive(_loc4_);
               _loc3_ = _loc3_ + 1;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.data.myInactiveMembers.length)
            {
               _loc2_.data.myInactiveMembers[_loc3_].amSpecial = true;
               _loc4_ = MadnessDataFile.replicateCharacter(_loc2_.data.myInactiveMembers[_loc3_]);
               MadnessRoster.playerRoster.addCharacter(_loc4_);
               _loc3_ = _loc3_ + 1;
            }
            MadnessRoster.storeRoster = new MadnessRoster();
            MadnessRoster.storeRoster.init("store");
            CharacterGenerator.storePopulator();
            ItemGenerator.storePopulator();
            MadnessRoster.playerRoster.myCash = _loc2_.data.myCash;
            _root.earnedXP = new Number();
            _root.earnedCash = new Number();
            _root.newArena = _loc2_.data.newArena;
            _root.generateArena(_loc2_.data.currentWave);
            _root.arenaKills = _loc2_.data.arenaKills;
            _root.arenaWaves = _loc2_.data.arenaWaves;
            trace("File Integrity: " + _loc2_.data.dataTester);
            if(MadnessRoster.playerRoster.myCash == NaN)
            {
               MadnessRoster.playerRoster.myCash = 0;
            }
         }
         trace("File Loaded! Total size: " + _loc2_.getSize() * 0.001 + " kb");
      }
   }
   static function testSaveExists()
   {
      var _loc1_ = MadnessGameSelect.gameMode;
      var _loc2_ = SharedObject.getLocal(_loc1_ + MadnessSaveData.saveName);
      return _loc2_.data.haveSaved != undefined;
   }
   static function sizeSave()
   {
      var _loc1_ = SharedObject.getLocal(MadnessGameSelect.gameMode + MadnessSaveData.saveName);
      _loc1_.flush(1000000);
   }
   static function loadOptions()
   {
      var _loc2_ = SharedObject.getLocal("options_" + MadnessSaveData.saveName);
      if(_loc2_.data.optionsSaveCheck)
      {
         _root._quality = _loc2_.data.myQuality;
         SwainAudioPlayer.musicOn = _loc2_.data.muteMusic;
         MadnessGameSelect.backgroundQuality = _loc2_.data.backgroundQuality;
      }
   }
   static function saveOptions()
   {
      var _loc2_ = SharedObject.getLocal("options_" + MadnessSaveData.saveName);
      _loc2_.data.optionsSaveCheck = true;
      _loc2_.data.myQuality = _root._quality;
      _loc2_.data.muteMusic = SwainAudioPlayer.musicOn;
      _loc2_.data.backgroundQuality = MadnessGameSelect.backgroundQuality;
   }
   static function loadArenaTestData()
   {
      var _loc3_ = SharedObject.getLocal("arenaMadnessTest31");
      if(_loc3_.data.haveSaved)
      {
         var _loc2_ = new MadnessRoster();
         _loc2_.copyRoster(_loc3_.data.playerRoster);
         _loc2_.convertCharactersToMadnessData(_loc3_.data.playerRosterMembers);
         _loc2_.convertActiveMembers();
         if(_loc2_.teamLeader.myKills > _root.arenaKills)
         {
            _root.arenaKills = Number(_loc2_.teamLeader.myKills);
         }
         if(_loc2_.teamLeader.myWaves > _root.arenaWaves)
         {
            _root.arenaWaves = Number(_loc2_.teamLeader.myWaves);
         }
         var _loc4_ = _loc3_.data.newArena;
         if(_loc4_ == undefined)
         {
            _loc4_ = false;
         }
         _root.newArena = _loc4_;
         var _loc5_ = _loc3_.data.currentWave;
         if(_loc5_ == undefined)
         {
            _loc5_ = 1;
         }
         _root.generateArena(_loc5_);
         _root.earnedXP = new Number();
         _root.earnedCash = new Number();
         if(_loc2_.myActiveMembers.length > 0 && _loc2_.teamLeader.myName != undefined)
         {
            MadnessRoster.playerRoster = _loc2_;
            MadnessSaveData.saveGame();
            trace("***   Found Old Data! Replacing   ****");
         }
         _loc3_.clear();
      }
   }
}
