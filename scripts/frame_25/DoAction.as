function muteMusic()
{
}
function pickCutscene()
{
}
function pickMenu()
{
   exitAll();
   createMainMenu();
}
function pickMap()
{
   exitAll();
   createWorldMap();
}
function pickStore()
{
   exitAll();
   createHireStore();
}
function pickItems(inEquip)
{
   exitWorldMap();
   exitHireStore();
   exitItemStore();
   if(!inEquip)
   {
      exitTeamSetup();
   }
   exitMainMenu();
   createItemStore();
}
function pickTeam()
{
   exitAll();
   createTeamSetup();
}
function pickCreate()
{
   exitAll();
   createNewGuy();
}
function exitAll()
{
   exitWorldMap();
   exitHireStore();
   exitItemStore();
   exitTeamSetup();
   exitMainMenu();
   exitNewGuy();
}
function createRoom()
{
   var _loc1_ = attachMovie("madness_world","newWorld",getNextHighestDepth());
   _loc1_.init(currentStart);
   _loc1_.swapDepths(gameMenu);
}
function removeRoom()
{
   newWorld.removeMovieClip();
   _root.mcScreenCap.removeMovieClip();
   delete newWorld;
}
function createMainMenu()
{
   var _loc1_ = attachMovie("madness_game_select","gameSelect",getNextHighestDepth());
   _loc1_.init();
}
function exitMainMenu()
{
   gameSelect.removeMovieClip();
   delete gameSelect;
}
function createMicroMenu(inGameMode)
{
   removeMicroMenu();
   var _loc1_ = attachMovie("madness_menu_top_bar","menuBar",getNextHighestDepth());
   _loc1_.gotoAndStop(MadnessGameSelect.gameMode);
}
function createGameMenu()
{
   var _loc1_ = attachMovie("madness_game_menu","gameMenu",getNextHighestDepth());
   _loc1_.init();
}
function removeMicroMenu()
{
   menuBar.removeMovieClip();
   delete menuBar;
}
function removeGameMenu()
{
   gameMenu.removeMovieClip();
   delete gameMenu;
}
function createTransition(inTrans, inAction, inObj)
{
   if(!MadnessTransition.transitionLock)
   {
      var _loc1_ = attachMovie("madness_transition","newTransition",getNextHighestDepth());
      _loc1_.init(inTrans,inAction,inObj);
      trace(_loc1_ + " exists?");
   }
}
function createWorldMap()
{
   var _loc1_ = attachMovie("world_map","worldMap",getNextHighestDepth());
   _loc1_.init();
   _loc1_.swapDepths(menuBar);
}
function exitWorldMap()
{
   worldMap.removeMovieClip();
   delete worldMap;
}
function generateLevel(inWorld, inLevel)
{
   var _loc1_ = new MadnessLevel();
   _loc1_.generateLevel(inWorld,inLevel);
}
function generateArena(inStartWave)
{
   var _loc1_ = new MadnessLevel();
   _loc1_.generateArena(inStartWave);
}
function createHireStore()
{
   var _loc1_ = attachMovie("madness_store_hire","storeHire",getNextHighestDepth());
   _loc1_.init();
   _loc1_.swapDepths(menuBar);
}
function exitHireStore()
{
   storeHire.removeMovieClip();
   delete storeHire;
}
function createItemStore()
{
   var _loc1_ = attachMovie("madness_store_items","storeItem",getNextHighestDepth());
   _loc1_.init();
   _loc1_.swapDepths(menuBar);
}
function exitItemStore()
{
   storeItem.removeMovieClip();
   delete storeItem;
}
function createTeamSetup()
{
   var _loc1_ = attachMovie("madness_team_setup","teamSetup",getNextHighestDepth());
   _loc1_.init2();
   _loc1_.swapDepths(menuBar);
}
function exitTeamSetup()
{
   teamSetup.removeMovieClip();
   delete teamSetup;
}
function createNewGuy()
{
   var _loc1_ = attachMovie("madness_character_creator","createCharacter",getNextHighestDepth());
   _loc1_.init();
}
function exitNewGuy()
{
   createCharacter.removeMovieClip();
   delete createCharacter;
}
function selectRosterCharacter(inChar)
{
   playerRoster.myMembers = new Array();
   playerRoster.addCharacter(inChar.myDataRef);
   _root.playerWeaponChoice = "";
}
function createCutscene()
{
   var _loc1_ = attachMovie("madness_cutscene","newCutscene",getNextHighestDepth());
   _loc1_.init();
}
function cutsceneDone()
{
   newCutscene.removeMovieClip();
   delete newCutscene;
}
function workaroundMedalUnlock(inName)
{
   trace("Activating " + inName);
   com.newgrounds.API.unlockMedal(inName);
}
stop();
pickMenu();
