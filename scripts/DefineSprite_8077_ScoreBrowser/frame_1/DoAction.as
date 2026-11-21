function loadScores()
{
   if(_scoreBoard)
   {
      _scoreBoard.removeEventListener(com.newgrounds.APIEvent.SCORES_LOADED,_onScoresLoaded);
   }
   _scoreBoard = com.newgrounds.API.getScoreBoard(scoreBoardName);
   if(!_scoreBoard)
   {
      if(!com.newgrounds.API.scoreBoards[0])
      {
         com.newgrounds.Logger.logError("No scoreboards created for this movie. You can create scoreboards on your API Settings page at http://www.newgrounds.com/account/flashapi");
         gotoAndStop("error");
         play();
         return undefined;
      }
      _scoreBoard = com.newgrounds.API.scoreBoards[0];
      scoreBoardName = _scoreBoard.name;
      com.newgrounds.Logger.logWarning("No scoreboard name set in the Score Browser component. Defaulting to scoreboard \"" + _scoreBoard.name + "\".");
   }
   _scoreBoard.addEventListener(com.newgrounds.APIEvent.SCORES_LOADED,_onScoresLoaded);
   _scoreBoard.numResults = _numScores;
   _scoreBoard.period = period;
   if(pageText)
   {
      pageText.text = "Page " + _scoreBoard.page;
   }
   _loading = true;
   if(listBox)
   {
      listBox.mouseChildren = false;
      listBox.hideList();
   }
   gotoAndStop("loading");
   _scoreBoard.loadScores();
}
function _onScoresLoaded(event)
{
   _loading = false;
   if(listBox)
   {
      listBox.mouseChildren = true;
   }
   if(event.success)
   {
      gotoAndStop("scores");
   }
   else
   {
      gotoAndStop("error");
      play();
   }
}
function _onPageClick()
{
   var _loc2_ = this;
   if(_scoreBoard && !_loading)
   {
      if(_loc2_ == prevButton)
      {
         _scoreBoard.prevPage();
      }
      else
      {
         _scoreBoard.nextPage();
      }
      loadScores();
   }
}
function _onListChange(selection)
{
   period = selection.data;
   loadScores();
}
var title;
var scoreBoardName;
var period;
if(!title)
{
   title = "High Scores";
}
if(!period)
{
   period = com.newgrounds.ScoreBoard.ALL_TIME;
}
var _scoreBoard;
var _loading;
var _numScores = 10;
var _listItems = [com.newgrounds.ScoreBoard.TODAY,com.newgrounds.ScoreBoard.THIS_WEEK,com.newgrounds.ScoreBoard.THIS_MONTH,com.newgrounds.ScoreBoard.THIS_YEAR,com.newgrounds.ScoreBoard.ALL_TIME];
_X = int(_X);
_Y = int(_Y);
if(titleText)
{
   titleText.text = title;
}
if(prevButton)
{
   prevButton.onRelease = _onPageClick;
}
if(nextButton)
{
   nextButton.onRelease = _onPageClick;
}
gotoAndStop("error");
play();
loadScores();
