class MadnessTeamSetup extends MovieClip
{
   var storeIcon0;
   var selectData;
   var pagePrev;
   var pageNext;
   var pageStringTEXT;
   var selectDisplay;
   var myButtons;
   var statCat;
   var purchasedStat;
   var myColorTransform;
   var myColor;
   var myPointsTEXT;
   var pointsSpendTEXT;
   var displayCash = new String();
   var myRoster = "team";
   var displayPage = 0;
   function MadnessTeamSetup()
   {
      super();
   }
   function init()
   {
      _root.menuBar.myCashTEXT.text = MadnessTeamSetup.returnPlayerCash();
      this.gotoAndStop(1);
      SwainAudioPlayer.playTrack("menu");
      this.removeAllCards();
      var _loc5_ = 140;
      var _loc3_ = undefined;
      var _loc4_ = 0;
      while(_loc4_ < MadnessRoster.playerRoster.myActiveMembers.length)
      {
         this["storeIcon" + String(_loc4_)].removeMovieClip();
         _loc3_ = this.attachMovie("madness_char_icon","storeIcon" + String(_loc4_),this.getNextHighestDepth());
         _loc3_._x = 425 + _loc4_ * _loc5_ - (MadnessRoster.playerRoster.myActiveMembers.length - 1) * _loc5_ / 2;
         _loc3_._y = 380;
         _loc3_.gotoAndStop(1);
         _loc3_.closeCard._visible = true;
         _loc3_.myDataRef = MadnessRoster.playerRoster.myActiveMembers[_loc4_];
         MadnessStoreHire.updateCharCard(_loc3_.spriteGroup,MadnessRoster.playerRoster.myActiveMembers[_loc4_],MadnessRoster.playerRoster.myActiveMembers[_loc4_ - 1] != undefined || _loc4_ == 0);
         this.setLeaderBar(_loc3_);
         _loc3_.charName2TEXT.text = _loc3_.myDataRef.myName;
         _loc3_.healthTEXT.text = _loc3_.myDataRef.myHealthMax;
         _loc3_.tacBarTEXT.text = _loc3_.myDataRef.myTacticsMax;
         _loc4_ = _loc4_ + 1;
      }
      if(MadnessRoster.playerRoster.teamLeader == undefined && this.storeIcon0.spriteGroup.myDataRef != undefined)
      {
         this.makeLeader(this.storeIcon0.spriteGroup.myDataRef);
      }
      this.displayPage = 0;
      this.selectData = MadnessRoster.playerRoster.myMembers[0];
   }
   function init2()
   {
      _root.menuBar.myCashTEXT.text = MadnessTeamSetup.returnPlayerCash();
      this.gotoAndStop(2);
      SwainAudioPlayer.playTrack("menu");
      this.removeAllCards();
      var _loc3_ = undefined;
      var _loc7_ = 5;
      var _loc11_ = 80;
      var _loc8_ = 105;
      var _loc5_ = 6;
      var _loc6_ = 3;
      var _loc10_ = 300;
      var _loc9_ = 170;
      if(this.selectData == undefined)
      {
         this.selectData = MadnessRoster.playerRoster.myMembers[0];
      }
      var _loc4_ = 0;
      while(_loc4_ < _loc6_ * _loc5_)
      {
         _loc3_ = this.attachMovie("madness_char_portrait","portrait" + String(_loc4_),this.getNextHighestDepth());
         if(_loc4_ / _loc5_ == Math.floor((_loc4_ + 1) / _loc5_))
         {
            _loc3_._x = _loc10_;
         }
         else
         {
            _loc3_._x = this["portrait" + (_loc4_ - 1)]._x + _loc11_ + _loc7_;
         }
         _loc3_._y = _loc9_ + Math.floor(_loc4_ / _loc5_) * (_loc8_ + _loc7_);
         if(MadnessRoster.playerRoster.myMembers[_loc4_ + Math.floor(this.displayPage * (_loc6_ * _loc5_))] != undefined)
         {
            MadnessStoreHire.updateCharCard(_loc3_,MadnessRoster.playerRoster.myMembers[_loc4_ + Math.floor(this.displayPage * (_loc6_ * _loc5_))],true);
            _loc3_.amActive._visible = MadnessRoster.playerRoster.returnActiveCharacter(_loc3_.myDataRef);
            _loc3_.amActive.activeStar.gotoAndStop(1);
            if(MadnessRoster.playerRoster.teamLeader == _loc3_.myDataRef)
            {
               _loc3_.amActive.activeStar.gotoAndStop(2);
            }
            _loc3_.myShade._visible = !(MadnessRoster.playerRoster.returnActiveCharacter(_loc3_.myDataRef) || _loc3_.myDataRef == this.selectData);
            _loc3_.selectMe._visible = _loc3_.myDataRef == this.selectData;
         }
         else
         {
            _loc3_.gotoAndStop(3);
            _loc3_.myBG.gotoAndStop(1);
         }
         _loc3_.mySprite.cacheAsBitmap = true;
         _loc3_.myShade.cacheAsBitmap = true;
         _loc3_.amActive.cacheAsBitmap = true;
         _loc4_ = _loc4_ + 1;
      }
      this.pagePrev._visible = this.displayPage > 0;
      this.pageNext._visible = Math.floor((MadnessRoster.playerRoster.myMembers.length - 1) / (_loc6_ * _loc5_)) > this.displayPage;
      this.pageStringTEXT.text = "PAGE " + String(this.displayPage + 1);
      this.selectDisplay.gotoAndStop("none");
      if(this.selectData != undefined)
      {
         this.selectDisplay.gotoAndStop(1);
      }
      MadnessStoreHire.updateCharCard(this.selectDisplay.spriteGroup,this.selectData,true);
      MadnessStoreHire.updateBars(this.selectDisplay,this.selectData);
      this.myButtons.gotoAndStop("main");
      if(this.selectData == MadnessRoster.playerRoster.teamLeader)
      {
         this.myButtons.buttonSquad.gotoAndStop("leader");
      }
      else if(MadnessRoster.playerRoster.returnActiveCharacter(this.selectData))
      {
         this.myButtons.buttonSquad.gotoAndStop("active");
      }
      else if(MadnessRoster.playerRoster.myActiveMembers.length - 1 >= Math.floor(MadnessRoster.playerRoster.teamLeader.statLEAD / 5))
      {
         this.myButtons.buttonSquad.gotoAndStop("full");
      }
      else
      {
         this.myButtons.buttonSquad.gotoAndStop("add");
      }
      if(this.selectData == MadnessRoster.playerRoster.teamLeader)
      {
         this.myButtons.buttonStats.gotoAndStop("player");
         this.myButtons.buttonStats.statFlash._visible = this.selectData.statPoints > 0 || this.selectData.skillPoints > 0;
      }
      else
      {
         this.myButtons.buttonStats.gotoAndStop("follower");
         this.myButtons.buttonStats.statFlash._visible = false;
      }
   }
   function init3()
   {
      _root.menuBar.myCashTEXT.text = MadnessTeamSetup.returnPlayerCash();
      this.gotoAndStop(3);
      SwainAudioPlayer.playTrack("menu");
      this.removeAllCards();
      var _loc7_ = 15;
      var _loc8_ = 72;
      var _loc11_ = 74;
      var _loc13_ = 68;
      var _loc12_ = 17;
      var _loc18_ = 6;
      var _loc17_ = 3;
      var _loc10_ = 310;
      var _loc9_ = 170;
      var _loc3_ = undefined;
      if(this.statCat == "stat")
      {
         _loc3_ = ["STR","DEX","TAC","END","LEAD","AWR"];
      }
      if(this.statCat == "skill")
      {
         _loc3_ = ["Pistol","SMG","Rifle","Shotgun","Melee","Unarmed"];
      }
      this.selectData = MadnessRoster.playerRoster.teamLeader;
      var _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         var _loc4_ = 0;
         while(_loc4_ < 4)
         {
            var _loc5_ = this.attachMovie("perk_peg","peg" + String(_loc6_) + "_" + String(_loc4_),this.getNextHighestDepth());
            _loc5_._x = _loc10_ + (_loc6_ * _loc7_ + _loc6_ * _loc8_);
            _loc5_._y = _loc9_ + _loc11_ + _loc12_ * _loc4_;
            _loc5_.gotoAndStop(1);
            if(this.selectData[this.statCat + _loc3_[_loc6_]] > _loc4_ + 10 * this.displayPage)
            {
               _loc5_.gotoAndStop(2 + this.displayPage);
            }
            _loc5_.myStat = _loc3_[_loc6_];
            _loc5_.myNum = _loc4_ + 1 + 10 * this.displayPage;
            _loc5_.justBought._visible = this.purchasedStat == this.statCat + _loc5_.myStat + _loc5_.myNum;
            _loc5_.amSelected._visible = false;
            _loc4_ = _loc4_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         _loc4_ = 5;
         while(_loc4_ < 9)
         {
            _loc5_ = this.attachMovie("perk_peg","peg" + String(_loc6_) + "_" + String(_loc4_),this.getNextHighestDepth());
            _loc5_._x = _loc10_ + (_loc6_ * _loc7_ + _loc6_ * _loc8_);
            _loc5_._y = _loc9_ + _loc11_ + _loc12_ * (_loc4_ - 1) + _loc13_;
            _loc5_.gotoAndStop(1);
            if(this.selectData[this.statCat + _loc3_[_loc6_]] > _loc4_ + 10 * this.displayPage)
            {
               _loc5_.gotoAndStop(2 + this.displayPage);
            }
            _loc5_.myStat = _loc3_[_loc6_];
            _loc5_.myNum = _loc4_ + 1 + 10 * this.displayPage;
            _loc5_.justBought._visible = this.purchasedStat == this.statCat + _loc5_.myStat + _loc5_.myNum;
            _loc5_.amSelected._visible = false;
            _loc4_ = _loc4_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         _loc5_ = this.attachMovie("perk_5","perk" + String(_loc6_) + "a",this.getNextHighestDepth());
         _loc5_._x = _loc10_ + (_loc6_ * _loc7_ + _loc6_ * _loc8_);
         _loc5_._y = _loc9_ + _loc11_ + _loc12_ * 4;
         _loc5_.gotoAndStop(1);
         this.myColorTransform = {rb:0,gb:0,bb:0};
         if(this.selectData[this.statCat + _loc3_[_loc6_]] > 4 + 10 * this.displayPage)
         {
            _loc5_.gotoAndStop(2 + this.displayPage);
            this.myColorTransform = {rb:255,gb:255,bb:255};
         }
         else
         {
            _loc5_.myLogo._alpha = 40;
         }
         _loc5_.myLogo.gotoAndStop(_loc3_[_loc6_]);
         this.myColor = new Color(_loc5_.myLogo);
         this.myColor.setTransform(this.myColorTransform);
         _loc5_.myStat = _loc3_[_loc6_];
         _loc5_.myNum = 5 + 10 * this.displayPage;
         _loc5_.justBought._visible = this.purchasedStat == this.statCat + _loc5_.myStat + _loc5_.myNum;
         _loc5_.amSelected._visible = false;
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         _loc5_ = this.attachMovie("perk_5","perk" + String(_loc6_) + "b",this.getNextHighestDepth());
         _loc5_._x = _loc10_ + (_loc6_ * _loc7_ + _loc6_ * _loc8_);
         _loc5_._y = _loc9_ + _loc11_ + _loc12_ * 8 + _loc13_;
         _loc5_.gotoAndStop(1);
         this.myColorTransform = {rb:0,gb:0,bb:0};
         if(this.selectData[this.statCat + _loc3_[_loc6_]] > 9 + 10 * this.displayPage)
         {
            _loc5_.gotoAndStop(2 + this.displayPage);
            this.myColorTransform = {rb:255,gb:255,bb:255};
         }
         else
         {
            _loc5_.myLogo._alpha = 40;
         }
         _loc5_.myLogo.gotoAndStop(_loc3_[_loc6_]);
         this.myColor = new Color(_loc5_.myLogo);
         this.myColor.setTransform(this.myColorTransform);
         _loc5_.myStat = _loc3_[_loc6_];
         _loc5_.myNum = 10 + 10 * this.displayPage;
         _loc5_.justBought._visible = this.purchasedStat == this.statCat + _loc5_.myStat + _loc5_.myNum;
         _loc5_.amSelected._visible = false;
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = 0;
      while(_loc6_ < _loc3_.length)
      {
         _loc5_ = this.attachMovie("perk_icon","icon" + String(_loc6_),this.getNextHighestDepth());
         _loc5_._x = _loc10_ + (_loc6_ * _loc7_ + _loc6_ * _loc8_);
         _loc5_._y = _loc9_;
         _loc5_.gotoAndStop(_loc3_[_loc6_]);
         _loc5_.myStat = _loc3_[_loc6_];
         _loc5_.myNum = 0;
         if(this.selectData[this.statCat + "Points"] > 0 && this.selectData[this.statCat + _loc5_.myStat] < this.selectData[this.statCat + "Cap"])
         {
            _loc5_.myBG.gotoAndStop(2);
            _loc5_.myText.textColor = 16777215;
         }
         else
         {
            _loc5_.myBG.gotoAndStop(1);
            _loc5_.myText.textColor = 10066329;
         }
         _loc6_ = _loc6_ + 1;
      }
      this.pagePrev._visible = this.displayPage > 0;
      this.pageNext._visible = this.displayPage < 2;
      this.pageStringTEXT.text = "PAGE " + String(this.displayPage + 1);
      this.myButtons.gotoAndStop("sub");
      this.myButtons.buttonBack.gotoAndStop("back");
      this.myButtons.buttonAlt.gotoAndStop("none");
      if(this.selectData != undefined)
      {
         this.selectDisplay.gotoAndStop(5);
      }
      else
      {
         this.selectDisplay.gotoAndStop("none");
      }
      MadnessStoreHire.updateCharCard(this.selectDisplay.spriteGroup,this.selectData,true);
      MadnessStoreHire.updateBars(this.selectDisplay,this.selectData);
      this.myPointsTEXT.text = this.selectData[this.statCat + "Points"];
      if(this.selectData[this.statCat + "Points"] == 0)
      {
         this.pointsSpendTEXT.textColor = 10027008;
         this.myPointsTEXT.textColor = 10027008;
      }
      else
      {
         this.pointsSpendTEXT.textColor = 16777215;
         this.myPointsTEXT.textColor = 16777215;
      }
   }
   function addTeammate(inData)
   {
      MadnessRoster.playerRoster.makeActive(inData);
      this.init();
   }
   function removeTeammate(inCard)
   {
      if(inCard.myDataRef != MadnessRoster.playerRoster.teamLeader)
      {
         MadnessRoster.playerRoster.removeActive(inCard.myDataRef);
         this.init();
      }
   }
   function makeLeader(inChar)
   {
      MadnessRoster.playerRoster.makeLeader(inChar);
      var _loc2_ = 0;
      while(_loc2_ < MadnessRoster.playerRoster.myActiveMembers.length)
      {
         this.setLeaderBar(this["storeIcon" + _loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function pressPrev()
   {
      this.displayPage = this.displayPage - 1;
      this.init2();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function pressNext()
   {
      this.displayPage = this.displayPage + 1;
      this.init2();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function pressPrev2()
   {
      this.displayPage = this.displayPage - 1;
      this.purchasedStat = "";
      this.init3();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function pressNext2()
   {
      this.displayPage = this.displayPage + 1;
      this.purchasedStat = "";
      this.init3();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function setLeaderBar(inCard)
   {
      if(MadnessRoster.playerRoster.teamLeader == inCard.spriteGroup.myDataRef && MadnessRoster.playerRoster.teamLeader != undefined)
      {
         inCard.buttonLead.gotoAndStop(1);
      }
      else if(inCard.spriteGroup.myDataRef != undefined)
      {
         inCard.buttonLead.gotoAndStop(2);
      }
      else
      {
         inCard.buttonLead.gotoAndStop(3);
      }
   }
   function pressLeader(inSprite)
   {
      this.makeLeader(inSprite.spriteGroup.myDataRef);
      SwainAudioPlayer.playSound("menu1",0);
   }
   function gunClick(inCard, inWeapon)
   {
      inCard.weaponSlot0.rollCover._visible = false;
      inCard.weaponSlot1.rollCover._visible = false;
      this._visible = false;
      this.selectData = inCard.myDataRef;
      _root.pickItems(true);
      SwainAudioPlayer.playSound("menu2",0);
   }
   function gunRollOver(inCard, inWeapon)
   {
   }
   function gunRollOut(inCard, inWeapon)
   {
   }
   function pressPortrait(inPortrait)
   {
      this.selectData = inPortrait.myDataRef;
      this.init2();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function pressConfirm()
   {
      if(MadnessRoster.playerRoster.myActiveMembers.length - 1 < Math.floor(MadnessRoster.playerRoster.teamLeader.statLEAD / 5))
      {
         MadnessRoster.playerRoster.makeActive(this.selectData);
         this.init2();
         SwainAudioPlayer.playSound("menu4",0);
      }
   }
   function pressRemove()
   {
      MadnessRoster.playerRoster.removeActive(this.selectData);
      this.init2();
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressClose()
   {
      this.init2();
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressStore()
   {
      _root.pickStore();
      SwainAudioPlayer.playSound("menu4",0);
   }
   function pressStats(inCat)
   {
      if(inCat == "" || this.statCat == undefined)
      {
         this.statCat = "stat";
      }
      else
      {
         this.statCat = inCat;
      }
      this.displayPage = 0;
      this.init3();
      SwainAudioPlayer.playSound("menu1",0);
   }
   function pressMyGear()
   {
      this._visible = false;
      _root.pickItems(true);
      SwainAudioPlayer.playSound("menu1",0);
   }
   function removeAllCards()
   {
      var _loc3_ = 0;
      while(_loc3_ <= MadnessRoster.playerRoster.myActiveMembers.length)
      {
         this["storeIcon" + String(_loc3_)].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
      var _loc4_ = 0;
      while(this["portrait" + String(_loc4_)] != undefined)
      {
         this["portrait" + String(_loc4_)].removeMovieClip();
         _loc4_ = _loc4_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         var _loc2_ = 0;
         while(_loc2_ < 4)
         {
            this["peg" + String(_loc3_) + "_" + String(_loc2_)].removeMovieClip();
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         this["perk" + String(_loc3_) + "a"].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         _loc2_ = 5;
         while(_loc2_ < 9)
         {
            this["peg" + String(_loc3_) + "_" + String(_loc2_)].removeMovieClip();
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         this["perk" + String(_loc3_) + "b"].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         this["icon" + String(_loc3_)].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
   }
   function clickStat(inIcon)
   {
      if(this.selectData[this.statCat + "Points"] > 0 && this.selectData[this.statCat + inIcon.myStat] < this.selectData[this.statCat + "Cap"])
      {
         this.selectData.buyStat(inIcon.myStat,this.statCat);
         this.displayPage = Math.floor((this.selectData[this.statCat + inIcon.myStat] - 1) / 10);
         this.purchasedStat = this.statCat + inIcon.myStat + this.selectData[this.statCat + inIcon.myStat];
         this.init3();
         SwainAudioPlayer.playSound("blunt",0);
      }
   }
   function displayStatInfo(inIcon)
   {
      inIcon.amSelected._visible = true;
      inIcon.amSelected.play();
      MadnessDataFile.applyPerkDescription(inIcon.myStat,inIcon.myNum,this.selectDisplay.myNameTEXT,this.selectDisplay.myDescriptionTEXT,this.selectData);
   }
   static function returnPlayerCash()
   {
      MadnessRoster.playerRoster.myCash = Math.floor(MadnessRoster.playerRoster.myCash);
      var _loc1_ = Math.floor(MadnessRoster.playerRoster.myCash);
      return "$" + _loc1_;
   }
}
