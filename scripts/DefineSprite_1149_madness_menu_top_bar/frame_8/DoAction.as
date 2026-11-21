function arenaTick()
{
   this.myCashTEXT.text = "$" + MadnessRoster.playerRoster.myCash;
}
onEnterFrame = arenaTick;
