class MadnessStoreItems extends MovieClip
{
   var selectData;
   var pagePrev;
   var pageNext;
   var pageStringTEXT;
   var storeDummy;
   var selectDisplay;
   var myButtons;
   var mySubMenu;
   var myColorTransform;
   var myColor;
   var displayPage = 0;
   var myCategory = "weapon0";
   var finished = false;
   var teamActive = false;
   function MadnessStoreItems()
   {
      super();
   }
   function init()
   {
      SwainAudioPlayer.playTrack("menu");
      _root.menuBar.myCashTEXT.text = MadnessTeamSetup.returnPlayerCash();
      this.teamActive = _root.teamSetup != undefined;
      if(this.teamActive)
      {
         this.gotoAndStop(2);
      }
      else
      {
         this.gotoAndStop(1);
      }
      var _loc9_ = 0;
      while(this["item" + String(_loc9_)] != undefined)
      {
         this["item" + String(_loc9_)].removeMovieClip();
         _loc9_ = _loc9_ + 1;
      }
      if(this.myCategory == "weapon0" && !this.teamActive)
      {
         this.myCategory = "ranged";
      }
      var _loc5_ = undefined;
      if(this.teamActive)
      {
         if(this.myCategory == "weapon0")
         {
            _loc5_ = MadnessRoster.playerRoster.myWeapons;
         }
         if(this.myCategory == "weapon1")
         {
            _loc5_ = MadnessRoster.playerRoster.myWeapons;
         }
         if(this.myCategory == "hat")
         {
            _loc5_ = MadnessRoster.playerRoster.myArmor;
         }
         if(this.myCategory == "mask")
         {
            _loc5_ = MadnessRoster.playerRoster.myArmor;
         }
         if(this.myCategory == "mouth")
         {
            _loc5_ = MadnessRoster.playerRoster.myArmor;
         }
         if(this.myCategory == "shirt")
         {
            _loc5_ = MadnessRoster.playerRoster.myArmor;
         }
      }
      else
      {
         if(this.myCategory == "ranged")
         {
            _loc5_ = MadnessRoster.storeRoster.myWeapons;
         }
         if(this.myCategory == "melee")
         {
            _loc5_ = MadnessRoster.storeRoster.myWeapons;
         }
         if(this.myCategory == "hat")
         {
            _loc5_ = MadnessRoster.storeRoster.myArmor;
         }
         if(this.myCategory == "mask")
         {
            _loc5_ = MadnessRoster.storeRoster.myArmor;
         }
         if(this.myCategory == "mouth")
         {
            _loc5_ = MadnessRoster.storeRoster.myArmor;
         }
         if(this.myCategory == "shirt")
         {
            _loc5_ = MadnessRoster.storeRoster.myArmor;
         }
      }
      var _loc6_ = new Array();
      var _loc10_ = undefined;
      if(this.teamActive)
      {
         if(this.myCategory == "weapon0")
         {
            _loc10_ = _root.teamSetup.selectData.myWeapons[0];
         }
         if(this.myCategory == "weapon1")
         {
            _loc10_ = _root.teamSetup.selectData.myWeapons[1];
         }
         if(this.myCategory == "hat")
         {
            _loc10_ = _root.teamSetup.selectData.myHat[0];
         }
         if(this.myCategory == "mask")
         {
            _loc10_ = _root.teamSetup.selectData.myMask[0];
         }
         if(this.myCategory == "mouth")
         {
            _loc10_ = _root.teamSetup.selectData.myMouth[0];
         }
         if(this.myCategory == "shirt")
         {
            _loc10_ = _root.teamSetup.selectData.myShirt[0];
         }
         if(_loc10_ != undefined)
         {
            _loc6_.push(_loc10_);
         }
      }
      var _loc4_ = 0;
      while(_loc4_ < _loc5_.length)
      {
         if(_loc5_[_loc4_].myOwner == undefined)
         {
            if(this.myCategory == _loc5_[_loc4_].myCat || this.myCategory.substr(0,6) == "weapon" || this.myCategory == "ranged" || this.myCategory == "melee")
            {
               if(this.teamActive || this.myCategory != "ranged" && this.myCategory != "melee" || this.myCategory == "ranged" && !_loc5_[_loc4_].melee || this.myCategory == "melee" && _loc5_[_loc4_].melee)
               {
                  _loc6_.push(_loc5_[_loc4_]);
               }
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      if(this.selectData == undefined && _loc10_ != undefined)
      {
         this.selectData = _loc10_;
      }
      var _loc3_ = undefined;
      var _loc12_ = 5;
      var _loc16_ = 80;
      var _loc13_ = 105;
      var _loc7_ = 6;
      var _loc11_ = 3;
      var _loc15_ = 300;
      var _loc14_ = 170;
      var _loc8_ = undefined;
      _loc4_ = 0;
      while(_loc4_ < _loc11_ * _loc7_)
      {
         _loc3_ = this.attachMovie("madness_item_portrait","item" + String(_loc4_),this.getNextHighestDepth());
         _loc8_ = _loc4_ + Math.floor(this.displayPage * (_loc11_ * _loc7_));
         ItemGenerator.setItemSprite(_loc3_.myWeapon.mySprite,_loc6_[_loc8_]);
         _loc3_.myDataRef = _loc6_[_loc8_];
         if(_loc4_ / _loc7_ == Math.floor((_loc4_ + 1) / _loc7_))
         {
            _loc3_._x = _loc15_;
         }
         else
         {
            _loc3_._x = this["item" + (_loc4_ - 1)]._x + _loc16_ + _loc12_;
         }
         _loc3_._y = _loc14_ + Math.floor(_loc4_ / _loc7_) * (_loc13_ + _loc12_);
         if(_loc6_[_loc8_] != undefined)
         {
            _loc3_.myGun = _loc6_[_loc8_];
            _loc3_.amEquipped._visible = _loc3_.myGun == _loc10_;
            _loc3_.myShade._visible = _loc3_.myGun != this.selectData;
            _loc3_.selectMe._visible = _loc3_.myGun == this.selectData;
            _loc3_.gunNameTEXT.text = _loc3_.myGun.myName;
            if(_loc3_.myGun.amSpecial)
            {
               _loc3_.myBG.gotoAndStop(2);
            }
            else
            {
               _loc3_.myBG.gotoAndStop(1);
            }
            if(this.myCategory.substr(0,6) == "weapon")
            {
               _loc3_.gotoAndStop("guns");
            }
            else
            {
               _loc3_.gotoAndStop(this.myCategory);
            }
            _loc3_.myWeapon.gotoAndStop(_loc3_.myGun.myType);
            if(_loc3_.myGun.haveSilencer)
            {
               _loc3_.myWeapon.gotoAndStop(_loc3_.myGun.myType + "_silenced");
            }
            _loc3_.myHat.gotoAndStop(_loc3_.myGun.myType);
            _loc3_.myHat2.gotoAndStop(_loc3_.myGun.myType);
            _loc3_.myMask.gotoAndStop(_loc3_.myGun.myType);
            _loc3_.myMouth.gotoAndStop(_loc3_.myGun.myType);
            _loc3_.myShirt.gotoAndStop(_loc3_.myGun.myType);
            ItemGenerator.setItemSprite(_loc3_.myWeapon.mySprite,_loc3_.myGun);
         }
         else
         {
            _loc3_.gotoAndStop("none");
            _loc3_.myBG.gotoAndStop(1);
         }
         _loc4_ = _loc4_ + 1;
      }
      this.pagePrev._visible = this.displayPage > 0;
      this.pageNext._visible = Math.floor((_loc6_.length - 1) / (_loc11_ * _loc7_)) > this.displayPage;
      this.pageStringTEXT.text = "PAGE " + String(this.displayPage + 1);
      this.storeDummy = new MadnessDataFile();
      this.storeDummy.createNew("woody");
      if(this.teamActive)
      {
         this.storeDummy = _root.teamSetup.selectData;
      }
      if(this.selectData == undefined)
      {
         if(this.myCategory == "weapon1")
         {
            this.storeDummy.myWeapons[2] = this.storeDummy.myWeapons[1];
         }
         else
         {
            this.storeDummy.myWeapons[2] = this.storeDummy.myWeapons[0];
         }
         this.storeDummy.myHat[2] = this.storeDummy.myHat[0];
         this.storeDummy.myMask[2] = this.storeDummy.myMask[0];
         this.storeDummy.myMouth[2] = this.storeDummy.myMouth[0];
         this.storeDummy.myShirt[2] = this.storeDummy.myShirt[0];
      }
      else
      {
         this.storeDummy.equipItem(this.selectData,2);
      }
      this.selectDisplay.gotoAndStop("none");
      if(this.teamActive)
      {
         this.selectDisplay.gotoAndStop(3);
      }
      else
      {
         this.selectDisplay.gotoAndStop(2);
      }
      MadnessStoreHire.updateCharCard(this.selectDisplay.spriteGroup,this.storeDummy,true);
      if(this.selectData == undefined)
      {
         this.selectDisplay.charName2TEXT.text = "";
         this.selectDisplay.charNameTEXT.text = "";
         this.selectDisplay.myDescriptionTEXT.text = "";
         this.selectDisplay.damageTEXT.text = "";
         this.selectDisplay.damageNameTEXT.text = "";
         this.selectDisplay.rangeTEXT.text = "";
         this.selectDisplay.rangeNameTEXT.text = "";
         this.selectDisplay.accuracyTEXT.text = "";
         this.selectDisplay.accuracyNameTEXT.text = "";
         this.selectDisplay.ammoTEXT.text = "";
         this.selectDisplay.ammoNameTEXT.text = "";
      }
      else
      {
         this.selectDisplay.charName2TEXT.text = this.selectData.myNameFull;
         this.selectDisplay.charNameTEXT.text = this.selectData.myName;
         this.selectDisplay.myDescriptionTEXT.text = this.selectData.myDescription;
         if(this.selectData.myCat == "hat" || this.selectData.myCat == "mask" || this.selectData.myCat == "mouth" || this.selectData.myCat == "shirt")
         {
            this.selectDisplay.damageTEXT.text = "";
            this.selectDisplay.damageNameTEXT.text = "";
            this.selectDisplay.rangeTEXT.text = this.selectData.myArmor;
            this.selectDisplay.rangeNameTEXT.text = "Armor";
            this.selectDisplay.accuracyTEXT.text = this.selectData.myWeight.substr(0,1).toUpperCase() + this.selectData.myWeight.substr(1,this.selectData.myWeight.length - 1);
            this.selectDisplay.accuracyNameTEXT.text = "Weight";
            this.selectDisplay.ammoTEXT.text = "";
            this.selectDisplay.ammoNameTEXT.text = "";
         }
         else
         {
            this.selectDisplay.damageTEXT.text = this.selectData.myDamage;
            this.selectDisplay.damageNameTEXT.text = "Damage";
            this.selectDisplay.rangeTEXT.text = this.selectData.myRange;
            this.selectDisplay.rangeNameTEXT.text = "Range";
            this.selectDisplay.accuracyTEXT.text = this.selectData.mySpread;
            this.selectDisplay.accuracyNameTEXT.text = "Accuracy";
            this.selectDisplay.ammoTEXT.text = this.selectData.myAmmoMax;
            this.selectDisplay.ammoNameTEXT.text = "Ammo";
            if(this.selectData.melee)
            {
               this.selectDisplay.accuracyTEXT.text = " - ";
               this.selectDisplay.ammoTEXT.text = " - ";
            }
         }
      }
      this.myButtons.gotoAndStop("sub");
      if(!this.teamActive && this.selectData != undefined)
      {
         if(MadnessRoster.playerRoster.myCash >= this.selectData.myPrice)
         {
            this.myButtons.buttonAlt.gotoAndStop("buy");
         }
         else
         {
            this.myButtons.buttonAlt.gotoAndStop("buy_no");
         }
      }
      if(this.selectData == undefined)
      {
         this.myButtons.buttonAlt.gotoAndStop("equip_no");
      }
      if(this.selectData.myWeight == "none" || this.selectData.myWeight == "light" && MadnessDataFile.havePerk("perkArmor1",this.storeDummy) || this.selectData.myWeight == "med" && MadnessDataFile.havePerk("perkArmor2",this.storeDummy) || this.selectData.myWeight == "heavy" && MadnessDataFile.havePerk("perkArmor3",this.storeDummy))
      {
         if(this.selectData == _loc10_ && _loc10_ != undefined)
         {
            this.myButtons.buttonAlt.gotoAndStop("unequip");
         }
         else if(this.selectData != undefined)
         {
            this.myButtons.buttonAlt.gotoAndStop("equip");
         }
      }
      else if(this.selectData != undefined)
      {
         this.myButtons.buttonAlt.gotoAndStop("heavy");
      }
      if(this.teamActive)
      {
         if(!this.haveCategoryItem("weapon0",this.teamActive))
         {
            this.mySubMenu.buttonMain.gotoAndStop("none");
         }
         else
         {
            this.mySubMenu.buttonMain.gotoAndStop("main");
         }
         if(MadnessDataFile.havePerk("perkSidearm1",this.storeDummy))
         {
            if(!this.haveCategoryItem("weapon1",this.teamActive))
            {
               this.mySubMenu.buttonSide.gotoAndStop("none");
            }
            else
            {
               this.mySubMenu.buttonSide.gotoAndStop("side");
            }
         }
         else
         {
            this.mySubMenu.buttonSide.gotoAndStop("locked");
         }
      }
      if(!this.teamActive)
      {
         if(!this.haveCategoryItem("guns",this.teamActive))
         {
            this.mySubMenu.buttonMain.gotoAndStop("none");
         }
         else
         {
            this.mySubMenu.buttonMain.gotoAndStop("main");
         }
         if(!this.haveCategoryItem("melee",this.teamActive))
         {
            this.mySubMenu.buttonSide.gotoAndStop("melee_none");
         }
         else
         {
            this.mySubMenu.buttonSide.gotoAndStop("main");
         }
      }
      if(!this.teamActive || _root.teamSetup.selectData == MadnessRoster.playerRoster.teamLeader || !_root.teamSetup.selectData.arenaLockArmor)
      {
         if(!this.haveCategoryItem("hat",this.teamActive))
         {
            this.mySubMenu.buttonHat.gotoAndStop("none");
         }
         else
         {
            this.mySubMenu.buttonHat.gotoAndStop("main");
         }
         if(!this.haveCategoryItem("mouth",this.teamActive))
         {
            this.mySubMenu.buttonMouth.gotoAndStop("none");
         }
         else
         {
            this.mySubMenu.buttonMouth.gotoAndStop("main");
         }
         if(!this.haveCategoryItem("mask",this.teamActive))
         {
            this.mySubMenu.buttonMask.gotoAndStop("none");
         }
         else
         {
            this.mySubMenu.buttonMask.gotoAndStop("main");
         }
         if(!this.haveCategoryItem("shirt",this.teamActive))
         {
            this.mySubMenu.buttonShirt.gotoAndStop("none");
         }
         else
         {
            this.mySubMenu.buttonShirt.gotoAndStop("main");
         }
      }
      else
      {
         this.mySubMenu.buttonHat.gotoAndStop("locked");
         this.mySubMenu.buttonMouth.gotoAndStop("locked");
         this.mySubMenu.buttonMask.gotoAndStop("locked");
         this.mySubMenu.buttonShirt.gotoAndStop("locked");
      }
      if(this.teamActive)
      {
         this.myButtons.buttonBack.gotoAndStop("back");
      }
      else
      {
         this.myButtons.buttonBack.gotoAndStop("cost");
         if(this.selectData == undefined)
         {
            this.myButtons.buttonBack.myPriceTEXT.text = "$ ---";
            this.myButtons.buttonAlt.gotoAndStop("buy_no");
         }
         else
         {
            this.myButtons.buttonBack.myPriceTEXT.text = "$" + this.selectData.myPrice;
            if(MadnessRoster.playerRoster.myCash >= this.selectData.myPrice)
            {
               this.myButtons.buttonAlt.gotoAndStop("buy");
            }
            else
            {
               this.myButtons.buttonAlt.gotoAndStop("buy_no");
            }
         }
         this.mySubMenu.buttonSide.gotoAndStop("melee");
      }
      if(this.teamActive)
      {
         this.applyAlpha(this.myCategory);
      }
   }
   function applyAlpha(inCat)
   {
      this.myColorTransform = new Object();
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      var _loc2_ = undefined;
      if(inCat.substr(0,6) == "weapon")
      {
         _loc3_ = this.selectDisplay.spriteGroup.mySprite.handNone_front.myGun;
         if(this.selectData !== this.storeDummy.myWeapons[Number(inCat.substr(-1,1))])
         {
            _loc2_ = 70;
            this.myColorTransform = {rb:80,gb:80,bb:150};
         }
         else
         {
            _loc2_ = 100;
            this.myColorTransform = {rb:0,gb:0,bb:0};
         }
      }
      if(inCat == "hat")
      {
         _loc3_ = this.selectDisplay.spriteGroup.mySprite.myHead.myPart.myHat;
         _loc5_ = this.selectDisplay.spriteGroup.mySprite.myHead.myPart.myHat2;
         if(this.selectData !== this.storeDummy.myHat[0])
         {
            _loc2_ = 70;
            this.myColorTransform = {rb:80,gb:80,bb:150};
         }
         else
         {
            _loc2_ = 100;
            this.myColorTransform = {rb:0,gb:0,bb:0};
         }
      }
      if(inCat == "mask")
      {
         _loc3_ = this.selectDisplay.spriteGroup.mySprite.myHead.myPart.myMask;
         if(this.selectData !== this.storeDummy.myMask[0])
         {
            _loc2_ = 70;
            this.myColorTransform = {rb:80,gb:80,bb:150};
         }
         else
         {
            _loc2_ = 100;
            this.myColorTransform = {rb:0,gb:0,bb:0};
         }
      }
      if(inCat == "mouth")
      {
         _loc3_ = this.selectDisplay.spriteGroup.mySprite.myHead.myPart.myMouth;
         if(this.selectData !== this.storeDummy.myMouth[0])
         {
            _loc2_ = 70;
            this.myColorTransform = {rb:80,gb:80,bb:150};
         }
         else
         {
            _loc2_ = 100;
            this.myColorTransform = {rb:0,gb:0,bb:0};
         }
      }
      if(inCat == "shirt")
      {
         _loc3_ = this.selectDisplay.spriteGroup.mySprite.myBody.myPart.myShirt;
         if(this.selectData !== this.storeDummy.myShirt[0])
         {
            _loc2_ = 70;
            this.myColorTransform = {rb:80,gb:80,bb:150};
         }
         else
         {
            _loc2_ = 100;
            this.myColorTransform = {rb:0,gb:0,bb:0};
         }
      }
      _loc3_._alpha = _loc2_;
      _loc5_._alpha = _loc2_;
      this.myColor = new Color(_loc3_);
      this.myColor.setTransform(this.myColorTransform);
      this.myColor = new Color(_loc5_);
      this.myColor.setTransform(this.myColorTransform);
   }
   function pressPrev()
   {
      this.displayPage = this.displayPage - 1;
      this.init();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function pressNext()
   {
      this.displayPage = this.displayPage + 1;
      this.init();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function pressPortrait(inItem)
   {
      this.selectData = inItem.myGun;
      this.init();
      SwainAudioPlayer.playSound("menu2",0);
   }
   function pressConfirm()
   {
      if(MadnessRoster.playerRoster.myCash >= this.selectData.myPrice)
      {
         if(this.selectData.amArmor)
         {
            MadnessRoster.playerRoster.addArmor(this.selectData);
            MadnessRoster.storeRoster.removeArmor(this.selectData);
         }
         else
         {
            MadnessRoster.playerRoster.addWeapon(this.selectData);
            MadnessRoster.storeRoster.removeWeapon(this.selectData);
         }
         MadnessRoster.playerRoster.myCash = Math.floor(MadnessRoster.playerRoster.myCash - this.selectData.myPrice);
         this.selectData = undefined;
         SwainAudioPlayer.playSound("buy",0);
      }
      this.init();
   }
   function pressEquip()
   {
      if(this.myCategory == "weapon1")
      {
         this.storeDummy.equipItem(this.selectData,1);
      }
      else
      {
         this.storeDummy.equipItem(this.selectData,0);
      }
      this.init();
      SwainAudioPlayer.playSound("swapgun",0);
   }
   function pressUnequip()
   {
      this.storeDummy.unequipItem(this.myCategory,false);
      this.init();
      SwainAudioPlayer.playSound("swapgun",0);
   }
   function pressClose()
   {
      this.finished = true;
      _root.teamSetup._visible = true;
      _root.teamSetup.init2();
      this.removeMovieClip();
      SwainAudioPlayer.playSound("menu4",0);
   }
   function pressItemSlot(inCat)
   {
      if(inCat == "weapon0")
      {
         this.myCategory = inCat;
         if(!this.teamActive)
         {
            this.myCategory = "ranged";
         }
      }
      else if(inCat == "weapon1")
      {
         this.myCategory = inCat;
         if(!this.teamActive)
         {
            this.myCategory = "melee";
         }
      }
      else if(inCat == "hat")
      {
         this.myCategory = inCat;
      }
      else if(inCat == "mask")
      {
         this.myCategory = inCat;
      }
      else if(inCat == "mouth")
      {
         this.myCategory = inCat;
      }
      else if(inCat == "shirt")
      {
         this.myCategory = inCat;
      }
      this.selectData = undefined;
      this.displayPage = 0;
      SwainAudioPlayer.playSound("menu2",0);
      this.init();
   }
   function haveCategoryItem(inCat, inTeamActive)
   {
      var _loc5_ = undefined;
      var _loc3_ = undefined;
      if(inTeamActive)
      {
         _loc5_ = MadnessRoster.playerRoster;
      }
      else
      {
         _loc5_ = MadnessRoster.storeRoster;
      }
      if(inCat.substr(0,6) == "weapon")
      {
         _loc3_ = _loc5_.myWeapons;
         if(_loc3_.length > 0)
         {
            return true;
         }
      }
      else if(inCat == "melee" || inCat == "guns")
      {
         _loc3_ = _loc5_.myWeapons;
      }
      else
      {
         _loc3_ = _loc5_.myArmor;
      }
      if(inTeamActive)
      {
         if(inCat == "weapon0" && _root.teamSetup.selectData.myWeapons[0] != undefined)
         {
            return true;
         }
         if(inCat == "weapon1" && _root.teamSetup.selectData.myWeapons[1] != undefined)
         {
            return true;
         }
         if(inCat == "hat" && _root.teamSetup.selectData.myHat[0] != undefined)
         {
            return true;
         }
         if(inCat == "mask" && _root.teamSetup.selectData.myMask[0] != undefined)
         {
            return true;
         }
         if(inCat == "mouth" && _root.teamSetup.selectData.myMouth[0] != undefined)
         {
            return true;
         }
         if(inCat == "shirt" && _root.teamSetup.selectData.myShirt[0] != undefined)
         {
            return true;
         }
      }
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].myCat == inCat)
         {
            return true;
         }
         if(inCat == "guns" && !_loc3_[_loc2_].melee)
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
}
