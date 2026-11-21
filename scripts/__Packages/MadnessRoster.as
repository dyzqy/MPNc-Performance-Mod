class MadnessRoster
{
   var myActiveMembers;
   var myMembers;
   var myWeapons;
   var myArmor;
   var myEvents;
   var teamFaction;
   var teamLeader;
   static var storeRoster;
   static var playerRoster;
   static var maxPlayers = 10;
   static var maxRoster = 999;
   var myCash = new Number();
   var teamFireScore = new Number();
   function MadnessRoster()
   {
      this.myActiveMembers = new Array();
      this.myMembers = new Array();
      this.myWeapons = new Array();
      this.myArmor = new Array();
      this.myEvents = new Array();
   }
   function init(inFaction)
   {
      this.teamFaction = inFaction;
   }
   function addCharacter(inChar)
   {
      this.myMembers.push(inChar);
      inChar.myRoster = this;
      inChar.mySprite.myRoster = this;
      if(this.teamFaction != "deserters")
      {
         inChar.myFaction = this.teamFaction;
      }
   }
   function makeActive(inChar)
   {
      if(this == MadnessRoster.playerRoster)
      {
         var _loc2_ = undefined;
         _loc2_ = 0;
         while(_loc2_ < MadnessRoster.maxPlayers)
         {
            if(this.myActiveMembers[_loc2_] == undefined)
            {
               if(this.returnActiveCharacter(inChar))
               {
                  break;
               }
               this.myActiveMembers.push(inChar);
               if(this.teamLeader == undefined)
               {
                  this.makeLeader(inChar);
               }
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc2_ == MadnessRoster.maxPlayers)
         {
         }
      }
      else if(!this.returnActiveCharacter(inChar))
      {
         this.myActiveMembers.push(inChar);
         this.findLeaderCandidate();
      }
   }
   function removeActive(inChar)
   {
      var _loc2_ = 0;
      while(_loc2_ < MadnessRoster.maxPlayers)
      {
         if(this.myActiveMembers[_loc2_] == inChar)
         {
            this.myActiveMembers.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(inChar == this.teamLeader)
      {
         this.teamLeader = undefined;
         this.findLeaderCandidate();
      }
   }
   function returnActiveCharacter(inChar)
   {
      var _loc2_ = undefined;
      _loc2_ = 0;
      while(_loc2_ < MadnessRoster.maxPlayers)
      {
         if(inChar == this.myActiveMembers[_loc2_])
         {
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc2_ != MadnessRoster.maxPlayers;
   }
   function removeCharacter(inChar)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.myMembers.length)
      {
         if(this.myMembers[_loc2_] == inChar)
         {
            this.myMembers.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.removeActive(inChar);
      if(inChar.myRoster == this)
      {
         inChar.myRoster = undefined;
      }
   }
   function populateRoster(inUnits, inDifficulty, inCategory, inLeader)
   {
      var _loc3_ = 0;
      while(_loc3_ < inUnits)
      {
         var _loc2_ = new MadnessDataFile();
         _loc2_.createNew(MadnessLevel.badguyShoppingList[SwainMath.randomNumber(0,MadnessLevel.badguyShoppingList.length - 1)]);
         this.addCharacter(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function makeLeader(inChar)
   {
      this.teamLeader = inChar;
      var _loc2_ = 0;
      while(_loc2_ < this.myMembers)
      {
         this.myMembers[_loc2_].mySprite.myLeader = this.teamLeader;
         _loc2_ = _loc2_ + 1;
      }
   }
   function findLeaderCandidate()
   {
      this.determineTeamLeader();
   }
   function addWeapon(inWeapon)
   {
      if(inWeapon != undefined)
      {
         this.myWeapons.unshift(inWeapon);
         inWeapon.myOwner = undefined;
      }
   }
   function removeWeapon(inWeapon)
   {
      if(inWeapon != undefined)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.myWeapons.length)
         {
            if(this.myWeapons[_loc2_] == inWeapon)
            {
               this.myWeapons[_loc2_].myOwner = undefined;
               this.myWeapons.splice(_loc2_,1);
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function addArmor(inArmor)
   {
      if(inArmor != undefined)
      {
         this.myArmor.unshift(inArmor);
         this.myArmor.myOwner = undefined;
      }
   }
   function removeArmor(inArmor)
   {
      if(inArmor != undefined)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.myArmor.length)
         {
            if(this.myArmor[_loc2_] == inArmor)
            {
               this.myArmor[_loc2_].myOwner = undefined;
               this.myArmor.splice(_loc2_,1);
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function releaseAllWeapons()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.myWeapons.length)
      {
         var _loc2_ = undefined;
         _loc2_ = 0;
         while(_loc2_ < this.myMembers.length)
         {
            if(this.myWeapons[_loc3_] == this.myMembers[_loc2_].myWeapons[0] || this.myWeapons[_loc3_] == this.myMembers[_loc2_].myWeapons[1])
            {
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc2_ == this.myMembers.length)
         {
            this.myWeapons[_loc3_].myOwner = undefined;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function healTeam()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.myMembers.length)
      {
         this.myMembers[_loc2_].healMe();
         _loc2_ = _loc2_ + 1;
      }
   }
   function gameOver(inReason)
   {
      this.healTeam();
   }
   function copyRoster(otherRoster)
   {
      this.myActiveMembers = new Array();
      this.myMembers = new Array();
      var _loc5_ = 0;
      while(_loc5_ < otherRoster.myMembers.length)
      {
         var _loc4_ = new MadnessDataFile();
         _loc4_.copyCharacter(otherRoster.myMembers[_loc5_]);
         _loc4_.myRoster = this;
         this.myMembers.push(_loc4_);
         if(otherRoster.myMembers[_loc5_] == otherRoster.teamLeader)
         {
            this.teamLeader = _loc4_;
         }
         var _loc3_ = 0;
         while(_loc3_ < otherRoster.myActiveMembers.length)
         {
            if(otherRoster.myMembers[_loc5_] == otherRoster.myActiveMembers[_loc3_])
            {
               this.myActiveMembers.push(_loc4_);
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
      this.teamFaction = otherRoster.teamFaction;
      this.myCash = otherRoster.myCash;
      this.myWeapons = otherRoster.myWeapons;
      this.myArmor = otherRoster.myArmor;
   }
   function returnCharactersAsObjects()
   {
      var _loc2_ = undefined;
      var _loc4_ = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this.myActiveMembers.length)
      {
         _loc2_ = this.myActiveMembers[_loc3_];
         _loc2_.saveAsActive = true;
         _loc2_.saveAsLeader = _loc2_ == this.teamLeader;
         _loc3_ = _loc3_ + 1;
      }
      this.myActiveMembers = new Array();
      _loc3_ = 0;
      while(_loc3_ < this.myMembers.length)
      {
         _loc2_ = this.myMembers[_loc3_];
         _loc2_.myRoster = undefined;
         _loc4_.push(Object(_loc2_));
         _loc3_ = _loc3_ + 1;
      }
      return _loc4_;
   }
   function convertCharactersToMadnessData(inMembers)
   {
      this.myMembers = new Array();
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < inMembers.length)
      {
         _loc3_ = new MadnessDataFile();
         _loc3_.copyCharacter(inMembers[_loc2_]);
         _loc3_.myRoster = this;
         this.myMembers.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function convertActiveMembers()
   {
      var _loc2_ = undefined;
      this.myActiveMembers = new Array();
      var _loc3_ = 0;
      while(_loc3_ < this.myMembers.length)
      {
         _loc2_ = this.myMembers[_loc3_];
         if(_loc2_.saveAsActive)
         {
            _loc2_.saveAsActive = false;
            if(_loc2_.saveAsLeader)
            {
               this.teamLeader = _loc2_;
            }
            _loc2_.saveAsLeader = false;
            this.myActiveMembers.push(_loc2_);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function determineTeamLeader()
   {
      var _loc4_ = 0;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < this.myActiveMembers.length)
      {
         if(this.myActiveMembers[_loc2_].myLevel > _loc4_)
         {
            _loc3_ = this.myActiveMembers[_loc2_];
            _loc4_ = _loc3_.myLevel;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ != undefined)
      {
         this.makeLeader(_loc3_);
      }
   }
   function readjustActiveOrder()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.myActiveMembers.length)
      {
         if(this.myActiveMembers[_loc2_] == this.teamLeader)
         {
            this.myActiveMembers.splice(_loc2_,1);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.myActiveMembers.splice(0,0,this.teamLeader);
   }
}
