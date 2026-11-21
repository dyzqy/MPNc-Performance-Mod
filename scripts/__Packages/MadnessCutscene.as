class MadnessCutscene extends MovieClip
{
   var onEnterFrame;
   var newMovie;
   var buttonSkip;
   static var currentCutscene;
   static var cutsceneID;
   static var savedAction;
   static var savedObject;
   function MadnessCutscene()
   {
      super();
      this.onEnterFrame = this.tick;
   }
   function init()
   {
      MadnessCutscene.currentCutscene = this;
      this.newMovie = this.attachMovie(MadnessCutscene.cutsceneID,"newMovie",this.getNextHighestDepth());
      if(this.buttonSkip.getDepth() < this.newMovie.getDepth())
      {
         this.newMovie.swapDepths(this.buttonSkip);
      }
      this.newMovie._x = 421.8;
      this.newMovie._y = 284.9;
      SwainAudioPlayer.playTrack(this.returnTrack());
   }
   function tick()
   {
      if(this.newMovie._currentframe == this.newMovie._totalframes)
      {
         this.pressSkip();
      }
   }
   function pressSkip()
   {
      SwainAudioPlayer.stopAllSounds();
      this.newMovie.stop();
      _root.createTransition("instant",MadnessCutscene.savedAction,MadnessCutscene.savedObject);
      MadnessCutscene.closeCutscene();
      SwainAudioPlayer.playSound("menu4",0);
   }
   static function closeCutscene()
   {
      MadnessCutscene.currentCutscene.removeMovieClip();
   }
   static function storeCutsceneInfo(inCutscene, inAction, inObject)
   {
      MadnessCutscene.cutsceneID = inCutscene;
      MadnessCutscene.savedAction = inAction;
      MadnessCutscene.savedObject = inObject;
   }
   function returnTrack()
   {
      var _loc1_ = undefined;
      if(MadnessGameSelect.gameMode == "arena")
      {
      }
      _loc1_ = "menu";
      if(MadnessGameSelect.gameMode == "story")
      {
         if(MadnessCutscene.cutsceneID == "cutscene_world0_start")
         {
            _loc1_ = "stage1";
         }
         if(MadnessCutscene.cutsceneID == "cutscene_world0_end")
         {
            _loc1_ = "stage5";
         }
         if(MadnessCutscene.cutsceneID == "cutscene_world1_start")
         {
            _loc1_ = "stage8";
         }
         if(MadnessCutscene.cutsceneID == "cutscene_world1_end")
         {
            _loc1_ = "stage5";
         }
      }
      return _loc1_;
   }
}
