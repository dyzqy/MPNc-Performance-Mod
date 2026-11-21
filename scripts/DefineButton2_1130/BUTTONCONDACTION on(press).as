on(press){
   if(!MadnessTransition.transitionLock)
   {
      SwainAudioPlayer.playSound("menu4",0);
      MadnessSaveData.saveGame();
      _root.createTransition("fade","quit",null);
   }
}
