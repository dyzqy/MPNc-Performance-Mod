class MadnessStoreHire extends MovieClip
{
   var squadmatesTEXT;
   var noHirelings;
   var displayCash = new String();
   var myRoster = "store";
   function MadnessStoreHire()
   {
      super();
   }
   function init()
   {
      _root.menuBar.myCashTEXT.text = MadnessTeamSetup.returnPlayerCash();
      var _loc5_ = 0;
      while(this["storeIcon" + String(_loc5_)] != undefined)
      {
         this["storeIcon" + String(_loc5_)].removeMovieClip();
         _loc5_ = _loc5_ + 1;
      }
      var _loc3_ = undefined;
      var _loc7_ = 1;
      var _loc6_ = 140;
      var _loc4_ = 0;
      while(_loc4_ < MadnessRoster.storeRoster.myMembers.length)
      {
         this["storeIcon" + String(_loc4_)].removeMovieClip();
         _loc3_ = this.attachMovie("madness_char_icon","storeIcon" + String(_loc4_),this.getNextHighestDepth());
         _loc3_._x = 425 + _loc4_ * _loc6_ - (MadnessRoster.storeRoster.myMembers.length - 1) * _loc6_ / 2;
         _loc3_._y = 360;
         _loc3_.gotoAndStop("hire");
         _loc3_.closeCard._visible = true;
         _loc3_.myDataRef = MadnessRoster.storeRoster.myMembers[_loc4_];
         MadnessStoreHire.updateCharCard(_loc3_.spriteGroup,MadnessRoster.storeRoster.myMembers[_loc4_],MadnessRoster.storeRoster.myMembers[_loc4_ - 1] != undefined || _loc4_ == 0);
         _loc3_.buttonLead._visible = false;
         _loc3_.charName2TEXT.text = _loc3_.myDataRef.myName;
         _loc3_.levelTEXT.text = "Level " + _loc3_.myDataRef.myLevel;
         _loc3_.barTEXT.text = MadnessDataFile.findHighestSkill(_loc3_.myDataRef);
         _loc3_.costTEXT.text = "$" + Math.ceil(_loc3_.myDataRef.myHireCost);
         MadnessStoreHire.updateIndividualBar(_loc3_.barMerc,_loc3_.myDataRef["skill" + _loc3_.barTEXT.text]);
         _loc3_.healthTEXT.text = _loc3_.myDataRef.myHealthMax;
         _loc3_.tacBarTEXT.text = _loc3_.myDataRef.myTacticsMax;
         _loc3_.mySprite.cacheAsBitmap = true;
         _loc3_.myShade.cacheAsBitmap = true;
         _loc3_.amActive.cacheAsBitmap = true;
         _loc4_ = _loc4_ + 1;
      }
      this.resetBuyButtons();
      this.displayCash = MadnessStoreHire.setDisplayCash(_root.myCash);
      this.squadmatesTEXT.text = String(Math.floor(MadnessRoster.playerRoster.teamLeader.statLEAD / 5));
      if(Math.floor(MadnessRoster.playerRoster.teamLeader.statLEAD / 5) == 1)
      {
         this.squadmatesTEXT.text += " SQUADMATE";
      }
      else
      {
         this.squadmatesTEXT.text += " SQUADMATES";
      }
      if(MadnessRoster.storeRoster.myMembers.length == 0)
      {
         this.noHirelings._visible = true;
      }
      else
      {
         this.noHirelings._visible = false;
      }
   }
   function pressBuy(inCard)
   {
      if(MadnessRoster.playerRoster.myCash >= inCard.myDataRef.myHireCost)
      {
         if(MadnessRoster.playerRoster.myMembers.length < MadnessRoster.maxRoster)
         {
            MadnessRoster.playerRoster.addCharacter(inCard.myDataRef);
            MadnessRoster.storeRoster.removeCharacter(inCard.myDataRef);
            MadnessRoster.playerRoster.myCash = Math.floor(MadnessRoster.playerRoster.myCash - inCard.myDataRef.myHireCost);
            _root.menuBar.myCashTEXT.text = MadnessTeamSetup.returnPlayerCash();
            trace("Hire cash set to " + _root.menuBar.myCashTEXT.text);
            this.init();
            SwainAudioPlayer.playSound("buy",0);
            SwainAudioPlayer.playSound("blunt",0);
         }
         else
         {
            SwainAudioPlayer.playSound("nobuy",0);
         }
      }
      else
      {
         SwainAudioPlayer.playSound("nobuy",0);
      }
   }
   function resetBuyButtons()
   {
   }
   static function setDisplayCash(inCash)
   {
      return "$" + String(inCash);
   }
   static function updateBars(inLoc, inData)
   {
      var _loc2_ = ["barStr","barDex","barTac","barEnd","barLead","barAwr","barPistol","barRevolver","barSMG","barRifle","barShotgun","barMelee","barUnarmed"];
      var _loc6_ = ["statSTR","statDEX","statTAC","statEND","statLEAD","statAWR","skillPistol","skillRevolver","skillSMG","skillRifle","skillShotgun","skillMelee","skillUnarmed"];
      var _loc7_ = undefined;
      var _loc3_ = undefined;
      var _loc8_ = undefined;
      inLoc.healthTEXT.text = inData.myHealthMax;
      inLoc.tacBarTEXT.text = inData.myTacticsMax;
      inLoc.levelTEXT.text = "Level " + inData.myLevel;
      inLoc.charName2TEXT.text = inData.myName;
      inLoc.charNameTEXT.text = inData.myName;
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         _loc3_ = inLoc[_loc2_[_loc1_]];
         MadnessStoreHire.updateIndividualBar(_loc3_,inData[_loc6_[_loc1_]]);
         _loc1_ = _loc1_ + 1;
      }
   }
   static function updateIndividualBar(inBar, inValue)
   {
      inBar.peg1.gotoAndStop(1);
      inBar.peg2.gotoAndStop(1);
      inBar.peg3.gotoAndStop(1);
      inBar.peg4.gotoAndStop(1);
      inBar.peg5.gotoAndStop(1);
      inBar.peg6.gotoAndStop(1);
      inBar.peg7.gotoAndStop(1);
      inBar.peg8.gotoAndStop(1);
      inBar.peg9.gotoAndStop(1);
      inBar.peg10.gotoAndStop(1);
      var _loc1_ = 1;
      var _loc2_ = 0;
      while(_loc2_ < inValue)
      {
         inBar["peg" + _loc1_].nextFrame();
         _loc1_ = _loc1_ + 1;
         if(_loc1_ > 10)
         {
            _loc1_ = 1;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   static function updateCharCard(inCard, inData, inAddTeam)
   {
      if(inData != undefined)
      {
         inCard.gotoAndStop(1);
         inCard.myDataRef = inData;
         if(_root.storeItem != undefined && !_root.storeItem.finished)
         {
            inCard.myWeapon = 2;
         }
         else
         {
            inCard.myWeapon = 0;
         }
         if(_root.storeItem != undefined && !_root.storeItem.finished && _root.storeItem.myCategory == "hat")
         {
            inCard.myHat = 2;
         }
         else
         {
            inCard.myHat = 0;
         }
         if(_root.storeItem != undefined && !_root.storeItem.finished && _root.storeItem.myCategory == "mask")
         {
            inCard.myMask = 2;
         }
         else
         {
            inCard.myMask = 0;
         }
         if(_root.storeItem != undefined && !_root.storeItem.finished && _root.storeItem.myCategory == "mouth")
         {
            inCard.myMouth = 2;
         }
         else
         {
            inCard.myMouth = 0;
         }
         if(_root.storeItem != undefined && !_root.storeItem.finished && _root.storeItem.myCategory == "shirt")
         {
            inCard.myShirt = 2;
         }
         else
         {
            inCard.myShirt = 0;
         }
         inCard.isFacingRight = true;
         inCard.reloadTimer = -1;
         inCard.statName = inCard.myDataRef.myName;
         inCard.mySprite.gotoAndStop(inCard.myDataRef.myIconPos);
         if(inCard._name == "spriteGroup")
         {
            inCard.mySprite.gotoAndPlay(1);
         }
         MadnessCharacter.adjustSprite(inCard);
         MadnessCharacter.clearWounds(inCard,"head");
         MadnessCharacter.clearWounds(inCard,"body");
         MadnessCharacter.checkWounds(inCard);
         inCard.weaponSlot0.myWeapon.gotoAndStop(inCard.myDataRef.myWeapons[0].myType);
         inCard.weaponSlot1.myWeapon.gotoAndStop(inCard.myDataRef.myWeapons[1].myType);
         ItemGenerator.setItemSprite(inCard.weaponSlot0.myWeapon.mySprite,inCard.myDataRef.myWeapons[0]);
         ItemGenerator.setItemSprite(inCard.weaponSlot1.myWeapon.mySprite,inCard.myDataRef.myWeapons[1]);
         if(inCard.myDataRef.myWeapons[0] == undefined)
         {
            inCard.weaponSlot0.gotoAndStop(2);
         }
         if(inCard.myDataRef.myWeapons[1] == undefined)
         {
            inCard.weaponSlot1.gotoAndStop(2);
         }
         if(inCard.myDataRef.amSpecial)
         {
            inCard.myBG.gotoAndStop(2);
         }
         else
         {
            inCard.myBG.gotoAndStop(1);
         }
      }
      else
      {
         inCard.myDataRef = undefined;
         inCard.gotoAndStop(2);
         inCard.addChar._visible = false;
      }
   }
   function rejectCharacter(inCard)
   {
   }
   function gunClick(inCard, inWeapon)
   {
   }
   function gunRollOver(inCard, inWeapon)
   {
   }
   function gunRollOut(inCard, inWeapon)
   {
   }
}
