class MadnessWorldMap extends MovieClip
{
   var myFader;
   var button0;
   var button_proceed;
   var targetArrow;
   var level0;
   static var maxWorlds = 1;
   function MadnessWorldMap()
   {
      super();
   }
   function init()
   {
      var _loc2_ = new Number();
      var _loc3_ = MadnessGameSelect["storyProgressWorld" + String(_loc2_)];
      while(_loc3_[_loc3_.length - 1] == true && _loc2_ < MadnessWorldMap.maxWorlds)
      {
         _loc2_ = _loc2_ + 1;
         _loc3_ = MadnessGameSelect["storyProgressWorld" + String(_loc2_)];
      }
      this.adjustMap(_loc2_,_loc3_);
      SwainAudioPlayer.playTrack("menu");
   }
   function adjustMap(inWorld, inStages)
   {
      this.gotoAndStop(inWorld + 1);
      this.myFader.gotoAndPlay(1);
      this.button0._visible = true;
      this.hilightLevel(0,true);
      this.button_proceed._visible = false;
      this.targetArrow._visible = true;
      this.targetArrow._x = this.level0._x;
      this.targetArrow._y = this.level0._y;
      var _loc3_ = 0;
      while(_loc3_ < inStages.length)
      {
         this["button" + (_loc3_ + 1)]._visible = inStages[_loc3_];
         this.hilightLevel(_loc3_ + 1,inStages[_loc3_]);
         if(inStages[_loc3_ - 1])
         {
            this.targetArrow._x = this["level" + _loc3_]._x;
            this.targetArrow._y = this["level" + _loc3_]._y;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(inWorld != MadnessWorldMap.maxWorlds)
      {
         _loc3_ = 0;
         while(_loc3_ < inStages.length)
         {
            if(!inStages[_loc3_])
            {
               return undefined;
            }
            _loc3_ = _loc3_ + 1;
         }
         this.button_proceed._visible = true;
         this.targetArrow._visible = false;
      }
   }
   function cheatOpenAll(inWorld)
   {
   }
   function initiateStage()
   {
      if(!MadnessTransition.transitionLock)
      {
         MadnessGameSelect.gameStarted();
         if(MadnessLevel.currentLevel.myCutsceneStart != undefined)
         {
            MadnessCutscene.storeCutsceneInfo(MadnessLevel.currentLevel.myCutsceneStart,"room",MadnessLevel.startPoint);
            _root.createTransition("fade","cutscene",null);
         }
         else
         {
            _root.createTransition("fade","room",MadnessLevel.startPoint);
         }
         SwainAudioPlayer.playSound("menu4",0);
      }
   }
   function pickStage(inWorld, inLevel)
   {
      MadnessPopup.closeAll();
      _root.generateLevel(inWorld,inLevel);
      MadnessPopup.addPopup("mission",MadnessLevel.currentLevel.myDescription,null,425,110,MadnessLevel.currentLevel,-1,this.initiateStage,MadnessPopup.closeAll);
      this.buttonRollOver(inLevel,false);
      SwainAudioPlayer.playSound("menu1",0);
   }
   static function pickArena(inStartWave)
   {
      if(!MadnessTransition.transitionLock)
      {
         _root.generateArena(inStartWave);
         _root.createTransition("fade","room",MadnessLevel.startPoint);
         SwainAudioPlayer.playSound("menu4",0);
      }
   }
   function buttonRollOver(inLevel, inRollOver)
   {
      var _loc3_ = this["level" + inLevel];
      var _loc4_ = new Color(_loc3_);
      var _loc2_ = undefined;
      if(inRollOver)
      {
         _loc2_ = {rb:180,gb:40,bb:40};
         SwainAudioPlayer.playSound("menu2",0);
      }
      else
      {
         _loc2_ = {rb:0,gb:0,bb:0};
      }
      _loc4_.setTransform(_loc2_);
   }
   function hilightLevel(inLevel, inHi)
   {
      var _loc2_ = this["level" + inLevel];
      var _loc4_ = new Color(_loc2_);
      var _loc3_ = undefined;
      var _loc5_ = new flash.filters.GlowFilter(16711680,100,10,10,2.3,1,false,false);
      if(inHi)
      {
         _loc3_ = {rb:0,gb:0,bb:0};
         _loc2_.filters = [_loc5_];
      }
      else
      {
         _loc3_ = {rb:-50,gb:-50,bb:-50};
         _loc2_.filters = undefined;
         delete _loc2_.filters;
      }
      _loc4_.setTransform(_loc3_);
   }
   function pressMenu()
   {
      if(!MadnessTransition.transitionLock && MadnessPopup.returnSkipable())
      {
         _root.createTransition("fade","quit",null);
         SwainAudioPlayer.playSound("menu4",0);
      }
   }
   function pressChangeWorld(inWorld)
   {
      SwainAudioPlayer.playSound("menu4",0);
      this.adjustMap(inWorld,MadnessGameSelect["storyProgressWorld" + String(inWorld)]);
   }
}
