function initPlayButton()
{
   if(this.playButton)
   {
      this.playButton.onRelease = onPlayClick;
      if(!this.showPlayButton)
      {
         this.playButton._visible = false;
      }
   }
}
function onPlayClick()
{
   removeAd();
   _visible = false;
}
stop();
