function onScoreClick()
{
   var _loc3_ = MovieClip(this);
   if(_loc3_.usernameText)
   {
      _root.getURL("http://" + _loc3_.usernameText.text + ".newgrounds.com","_blank");
   }
}
var i = 0;
var scoreClip = scoreContainer.score0;
while(scoreClip)
{
   var score = com.newgrounds.Score(_scoreBoard.scores[i]);
   if(score)
   {
      if(scoreClip.rankText)
      {
         scoreClip.rankText.text = score.rank.toString();
      }
      if(scoreClip.usernameText)
      {
         scoreClip.usernameText.text = score.username;
      }
      if(scoreClip.scoreText)
      {
         scoreClip.scoreText.text = score.score;
      }
      scoreClip.onRelease = onScoreClick;
   }
   else
   {
      if(scoreClip.rankText)
      {
         scoreClip.rankText.text = "";
      }
      if(scoreClip.usernameText)
      {
         scoreClip.usernameText.text = "";
      }
      if(scoreClip.scoreText)
      {
         scoreClip.scoreText.text = "";
      }
      scoreClip.enabled = false;
   }
   i++;
   scoreClip = scoreContainer["score" + i];
}
