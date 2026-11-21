class CharacterGenerator
{
   static var allNames = ["Kurt","Stu","Willy","Geeves","Bateman","James","Axel","Bruno","Caleb","Dale","Tucker","Felix","Fabian","Grant","Hal","Ives","Jarvis","T.J.","Nash","Gavyn","Don","Brooks","Bronson","Heston","Charleton","Clint","Eastwood","Jordan","Duane","Jacob","Stamper","Fulp","Bandelin","Tanner","Brick","Scooter","Roland","Blade","Logan","Xavier","Po","Thor","Odin","Loki","Zeus","Gil","Hermes","Hercules","Hades","Apollo","Frenchie","Aurelius","Zeke","Yale","Wade","Vincent","Vance","Uistean","Thorpe","Shawn","Biddle","Johanson","Francis","Drake","Raleigh","Quade","Pedro","Oliver","Neal","Manuel","Landon","Keegan","Butch","Buck","Kane","Jasper","Smalls","Ponyboy","Godzilla","Sailor","Charles","Mabutu","Chumbo","Ching","Mr.Beautiful","Johnny","Sticky","Duncan","Malcolm","Malone","Professor","Coach","Ellis","Leonardo","Michelangelo","Donatello","Raphael","Oney","O\'Neal","Leon","Norton","Jacob","Fletcher","Grisham","Graham","Harold","Watson","Holmes","Blake","Cartiff","Ulysses","Marty","Lloyd","Emmett","Tiernan","Tiberius","Thadeus","Max","Holden","Hayden","Hadrian","Claus","Claudius","Caesar","Fernando","Gooseman","Hernando","Wheeler","Ma-Ti","Kwame","Captain","Lee","Lucky","King","Spades","Diamonds","Clubs","Swords","Hearts","Cadet","Niko","Roman","Brutus","Sparticus","Clayton","Kleeton","Cleetus","Aden","Abram","Lee","Colby","Maynard","Jonesy","Chauncey","Jack","Harvey","Hugh","Tobias","Phoenix","Simon","Alucard","Alistar","Edgar","Edwin","Reuben","Jonas","Dylan","Kai","Nigel","Percy","Bruce","Alfie","Gordon","Lebowski","Walter","Donnie","Frank","Leo","Deadeye","Skittles","Mr. E","Arnold","Chuck","Sly","Statham","Jet","Dirk","Matches","Sandman","Quintus","Ryu","Moe","Curly","Shemp","Shep","Larry","Ricky","Addison","Adonis","Ajay","Ari","Cale","Carlo","Castle","Dalvin","Ethan","Eli","Ezekiel","Fox","Snake","Wolf","Garett","Gideon","Rocco","Judah","Mick","Sylas","Jan","Lionel","Sabin","Setzer","Spencer","Waylon","Wyatt","Victor","Malakai","Fingers","8-Ball","Swastiko","Tyrone","Filburt","Fanny","Crowley","Grantham","Winston","Enoch","Nucky","Priest","Brains","Sponge","Doc","Rocky","Woody","Chubs","Snickers","Pepsi","Bennet","Mordecai","Percival","Samson","Terrance","Curtis","Johan","Marcus","Kenton","Bond","Ashton","Shepard","Rex","Tony","Ramsay","Darius","Xerxes","Chief","Ivan","Drago","Drachen","Vlad","Joachim","Adolf","Heinrich","Lungren","Dolf","Rolf","Poopoo","Peepee","Rigby","Heisenberg","Pinkman","Gus","Gayle","Conner","Marston","Jose","Dom","Micky","Donald","Church","Churchill","Gaylord"];
   function CharacterGenerator()
   {
   }
   static function generateCharacter(inCharArray, inDifficulty)
   {
   }
   static function generateRoster(inFaction, inUnitsArray)
   {
      var _loc3_ = new MadnessRoster();
      _loc3_.init(inFaction);
      var _loc2_ = 0;
      while(_loc2_ < inUnitsArray.length)
      {
         var _loc1_ = new MadnessDataFile();
         _loc1_.createNew(MadnessLevel.badguyShoppingList[SwainMath.randomNumber(0,MadnessLevel.badguyShoppingList.length - 1)]);
         _loc3_.addCharacter(_loc1_);
         _loc3_.makeActive(_loc1_);
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   static function storePopulator()
   {
      var _loc9_ = MadnessRoster.storeRoster;
      while(MadnessRoster.storeRoster.myMembers.length > 0)
      {
         _loc9_.removeCharacter(_loc9_.myMembers[0]);
      }
      var _loc8_ = 0;
      while(_loc8_ < 2 || _loc8_ < 5 && SwainMath.randomNumber(0,2) < 2)
      {
         var _loc4_ = new MadnessDataFile();
         var _loc3_ = true;
         if(SwainMath.randomNumber(0,10) == 0)
         {
            var _loc2_ = new Array();
            var _loc6_ = undefined;
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 8)
            {
               _loc2_.push("blockhead");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 12)
            {
               _loc2_.push("krinkels");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 10)
            {
               _loc2_.push("swain");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 10)
            {
               _loc2_.push("cheshyre");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 10)
            {
               _loc2_.push("luis");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 20)
            {
               _loc2_.push("tricky");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 20)
            {
               _loc2_.push("jesus");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 15)
            {
               _loc2_.push("deimos");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 15)
            {
               _loc2_.push("sanford");
            }
            if(MadnessRoster.playerRoster.teamLeader.myLevel >= 30)
            {
               _loc2_.push("hank");
            }
            var _loc7_ = 0;
            while(_loc7_ < 3 && _loc3_ == true)
            {
               _loc3_ = false;
               _loc6_ = _loc2_[SwainMath.randomNumber(0,_loc2_.length - 1)];
               var _loc5_ = 0;
               while(_loc5_ < MadnessRoster.storeRoster.myMembers.length)
               {
                  if(MadnessRoster.storeRoster.myMembers[_loc5_].myCharacter == _loc6_)
                  {
                     _loc3_ = true;
                     break;
                  }
                  _loc5_ = _loc5_ + 1;
               }
               if(!_loc3_)
               {
                  _loc5_ = 0;
                  while(_loc5_ < MadnessRoster.playerRoster.myMembers.length)
                  {
                     if(MadnessRoster.playerRoster.myMembers[_loc5_].myCharacter == _loc6_)
                     {
                        _loc3_ = true;
                        break;
                     }
                     _loc5_ = _loc5_ + 1;
                  }
               }
               _loc7_ = _loc7_ + 1;
            }
            if(!_loc3_)
            {
               _loc4_.createNew(_loc6_);
               _loc4_.applyHireCost(_loc4_.myLevel);
               _loc4_.myWeapons[0] = undefined;
               _loc4_.myWeapons[1] = undefined;
               _loc4_.mixStats();
            }
         }
         if(_loc3_)
         {
            _loc4_.createNew("arena_merc");
            _loc4_.randomStats(MadnessRoster.playerRoster.teamLeader.myLevel);
            ItemGenerator.assignGear(_loc4_,MadnessRoster.playerRoster.teamLeader.myLevel);
            _loc4_.myName = CharacterGenerator.allNames[SwainMath.randomNumber(0,CharacterGenerator.allNames.length - 1)];
         }
         if(_loc4_ != undefined && _loc4_.myName != undefined)
         {
            MadnessRoster.storeRoster.addCharacter(_loc4_);
         }
         _loc8_ = _loc8_ + 1;
      }
      if(_root.storeHire != undefined)
      {
         _root.storeHire.init();
      }
   }
   static function returnWaveList(inLevel, inWave)
   {
      var _loc8_ = new Array();
      var _loc6_ = 3 + Math.floor((inLevel + inWave / 4) / 4);
      if(_loc6_ > 6)
      {
         _loc6_ = 6;
      }
      var _loc9_ = new Array();
      var _loc7_ = 0;
      if(inWave == 4 || inWave == 8)
      {
         _loc7_ += Math.ceil(inLevel / (8 - inWave) / 5);
      }
      var _loc2_ = new Array();
      if(MadnessGameSelect.subGameMode == "standard")
      {
         if(inLevel <= 2)
         {
            _loc2_ = ["civ","civ","civ"];
         }
         else if(inLevel <= 4)
         {
            _loc2_ = ["civ","civ","civ","civ"];
         }
         else if(inLevel <= 6)
         {
            _loc2_ = ["civ","civ","agent","agent"];
         }
         else if(inLevel <= 12)
         {
            _loc2_ = ["civ","civ","agent","agent","agent"];
         }
         else if(inLevel <= 16)
         {
            _loc2_ = ["civ","agent","agent","agent","agent","agent"];
         }
         else if(inLevel <= 20)
         {
            _loc2_ = ["agent","agent","agent","agent","agent2","agent2"];
         }
         else if(inLevel <= 24)
         {
            _loc2_ = ["agent","agent","agent","agent2","agent2","agent2"];
         }
         else if(inLevel <= 28)
         {
            _loc2_ = ["agent","agent","agent2","agent2","agent2","agent2"];
         }
         else if(inLevel <= 30)
         {
            _loc2_ = ["agent","agent2","agent2","agent2","agent2","agent3"];
         }
         else if(inLevel <= 32)
         {
            _loc2_ = ["agent2","agent2","agent2","agent3","agent3","agent3"];
         }
         else if(inLevel <= 36)
         {
            _loc2_ = ["agent2","agent2","agent3","agent3","agent3","agent3"];
         }
         else
         {
            _loc2_ = ["agent3","agent3","agent3","agent3","agent3","agent3","agent3"];
         }
         var _loc5_ = new Number();
         if(inWave == 8 && inLevel <= 36 && inLevel / 12 == Math.floor(inLevel / 12))
         {
            _loc5_ = Math.floor(inLevel / 12);
         }
         if(inWave == 4 && inLevel > 36)
         {
            _loc5_ = Math.ceil((inLevel - 36) / 4);
         }
         var _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_.push("fatboy");
            _loc3_ = _loc3_ + 1;
         }
         if(inLevel > 36 && inWave == 8)
         {
            _loc3_ = 0;
            while(_loc3_ < (inLevel - 36) / 4)
            {
               _loc2_.push("fatman");
               _loc3_ = _loc3_ + 1;
            }
         }
         if(inWave == 8 && inLevel > 1 && inLevel / 12 != Math.floor(inLevel / 12))
         {
            if(inLevel <= 4)
            {
               _loc2_.push("agent");
            }
            else if(inLevel <= 16)
            {
               _loc2_.push("agent2");
            }
            else if(inLevel <= 28)
            {
               _loc2_.push("agent3");
            }
         }
      }
      if(MadnessGameSelect.subGameMode == "zombie")
      {
         if(inLevel <= 2)
         {
            _loc2_ = ["zombie","zombie","zombie"];
         }
         else if(inLevel <= 4)
         {
            _loc2_ = ["zombie","zombie","zombie","zombie"];
         }
         else if(inLevel <= 6)
         {
            _loc2_ = ["zombie","zombie","zombie_agent","zombie_agent"];
         }
         else if(inLevel <= 12)
         {
            _loc2_ = ["zombie","zombie","zombie_agent","zombie_agent","zombie_agent"];
         }
         else if(inLevel <= 16)
         {
            _loc2_ = ["zombie","zombie_agent","zombie_agent","zombie_agent","zombie_agent"];
         }
         else if(inLevel <= 20)
         {
            _loc2_ = ["zombie_agent","zombie_agent","zombie_agent","zombie_agent2","zombie_agent2"];
         }
         else if(inLevel <= 24)
         {
            _loc2_ = ["zombie_agent","zombie_agent","zombie_agent2","zombie_agent2","zombie_agent2"];
         }
         else if(inLevel <= 28)
         {
            _loc2_ = ["zombie_agent","zombie_agent2","zombie_agent2","zombie_agent2","zombie_agent2"];
         }
         else if(inLevel <= 30)
         {
            _loc2_ = ["zombie_agent2","zombie_agent2","zombie_agent2","zombie_agent2","zombie_agent3"];
         }
         else if(inLevel <= 32)
         {
            _loc2_ = ["zombie_agent2","zombie_agent2","zombie_agent3","zombie_agent3","zombie_agent3"];
         }
         else if(inLevel <= 36)
         {
            _loc2_ = ["zombie_agent2","zombie_agent3","zombie_agent3","zombie_agent3","zombie_agent3"];
         }
         else
         {
            _loc2_ = ["zombie_agent3","zombie_agent3","zombie_agent3","zombie_agent3","zombie_agent3","zombie_agent3"];
         }
         _loc5_ = new Number();
         if(inLevel > 8 && inWave == 8)
         {
            _loc5_ = 1 + Math.floor(inLevel / 16);
         }
         if(inLevel > 16 && inWave == 4)
         {
            _loc5_ = Math.floor(inLevel / 16);
         }
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_.push("zombie_fatboy");
            _loc3_ = _loc3_ + 1;
         }
         if(inWave == 8 && inLevel > 1 && inLevel / 12 != Math.floor(inLevel / 12))
         {
            if(inLevel <= 4)
            {
               _loc2_.push("zombie_agent");
            }
            else if(inLevel <= 16)
            {
               _loc2_.push("zombie_agent2");
            }
            else if(inLevel <= 28)
            {
               _loc2_.push("zombie_agent3");
            }
         }
      }
      return _loc2_;
   }
   static function returnWaveListPREVIOUS(inLevel, inWave)
   {
      inLevel = inLevel - 1;
      var _loc3_ = new Array();
      var _loc8_ = 3 + Math.floor((inLevel + inWave / 4) / 4);
      var _loc2_ = new Array();
      var _loc7_ = 0;
      if(inWave == 3 || inWave == 7)
      {
         _loc7_ += Math.ceil(inLevel / (8 - inWave) / 5);
      }
      var _loc4_ = 0;
      while(_loc4_ < _loc8_)
      {
         if(inLevel + inWave / 4 - 2 < _loc4_ || _loc4_ <= 1)
         {
            _loc3_.push("civ");
         }
         else if(inLevel > 5 && _loc4_ == 2 && inWave > 3)
         {
            _loc3_.push("agent2");
         }
         else if(inLevel > 9 && _loc4_ == 3 && inWave > 4)
         {
            _loc3_.push("agent3");
         }
         else
         {
            _loc3_.push("agent");
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         if(inLevel + _loc4_ <= 2)
         {
            _loc2_.push("agent");
         }
         else if(inLevel + _loc4_ <= 5)
         {
            _loc2_.push("agent2");
         }
         else if(inLevel + _loc4_ <= 9)
         {
            _loc2_.push("agent3");
         }
         else if(inLevel + _loc4_ <= 15)
         {
            _loc2_.push("fatboy");
         }
         else
         {
            _loc2_.push("fatman");
         }
         _loc4_ = _loc4_ + 1;
      }
      var _loc6_ = new Array();
      _loc4_ = 0;
      while(_loc4_ < _loc3_.length)
      {
         _loc6_.push(_loc3_[_loc4_]);
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < _loc2_.length)
      {
         _loc6_.push(_loc2_[_loc4_]);
         _loc4_ = _loc4_ + 1;
      }
      return _loc6_;
   }
}
