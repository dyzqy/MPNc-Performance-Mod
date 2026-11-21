class MadnessGameSelect extends MovieClip
{
   var onEnterFrame;
   var highTEXT;
   var medTEXT;
   var lowTEXT;
   var highButton;
   var medButton;
   var lowButton;
   var onTEXT;
   var onButton;
   var offTEXT;
   var offButton;
   var highBgTEXT;
   var lowBgTEXT;
   var highBgButton;
   var lowBgButton;
   var continueButton;
   var continueTEXT;
   var charIcon;
   static var subGameMode;
   static var currentGameSelect;
   static var storyProgressWorld0;
   static var storyProgressWorld1;
   static var storyProgressWorld2;
   static var storyProgressWorld3;
   static var myDifficulty = "normal";
   static var backgroundQuality = "high";
   static var allGameModes = ["story","arena","options"];
   static var gameMode = MadnessGameSelect.allGameModes[0];
   static var saveName = "MadnessTest3";
   static var menuCharacters = ["hank","sanford","deimos","agent","zombie","zombie_agent","scientist","jesus2"];
   static var myVersion = 1.4;
   static var testMode = false;
   function MadnessGameSelect()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init()
   {
      this.setContinueButton();
      MadnessGameSelect.currentGameSelect = this;
      trace("Version " + MadnessGameSelect.myVersion);
      if(MadnessGameSelect.myVersion == 1.4)
      {
         MadnessGameSelect.gameMode = "arena";
         MadnessSaveData.loadArenaTestData();
         MadnessGameSelect.gameMode = MadnessGameSelect.allGameModes[0];
      }
      MadnessSaveData.sizeSave();
      MadnessSaveData.loadOptions();
      SwainAudioPlayer.playTrack("menu");
   }
   function tick()
   {
   }
   function pressNext()
   {
      this.changeGameMode(1);
      this.init();
   }
   function pressPrev()
   {
      this.changeGameMode(-1);
      this.init();
   }
   function pressStory()
   {
      MadnessGameSelect.gameMode = "story";
      this.gotoAndStop("story");
      this.setContinueButton();
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressArena()
   {
      MadnessGameSelect.gameMode = "arena";
      this.gotoAndStop("arena");
      this.setContinueButton();
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressOptions()
   {
      this.gotoAndStop("options");
      this.setQualityButtons();
      this.setMusicButtons();
      this.setBackgroundButtons();
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressCredits()
   {
      this.gotoAndStop("credits");
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressCheats()
   {
      this.gotoAndStop("cheats");
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressMoarMadness()
   {
      this.getURL("https://www.newgrounds.com/collection/madness.html","_blank");
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressQuality(inQual)
   {
      _root._quality = inQual;
      this.setQualityButtons();
      SwainAudioPlayer.playSound("menu1",0);
      MadnessSaveData.saveOptions();
   }
   function setQualityButtons()
   {
      this.highTEXT._visible = _root._quality == "HIGH";
      this.medTEXT._visible = _root._quality == "MEDIUM";
      this.lowTEXT._visible = _root._quality == "LOW";
      this.highButton._visible = _root._quality != "HIGH";
      this.medButton._visible = _root._quality != "MEDIUM";
      this.lowButton._visible = _root._quality != "LOW";
   }
   function pressMusic(inOn)
   {
      trace("t1 " + SwainAudioPlayer.muteMusic);
      SwainAudioPlayer.muteMusic(inOn);
      this.setMusicButtons();
      SwainAudioPlayer.playSound("menu1",0);
      MadnessSaveData.saveOptions();
   }
   function setMusicButtons()
   {
      trace(SwainAudioPlayer.musicOn);
      this.onTEXT._visible = SwainAudioPlayer.musicOn;
      this.onButton._visible = !SwainAudioPlayer.musicOn;
      this.offTEXT._visible = !SwainAudioPlayer.musicOn;
      this.offButton._visible = SwainAudioPlayer.musicOn;
   }
   function pressBackground(inQual)
   {
      MadnessGameSelect.backgroundQuality = inQual;
      this.setBackgroundButtons();
      SwainAudioPlayer.playSound("menu1",0);
      MadnessSaveData.saveOptions();
   }
   function setBackgroundButtons()
   {
      this.highBgTEXT._visible = MadnessGameSelect.backgroundQuality == "high";
      this.lowBgTEXT._visible = MadnessGameSelect.backgroundQuality == "low";
      this.highBgButton._visible = MadnessGameSelect.backgroundQuality != "high";
      this.lowBgButton._visible = MadnessGameSelect.backgroundQuality != "low";
   }
   function setContinueButton()
   {
      if(MadnessGameSelect.myVersion == 1.4)
      {
         this.continueButton._visible = MadnessSaveData.testSaveExists();
      }
      if(MadnessGameSelect.myVersion == 1.3)
      {
         this.continueButton._visible = MadnessGameSelect.testSaveExistsOLD();
      }
      this.continueTEXT._visible = !this.continueButton._visible;
   }
   function assignRandomCharacter()
   {
      var _loc3_ = MadnessGameSelect.gameMode;
      MadnessGameSelect.gameMode = "story";
      var _loc2_ = new MadnessDataFile();
      _loc2_.createNew(MadnessGameSelect.menuCharacters[SwainMath.randomNumber(0,MadnessGameSelect.menuCharacters.length - 1)]);
      _loc2_.myWeapons[0] = undefined;
      _loc2_.myWeapons[1] = undefined;
      MadnessCharacter.applyNecessaryStats(this.charIcon,_loc2_);
      MadnessStoreHire.updateCharCard(this.charIcon,_loc2_,false);
      this.charIcon.mySprite.play();
      MadnessGameSelect.gameMode = _loc3_;
   }
   function changeGameMode(inDir)
   {
      var _loc2_ = undefined;
      var _loc1_ = 0;
      while(_loc1_ < MadnessGameSelect.allGameModes.length)
      {
         if(MadnessGameSelect.gameMode == MadnessGameSelect.allGameModes[_loc1_])
         {
            _loc2_ = _loc1_;
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      var _loc3_ = undefined;
      if(_loc2_ == 0 && inDir == -1)
      {
         _loc3_ = MadnessGameSelect.allGameModes.length - 1;
      }
      else if(_loc2_ == MadnessGameSelect.allGameModes.length - 1 && inDir == 1)
      {
         _loc3_ = 0;
      }
      else
      {
         _loc3_ = _loc2_ + inDir;
      }
      MadnessGameSelect.gameMode = MadnessGameSelect.allGameModes[_loc3_];
   }
   function pressNew()
   {
      if(MadnessSaveData.testSaveExists() && MadnessGameSelect.myVersion == 1.4 || MadnessGameSelect.testSaveExistsOLD() && MadnessGameSelect.myVersion == 1.3)
      {
         SwainAudioPlayer.playSound("menu1",0);
         MadnessPopup.addPopup("yesno","You\'re about to ruin the entirety of your data.",null,425,180,this,-1,MadnessGameSelect.pressYes,MadnessGameSelect.pressNo);
      }
      else
      {
         MadnessGameSelect.pressYes();
      }
   }
   function pressContinue()
   {
      if(MadnessGameSelect.myVersion == 1.4)
      {
         MadnessSaveData.loadGame();
      }
      if(MadnessGameSelect.myVersion == 1.3)
      {
         MadnessGameSelect.loadGameOLD();
      }
      MadnessCharacterCreator.newGame = false;
      if(!MadnessTransition.transitionLock)
      {
         _root.createTransition("fade",MadnessGameSelect.gameMode + "_menu_new",null);
      }
      SwainAudioPlayer.playSound("menu4",0);
   }
   static function pressYes()
   {
      if(MadnessGameSelect.myVersion == 1.4)
      {
         MadnessSaveData.newGame();
      }
      if(MadnessGameSelect.myVersion == 1.3)
      {
         MadnessGameSelect.newGameOLD();
      }
      MadnessCharacterCreator.newGame = true;
      if(!MadnessTransition.transitionLock)
      {
         if(MadnessGameSelect.gameMode == "arena")
         {
            MadnessCutscene.storeCutsceneInfo("cutscene_arena1",MadnessGameSelect.gameMode + "_menu_new",null);
            _root.createTransition("fade","cutscene",null);
         }
         else
         {
            _root.createTransition("fade",MadnessGameSelect.gameMode + "_menu_new",null);
         }
      }
      SwainAudioPlayer.playSound("menu4",0);
   }
   static function pressNo()
   {
      MadnessPopup.currentPopup.myDataRef.closePopup();
      SwainAudioPlayer.playSound("menu4",0);
   }
   static function closeGameSelect()
   {
      MadnessGameSelect.currentGameSelect.removeMovieClip();
   }
   static function appropriateXP(inSource, inTarget, inType)
   {
      if(MadnessGameSelect.gameMode == "arena" && !inTarget.amHarvested)
      {
         inTarget.amHarvested = true;
         var _loc4_ = inTarget.myLevel * 20;
         if(inSource.myLevel > inTarget.myLevel)
         {
            _loc4_ = _loc4_ * 0.7 + _loc4_ * (inTarget.myLevel / inSource.myLevel);
         }
         _root.earnedCash += _loc4_;
         if(inSource == MadnessRoster.playerRoster.teamLeader)
         {
            inSource.myKills = inSource.myKills + 1;
            _root.arenaKills = _root.arenaKills + 1;
            var _loc5_ = inTarget.myLevel * 8;
            if(_loc5_ < 1)
            {
               _loc5_ = 1;
            }
            _root.earnedXP += _loc5_;
         }
         else if(inSource.myRoster == MadnessRoster.playerRoster)
         {
            inSource.myKills = inSource.myKills + 1;
            _loc5_ = inTarget.myLevel * 8;
            if(_loc5_ < 1)
            {
               _loc5_ += 1;
            }
            inSource.applyXP(_loc5_);
            inSource.autoApplyPoints();
         }
      }
      if(inSource == MadnessRoster.playerRoster.teamLeader)
      {
         if(_root.myGameSpeed == 0)
         {
            inSource.mySlowMo += 10;
         }
         else
         {
            inSource.mySlowMo += 20;
         }
         if(inSource.mySlowMo > inSource.mySlowMoMax)
         {
            inSource.mySlowMo = inSource.mySlowMoMax;
         }
      }
   }
   static function checkKillMedals()
   {
      if(!MadnessGameSelect.testMode)
      {
         if(_root.arenaKills >= 50)
         {
            MadnessMedals.unlockMedal("kills1");
         }
         if(_root.arenaKills >= 200)
         {
            MadnessMedals.unlockMedal("kills2");
         }
         if(_root.arenaKills >= 350)
         {
            MadnessMedals.unlockMedal("kills3");
         }
         if(_root.arenaKills >= 600)
         {
            MadnessMedals.unlockMedal("kills4");
         }
         if(_root.arenaKills >= 1000)
         {
            MadnessMedals.unlockMedal("kills5");
         }
         if(_root.arenaKills >= 2000)
         {
            MadnessMedals.unlockMedal("kills6");
         }
         if(_root.arenaKills >= 5000)
         {
            MadnessMedals.unlockMedal("kills7");
         }
         if(_root.arenaKills >= 9001)
         {
            MadnessMedals.unlockMedal("kills8");
         }
         if(_root.arenaKills >= 53594)
         {
            MadnessMedals.unlockMedal("kills9");
         }
      }
   }
   static function beatStage(inWorld, inLevel)
   {
      trace("Beat level!");
      MadnessGameSelect["storyProgressWorld" + String(inWorld)][inLevel] = true;
      trace(MadnessGameSelect["storyProgressWorld" + String(inWorld)]);
      if(MadnessGameSelect.myVersion == 1.4)
      {
         MadnessSaveData.saveGame();
      }
      if(MadnessGameSelect.myVersion == 1.3)
      {
         MadnessGameSelect.saveGameOLD();
      }
   }
   static function gameStarted()
   {
      if(MadnessGameSelect.gameMode == "story")
      {
         if(MadnessGameSelect.myDifficulty == "easy")
         {
            MadnessCharacter.playerLives = 2;
         }
         if(MadnessGameSelect.myDifficulty == "normal")
         {
            MadnessCharacter.playerLives = 1;
         }
         if(MadnessGameSelect.myDifficulty == "hard")
         {
            MadnessCharacter.playerLives = 0;
         }
      }
      if(MadnessGameSelect.gameMode == "arena")
      {
         MadnessCharacter.playerLives = 0;
      }
   }
   static function testSaveExistsOLD()
   {
      var _loc1_ = SharedObject.getLocal(MadnessGameSelect.gameMode + MadnessGameSelect.saveName + String(1));
      return _loc1_.data.haveSaved != undefined;
   }
   static function newGameOLD()
   {
      if(MadnessGameSelect.gameMode == "story")
      {
         MadnessGameSelect.storyProgressWorld0 = [false,false,false,false,false,false,false,false];
      }
      if(MadnessGameSelect.gameMode == "arena")
      {
         MadnessRoster.playerRoster = new MadnessRoster();
         MadnessRoster.playerRoster.init("player");
         var _loc2_ = new MadnessDataFile();
         _loc2_.createNew("arenatest",false);
         MadnessRoster.playerRoster.addCharacter(_loc2_);
         MadnessRoster.playerRoster.makeActive(_loc2_);
         MadnessRoster.playerRoster.myCash = 200000;
         _root.earnedXP = new Number();
         _root.earnedCash = new Number();
         MadnessRoster.storeRoster = new MadnessRoster();
         MadnessRoster.storeRoster.init("store");
         CharacterGenerator.storePopulator();
         ItemGenerator.storePopulator();
         _root.newArena = true;
         _root.generateArena(5);
      }
   }
   static function loadGameOLD()
   {
      var _loc2_ = SharedObject.getLocal(MadnessGameSelect.gameMode + MadnessGameSelect.saveName + String(1));
      if(!MadnessGameSelect.testSaveExistsOLD())
      {
         trace("No Data");
      }
      else
      {
         if(MadnessGameSelect.gameMode == "story")
         {
            MadnessGameSelect.storyProgressWorld0 = _loc2_.data.storyProgressWorld0;
            if(MadnessGameSelect.storyProgressWorld0 == undefined)
            {
               MadnessGameSelect.storyProgressWorld0 = [false,false,false,false,false,false,false,false];
            }
         }
         if(MadnessGameSelect.gameMode == "arena")
         {
            trace("Attempting Load:");
            MadnessRoster.playerRoster = new MadnessRoster();
            MadnessRoster.playerRoster.copyRoster(_loc2_.data.playerRoster);
            MadnessRoster.playerRoster.convertCharactersToMadnessData(_loc2_.data.playerRosterMembers);
            MadnessRoster.playerRoster.convertActiveMembers();
            MadnessRoster.storeRoster = new MadnessRoster();
            MadnessRoster.storeRoster.init("store");
            CharacterGenerator.storePopulator();
            ItemGenerator.storePopulator();
            var _loc3_ = _loc2_.data.newArena;
            if(_loc3_ == undefined)
            {
               _loc3_ = false;
               trace("FAILED to load, resetting new arena boolean");
            }
            _root.newArena = _loc3_;
            var _loc4_ = _loc2_.data.currentWave;
            if(_loc4_ == undefined)
            {
               _loc4_ = 1;
               trace("FAILED to load, resetting wave");
            }
            _root.generateArena(_loc4_);
         }
         trace("Data LOADED");
      }
   }
   static function saveGameOLD()
   {
      var _loc2_ = SharedObject.getLocal(MadnessGameSelect.gameMode + MadnessGameSelect.saveName + String(1));
      _loc2_.clear();
      _loc2_.data.haveSaved = true;
      if(MadnessGameSelect.gameMode == "story")
      {
         _loc2_.data.storyProgressWorld0 = MadnessGameSelect.storyProgressWorld0;
      }
      if(MadnessGameSelect.gameMode == "arena")
      {
         trace("Attempting Save:");
         var _loc3_ = new MadnessRoster();
         _loc3_.copyRoster(MadnessRoster.playerRoster);
         _loc2_.data.playerRosterMembers = _loc3_.returnCharactersAsObjects();
         _loc3_.myMembers = new Array();
         _loc2_.data.playerRoster = Object(_loc3_);
         _loc2_.data.storeRosterMembers = undefined;
         delete _loc2_.data.storeRosterMembers;
         _loc2_.data.storeRoster = undefined;
         delete _loc2_.data.storeRoster;
         _loc2_.data.newArena = _root.newArena;
         _loc2_.data.currentWave = MadnessLevel.currentLevel.totalWaves;
      }
      _loc2_.flush(600);
      if(MadnessGameSelect.gameMode == "arena")
      {
         trace("                SAVE!                " + _loc2_.data.newArena + " " + _loc2_.data.currentWave);
      }
      trace("After Save: " + _loc2_.getSize() * 0.001 + " kb");
   }
}
