function _onPlayClick()
{
   _root.nextFrame();
   _root.play();
   _parent._onLoaded();
}
if(playButton)
{
   playButton.onRelease = _onPlayClick;
   playButton.stop();
}
if(autoPlay)
{
   _onPlayClick(null);
}
