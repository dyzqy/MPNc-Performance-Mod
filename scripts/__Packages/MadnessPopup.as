class MadnessPopup extends MovieClip
{
   var onEnterFrame;
   var appearing;
   var myDataRef;
   var myLinkedItem;
   var myType;
   var myText;
   var myChar;
   var myTimer;
   var myYesFunction;
   var myNoFunction;
   var myTextField;
   var myTextField2;
   var myTitle1;
   var myTitle2;
   var lineConnectX;
   var lineConnectY;
   var myMask;
   var myFrame;
   var borderMC;
   var myBG;
   var myShadow;
   var myTarget;
   var myLineStart;
   var lineMC;
   var myLevelTEXT;
   var myCashTEXT;
   var xpBar;
   static var currentPopup;
   static var pendingPopups;
   var targetCoord = new Object();
   function MadnessPopup()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init(inDataRef)
   {
      this._alpha = 20;
      this.appearing = true;
      this.myDataRef = inDataRef;
      this.myLinkedItem = this.myDataRef.myLinkedItem;
      if(this.myLinkedItem.myCharacter != undefined)
      {
         this.myLinkedItem = this.myDataRef.myLinkedItem.mySprite;
      }
      this.myType = inDataRef.myType;
      this.myText = inDataRef.myText;
      this.myChar = inDataRef.myChar;
      this._y = inDataRef.myY;
      this._x = inDataRef.myX;
      this.myTimer = inDataRef.myTimer;
      this.myYesFunction = inDataRef.myYesFunction;
      this.myNoFunction = inDataRef.myNoFunction;
      this.gotoAndStop(this.myType);
      if(this.myType == "talk")
      {
         this.gotoAndPlay(this.myType);
      }
      this.myTextField.text = this.myText;
      this.myTextField2.text = this.myText;
      if(this.myType == "mission")
      {
         this.myTitle1.text = this.myLinkedItem.myName;
         this.myTitle2.text = this.myLinkedItem.myName;
      }
      if(this.myType == "talk")
      {
         if(this.myLinkedItem.mySprite.myHead != undefined)
         {
            this.myLinkedItem = this.myLinkedItem.mySprite.myHead;
         }
         this.lineConnectX = 0;
         this.lineConnectY = this.myTextField.textHeight - 5;
         if(this.lineConnectY < 40)
         {
            this.lineConnectY = 30;
         }
         this.moveTarget();
         this.drawLine();
      }
      if(this.myType == "help")
      {
         this.myMask._xscale = 100 + 100 * (this.myTextField.textWidth / 20) + 52;
         this.myMask._yscale = 100 + 100 * (this.myTextField.textHeight / 20) + 76;
         this.myFrame._visible = false;
         this.createEmptyMovieClip("borderMC",this.getNextHighestDepth());
         this.borderMC.lineStyle(1,16711680,100,true,"normal","square","miter",1);
         this.borderMC.moveTo((- this.myMask._width) / 2,0);
         this.borderMC.lineTo(this.myMask._width / 2,0);
         this.borderMC.lineTo(this.myMask._width / 2,this.myMask._height);
         this.borderMC.lineTo((- this.myMask._width) / 2,this.myMask._height);
         this.borderMC.lineTo((- this.myMask._width) / 2,0);
         var _loc4_ = (- this.myMask._width) / 2;
         var _loc3_ = 0;
         this.lineConnectX = 0;
         this.lineConnectY = this.myMask._height;
         this.myBG._x = _loc4_;
         this.myBG._y = _loc3_;
         this.myFrame._x = _loc4_;
         this.myFrame._y = _loc3_;
         this.myTextField._x = 14 + _loc4_;
         this.myTextField._y = 16 + _loc3_;
         this.myMask._x = _loc4_;
         this.myMask._y = _loc3_;
         if(this.myDataRef.buffer == false)
         {
            this.moveTarget();
            this.drawLine();
         }
         else
         {
            this.myBG._visible = false;
            this.myFrame._visible = false;
            this.myTextField._visible = false;
            this.myMask._visible = false;
         }
      }
      else
      {
         this.targetCoord.x = 0;
         this.targetCoord.y = 0;
         this.globalToLocal(this.targetCoord);
         this.myShadow._x = this.targetCoord.x;
         this.myShadow._y = this.targetCoord.y;
      }
      if(this.myType == "arena")
      {
         this.setArenaStats(MadnessRoster.playerRoster.teamLeader);
      }
      if(this.myType == "mission")
      {
         this.missionIconAdjust();
         this.missionDifficulty();
      }
      MadnessPopup.currentPopup = this;
      if(this.myType == "lines")
      {
         SwainAudioPlayer.playSound("menu3",0);
      }
      if(this.myType == "help")
      {
         SwainAudioPlayer.playSound("menu1",0);
      }
      if(this.myType == "talk")
      {
         SwainAudioPlayer.playSound("talk",0);
      }
   }
   function tick()
   {
      if(this.myTimer > 1)
      {
         this.myTimer = this.myTimer - 1;
         if(this.myType == "arena" && this.myTimer < 2)
         {
            this.myTimer = 2;
         }
      }
      if(this.myTimer == 1)
      {
         this.appearing = false;
         if(this.myType !== "help" && this.myType != "lines" || this._alpha <= 0)
         {
            if(this.myYesFunction != null)
            {
               this.pressYes(false);
            }
            this.closePopup();
         }
      }
      if(this._alpha < 100 && this.appearing)
      {
         this._alpha += 20;
      }
      if(this._alpha > 0 && !this.appearing)
      {
         this._alpha -= 20;
      }
      if(this.myDataRef.buffer == false)
      {
         this.moveTarget();
         this.drawLine();
      }
      if(this.myType == "arena" && this.myTimer == 2)
      {
         this.applyXPFromEarned();
         this.setArenaStats(MadnessRoster.playerRoster.teamLeader);
      }
   }
   static function beginPopup()
   {
      var _loc2_ = _root.attachMovie("madness_popup","np" + SwainMath.randomNumber(0,999999999),_root.getNextHighestDepth());
      _loc2_.init(MadnessPopup.pendingPopups[0]);
      _loc2_.onEnterFrame = _loc2_.tick;
      MadnessPopup.pendingPopups.splice(0,1);
   }
   static function addBuffer(inTimer, inYesFunction)
   {
      var _loc1_ = new Object();
      if(MadnessPopup.pendingPopups == undefined)
      {
         MadnessPopup.pendingPopups = new Array();
      }
      MadnessPopup.pendingPopups.push(_loc1_);
      _loc1_.buffer = true;
      _loc1_.myLinkedItem = _loc1_;
      _loc1_.myTimer = inTimer;
      _loc1_.myType = "buffer";
      _loc1_.myYesFunction = inYesFunction;
      if(MadnessPopup.currentPopup == undefined)
      {
         MadnessPopup.beginPopup();
      }
   }
   static function addPopup(inType, inText, inChar, inStickX, inStickY, inLinkedItem, inTimer, inYesFunction, inNoFunction)
   {
      var _loc1_ = new Object();
      if(MadnessPopup.pendingPopups == undefined)
      {
         MadnessPopup.pendingPopups = new Array();
      }
      MadnessPopup.pendingPopups.push(_loc1_);
      _loc1_.buffer = false;
      _loc1_.myType = inType;
      _loc1_.myText = inText;
      _loc1_.myChar = inChar;
      _loc1_.myY = inStickY;
      _loc1_.myX = inStickX;
      _loc1_.myLinkedItem = inLinkedItem;
      _loc1_.myTimer = inTimer;
      _loc1_.myYesFunction = inYesFunction;
      _loc1_.myNoFunction = inNoFunction;
      if(MadnessPopup.currentPopup == undefined)
      {
         MadnessPopup.beginPopup();
      }
   }
   function closePopup()
   {
      MadnessPopup.currentPopup.removeMovieClip();
      MadnessPopup.currentPopup = undefined;
      if(MadnessPopup.pendingPopups.length > 0)
      {
         MadnessPopup.beginPopup();
      }
   }
   static function closeAll()
   {
      MadnessPopup.pendingPopups = new Array();
      MadnessPopup.currentPopup.closePopup();
   }
   function moveTarget()
   {
      if(this.myType == "help" || this.myType == "talk")
      {
         if(this.myLinkedItem._x == undefined)
         {
            this.myTarget._visible = false;
            this.myLineStart._visible = false;
         }
         else
         {
            this.targetCoord.x = 0;
            this.targetCoord.y = 0;
            this.myLinkedItem.localToGlobal(this.targetCoord);
            this.globalToLocal(this.targetCoord);
            this.myTarget._x = this.targetCoord.x;
            this.myTarget._y = this.targetCoord.y;
            if(this.myType == "talk")
            {
               if(this.myTarget._x < 0)
               {
                  this.myTarget._xscale = 100;
               }
               else
               {
                  this.myTarget._xscale = -100;
               }
               if(this.myTarget._x < 0)
               {
                  this.myTarget._x += 36;
               }
               else
               {
                  this.myTarget._x -= 36;
               }
            }
            this.myLineStart._x = this.lineConnectX;
            this.myLineStart._y = this.lineConnectY;
         }
      }
   }
   function drawLine()
   {
      if(this.myType == "help" || this.myType == "talk")
      {
         this.lineMC.removeMovieClip();
         if(this.myLinkedItem._x != undefined)
         {
            this.createEmptyMovieClip("lineMC",this.getNextHighestDepth());
            this.lineMC.lineStyle(1,16711680,100,true,"normal","square","miter",1);
            if(this.myTarget._y <= 0)
            {
               this.lineMC.moveTo(this.lineConnectX,0);
               this.lineMC.lineTo(this.lineConnectX,this.myTarget._y / 2);
            }
            else
            {
               this.lineMC.moveTo(this.lineConnectX,this.lineConnectY);
               this.lineMC.lineTo(this.lineConnectX,this.lineConnectY + (this.myTarget._y - this.lineConnectY) / 2);
            }
            if(this.myType == "talk")
            {
               this.lineMC.lineTo(this.myTarget._x,this.myTarget._y);
            }
            else if(this.myTarget._x < this.lineConnectX)
            {
               this.lineMC.lineTo(this.myTarget._x + this.myTarget._width / 2,this.myTarget._y);
            }
            else
            {
               this.lineMC.lineTo(this.myTarget._x - this.myTarget._width / 2,this.myTarget._y);
            }
         }
      }
   }
   function pressYes(inPlayerPressedYesManually)
   {
      if(inPlayerPressedYesManually)
      {
         SwainAudioPlayer.playSound("menu4",0);
      }
      this.myYesFunction();
      this.closePopup();
   }
   function pressNo()
   {
      this.myNoFunction();
      this.closePopup();
   }
   function setArenaStats(inSource)
   {
      this.myLevelTEXT.text = inSource.myLevel;
      this.myCashTEXT.text = "+ $" + String(Math.floor(MadnessRoster.playerRoster.myCash));
      this.xpBar.myBar._xscale = inSource.myXP / MadnessDataFile.getLevelUpXP(inSource.myLevel,inSource.myXP) * 100;
   }
   function applyXPFromEarned()
   {
      if(_root.earnedXP > 0)
      {
         if(_root.earnedXP > 1)
         {
            MadnessRoster.playerRoster.teamLeader.applyXP(_root.earnedXP * 0.1);
            _root.earnedXP -= _root.earnedXP * 0.1;
         }
         else
         {
            MadnessRoster.playerRoster.teamLeader.applyXP(_root.earnedXP);
            _root.earnedXP = 0;
         }
      }
      if(_root.earnedCash > 0)
      {
         if(_root.earnedCash > 1)
         {
            MadnessRoster.playerRoster.myCash += _root.earnedCash * 0.1;
            _root.earnedCash -= _root.earnedCash * 0.1;
         }
         else
         {
            MadnessRoster.playerRoster.myCash += _root.earnedCash;
            _root.earnedCash = 0;
         }
      }
   }
   function pressMissionCharacter(inSlot)
   {
      MadnessRoster.playerRoster.makeLeader(MadnessRoster.playerRoster.myActiveMembers[inSlot]);
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         this["leader" + _loc2_]._visible = MadnessRoster.playerRoster.myActiveMembers[_loc2_] == MadnessRoster.playerRoster.teamLeader;
         _loc2_ = _loc2_ + 1;
      }
      this.missionIconAdjust();
   }
   function rollOverMissionCharacter(inSlot)
   {
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc4_ = new Color(this["icon" + _loc2_]);
         var _loc3_ = {rb:150,gb:80,bb:80};
         if(_loc2_ != inSlot)
         {
            _loc3_ = {rb:0,gb:0,bb:0};
         }
         _loc4_.setTransform(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function rollOutMissionCharacter(inSlot)
   {
      var _loc3_ = new Color(this["icon" + inSlot]);
      var _loc2_ = {rb:0,gb:0,bb:0};
      _loc3_.setTransform(_loc2_);
   }
   function missionIconAdjust()
   {
      MadnessRoster.playerRoster.readjustActiveOrder();
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         _loc4_ = this["icon" + _loc2_];
         _loc3_ = MadnessRoster.playerRoster.myActiveMembers[_loc2_];
         _loc4_.deadX._visible = false;
         if(_loc3_ == undefined)
         {
            this["charName" + _loc2_].text = "";
            _loc4_.mySprite._visible = false;
            this["select" + _loc2_]._visible = false;
         }
         else
         {
            this["charName" + _loc2_].text = _loc3_.myName;
            MadnessStoreHire.updateCharCard(_loc4_,_loc3_,false);
         }
         this["leader" + _loc2_]._visible = _loc3_ == MadnessRoster.playerRoster.teamLeader;
         _loc2_ = _loc2_ + 1;
      }
   }
   function missionDifficulty()
   {
      var _loc3_ = ["easy","normal","hard"];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         this[_loc3_[_loc2_] + "Difficulty"]._visible = _loc3_[_loc2_] == MadnessGameSelect.myDifficulty;
         this[_loc3_[_loc2_] + "Button"]._visible = _loc3_[_loc2_] != MadnessGameSelect.myDifficulty;
         _loc2_ = _loc2_ + 1;
      }
   }
   function missionChangeDifficulty(inDiff)
   {
      if(!MadnessTransition.transitionLock)
      {
         MadnessGameSelect.myDifficulty = inDiff;
         this.missionDifficulty();
      }
   }
   static function returnSkipable()
   {
      var _loc1_ = 0;
      while(_loc1_ < MadnessPopup.pendingPopups.length)
      {
         if(MadnessPopup.pendingPopups[_loc1_].myType != "help" && MadnessPopup.pendingPopups[_loc1_].myType != "buffer")
         {
            return false;
         }
         _loc1_ = _loc1_ + 1;
      }
      return MadnessPopup.currentPopup.myType == "help" || MadnessPopup.currentPopup.myType == "buffer" || MadnessPopup.currentPopup == undefined;
   }
   function refreshText()
   {
      this.myTextField.text = this.myText;
      this.myTextField2.text = this.myText;
   }
}
