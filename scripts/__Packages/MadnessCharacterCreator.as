class MadnessCharacterCreator extends MovieClip
{
   var selectDisplay;
   var newSubjectTEXT;
   var myKillsTEXT;
   var myCashTEXT;
   var myWavesTEXT;
   var myKillsCareerTEXT;
   var myWavesCareerTEXT;
   var zombieButton;
   static var newGame;
   var nameClicked = false;
   function MadnessCharacterCreator()
   {
      super();
   }
   function init()
   {
      if(MadnessCharacterCreator.newGame)
      {
         this.selectDisplay.gotoAndStop("create");
         this.selectDisplay.newNameTEXT.text = "Enter Name";
         this.selectDisplay.newNameTEXT.text.onSetFocus = function()
         {
            Selection.setSelection(0,this.selectDisplay.newNameTEXT.text.length);
         };
         this.newSubjectTEXT.text = "NEW TEST SUBJECT";
      }
      else
      {
         this.selectDisplay.gotoAndStop("create2");
         this.selectDisplay.newNameTEXT.text = MadnessRoster.playerRoster.teamLeader.myName;
         this.selectDisplay.levelTEXT.text = "Level " + MadnessRoster.playerRoster.teamLeader.myLevel;
         this.newSubjectTEXT.text = "TEST SUBJECT FOUND";
      }
      this.myKillsTEXT.text = MadnessRoster.playerRoster.teamLeader.myKills;
      this.myCashTEXT.text = "$" + Math.floor(MadnessRoster.playerRoster.myCash);
      this.myWavesTEXT.text = MadnessRoster.playerRoster.teamLeader.myWaves;
      this.myKillsCareerTEXT.text = _root.arenaKills;
      this.myWavesCareerTEXT.text = _root.arenaWaves;
      MadnessStoreHire.updateCharCard(this.selectDisplay.spriteGroup,MadnessRoster.playerRoster.teamLeader,false);
      if(MadnessRoster.playerRoster.teamLeader.myLevel >= 30)
      {
         this.zombieButton.gotoAndStop(1);
      }
      else
      {
         this.zombieButton.gotoAndStop(2);
      }
   }
   function pressDone(inMode)
   {
      if(MadnessGameSelect.gameMode == "arena")
      {
         MadnessGameSelect.subGameMode = inMode;
         if(MadnessCharacterCreator.newGame)
         {
            MadnessRoster.playerRoster.teamLeader.myName = this.selectDisplay.newNameTEXT.text;
         }
         if(!MadnessTransition.transitionLock)
         {
            _root.createTransition("fade","arena_menu",null);
            SwainAudioPlayer.playSound("menu4",0);
         }
      }
   }
}
