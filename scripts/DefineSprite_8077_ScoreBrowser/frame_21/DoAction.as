function onReloadClick()
{
   loadScores();
}
if(reloadButton)
{
   reloadButton.onRelease = onReloadClick;
}
