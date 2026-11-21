class MadnessTransition extends MovieClip
{
   var onEnterFrame;
   var myAction;
   var myRef;
   static var transitionLock;
   var myPhase = 0;
   function MadnessTransition()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init(inTrans, inAction, inObj)
   {
      this.myAction = inAction;
      this.myRef = inObj;
      this.gotoAndPlay(inTrans);
      MadnessTransition.transitionLock = true;
   }
   function tick()
   {
      if(this.myPhase == 1)
      {
         this.myPhase = 2;
         MadnessPopup.closeAll();
         SwainAudioPlayer.stopAllSounds();
         if(this.myAction == "room")
         {
            _root.currentStart = this.myRef;
            if(_root.gameMenu == undefined)
            {
               _root.createGameMenu();
            }
            else
            {
               _root.gameMenu.init();
            }
            _root.removeRoom();
            _root.createRoom();
            if(this.getDepth() < _root.gameMenu.getDepth())
            {
               _root.gameMenu.swapDepths(this);
            }
            if(_root.gameMenu.getDepth() < _root.newWorld.getDepth())
            {
               _root.newWorld.swapDepths(_root.gameMenu.getDepth());
            }
            _root.exitWorldMap();
            _root.exitHireStore();
            _root.exitItemStore();
            _root.exitTeamSetup();
            _root.cutsceneDone();
            _root.removeMicroMenu();
            if(MadnessGameSelect.myVersion == 1.4)
            {
               MadnessSaveData.saveGame();
            }
            if(MadnessGameSelect.myVersion == 1.3)
            {
               MadnessGameSelect.saveGameOLD();
            }
         }
         if(this.myAction == "menu")
         {
            _root.cutsceneDone();
            _root.removeRoom();
            _root.removeGameMenu();
            _root.createMicroMenu();
            _root.menuBar.swapDepths(this);
            _root.createHireStore();
            _root.worldMap.swapDepths(this);
            MadnessRoster.playerRoster.gameOver();
         }
         if(this.myAction == "arena_menu" || this.myAction == "arena_menu_new")
         {
            _root.removeRoom();
            _root.removeGameMenu();
            MadnessRoster.playerRoster.gameOver("arena");
            if(this.myAction == "arena_menu_new")
            {
               _root.pickCreate();
            }
            if(this.myAction == "arena_menu")
            {
               _root.createMicroMenu("arena");
               _root.menuBar.swapDepths(this);
               _root.pickTeam();
            }
            _root.createCharacter.swapDepths(this);
            MadnessGameSelect.closeGameSelect();
            if(MadnessGameSelect.myVersion == 1.4)
            {
               MadnessSaveData.saveGame();
            }
            if(MadnessGameSelect.myVersion == 1.3)
            {
               MadnessGameSelect.saveGameOLD();
            }
         }
         if(this.myAction == "story_menu" || this.myAction == "story_menu_new")
         {
            _root.cutsceneDone();
            _root.removeRoom();
            _root.removeGameMenu();
            _root.createMicroMenu("story");
            _root.menuBar.swapDepths(this);
            _root.pickMap();
            if(this.getDepth() < _root.worldMap.getDepth())
            {
               _root.worldMap.swapDepths(this);
            }
            MadnessRoster.playerRoster.gameOver();
            MadnessGameSelect.closeGameSelect();
         }
         if(this.myAction == "quit")
         {
            _root.cutsceneDone();
            _root.removeRoom();
            _root.removeGameMenu();
            _root.pickMenu();
            _root.gameSelect.swapDepths(this);
            MadnessRoster.playerRoster.gameOver();
         }
         if(this.myAction == "cutscene")
         {
            _root.exitWorldMap();
            _root.exitHireStore();
            _root.exitItemStore();
            _root.exitTeamSetup();
            _root.removeGameMenu();
            _root.removeRoom();
            _root.createCutscene();
            _root.newCutscene.swapDepths(this);
         }
      }
   }
   function completeTransition()
   {
      MadnessTransition.transitionLock = false;
      this.removeMovieClip();
   }
}
