class MadnessMenu extends MovieClip
{
   var onEnterFrame;
   var myRoster;
   var myBulletTime;
   var slowMoBar;
   var icon0;
   var charNameTEXT;
   var iconWeapon;
   static var currentMenu;
   var dimWidth = 850;
   var dimHeight = 125;
   var iconStartX = 130;
   var iconStartY = 36;
   var iconWidth = 74;
   var iconHeight = 77;
   var iconSpace = 8;
   var reduceSize = 0.5;
   var totalIcons = new Number();
   function MadnessMenu()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init()
   {
      this.myRoster = MadnessRoster.playerRoster;
      this.setIcons();
      this = MadnessMenu.currentMenu;
   }
   function tick()
   {
      var _loc2_ = undefined;
      var _loc3_ = 0;
      while(_loc3_ < this.totalIcons)
      {
         _loc2_ = this["icon" + String(_loc3_)];
         _loc2_.targetHealthY = (this.iconHeight + 5) * (_loc2_.myDataRef.myHealth / _loc2_.myDataRef.myHealthMax);
         if(_loc2_.targetHealthY < - this.iconHeight - 5)
         {
            _loc2_.targetHealthY = - this.iconHeight - 5;
         }
         _loc2_.healthBar._y += (_loc2_.targetHealthY - _loc2_.healthBar._y) * 0.6;
         if(_loc2_.myDataRef.myHealth <= 0)
         {
            _loc2_.deadX._visible = true;
         }
         else
         {
            _loc2_.deadX._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.setWeaponIcon();
      if(MadnessRoster.playerRoster.teamLeader.myMagic == undefined)
      {
         this.myBulletTime.gotoAndStop("buleltTime");
      }
      else
      {
         this.myBulletTime.gotoAndStop("magicBar");
      }
      this.slowMoBar.myBar._xscale = 100 * (this.myRoster.teamLeader.mySlowMo / this.myRoster.teamLeader.mySlowMoMax);
   }
   function setIcons()
   {
      var _loc3_ = 1;
      while(_loc3_ < this.totalIcons)
      {
         this["icon" + String(_loc3_)].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
      this.icon0.myDataRef = this.myRoster.teamLeader;
      this.icon0.mySprite.gotoAndStop(this.icon0.myDataRef.myIconPos);
      this.icon0.targetHealthY = 0;
      this.icon0.headWounds = this.icon0.myDataRef.headWounds;
      this.icon0.bodyWounds = this.icon0.myDataRef.bodyWounds;
      this.icon0.headSpray = this.icon0.myDataRef.headSpray;
      this.icon0.bodySpray = this.icon0.myDataRef.bodySpray;
      this.icon0.myWeapon = 0;
      this.icon0.myHat = 0;
      this.icon0.myMask = 0;
      this.icon0.myMouth = 0;
      this.icon0.myShirt = 0;
      MadnessCharacter.adjustSprite(this.icon0);
      this.charNameTEXT.text = this.icon0.myDataRef.myName;
      this.setWeaponIcon();
      this.totalIcons = 1;
      var _loc4_ = undefined;
      _loc3_ = 0;
      while(_loc3_ < this.myRoster.myActiveMembers.length)
      {
         _loc4_ = this.myRoster.myActiveMembers[_loc3_];
         if(_loc4_ != this.myRoster.teamLeader)
         {
            var _loc2_ = this.attachMovie("ui_mug","icon" + this.totalIcons,this.getNextHighestDepth());
            _loc2_._x = this.iconStartX + (this.iconWidth * this.reduceSize + this.iconSpace) * this.totalIcons;
            _loc2_._y = this.iconStartY;
            _loc2_._xscale *= this.reduceSize;
            _loc2_._yscale *= this.reduceSize;
            _loc2_.myDataRef = _loc4_;
            _loc2_.targetHealthY = 0;
            _loc2_.headWounds = _loc2_.myDataRef.headWounds;
            _loc2_.bodyWounds = _loc2_.myDataRef.bodyWounds;
            _loc2_.headSpray = _loc2_.myDataRef.headSpray;
            _loc2_.bodySpray = _loc2_.myDataRef.bodySpray;
            _loc2_.myWeapon = 0;
            _loc2_.myHat = 0;
            _loc2_.myMask = 0;
            _loc2_.myMouth = 0;
            _loc2_.myShirt = 0;
            _loc2_.mySprite.gotoAndStop(_loc2_.myDataRef.myIconPos);
            MadnessCharacter.adjustSprite(_loc2_);
            this.totalIcons = this.totalIcons + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function refreshPics()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.myRoster.myActiveMembers.length)
      {
         MadnessCharacter.adjustSprite(this["icon" + String(_loc2_)]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setWeaponIcon()
   {
      this.iconWeapon.myGun = this.icon0.myDataRef.myWeapons[this.icon0.myDataRef.myWeapon];
      if(this.iconWeapon.myGun != undefined)
      {
         this.iconWeapon.myAmmo.gotoAndStop(1);
         if(this.iconWeapon.myGun.melee)
         {
            this.iconWeapon.myContainer.myWeapon.gotoAndStop(this.iconWeapon.myGun.myType);
            this.iconWeapon.myContainer2.myWeapon2.gotoAndStop("none");
            ItemGenerator.setItemSprite(this.iconWeapon.myContainer.myWeapon.mySprite,this.iconWeapon.myGun);
            this.iconWeapon.myAmmo.myBar._x = - this.iconWeapon.myAmmo.myBar._width + this.iconWeapon.myGun.myHealth / this.iconWeapon.myGun.myHealthMax * this.iconWeapon.myAmmo.myBar._width;
            this.iconWeapon.myAmmo.myBullet.gotoAndStop(2);
         }
         else
         {
            this.iconWeapon.myContainer.myWeapon.gotoAndStop("none");
            this.iconWeapon.myContainer2.myWeapon2.gotoAndStop(this.iconWeapon.myGun.myType);
            if(this.iconWeapon.myGun.upgradeSilencer)
            {
               this.iconWeapon.myContainer2.myWeapon2.gotoAndStop(this.iconWeapon.myGun.myType + "_silenced");
            }
            this.iconWeapon.myAmmo.myBar._x = - this.iconWeapon.myAmmo.myBar._width + this.iconWeapon.myGun.myAmmo / this.iconWeapon.myGun.myAmmoMax * this.iconWeapon.myAmmo.myBar._width;
            this.iconWeapon.myAmmo.myBullet.gotoAndStop(1);
         }
         this.iconWeapon.myAmmo.myBullet._x = this.iconWeapon.myAmmo.myBar._x + this.iconWeapon.myAmmo.myBar._width;
      }
      else
      {
         this.iconWeapon.myContainer.myWeapon.gotoAndStop("none");
         this.iconWeapon.myContainer2.myWeapon2.gotoAndStop("none");
         this.iconWeapon.myAmmo.gotoAndStop(2);
      }
      if(this.iconWeapon.myGun.melee || this.iconWeapon.myGun == undefined)
      {
         this.iconWeapon.myContainer3.clip1.gotoAndStop("none");
         this.iconWeapon.clipX._visible = false;
         this.iconWeapon.clipsTotal._visible = false;
      }
      else
      {
         this.iconWeapon.myContainer3.clip1.gotoAndStop(this.iconWeapon.myGun.myType);
         this.iconWeapon.clipX._visible = true;
         this.iconWeapon.clipsTotal._visible = true;
      }
      this.iconWeapon.clipsTotal.text = String(this.iconWeapon.myGun.myClips);
   }
   function pressMenu()
   {
      if(!MadnessTransition.transitionLock && !MadnessLevel.levelVictory && MadnessPopup.returnSkipable())
      {
         MadWorld.thisWorld.pauseGame();
         MadnessPopup.closeAll();
         MadnessPopup.addPopup("yesno","Are you sure you want to back out?",null,425,180,this,-1,this.confirmQuit,this.cancelQuit);
      }
   }
   function confirmQuit()
   {
      if(!MadnessTransition.transitionLock)
      {
         _root.createTransition("fade","quit",null);
      }
      else
      {
         MadWorld.thisWorld.unpauseGame();
      }
      MadnessPopup.closeAll();
   }
   function cancelQuit()
   {
      MadWorld.thisWorld.unpauseGame();
      MadnessPopup.closeAll();
   }
}
