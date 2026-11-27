class ItemGenerator
{
   function ItemGenerator()
   {
   }
   static function storePopulator()
   {
      MadnessRoster.storeRoster.myWeapons = new Array();
      MadnessRoster.storeRoster.myArmor = new Array();
      var _loc11_ = ["head","machette","switchblade","ironknife","bowieknife","carbonknife","l337sword","ironsword","tangsword","carbonsword","dragonsword","binarysword","axe","bottle","urinal","mallet","bat","billyclub","baton","pipe","hammer","sign"];
      var _loc17_ = ["ppk","beretta","glock20","prokiller460","deagle","fiveseven","browning"];
      var _loc13_ = ["500long","500snub","357long","357snub"];
      var _loc16_ = ["hk2","mp7","tmp","mp5k","mp5","pm9","oa93","uzi","m11"];
      var _loc14_ = ["ar15","sr3","ak74","m16","aug","ak74u","hk416","fnfal","m249","famas"];
      var _loc12_ = ["97k","spas12","usas12"];
      var _loc15_ = ["chaingun"];
      if(MadnessGameSelect.gameMode == "arena")
      {
         trace("Populating arena Store");
         var _loc1_ = undefined;
         if(MadnessRoster.playerRoster.teamLeader.myLevel < 3)
         {
            _loc1_ = ["ppk","beretta","browning"];
         }
         else if(MadnessRoster.playerRoster.teamLeader.myLevel < 6)
         {
            _loc1_ = ["ppk","beretta","glock20","prokiller460","500snub","357snub","browning","uspmatch","p1445"];
         }
         else if(MadnessRoster.playerRoster.teamLeader.myLevel < 10)
         {
            _loc1_ = ["hk2","mp7","ppk","beretta","glock20","prokiller460","deagle","97k","500snub","357snub","500long","357long","browning","fiveseven","uspmatch","p1445","automagv"];
         }
         else if(MadnessRoster.playerRoster.teamLeader.myLevel < 15)
         {
            _loc1_ = ["hk2","mp7","tmp","mp5k","mp5","pm9","oa93","ppk","beretta","glock20","prokiller460","deagle","luger","500snub","357snub","500long","357long","97k","spas12","fiveseven","browning","uzi","uspmatch","p1445","automagv","ots33","mp40","thompson"];
         }
         else if(MadnessRoster.playerRoster.teamLeader.myLevel < 20)
         {
            _loc1_ = ["ppk","beretta","glock20","prokiller460","deagle","luger","500snub","357snub","500long","357long","hk2","mp7","tmp","mp5k","mp5","pm9","oa93","ar15","sr3","ak74","m16","aug","ak74u","hk416","97k","spas12","fiveseven","browning","m11","uzi","uspmatch","p1445","automagv","ots33","mp40","thompson","tar21","g36"];
         }
         else
         {
            _loc1_ = ["ppk","beretta","glock20","prokiller460","deagle","luger","500snub","357snub","500long","357long","hk2","mp7","tmp","mp5k","mp5","pm9","oa93","ar15","sr3","ak74","m16","aug","ak74u","hk416","97k","spas12","fnfal","m249","famas","usas12","m203","fiveseven","browning","m11","uzi","uspmatch","p1445","automagv","auto9","ots33","mp40","thompson","tar21","g36"];
         }
         var _loc7_ = ["switchblade","bottle","hammer","pipe","ironknife","mallet","bowieknife","bat","baton","gclub","crowbar","carbonknife","billyclub","machette","ironsword","tangsword","carbonsword","axe","l337sword","dragonsword","sign","binarysword"];
         var _loc5_ = MadnessRoster.playerRoster.teamLeader.myLevel * 1.5;
         if(_loc5_ > 40)
         {
            _loc5_ = 40;
         }
         var _loc2_ = 0;
         while(_loc2_ < _loc5_ && _loc2_ < _loc7_.length)
         {
            _loc1_.push(_loc7_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         var _loc3_ = undefined;
         var _loc4_ = undefined;
         _loc2_ = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = SwainMath.randomNumber(0,_loc1_.length - 1);
            _loc4_ = ItemGenerator.createWeapon(_loc1_[_loc3_],SwainMath.randomNumber(0,10) == 0 && ItemGenerator.canSilence(_loc1_[_loc3_]));
            ItemGenerator.randomizeUpgrades(_loc4_);
            MadnessRoster.storeRoster.addWeapon(_loc4_);
            _loc2_ = _loc2_ + 1;
         }
         var _loc9_ = ["top","tiny","fedora","headphones","hat1","hat2","hat3","hat4","hat5","hat6","hat7","hat8","hair1","hair2","hair3","hair4","hair6","hair7","helmet1","helmet2","helmet3","helmet4","helmet5","helmet6","jonas1","jonas2","jonas3","jonas4","jonas5","jonas6","jonas7","jonas8","jonas9"];
         var _loc8_ = ["mouth1","mouth2","mouth3","mouth4","mouth5","mouth6","mouth7","mouth8","mouth9","mask1","mask2","chin1","beard1","beard2","beard3","beard4"];
         var _loc6_ = ["hi1","hi2","hi3","hi4","hi5","hi6","hi7","hi8","tricky","shades1","shades2","shades3","shades4","shades5","shades6","shades7","shades8","goggles1","paintball1","paintball2","skullmask","beltmask"];
         var _loc10_ = ["armor1","armor2","armor3","armor4","armor5","armor6","armor7","armor8","armor9","armor10","armor11","armor12","armor13","armor14","coat1","coat2","coat3"];
         _loc1_ = new Array();
         _loc2_ = 0;
         while(_loc2_ < _loc9_.length)
         {
            _loc1_.push(_loc9_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc8_.length)
         {
            _loc1_.push(_loc8_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc6_.length)
         {
            _loc1_.push(_loc6_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc10_.length)
         {
            _loc1_.push(_loc10_[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while((_loc2_ < 5 || _loc2_ < _loc5_) && _loc2_ < 40)
         {
            _loc3_ = SwainMath.randomNumber(0,_loc1_.length - 1);
            MadnessRoster.storeRoster.addArmor(ItemGenerator.createArmor(_loc1_[_loc3_]));
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   static function createArmor(inType)
   {
      var _loc1_ = new Object();
      _loc1_.myType = inType;
      _loc1_.myOwner = undefined;
      _loc1_.amArmor = true;
      _loc1_.myIntegrity = 1;
      _loc1_.flipMe = false;
      _loc1_.destructible = false;
      if(inType == "horn")
      {
         _loc1_.myName = "Horns";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "top")
      {
         _loc1_.myName = "Tophat";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "tiny")
      {
         _loc1_.myName = "Tiny Tophat";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "headphones")
      {
         _loc1_.myName = "Headphones";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "halo")
      {
         _loc1_.myName = "Nexus Artifact";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 999999999;
      }
      else if(inType == "fedora")
      {
         _loc1_.myName = "Fedora";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hat1")
      {
         _loc1_.myName = "SWAT Cap";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hat2")
      {
         _loc1_.myName = "Leon Cap";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hat3")
      {
         _loc1_.myName = "Sweatband";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hat4")
      {
         _loc1_.myName = "Ballcap";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hat5")
      {
         _loc1_.myName = "Desperado";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hat6")
      {
         _loc1_.myName = "Bowler";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hat7")
      {
         _loc1_.myName = "Mad Hatter";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hat8")
      {
         _loc1_.myName = "Der Offizier";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 900;
      }
      else if(inType == "hat9")
      {
         _loc1_.myName = "Sombrero";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hair1")
      {
         _loc1_.myName = "Manhair 1";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hair2")
      {
         _loc1_.myName = "Manhair 2";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hair3")
      {
         _loc1_.myName = "Mohawk 1";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hair4")
      {
         _loc1_.myName = "Mohawk 2";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hair5")
      {
         _loc1_.myName = "Krinkels Hawk";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hair6")
      {
         _loc1_.myName = "Scruff 1";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hair7")
      {
         _loc1_.myName = "Scruff 2";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "helmet1")
      {
         _loc1_.myName = "Soldier Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "helmet2")
      {
         _loc1_.myName = "Riot Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 3;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 1200;
      }
      else if(inType == "helmet3")
      {
         _loc1_.myName = "Blast Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 3;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 1200;
      }
      else if(inType == "helmet4")
      {
         _loc1_.myName = "G03LM Scalp";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 3.2;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 8000;
      }
      else if(inType == "helmet5")
      {
         _loc1_.myName = "Cadet Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 3.2;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 8000;
      }
      else if(inType == "helmet6")
      {
         _loc1_.myName = "Robo Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 3.2;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 8000;
      }
      else if(inType == "helmetgolem1")
      {
         _loc1_.myName = "G:013M Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 9999999999;
         _loc1_.myIntegrity = 1;
      }
      else if(inType == "helmetgolem2")
      {
         _loc1_.myName = "G:014M Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 9999999999;
         _loc1_.myIntegrity = 3;
      }
      else if(inType == "helmetgolem_zombie")
      {
         _loc1_.myName = "G:013M Remains";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 9999999999;
         _loc1_.myIntegrity = 1;
      }
      else if(inType == "helmet_mag2")
      {
         _loc1_.myName = "Gestalt Helmet";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 9999999999;
         _loc1_.myIntegrity = 17;
         _loc1_.destructible = true;
      }
      else if(inType == "jonas1")
      {
         _loc1_.myName = "Hawk Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 3;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 1300;
      }
      else if(inType == "jonas2")
      {
         _loc1_.myName = "Steel Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "jonas3")
      {
         _loc1_.myName = "Chromedome";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 3;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 1300;
      }
      else if(inType == "jonas4")
      {
         _loc1_.myName = "Kaiser Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "jonas5")
      {
         _loc1_.myName = "Steel Helm";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "jonas6")
      {
         _loc1_.myName = "Metal Beanie";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "jonas7")
      {
         _loc1_.myName = "McVisor";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "jonas8")
      {
         _loc1_.myName = "Girly 1";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "jonas9")
      {
         _loc1_.myName = "Girly 2";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hat_luis")
      {
         _loc1_.myName = "Sombrero";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hair_luis")
      {
         _loc1_.myName = "Mexi-Hair";
         _loc1_.myCat = "hat";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "mouth1")
      {
         _loc1_.myName = "Breather";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "mouth2")
      {
         _loc1_.myName = "Breather";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "mouth3")
      {
         _loc1_.myName = "Bandana 1";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "mouth4")
      {
         _loc1_.myName = "Breather";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "mouth5")
      {
         _loc1_.myName = "Breather";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "mouth6")
      {
         _loc1_.myName = "Bandana 2";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "mouth7")
      {
         _loc1_.myName = "G03LM Guard";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 8000;
      }
      else if(inType == "mouth8")
      {
         _loc1_.myName = "Horsebox";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "mouth9")
      {
         _loc1_.myName = "Robo Guard";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 8000;
      }
      else if(inType == "mouth10")
      {
         _loc1_.myName = "SARS Guard";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "mask1")
      {
         _loc1_.myName = "Skimask";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "mask2")
      {
         _loc1_.myName = "Ninja Wraps";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 3000;
      }
      else if(inType == "chin1")
      {
         _loc1_.myName = "Krinkelscruff";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "beard1")
      {
         _loc1_.myName = "Beard 1";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "beard2")
      {
         _loc1_.myName = "Beard 2";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "beard3")
      {
         _loc1_.myName = "Beard 3";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "beard4")
      {
         _loc1_.myName = "Beard 4";
         _loc1_.myCat = "mouth";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "hi1")
      {
         _loc1_.myName = "Bi-Techs";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hi2")
      {
         _loc1_.myName = "Uni-Visor";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hi3")
      {
         _loc1_.myName = "Tri-Techs";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hi4")
      {
         _loc1_.myName = "Uni-Techs";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hi5")
      {
         _loc1_.myName = "Pilot Junior";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "hi6")
      {
         _loc1_.myName = "Pilot Pro";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 1;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 900;
      }
      else if(inType == "hi7")
      {
         _loc1_.myName = "Scubaboy";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 1;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 900;
      }
      else if(inType == "hi8")
      {
         _loc1_.myName = "Goggles";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 1;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 900;
      }
      else if(inType == "tricky")
      {
         _loc1_.myName = "Iron Slab";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 1.2;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 9000;
      }
      else if(inType == "shades1")
      {
         _loc1_.myName = "Radio-Shades";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades2")
      {
         _loc1_.myName = "Krinkels Specs";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades3")
      {
         _loc1_.myName = "State Troopers";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades4")
      {
         _loc1_.myName = "Sir Eltons";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades5")
      {
         _loc1_.myName = "Professionals";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades6")
      {
         _loc1_.myName = "Hank Shades";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades7")
      {
         _loc1_.myName = "Blueblockers";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades8")
      {
         _loc1_.myName = "3-D";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades9")
      {
         _loc1_.myName = "Pointdexters";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades10")
      {
         _loc1_.myName = "Hipsters";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades11")
      {
         _loc1_.myName = "Nerd Alert";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades12")
      {
         _loc1_.myName = "Coolguys";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "shades13")
      {
         _loc1_.myName = "Heisenbergs";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "goggles1")
      {
         _loc1_.myName = "Dr. Horrible";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 100;
      }
      else if(inType == "paintball1")
      {
         _loc1_.myName = "Paintball Mask";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.8;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 400;
      }
      else if(inType == "paintball2")
      {
         _loc1_.myName = "Paintball Mask";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.8;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 400;
      }
      else if(inType == "agent1_mask")
      {
         _loc1_.myName = "Agent Shades";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 900;
      }
      else if(inType == "agent1_mask_b")
      {
         _loc1_.myName = "Agent Shades";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 900;
      }
      else if(inType == "agent2_mask")
      {
         _loc1_.myName = "ATP Mask";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 1200;
         _loc1_.flipMe = true;
      }
      else if(inType == "agent3_mask")
      {
         _loc1_.myName = "OBSV Goggles";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 900;
         _loc1_.flipMe = true;
      }
      else if(inType == "cheshyre")
      {
         _loc1_.myName = "Cheshyre\'s Mug";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 900;
      }
      else if(inType == "skullmask")
      {
         _loc1_.myName = "Skullmask";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 1;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 900;
      }
      else if(inType == "beltmask")
      {
         _loc1_.myName = "Beltmask";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "luis")
      {
         _loc1_.myName = "Luis Brow";
         _loc1_.myCat = "mask";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 0;
      }
      else if(inType == "armor1")
      {
         _loc1_.myName = "Padded Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 3;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "armor2")
      {
         _loc1_.myName = "Utility Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 2;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "armor3")
      {
         _loc1_.myName = "Armored Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 3;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "armor4")
      {
         _loc1_.myName = "Armored Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 3;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "armor5")
      {
         _loc1_.myName = "Armored Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 5;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "armor6")
      {
         _loc1_.myName = "Metal Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 10;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 1200;
      }
      else if(inType == "armor7")
      {
         _loc1_.myName = "Metal Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 10;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 1200;
      }
      else if(inType == "armor8")
      {
         _loc1_.myName = "Armored Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 6;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "armor9")
      {
         _loc1_.myName = "Armored Suit";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 6;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "armor10")
      {
         _loc1_.myName = "Padded Suit";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 6;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "armor11")
      {
         _loc1_.myName = "Armored Suit";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 6;
         _loc1_.myWeight = "med";
         _loc1_.myPrice = 500;
      }
      else if(inType == "armor12")
      {
         _loc1_.myName = "Metal Suit";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 10.5;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 5000;
      }
      else if(inType == "armor13")
      {
         _loc1_.myName = "G03LM Scraps";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 10.5;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 5000;
      }
      else if(inType == "armor14")
      {
         _loc1_.myName = "Robo Armor";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 10.5;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 5000;
      }
      else if(inType == "armor_hoody")
      {
         _loc1_.myName = "Reinforced Hoody";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 4;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 300;
      }
      else if(inType == "coat1")
      {
         _loc1_.myName = "Long Coat";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "coat2")
      {
         _loc1_.myName = "Duster";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "coat3")
      {
         _loc1_.myName = "Trenchcoat";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 0.5;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 200;
      }
      else if(inType == "armorgolem1")
      {
         _loc1_.myName = "G:013M Suit";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 99999999999;
      }
      else if(inType == "armorgolem2")
      {
         _loc1_.myName = "G:014M Suit";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 99999999999;
      }
      else if(inType == "armorgolem_zombie")
      {
         _loc1_.myName = "G:013M Remains";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 99999999999;
      }
      else if(inType == "armor_mag2")
      {
         _loc1_.myName = "Gestalt Armor";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 100;
         _loc1_.myWeight = "heavy";
         _loc1_.myPrice = 99999999999;
         _loc1_.myIntegrity = 13;
         _loc1_.destructible = true;
      }
      else if(inType == "poncho")
      {
         _loc1_.myName = "Poncho";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 4;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 300;
      }
      else if(inType == "machette")
      {
         _loc1_.myName = "Mexi-Vest";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 4;
         _loc1_.myWeight = "light";
         _loc1_.myPrice = 300;
      }
      else if(inType == "handstraps")
      {
         _loc1_.myName = "Hand Straps";
         _loc1_.myCat = "shirt";
         _loc1_.myArmor = 0;
         _loc1_.myWeight = "none";
         _loc1_.myPrice = 9999999999;
         _loc1_.myIntegrity = 2;
      }
      if(_loc1_.myCat == "hat")
      {
         _loc1_.myDescription = "Cover up that pretty skull with something your enemies can take aim at.";
      }
      if(_loc1_.myCat == "mask")
      {
         _loc1_.myDescription = "They couldn\'t see your eyes before, but now you can be extra certain of it.";
      }
      if(_loc1_.myCat == "mouth")
      {
         _loc1_.myDescription = "Take your inner badass to the next level with some sweet gob gear.";
      }
      if(_loc1_.myCat == "shirt")
      {
         _loc1_.myDescription = "Your head isn\'t the only vital point on your body that needs covering.";
      }
      _loc1_.myPrice += _loc1_.myArmor * 100;
      _loc1_.myNameFull = _loc1_.myName;
      if(inType == "" || inType == undefined)
      {
         _loc1_ = undefined;
      }
      return _loc1_;
   }
   static function createWeapon(inType, silencer)
   {
      var _loc1_ = new Object();
      _loc1_.ammoArray = new Array();
      _loc1_.amArmor = false;
      _loc1_.myType = inType;
      _loc1_.myOwner = undefined;
      _loc1_.upgradeSight = false;
      _loc1_.upgradeLaser = false;
      _loc1_.myColor = 1;
      _loc1_.startClips = 2;
      _loc1_.upgradeSilencer = silencer;
      _loc1_.myRoster = undefined;
      _loc1_.myFaction = undefined;
      _loc1_.noPickup = false;
      _loc1_.myWeight = "none";
      _loc1_.amHook = false;
      _loc1_.myDescription = "HELLO";
      _loc1_.singleBulletClip = false;
      _loc1_.amWeapon = true;
      _loc1_.amHeavy = false;
      _loc1_.myTracer = "bullet";
      if(inType == "hk2")
      {
         _loc1_.myTag = "SMG - HK2";
         _loc1_.myName = "H&K SMG2";
         _loc1_.mySound = "smg3";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "H&K SMG2 9x19mm";
         _loc1_.myDescription = "Rather ordinary sub machine-gun for rather ordinary sub-machinegun tastes.  Perfoms well across the board.";
         _loc1_.myROF = 10;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 135;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "mp7")
      {
         _loc1_.myTag = "SMG - MP7";
         _loc1_.myName = "H&K MP7";
         _loc1_.mySound = "smg3";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_PDW";
         _loc1_.myNameFull = "H&K MP7 4.7x30mm";
         _loc1_.myDescription = "High magazine capacity, decent power output, good rate of fire. Just another great way to mess up someone\'s day.";
         _loc1_.myROF = 8;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 5;
         _loc1_.myRange = 135;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 40;
      }
      else if(inType == "tmp")
      {
         _loc1_.myTag = "SMG - TMP";
         _loc1_.myName = "Steyr TMP";
         _loc1_.mySound = "smg1";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Steyr TMP 9x19mm";
         _loc1_.myDescription = "A firearm made popular by its insane rate of fire. With this you can invite everyone in the room to a bullet party nearly instantly!";
         _loc1_.myROF = 4;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 10;
         _loc1_.myRange = 115;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "mp5k")
      {
         _loc1_.myTag = "SMG - MP5k";
         _loc1_.myName = "H&K MP5K";
         _loc1_.mySound = "smg1";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "H&K MP5K 9x19mm";
         _loc1_.myDescription = "A more petite alternative to your traditional full auto while still maintaining a modicum of accuracy and control.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 10;
         _loc1_.myRange = 115;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "mp5")
      {
         _loc1_.myTag = "SMG - MP5";
         _loc1_.myName = "H&K MP5";
         _loc1_.mySound = "smg3";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "H&K MP5 9x19mm";
         _loc1_.myDescription = "Made popular in Nevada for one reason: It is very good at what it does.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 140;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "pm9")
      {
         _loc1_.myTag = "SMG - Mineaba PM9";
         _loc1_.myName = "Mineaba PM9";
         _loc1_.mySound = "smg1";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Mineaba PM9 9x19mm";
         _loc1_.myDescription = "This submachinegun trades some accuracy for rate of fire while keeping (most) of it\'s overall power intact.";
         _loc1_.myROF = 4;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 120;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 25;
      }
      else if(inType == "oa93")
      {
         _loc1_.myTag = "SMG - OA93";
         _loc1_.myName = "O.A.93";
         _loc1_.mySound = "smg2";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "O.A.93 5.56x45mm";
         _loc1_.myDescription = "A grossly oversized pistol firing a rifle round in a fully automatic manner. This gun is an identity crisis that shoots bullets.";
         _loc1_.myROF = 12;
         _loc1_.myDamage = 10;
         _loc1_.mySpread = 10;
         _loc1_.myRange = 115;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "m11")
      {
         _loc1_.myTag = "SMG - M11";
         _loc1_.myName = "M11";
         _loc1_.mySound = "m11";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "M-11 9x17mm";
         _loc1_.myDescription = "This gun is great for when rate of fire matters most.  32 rounds downrange faster than you can handle it.";
         _loc1_.myROF = 4;
         _loc1_.myDamage = 5.5;
         _loc1_.mySpread = 10;
         _loc1_.myRange = 110;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 32;
         _loc1_.startClips = 3;
      }
      else if(inType == "uzi")
      {
         _loc1_.myTag = "SMG - Uzi";
         _loc1_.myName = "Uzi";
         _loc1_.mySound = "uzi";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Uzi 9x19mm";
         _loc1_.myDescription = "Famous for being as functional as an MP-5 but without being so German about it.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 130;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 32;
      }
      else if(inType == "thompson")
      {
         _loc1_.myTag = "SMG - Thompson";
         _loc1_.myName = "Thompson";
         _loc1_.mySound = "thompson";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Thompson 11.43Ã—23mm";
         _loc1_.myDescription = "The iconic tommygun. The original hand held lead stream.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 8.5;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 110;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "mp40")
      {
         _loc1_.myTag = "SMG - MP40";
         _loc1_.myName = "MP40";
         _loc1_.mySound = "mp40";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "smg";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "MP-40 9x19mm";
         _loc1_.myDescription = "Ergonomics was not the strong suit of this weapon\'s design, mind the heat coming off the barrel.";
         _loc1_.myROF = 8;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 140;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 32;
      }
      else if(inType == "ar15")
      {
         _loc1_.myTag = "Rifle - AR15";
         _loc1_.myName = "AR-15";
         _loc1_.mySound = "ar15";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "AR-15 5.56x45mm";
         _loc1_.myDescription = "The most mass produced .223 rifle the world has ever seen.  A great all-purpose rifle, just don\'t forget your cleaning kit.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 4;
         _loc1_.myRange = 200;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "sr3")
      {
         _loc1_.myTag = "Rifle - SR3";
         _loc1_.myName = "SR-3";
         _loc1_.mySound = "sr3";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle9";
         _loc1_.myNameFull = "SR-3 9x39mm";
         _loc1_.myDescription = "Tiny rifle bullets might do for your run of the mill gunfigher, but others might go for this gun. The SR3 is both brutal and compact.";
         _loc1_.myROF = 10;
         _loc1_.myDamage = 12;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 190;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 20;
         _loc1_.startClips = 3;
      }
      else if(inType == "ak74")
      {
         _loc1_.myTag = "Rifle - AK74";
         _loc1_.myName = "AK-74";
         _loc1_.mySound = "ak74";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "AK-74 5.45x39mm";
         _loc1_.myDescription = "This rifle will be a handy thing to have around when body armor starts getting popular in Nevada.";
         _loc1_.myROF = 12;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 200;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "m16")
      {
         _loc1_.myTag = "Rifle - M16";
         _loc1_.myName = "Colt M-16";
         _loc1_.mySound = "ar15";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "Colt M-16 5.56x45mm";
         _loc1_.myDescription = "Powerful, accurate, and with a crazy rate of fire.  The drawback?  The vintage 20 round magazines.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 12;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 220;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 20;
         _loc1_.startClips = 3;
      }
      else if(inType == "aug")
      {
         _loc1_.myTag = "Rifle - AUG";
         _loc1_.myName = "Steyr AUG";
         _loc1_.mySound = "steyr";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "Steyr AUG 5.56x45mm";
         _loc1_.myDescription = "Classic bullpup rifle.  Great all arounder plus an extra large magazine for extra dead bad guys.";
         _loc1_.myROF = 8;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 200;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 40;
         _loc1_.startClips = 1;
      }
      else if(inType == "ak74u")
      {
         _loc1_.myTag = "Rifle - AK74U";
         _loc1_.myName = "AK-74U";
         _loc1_.mySound = "ak74";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "AK-74U 5.45x39mm";
         _loc1_.myDescription = "A small rifle useful for taking down small men.  Not to be underestimated, as this rifle can hold it\'s own in just about any scenario.";
         _loc1_.myROF = 10;
         _loc1_.myDamage = 9;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 180;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "hk416")
      {
         _loc1_.myTag = "Rifle - HK416";
         _loc1_.myName = "H&K M-416";
         _loc1_.mySound = "smg2";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "H&K M-416 5.56x45mm";
         _loc1_.myDescription = "Nothing says \'tactical\' like plastic guns!  Piston operated, like an AK, but easier to control at a high rate of fire, like an AR.  Best of both worlds.";
         _loc1_.myROF = 8;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 4;
         _loc1_.myRange = 200;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "fnfal")
      {
         _loc1_.myTag = "Rifle - FN FAL";
         _loc1_.myName = "FN FAL";
         _loc1_.mySound = "fnfal";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_huge";
         _loc1_.myNameFull = "FN FAL 7.62x51mm";
         _loc1_.myDescription = "The most powerful rifle in the Nexus Project armory.  When you have to cut down mooks with heavy body armor, this is the gun you turn to.";
         _loc1_.myROF = 10;
         _loc1_.myDamage = 14;
         _loc1_.mySpread = 1;
         _loc1_.myRange = 240;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 20;
         _loc1_.startClips = 3;
      }
      else if(inType == "famas")
      {
         _loc1_.myTag = "Rifle - FAMAS";
         _loc1_.myName = "FAMAS";
         _loc1_.mySound = "famas";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "FAMAS 5.56x45mm";
         _loc1_.myDescription = "This weapon trades magazine capacity for rate of fire and accuracy.  A very effective tool for shooting apples off of people\'s heads.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 220;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 25;
      }
      else if(inType == "tar21")
      {
         _loc1_.myTag = "Rifle - Tar21";
         _loc1_.myName = "TAR-21";
         _loc1_.mySound = "tar21";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "IMI TAR-21 5.56x45mm";
         _loc1_.myDescription = "A lot of damage in a seriously compact package. Great for CQB or ranged encounters.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 4;
         _loc1_.myRange = 205;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "g36")
      {
         _loc1_.myTag = "Rifle - G36";
         _loc1_.myName = "G36";
         _loc1_.mySound = "g36";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_rifle";
         _loc1_.myNameFull = "IMI TAR-21 5.56x45mm";
         _loc1_.myDescription = "Another top shelf contender for the \'best plastic rifle\' award.";
         _loc1_.myROF = 10;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 4;
         _loc1_.myRange = 220;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 30;
      }
      else if(inType == "97k")
      {
         _loc1_.myTag = "Shotgun - Norinco97k";
         _loc1_.myName = "Norinco 97k";
         _loc1_.mySound = "shotgun";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "shotgun";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_shotgun";
         _loc1_.myNameFull = "Norinco 97k 12-Gauge";
         _loc1_.myDescription = "Box magazine fed pump action shotgun.  Great for making lasting impressions.";
         _loc1_.myROF = 40;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 9;
         _loc1_.myRange = 160;
         _loc1_.myShots = 5;
         _loc1_.myAmmo = 5;
         _loc1_.startClips = 3;
         _loc1_.havePump = true;
      }
      else if(inType == "spas12")
      {
         _loc1_.myTag = "Shotgun - SPAS12";
         _loc1_.myName = "SPAS-12";
         _loc1_.singleBulletClip = true;
         _loc1_.mySound = "shotgun";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "shotgun";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_shotgun";
         _loc1_.myNameFull = "SPAS-12 12-Gauge";
         _loc1_.myDescription = "Top of the line tactical shotgun.  Perfect for clearing particularly busy rooms.";
         _loc1_.myROF = 40;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 9;
         _loc1_.myRange = 160;
         _loc1_.myShots = 5;
         _loc1_.myAmmo = 8;
         _loc1_.startClips = 16;
         _loc1_.havePump = true;
      }
      else if(inType == "usas12")
      {
         _loc1_.myTag = "Shotgun - USAS12";
         _loc1_.myName = "USAS-12";
         _loc1_.mySound = "shotgun";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "shotgun";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_shotgun";
         _loc1_.myNameFull = "USAS-12 12-Gauge";
         _loc1_.myDescription = "This high capacity, box magazine fed, fully automatic shotgun is perfect for those days you just don\'t feel like aiming.";
         _loc1_.myROF = 14;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 9;
         _loc1_.myRange = 160;
         _loc1_.myShots = 5;
         _loc1_.myAmmo = 10;
         _loc1_.havePump = false;
      }
      else if(inType == "ppkmag")
      {
         _loc1_.myTag = "Pistol - PPK";
         _loc1_.myName = "Magnum PPK";
         _loc1_.mySound = "shotgun";
         _loc1_.myType = "ppk";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Walther PPK 9x17mm";
         _loc1_.myDescription = "The magnified version of a famiiar weapon.";
         _loc1_.myROF = 30;
         _loc1_.myDamage = 20;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 150;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 8;
         _loc1_.startClips = 3;
      }
      else if(inType == "ppk")
      {
         _loc1_.myTag = "Pistol - PPK";
         _loc1_.myName = "Walther PPK";
         _loc1_.mySound = "ppk";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Walther PPK 9x17mm";
         _loc1_.myDescription = "A compact alternative to larger, more dangerous firearms.  A classic weapon with classic application.";
         _loc1_.myROF = 20;
         _loc1_.myDamage = 5;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 100;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 8;
      }
      else if(inType == "beretta")
      {
         _loc1_.myTag = "Pistol - Beretta";
         _loc1_.myName = "Beretta 92";
         _loc1_.mySound = "beretta";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Beretta 92 9x19mm";
         _loc1_.myDescription = "A popular firearm due to an impressive magazine capacity and decent damage.  Especially handy for confrontations with numerous antagonists.";
         _loc1_.myROF = 18;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 110;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 18;
      }
      else if(inType == "glock20")
      {
         _loc1_.myTag = "Pistol - Glock20";
         _loc1_.myName = "Glock 20";
         _loc1_.mySound = "glock";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Glock 20 10x25mm";
         _loc1_.myDescription = "This weapon is a combination of high capacity and high  power.  Among the best overall combat pistols Nevada has ever seen.";
         _loc1_.myROF = 16;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 110;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 15;
      }
      else if(inType == "prokiller460")
      {
         _loc1_.myTag = "Pistol - Prokiller460";
         _loc1_.myName = "1911A1 Custom";
         _loc1_.mySound = "prokiller";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_revolver";
         _loc1_.myNameFull = "1911A1 Custom .460Rowland";
         _loc1_.myDescription = "When .45acp isn\'t enough, reach for this custom 1911A1 chambered in the powerful .460 Rowland Magnum.  Top shelf brutality.";
         _loc1_.myROF = 16;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 120;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 7;
      }
      else if(inType == "deagle")
      {
         _loc1_.myTag = "Pistol - Deagle";
         _loc1_.myName = "Desert Eagle";
         _loc1_.mySound = "deagle";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_revolver";
         _loc1_.myNameFull = "Desert Eagle .50Action";
         _loc1_.myDescription = "What more needs to be said about this semi automatic magic wand?  Just wave it at the bad guys and shout \'Headicus Explodicus!\'";
         _loc1_.myROF = 20;
         _loc1_.myDamage = 12;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 125;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 7;
      }
      else if(inType == "browning")
      {
         _loc1_.myTag = "Pistol - BrowningHP";
         _loc1_.myName = "Browning HP";
         _loc1_.mySound = "browning";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Browning HP 9x19mm";
         _loc1_.myDescription = "Just another great way to break up crowds of jerks.";
         _loc1_.myROF = 16;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 110;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 13;
         _loc1_.startClips = 3;
      }
      else if(inType == "fiveseven")
      {
         _loc1_.myTag = "Pistol - Fiveseven";
         _loc1_.myName = "Fiveseven";
         _loc1_.mySound = "fiveseven";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_PDW";
         _loc1_.myNameFull = "Five-seven 5.7x28mm";
         _loc1_.myDescription = "Power and capacity combined. If it isn\'t dead in 20 rounds you probably shouldn\'t be shooting at it.";
         _loc1_.myROF = 18;
         _loc1_.myDamage = 7.5;
         _loc1_.mySpread = 5;
         _loc1_.myRange = 135;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 20;
      }
      else if(inType == "luger")
      {
         _loc1_.myTag = "Pistol - Luger";
         _loc1_.myName = "Luger P08";
         _loc1_.mySound = "luger";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Luger P08 9x19mm";
         _loc1_.myDescription = "The pistol that almost took over the world. Twice. This German artifact is sleek, accurate, and unfortunately obsolete.";
         _loc1_.myROF = 18;
         _loc1_.myDamage = 6.5;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 110;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 8;
      }
      else if(inType == "ots33")
      {
         _loc1_.myTag = "Pistol - OTs33";
         _loc1_.myName = "OTs-33";
         _loc1_.mySound = "ppk";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "OTs-33 9x18mm";
         _loc1_.myDescription = "Fully automatic Russian spraygun. Difficult to control, but at close range is absolutely devastating.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 6;
         _loc1_.mySpread = 9;
         _loc1_.myRange = 100;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 27;
      }
      else if(inType == "uspmatch")
      {
         _loc1_.myTag = "Pistol - USPMatch";
         _loc1_.myName = "USP Match";
         _loc1_.mySound = "uspmatch";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "USP Match 10x22mm";
         _loc1_.myDescription = "H&K\'s above average performer excels in damage, capacity, and range.";
         _loc1_.myROF = 16;
         _loc1_.myDamage = 7.5;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 135;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 17;
      }
      else if(inType == "automagv")
      {
         _loc1_.myTag = "Pistol - AutomagV";
         _loc1_.myName = "AutomagV";
         _loc1_.mySound = "automagv";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_revolver";
         _loc1_.myNameFull = "Automag V .50Action";
         _loc1_.myDescription = "The Automag V is powerful, loud, heavy, and will snap your little baby wrist. A real man\'s gun.";
         _loc1_.myROF = 24;
         _loc1_.myDamage = 12;
         _loc1_.mySpread = 5;
         _loc1_.myRange = 125;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 7;
      }
      else if(inType == "p1445")
      {
         _loc1_.myTag = "Pistol - P1445";
         _loc1_.myName = "P1445";
         _loc1_.mySound = "p1445";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Para 14/45 11.43x23mm";
         _loc1_.myDescription = "Para Ord didn\'t think the 1911A1 could sling enough .45acp, so they improved it.";
         _loc1_.myROF = 16;
         _loc1_.myDamage = 8;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 105;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 14;
      }
      else if(inType == "auto9")
      {
         _loc1_.myTag = "Pistol - Auto9";
         _loc1_.myName = "Auto9";
         _loc1_.mySound = "beretta";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "pistol";
         _loc1_.myDamageType = "bullet";
         _loc1_.myCasing = "casing_pistol";
         _loc1_.myNameFull = "Auto9 9x19mm";
         _loc1_.myDescription = "A borderline fictional piece of full-auto hardware that\'ll have creeps scrambling to figure out whose move it is. Dead or alive, you\'re coming with me.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 7;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 110;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 50;
      }
      else if(inType == "500long")
      {
         _loc1_.myTag = "Pistol - 500";
         _loc1_.myName = "S&W 500";
         _loc1_.mySound = "500";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "revolver";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_revolver";
         _loc1_.myNameFull = "S&W 500 .500 Magnum";
         _loc1_.myDescription = "The absolute final word in one handed caliber pissing matches.";
         _loc1_.myROF = 20;
         _loc1_.myDamage = 13;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 200;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 5;
      }
      else if(inType == "500snub")
      {
         _loc1_.myTag = "Pistol - 500_Snub";
         _loc1_.myName = "S&W 500 Snub";
         _loc1_.mySound = "500";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "revolver";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_revolver";
         _loc1_.myNameFull = "S&W 500 Snub .500 Magnum";
         _loc1_.myDescription = "A compact answer to the lifelong question \'What am I going to do about all these jerks all up in my face?\'";
         _loc1_.myROF = 20;
         _loc1_.myDamage = 11;
         _loc1_.mySpread = 10;
         _loc1_.myRange = 90;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 5;
         _loc1_.startClips = 3;
      }
      else if(inType == "357long")
      {
         _loc1_.myTag = "Pistol - 357";
         _loc1_.myName = "Colt Revolver";
         _loc1_.mySound = "357";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "revolver";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_revolver";
         _loc1_.myNameFull = "Colt Revolver .357 Magnum";
         _loc1_.myDescription = "Powerful, accurate, and stylish. Handy for breaking through the more durable foes in Nevada.";
         _loc1_.myROF = 20;
         _loc1_.myDamage = 12;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 195;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 6;
      }
      else if(inType == "357snub")
      {
         _loc1_.myTag = "Pistol - 357_Snub";
         _loc1_.myName = "Snub Colt";
         _loc1_.mySound = "357";
         _loc1_.twoHand = false;
         _loc1_.melee = false;
         _loc1_.myCat = "revolver";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_revolver";
         _loc1_.myNameFull = "Snub Colt Revolver .357 Magnum";
         _loc1_.myDescription = "Very powerful short range cannon.  It puts down mooks fast so long as you\'re right up against them.";
         _loc1_.myROF = 20;
         _loc1_.myDamage = 10;
         _loc1_.mySpread = 10;
         _loc1_.myRange = 85;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 6;
         _loc1_.startClips = 3;
      }
      else if(inType == "chaingun")
      {
         _loc1_.myTag = "Heavy - Chaingun";
         _loc1_.myName = "MINIGUN";
         _loc1_.noPickup = true;
         _loc1_.mySound = "chaingun";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "heavy";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_huge";
         _loc1_.myNameFull = "MINIGUN 7.62x51mm";
         _loc1_.myDescription = "HOW DID YOU GET THIS? THIS DOES NOT BELONG TO YOU. YOU DO NOT BELONG IN NEVADA.";
         _loc1_.myROF = 4;
         _loc1_.myDamage = 14;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 200;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 9999999;
         _loc1_.amHeavy = true;
      }
      else if(inType == "m203")
      {
         _loc1_.myTag = "Heavy - M203";
         _loc1_.myName = "M-203";
         _loc1_.mySound = "m203";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "heavy";
         _loc1_.myDamageType = "grenade";
         _loc1_.myCasing = "casing_grenade";
         _loc1_.myNameFull = "M-203 40x46mm H.E.";
         _loc1_.myDescription = "This weapon will disperse the crowds with ease.  Mind the range, however, these \'nades don\'t feature range safety.";
         _loc1_.myROF = 20;
         _loc1_.myDamage = 20;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 300;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 1;
      }
      else if(inType == "m249")
      {
         _loc1_.myTag = "Rifle - M249";
         _loc1_.myName = "M-249";
         _loc1_.mySound = "m249";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "heavy_rifle";
         _loc1_.myDamageType = "bullet2";
         _loc1_.myCasing = "casing_huge";
         _loc1_.myNameFull = "M-249 5.56x45mm";
         _loc1_.myDescription = "Extreme capacity! Reloading is a pain in the ass, but chances are that everone will be dead before you even need to reload.";
         _loc1_.myROF = 6;
         _loc1_.myDamage = 12;
         _loc1_.mySpread = 6;
         _loc1_.myRange = 200;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 200;
         _loc1_.startClips = 1;
         _loc1_.amHeavy = true;
      }
      else if(inType == "ecannon")
      {
         _loc1_.myTag = "Heavy - ElectroCannon";
         _loc1_.myName = "ElectroCannon";
         _loc1_.singleBulletClip = true;
         _loc1_.mySound = "ecannon";
         _loc1_.twoHand = true;
         _loc1_.melee = false;
         _loc1_.myCat = "electric";
         _loc1_.myDamageType = "burn";
         _loc1_.myCasing = "none";
         _loc1_.myNameFull = "Nexus ElectroCannon";
         _loc1_.myDescription = "An experimental Nexus weapon that never made it past the prototype phase.";
         _loc1_.myROF = 15;
         _loc1_.myDamage = 40;
         _loc1_.mySpread = 2;
         _loc1_.myRange = 260;
         _loc1_.myShots = 1;
         _loc1_.myAmmo = 8;
         _loc1_.startClips = 20;
         _loc1_.havePump = true;
         _loc1_.myTracer = "lightning";
      }
      else if(inType == "switchblade")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Switchblade";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 20;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "If you didn\'t know they made blades this small, it\'s because you never saw the other guy packing it.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 85;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 2;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "ironknife")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Iron Knife";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 30;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Your standard kitchenware, repurposed as a utensil of death. Don\'t expect much.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 105;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 3;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "bowieknife")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Bowie Knife";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 30;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Named for the famous knife fighter who died defending the Alamo. Now you can be just like him, except for the dead part.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 105;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "carbonknife")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Carbon Knife";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 100;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Specially crafted short blade with an outstanding lifespan. It may even outlast its wielder.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 105;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 6;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "machette")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Machette";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 40;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Take aim at your opponents\' heads and watch them fall like so many jungle vines.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 115;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 7;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "ironsword")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Iron Sword";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 50;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "You don\'t need to be Edward the Black Prince to kill just as many people with his blade.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 130;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 8;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "tangsword")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Megachette";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 50;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "This mighty hack-n-slasher resembles the Full Tang of a bladed weapon, but with a tremendous amount of heft for that extra cleaving power.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 130;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 9;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "carbonsword")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Carbon Sword";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 100;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Like the Carbon Knife, this sword will only leave your posession when pried from your cold, dead hands.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 130;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 10;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "l337sword")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "L337 Sword";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 50;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Rumor has it that this line of swords were manifested digitally. \\startup_KILL() PROTOCOL*>";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 130;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 16;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "dragonsword")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Dragon Sword";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 100;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Defend your dojo with great honor using this masterfully crafted piece of ancient weaponry.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 130;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 12;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "binarysword")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Binary Sword";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 200;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Light and dark. Black and white. Life and death. The Binary Sword holds no middle ground as it turns your opponents OFF.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 135;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 20;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "axe")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Axe";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 50;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Can you not tell a lie? Doesn\'t matter. Chop \'em all down anyway.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 115;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 8;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "head")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Severed Head";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 10;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Where\'d you get that filthy thing?";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 105;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 4;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "mallet")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Mallet";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 25;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Whack-a-Mole has never been so wet and splattery.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 125;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 6;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "bat")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Baseball Bat";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 20;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Aim for an opponent\'s skull and be thankful for all those times you skipped Soldier Training to go play a round of tee-ball.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 115;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 9;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "billyclub")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Billy Club";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 30;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "A favorite for law enforcement in the company of hostile combatants.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 120;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 8;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "baton")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Baton";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 30;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Another official-capacity weapon for the subjugation of lesser beings.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 105;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 7;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "pipe")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Iron Pipe";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 20;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "The damage isn\'t anything to brag about, but the range of a stainless steel pipe is a definite perk.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 125;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 6;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "hammer")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Hammer";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 20;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Jesus was a carpenter, so why not?";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 95;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "bottle")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Bottle";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 8;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Sometimes you\'ve just gotta mix business with pleasure.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 95;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "urinal")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Urinal";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 10;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Flush \'em twice, just to be sure.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 125;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 10;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "sign")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Streetsign";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 50;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "The crossing guard just got dangerous.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 145;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 10;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "megahammer")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Mega Hammer";
         _loc1_.noPickup = true;
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 9999999;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "The fact that you have this means I hate you.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 145;
         _loc1_.brokeRange = _loc1_.myRange;
         _loc1_.myDamage = 9;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "hook")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Battle Hook";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 9999999;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "A unique weapon meant for close-range combat, and closing that distance from afar.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 105;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
         _loc1_.amHook = true;
      }
      else if(inType == "crowbar")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Crowbar";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 30;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "There\'s no good reason not to combine breaking-and-entering with invasive surgery.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 125;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 9;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "gclub")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Citizen Cane";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 30;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "I said GOOD DAY TO YOU SIR.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 125;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 6;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "scalpel")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Scalpel";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 8;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Sometimes you\'ve just gotta mix business with pleasure.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 95;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blade";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "clipboard")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Clipboard";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 8;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Sometimes you\'ve just gotta mix business with pleasure.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 95;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "tubes")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Test Tubes";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 8;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Sometimes you\'ve just gotta mix business with pleasure.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 95;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      else if(inType == "broom")
      {
         _loc1_.myTag = "Melee";
         _loc1_.myName = "Broom";
         _loc1_.twoHand = false;
         _loc1_.melee = true;
         _loc1_.myCat = "melee";
         _loc1_.myHealth = 12;
         _loc1_.myHealthMax = _loc1_.myHealth;
         _loc1_.myNameFull = _loc1_.myName;
         _loc1_.myDescription = "Sometimes you\'ve just gotta mix business with pleasure.";
         _loc1_.myROF = 30;
         _loc1_.myPiercing = 5;
         _loc1_.myShots = 1;
         _loc1_.myRange = 125;
         _loc1_.brokeRange = _loc1_.myRange / 2;
         _loc1_.myDamage = 5;
         _loc1_.myDamageType = "blunt";
         _loc1_.myAmmo = 1;
         _loc1_.myCasing = "spark1";
         _loc1_.mySpread = 3;
      }
      _loc1_.broken = false;
      if(silencer)
      {
         _loc1_.myTag += "_Silencer";
         _loc1_.upgradeSilencer = true;
         _loc1_.mySound = "silencer";
      }
      _loc1_.haveSilencer = silencer;
      _loc1_.myPrice = 100;
      _loc1_.myPrice *= (50 - _loc1_.myROF) * (_loc1_.myDamage * (_loc1_.myShots / 2)) / 20;
      _loc1_.myPrice += _loc1_.myPrice * (_loc1_.myAmmo / 30);
      if(_loc1_.melee)
      {
         _loc1_.myPrice += _loc1_.myPrice * (_loc1_.myDamage / 20);
      }
      _loc1_.myPrice = Math.floor(_loc1_.myPrice);
      if(_loc1_.myCat == "pistol" || _loc1_.myCat == "revolver")
      {
         _loc1_.xOffset = 15;
         _loc1_.yOffset = -5;
      }
      if(_loc1_.myCat == "smg")
      {
         _loc1_.xOffset = 6;
         _loc1_.yOffset = 2;
      }
      if(_loc1_.myCat == "shotgun")
      {
         _loc1_.xOffset = -9;
         _loc1_.yOffset = 4;
      }
      if(_loc1_.myCat == "rifle")
      {
         _loc1_.xOffset = 0;
         _loc1_.yOffset = 0;
      }
      if(_loc1_.myCat == "heavy")
      {
         _loc1_.xOffset = -11;
         _loc1_.yOffset = -6;
      }
      if(_loc1_.myCat == "heavy_rifle")
      {
         _loc1_.xOffset = 0;
         _loc1_.yOffset = 0;
      }
      if(_loc1_.myCat == "melee")
      {
         _loc1_.xOffset = 0;
         _loc1_.yOffset = 0;
      }
      _loc1_.myAmmoMax = _loc1_.myAmmo;
      _loc1_.myClips = _loc1_.startClips;
      _loc1_.myClipsMax = _loc1_.myClips;
      if(_loc1_.myCat == "melee")
      {
         _loc1_.myClips = undefined;
      }
      _loc1_.amSpecial = false;
      if(inType == "" || inType == undefined)
      {
         _loc1_ = undefined;
      }
      return _loc1_;
   }
   static function randomizeUpgrades(inWeapon)
   {
      if(MadnessGameSelect.gameMode == "arena")
      {
         if(ItemGenerator.canUpgrade(inWeapon.myCat,"sight"))
         {
            if(SwainMath.randomNumber(0,15) == 0)
            {
               inWeapon.upgradeSight = true;
            }
         }
         if(ItemGenerator.canUpgrade(inWeapon.myCat,"laser"))
         {
            if(SwainMath.randomNumber(0,15) == 0)
            {
               inWeapon.upgradeLaser = true;
            }
         }
         inWeapon.myColor = SwainMath.randomNumber(1,2);
         if(SwainMath.randomNumber(0,10) == 0)
         {
            inWeapon.myColor = 3;
         }
      }
      if(MadnessGameSelect.gameMode == "story")
      {
         if(ItemGenerator.canUpgrade(inWeapon.myCat,"sight"))
         {
            if(SwainMath.randomNumber(0,25 - MadnessLevel.currentLevel.myDifficulty * 3) == 0)
            {
               inWeapon.upgradeSight = Boolean(SwainMath.randomNumber(0,1));
            }
         }
         if(ItemGenerator.canUpgrade(inWeapon.myCat,"laser"))
         {
            if(SwainMath.randomNumber(0,25 - MadnessLevel.currentLevel.myDifficulty * 3) == 0)
            {
               inWeapon.upgradeLaser = Boolean(SwainMath.randomNumber(0,1));
            }
         }
         inWeapon.myColor = SwainMath.randomNumber(1,2);
         if(SwainMath.randomNumber(0,30) == 0)
         {
            inWeapon.myColor = 3;
         }
      }
      if(inWeapon.upgradeSight)
      {
         inWeapon.myPrice *= 1.3;
      }
      if(inWeapon.upgradeLaser)
      {
         inWeapon.myPrice *= 1.3;
      }
      inWeapon.myPrice = Math.floor(inWeapon.myPrice);
      ItemGenerator.applyUpgrades(inWeapon);
   }
   static function applyUpgrades(inWeapon)
   {
      if(inWeapon.upgradeSight)
      {
         inWeapon.mySpread *= 0.3;
      }
      if(inWeapon.upgradeLaser)
      {
         inWeapon.myRange *= 1.2;
      }
   }
   static function replicateWeapon(inWeapon)
   {
      var _loc1_ = new Object();
      _loc1_ = ItemGenerator.createWeapon(inWeapon.myType,inWeapon.upgradeSilencer);
      _loc1_.myClips = inWeapon.myClips;
      _loc1_.myColor = inWeapon.myColor;
      _loc1_.upgradeLaser = inWeapon.upgradeLaser;
      _loc1_.upgradeSight = inWeapon.upgradeSight;
      _loc1_.upgradeSilencer = inWeapon.upgradeSilencer;
      _loc1_.myHealth = inWeapon.myHealth;
      _loc1_.myHealthMax = _loc1_.myHealth;
      ItemGenerator.applyUpgrades(_loc1_);
      if(inWeapon == undefined)
      {
         _loc1_ = undefined;
      }
      return _loc1_;
   }
   static function isWeaponValid(inChar, inItem, inCat)
   {
      return true;
   }
   static function isWeaponAvailable(inItem, inCat)
   {
   }
   static function unarmedWeapon()
   {
      var _loc1_ = new Object();
      _loc1_.myTag = "Unarmed";
      _loc1_.myName = "Unarmed";
      _loc1_.twoHand = false;
      _loc1_.melee = true;
      _loc1_.myCat = "melee";
      _loc1_.myROF = 30;
      _loc1_.myPiercing = 0;
      _loc1_.myShots = 1;
      _loc1_.myRange = 95;
      _loc1_.myDamage = 2;
      _loc1_.myDamageType = "punch";
      _loc1_.myAmmo = 1;
      _loc1_.myCasing = "spark1";
      _loc1_.mySpread = 3;
      _loc1_.myType = "unarmed";
      return _loc1_;
   }
   static function changeUnarmedDamage(inChar, inAttack, inDashPerk)
   {
      if(inChar.amZombie)
      {
         inChar.myUnarmed.myDamage = 5;
         inChar.myUnarmed.myStyle = "zombie";
      }
      else if(inAttack.substr(8,6) == "savate" || inDashPerk)
      {
         inChar.myUnarmed.myDamage = 5.5;
         inChar.myUnarmed.myStyle = "savate";
      }
      else if(inAttack.substr(8,5) == "brawl")
      {
         inChar.myUnarmed.myDamage = 2.5;
         inChar.myUnarmed.myStyle = "brawl";
      }
      else if(inAttack.substr(8,5) == "elite")
      {
         inChar.myUnarmed.myDamage = 10;
         inChar.myUnarmed.myStyle = "elite";
      }
   }
   static function setItemSprite(inSprite, inWeapon)
   {
      // 27/11/2026 dyzqy: Many of the inSprites(coming from adjustSprite()) are usually undefined, which means skipping them yields some neglishable but good to have performance!
      if(inSprite == undefined) return;
      if(inWeapon.myCat == "melee")
      {
         // 27/11/2026 dyzqy: It is better to get the desired frame before setting it. And checking if setting it is even needed!
         var targetFrame:Number = 1;
         if(inWeapon.myHealth <= inWeapon.myHealthMax * 0.12)
         {
            targetFrame = 4;
         }
         else if(inWeapon.myHealth <= inWeapon.myHealthMax * 0.3)
         {
            targetFrame = 3;
         }
         else if(inWeapon.myHealth <= inWeapon.myHealthMax * 0.75)
         {
            targetFrame = 2;
         }

         if(inSprite._currentframe != targetFrame)
         {
            inSprite.gotoAndStop(targetFrame);
         }
         else
         {
            inSprite.stop();
         }
      }
   }
   static function equipLoadout(inChar, inLoadout, inLevel)
   {
      var _loc7_ = new Array();
      var _loc13_ = new Array();
      var _loc3_ = new Array();
      var _loc4_ = undefined;
      var _loc6_ = undefined;
      var _loc12_ = undefined;
      var _loc11_ = undefined;
      var _loc10_ = undefined;
      var _loc14_ = undefined;
      if(inChar.myCharacter == "civ" || inChar.myCharacter == "zombie")
      {
         if(inChar.myRoster.teamFaction == "enemy")
         {
            _loc3_ = [undefined,undefined,"hat1","hat2","hat3","hat4","hat5","headphones","hat6","helmet1","helmet2","helmet3"];
            _loc4_ = inLevel * 1.5;
            if(_loc4_ > _loc3_.length)
            {
               _loc4_ = _loc3_.length;
            }
            if(_loc4_ < 4)
            {
               _loc4_ = 4;
            }
            _loc6_ = -15 + inLevel;
            if(_loc6_ > -3)
            {
               _loc6_ = -3;
            }
            _loc12_ = _loc3_[SwainMath.randomNumber(_loc6_,_loc4_)];
            _loc3_ = [undefined,undefined,"armor1","armor2","armor3","armor4","armor5","armor8","armor9","armor10","armor11","armor6","armor7","armor12"];
            _loc4_ = inLevel * 1.5;
            if(_loc4_ > _loc3_.length)
            {
               _loc4_ = _loc3_.length;
            }
            _loc6_ = -20 + inLevel;
            if(_loc6_ > -3)
            {
               _loc6_ = -3;
            }
            _loc11_ = _loc3_[SwainMath.randomNumber(_loc6_,_loc4_)];
            _loc3_ = [undefined,undefined,"mask1","mouth6","mouth3"];
            _loc4_ = inLevel;
            if(_loc4_ > _loc3_.length)
            {
               _loc4_ = _loc3_.length;
            }
            _loc6_ = -15 + inLevel;
            if(_loc6_ > -3)
            {
               _loc6_ = -3;
            }
            _loc10_ = _loc3_[SwainMath.randomNumber(_loc6_,_loc4_)];
            _loc3_ = [undefined,undefined,"shades1","shades3","shades5","paintball1","paintball2","goggles1","hi1","hi2","hi3","hi4","hi5","hi6","hi7","hi8"];
            _loc4_ = inLevel * 1.5;
            if(_loc4_ > _loc3_.length)
            {
               _loc4_ = _loc3_.length;
            }
            if(_loc4_ < 3)
            {
               _loc4_ = 3;
            }
            _loc6_ = -15 + inLevel;
            if(_loc6_ > -3)
            {
               _loc6_ = -3;
            }
            _loc14_ = _loc3_[SwainMath.randomNumber(_loc6_,_loc4_)];
         }
      }
      if(inChar.myCharacter.substr(0,5) == "agent" || inChar.myCharacter.substr(0,12) == "zombie_agent")
      {
         _loc3_ = [undefined,undefined,"armor1","armor2","armor3","armor4","armor5","armor8","armor9","armor10","armor11","armor6","armor7","armor12"];
         _loc4_ = inLevel * 1.5;
         if(inLevel * 1.5 > _loc3_.length)
         {
            _loc4_ = _loc3_.length;
         }
         _loc6_ = -25 + inLevel;
         if(_loc6_ > -3)
         {
            _loc6_ = -3;
         }
         _loc11_ = _loc3_[SwainMath.randomNumber(_loc6_,_loc4_)];
         _loc3_ = [undefined,undefined,"mouth1","mouth2","mouth4","mouth5","mouth8"];
         _loc4_ = inLevel;
         if(inLevel > _loc3_.length)
         {
            _loc4_ = _loc3_.length;
         }
         _loc6_ = -25 + inLevel;
         if(_loc6_ > -3)
         {
            _loc6_ = -3;
         }
         _loc10_ = _loc3_[SwainMath.randomNumber(_loc6_,_loc4_)];
      }
      if(inChar.myCharacter == "scientist")
      {
         _loc3_ = [undefined,undefined,"shades1","shades9","shades10","shades11","shades13"];
         _loc11_ = _loc3_[SwainMath.randomNumber(0,_loc3_.length - 1)];
         if(SwainMath.randomNumber(0,5) == 0)
         {
            _loc10_ = "mouth10";
         }
      }
      if(MadnessLevel.currentLevel.myWorld == 0 && MadnessLevel.currentLevel.myLevel == 0)
      {
         _loc12_ = undefined;
         _loc11_ = undefined;
         _loc10_ = undefined;
         _loc14_ = undefined;
      }
      var _loc16_ = inLoadout == "zombie";
      if(inLoadout == "zombie")
      {
         inLoadout = "unarmed";
         if(SwainMath.randomNumber(1,3) == 3)
         {
            inLoadout = "melee";
         }
         else if(SwainMath.randomNumber(1,5) <= 2)
         {
            inLoadout = "ranged";
         }
         inLevel *= 1.4;
      }
      if(inLoadout == "unarmed")
      {
         inChar.myRoster.removeWeapon(inChar.myWeapons[0]);
         inChar.myWeapons[0] = undefined;
         inChar.myRoster.removeWeapon(inChar.myWeapons[1]);
         inChar.myWeapons[1] = undefined;
      }
      if(inLoadout == "lab")
      {
         _loc7_ = ["tubes","broom","clipboard","clipboard","scalpel",undefined,undefined,undefined,undefined];
      }
      if(inLoadout == "ranged")
      {
         if(inLevel < 3)
         {
            _loc7_ = ["ppk","beretta","browning"];
         }
         else if(inLevel < 5)
         {
            _loc7_ = ["ppk","beretta","glock20","prokiller460","browning","p1445"];
         }
         else if(inLevel < 8)
         {
            _loc7_ = ["hk2","mp7","ppk","beretta","glock20","prokiller460","deagle","automagv","97k","browning","uspmatch","p1445"];
         }
         else if(inLevel < 10)
         {
            _loc7_ = ["500snub","357snub","hk2","mp7","tmp","mp5k","mp5","pm9","oa93","glock20","prokiller460","deagle","automagv","uspmatch","p1445","ots33","97k","spas12","browning","uzi","thompson","mp40"];
         }
         else if(inLevel < 12)
         {
            _loc7_ = ["500long","357long","deagle","automagv","ots33","hk2","mp7","tmp","mp5k","mp5","pm9","oa93","ar15","sr3","ak74","m16","aug","ak74u","hk416","97k","spas12","fiveseven","m11","uzi","thompson","mp40"];
         }
         else
         {
            _loc7_ = ["ar15","sr3","ak74","m16","aug","ak74u","hk416","fnfal","m249","famas","usas12","tar21","g36"];
         }
         if(SwainMath.randomNumber(0,5) == 0)
         {
            inLoadout = "melee";
         }
      }
      if(inLoadout == "melee")
      {
         var _loc8_ = ["switchblade","bottle","hammer","pipe","ironknife","mallet","bowieknife","bat","baton","crowbar","carbonknife","billyclub","machette","ironsword","tangsword","carbonsword","axe","l337sword","dragonsword"];
         if(inLevel > _loc8_.length - 5)
         {
            inLevel = _loc8_.length - 5;
         }
         var _loc1_ = inLevel;
         while(_loc1_ < inLevel + 5)
         {
            if(_loc8_[_loc1_] != undefined)
            {
               _loc7_.push(_loc8_[_loc1_]);
            }
            _loc1_ = _loc1_ + 1;
         }
      }
      if(inLoadout == "bottle")
      {
         _loc7_ = new Array();
         _loc7_.push("bottle");
      }
      if(inLoadout == "test1")
      {
         _loc7_ = new Array();
         _loc7_ = ["uspmatch","ots33","tar21","luger"];
      }
      if(inLoadout != "none")
      {
         if(_loc7_.length > 0)
         {
            inChar.myRoster.removeWeapon(inChar.myWeapons[0]);
            inChar.myWeapons[0] = undefined;
            var _loc15_ = ItemGenerator.createWeapon(_loc7_[SwainMath.randomNumber(0,_loc7_.length - 1)],false);
            ItemGenerator.randomizeUpgrades(_loc15_);
            inChar.equipItem(_loc15_,0);
         }
         if(_loc13_.length > 0)
         {
            inChar.myRoster.removeWeapon(inChar.myWeapons[1]);
            inChar.myWeapons[1] = undefined;
            _loc15_ = ItemGenerator.createWeapon(_loc13_[SwainMath.randomNumber(0,_loc13_.length - 1)],false);
            ItemGenerator.randomizeUpgrades(_loc15_);
            inChar.equipItem(_loc15_,1);
         }
         if(_loc12_ != undefined)
         {
            var _loc17_ = ItemGenerator.createArmor(_loc12_,false);
            inChar.equipItem(_loc17_,0);
         }
         if(_loc11_ != undefined)
         {
            _loc17_ = ItemGenerator.createArmor(_loc11_,false);
            inChar.equipItem(_loc17_,0);
         }
         if(_loc10_ != undefined)
         {
            _loc17_ = ItemGenerator.createArmor(_loc10_,false);
            inChar.equipItem(_loc17_,0);
         }
         if(_loc14_ != undefined)
         {
            _loc17_ = ItemGenerator.createArmor(_loc14_,false);
            inChar.equipItem(_loc17_,0);
         }
      }
      if(_loc16_)
      {
         inChar.myWeapons[0].myAmmo = Math.floor(SwainMath.randomNumber(inChar.myWeapons[0].myAmmo / 2,inChar.myWeapons[0].myAmmo));
      }
   }
   static function canSilence(inType)
   {
      var _loc2_ = ["ppk","beretta","glock20","prokiller460","browning","fiveseven","uspmatch","p1445","hk2","mp7","tmp","mp5k","mp5","pm9","oa93","m11","uzi","thompson","mp40"];
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         if(inType == _loc2_[_loc1_])
         {
            return true;
         }
         _loc1_ = _loc1_ + 1;
      }
      return false;
   }
   static function canUpgrade(inCat, inUpgrade)
   {
      if(inCat == "melee")
      {
         return false;
      }
      if(inCat == "heavy" || inCat == "pistol" && inUpgrade == "sight")
      {
         return false;
      }
      return true;
   }
   static function returnWaveLoadout(inLevel, inWave)
   {
      inLevel = inLevel - 1;
      var _loc1_ = undefined;
      if(MadnessGameSelect.subGameMode == "zombie")
      {
         _loc1_ = "zombie";
      }
      else if(inLevel + Math.floor(inWave / 4) <= 0)
      {
         _loc1_ = "unarmed";
      }
      else if(inWave == 0 || inWave == 5 || inLevel + inWave / 4 <= 2)
      {
         _loc1_ = "melee";
      }
      else
      {
         _loc1_ = "ranged";
      }
      return _loc1_;
   }
   static function assignGear(inChar, inLvl)
   {
      var _loc5_ = ["top","tiny","fedora","hat1","hat2","hat3","hat4","hat5","hat6","hat7","hair1","hair2","hair3","hair4","helmet1","helmet2","helmet3"];
      var _loc4_ = ["mouth1","mouth2","mouth3","mouth4","mouth5","mouth6","mask1","chin1"];
      var _loc3_ = ["hi1","hi2","hi3","hi4","shades1","shades2","shades3","shades4","shades5","shades6","shades7","shades8","goggles1","paintball1","paintball2"];
      var _loc6_ = ["armor1","armor2","armor3","armor4","armor5","armor6","armor7","armor8","armor9","armor10","coat1","coat2","coat3"];
      var _loc1_ = 0;
      while(_loc1_ < 4)
      {
         if(SwainMath.randomNumber(0,Math.floor((15 - inLvl / 2) * 0.5)) <= 1)
         {
            inChar.myHireCost *= 1.15;
            if(_loc1_ == 0)
            {
               inChar.equipItem(ItemGenerator.createArmor(_loc5_[SwainMath.randomNumber(0,_loc5_.length)]),0);
            }
            if(_loc1_ == 1)
            {
               inChar.equipItem(ItemGenerator.createArmor(_loc4_[SwainMath.randomNumber(0,_loc4_.length)]),0);
            }
            if(_loc1_ == 2)
            {
               inChar.equipItem(ItemGenerator.createArmor(_loc3_[SwainMath.randomNumber(0,_loc3_.length)]),0);
            }
            if(_loc1_ == 3)
            {
               inChar.equipItem(ItemGenerator.createArmor(_loc6_[SwainMath.randomNumber(0,_loc6_.length)]),0);
            }
         }
         _loc1_ = _loc1_ + 1;
      }
   }
}
