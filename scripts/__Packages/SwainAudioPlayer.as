class SwainAudioPlayer
{
   static var musicTrack1;
   static var musicTrack2;
   static var currentTrack;
   static var soundManager;
   static var soundTypeArray;
   static var freeChannels;
   static var activeChannels;
   static var soundChannelCount = 0;
   static var initialPoolSize = 16;
   static var musicOn = true;
   static var volumeSound = 0.75;
   static var volumeMusic = 0.5;
   function SwainAudioPlayer()
   {
   }
   static function init()
   {
      SwainAudioPlayer.stopTrack(SwainAudioPlayer.musicTrack1);
      SwainAudioPlayer.stopTrack(SwainAudioPlayer.musicTrack2);
      _root.createEmptyMovieClip("musicTrack1",_root.getNextHighestDepth());
      _root.createEmptyMovieClip("musicTrack2",_root.getNextHighestDepth());
      SwainAudioPlayer.musicTrack1 = _root.musicTrack1;
      SwainAudioPlayer.musicTrack2 = _root.musicTrack2;
      SwainAudioPlayer.musicTrack1.mySound = new Sound(SwainAudioPlayer.musicTrack1);
      SwainAudioPlayer.musicTrack2.mySound = new Sound(SwainAudioPlayer.musicTrack2);
      SwainAudioPlayer.currentTrack = SwainAudioPlayer.musicTrack1;
      SwainAudioPlayer.musicOn = true;
      SwainAudioPlayer.stopAllSounds();
      _root.createEmptyMovieClip("soundManager",_root.getNextHighestDepth());
      SwainAudioPlayer.soundManager = _root.soundManager;
      SwainAudioPlayer.soundManager.onEnterFrame = SwainAudioPlayer.soundTick;
      SwainAudioPlayer.soundTypeArray = new Array();
      SwainAudioPlayer.freeChannels = new Array();
      SwainAudioPlayer.activeChannels = new Array();
      SwainAudioPlayer.soundChannelCount = 0;
      var _loc1_ = 0;
      while(_loc1_ < SwainAudioPlayer.initialPoolSize)
      {
         SwainAudioPlayer.freeChannels.push(SwainAudioPlayer.createChannel());
         _loc1_ = _loc1_ + 1;
      }
   }
   // 22/11/2026 dyzqy: Looping sounds is better than creating new ones every single time
   static function createChannel()
   {
      var _loc1_ = SwainAudioPlayer.soundChannelCount++;
      var _loc2_ = SwainAudioPlayer.soundManager.createEmptyMovieClip("soundMC_" + _loc1_,_loc1_);
      var _loc3_ = new Sound(_loc2_);
      var _loc4_ = {mc:_loc2_,snd:_loc3_,mySound:undefined,inUse:false};
      _loc3_.onSoundComplete = function()
      {
         SwainAudioPlayer.releaseChannel(_loc4_);
      };
      return _loc4_;
   }
   static function getChannel()
   {
      var _loc1_ = undefined;
      if(SwainAudioPlayer.freeChannels.length > 0)
      {
         _loc1_ = SwainAudioPlayer.freeChannels.pop();
      }
      else
      {
         _loc1_ = SwainAudioPlayer.createChannel();
      }
      _loc1_.inUse = true;
      SwainAudioPlayer.activeChannels.push(_loc1_);
      return _loc1_;
   }
   static function releaseChannel(inChannel)
   {
      if(inChannel == undefined || !inChannel.inUse)
      {
         return undefined;
      }
      inChannel.inUse = false;
      inChannel.mySound = undefined;
      var _loc1_ = 0;
      while(_loc1_ < SwainAudioPlayer.activeChannels.length)
      {
         if(SwainAudioPlayer.activeChannels[_loc1_] == inChannel)
         {
            SwainAudioPlayer.activeChannels.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      SwainAudioPlayer.freeChannels.push(inChannel);
   }
   static function playTrack(inTrack)
   {
      if(SwainAudioPlayer.musicTrack1.myTrack == SwainAudioPlayer.soundLibrary(inTrack))
      {
         if(SwainAudioPlayer.currentTrack == SwainAudioPlayer.musicTrack2)
         {
            SwainAudioPlayer.currentTrack = SwainAudioPlayer.musicTrack1;
         }
      }
      else if(SwainAudioPlayer.musicTrack2.myTrack == SwainAudioPlayer.soundLibrary(inTrack))
      {
         if(SwainAudioPlayer.currentTrack == SwainAudioPlayer.musicTrack1)
         {
            SwainAudioPlayer.currentTrack = SwainAudioPlayer.musicTrack2;
         }
      }
      else
      {
         if(SwainAudioPlayer.musicTrack1 == undefined && SwainAudioPlayer.musicTrack2 == undefined || SwainAudioPlayer.currentTrack == SwainAudioPlayer.musicTrack2)
         {
            SwainAudioPlayer.currentTrack = SwainAudioPlayer.musicTrack1;
         }
         else
         {
            SwainAudioPlayer.currentTrack = SwainAudioPlayer.musicTrack2;
         }
         SwainAudioPlayer.stopTrack(SwainAudioPlayer.currentTrack);
         var tempTrack = SwainAudioPlayer.currentTrack;
         tempTrack.onEnterFrame = function()
         {
            SwainAudioPlayer.trackTick(tempTrack);
         };
         SwainAudioPlayer.currentTrack.myTrack = SwainAudioPlayer.soundLibrary(inTrack);
         SwainAudioPlayer.currentTrack.mySound.attachSound(SwainAudioPlayer.currentTrack.myTrack);
         SwainAudioPlayer.currentTrack.mySound.start(0,999999);
         SwainAudioPlayer.setTrackVolume(inTrack);
         if(!SwainAudioPlayer.musicOn)
         {
            SwainAudioPlayer.currentTrack.mySound.setVolume(0);
         }
         else if(SwainAudioPlayer.musicTrack2.myTrack == undefined || SwainAudioPlayer.musicTrack1.myTrack == undefined)
         {
            SwainAudioPlayer.currentTrack.mySound.setVolume(100 * SwainAudioPlayer.volumeMusic);
         }
         else
         {
            SwainAudioPlayer.currentTrack.mySound.setVolume(0);
         }
      }
   }
   static function stopTrack(inTrackObj)
   {
      if(inTrackObj == undefined)
      {
         return undefined;
      }
      inTrackObj.mySound.stop();
      inTrackObj.mySound.setVolume(100);
      inTrackObj.myTrack = undefined;
      inTrackObj.onEnterFrame = null;
   }
   static function trackTick(inTrackObj)
   {
      if(!SwainAudioPlayer.musicOn)
      {
         inTrackObj.mySound.setVolume(0);
      }
      else if(inTrackObj != SwainAudioPlayer.currentTrack)
      {
         inTrackObj.mySound.setVolume(inTrackObj.mySound.getVolume() - 5);
         if(inTrackObj.mySound.getVolume() <= 0)
         {
            SwainAudioPlayer.stopTrack(inTrackObj);
         }
      }
      else
      {
         if(inTrackObj.mySound.getVolume() < 100 * SwainAudioPlayer.volumeMusic)
         {
            inTrackObj.mySound.setVolume(inTrackObj.mySound.getVolume() + 5);
         }
         if(inTrackObj.mySound.getVolume() > 100 * SwainAudioPlayer.volumeMusic)
         {
            inTrackObj.mySound.setVolume(100 * SwainAudioPlayer.volumeMusic);
         }
      }
   }
   static function fadeAllTracks()
   {
      SwainAudioPlayer.currentTrack = undefined;
   }
   static function stopAllTracks()
   {
      SwainAudioPlayer.currentTrack = undefined;
      SwainAudioPlayer.stopTrack(SwainAudioPlayer.musicTrack1);
      SwainAudioPlayer.stopTrack(SwainAudioPlayer.musicTrack2);
   }
   static function muteMusic(inOn)
   {
      SwainAudioPlayer.musicOn = inOn;
      if(inOn)
      {
         SwainAudioPlayer.currentTrack.mySound.setVolume(100 * SwainAudioPlayer.volumeMusic);
      }
      else
      {
         SwainAudioPlayer.currentTrack.mySound.setVolume(0);
      }
   }
   static function soundTick()
   {
      if(SwainAudioPlayer.soundTypeArray.length > 0)
      {
         SwainAudioPlayer.soundTypeArray = new Array();
      }
   }
   static function playSound(inSound, inPan)
   {
      var _loc1_ = 0;
      while(_loc1_ < SwainAudioPlayer.soundTypeArray.length)
      {
         if(SwainAudioPlayer.soundTypeArray[_loc1_] == inSound)
         {
            return false;
         }
         _loc1_ = _loc1_ + 1;
      }
      SwainAudioPlayer.soundTypeArray.push(inSound);
      var _loc2_ = SwainAudioPlayer.getChannel();
      _loc2_.mySound = inSound;
      var _loc3_ = _loc2_.snd;
      _loc3_.stop();
      _loc3_.setPan(0);
      _loc3_.setVolume(100);
      _loc3_.attachSound(SwainAudioPlayer.soundLibrary(inSound));
      _loc3_.setPan(inPan);
      _loc3_.setVolume((SwainAudioPlayer.returnVolume(inSound) - Math.abs(inPan * 0.5)) * SwainAudioPlayer.volumeSound);
      _loc3_.start();
   }
   static function stopSound(inSound)
   {
      var _loc1_ = 0;
      while(_loc1_ < SwainAudioPlayer.activeChannels.length)
      {
         var _loc2_ = SwainAudioPlayer.activeChannels[_loc1_];
         if(_loc2_.mySound == inSound)
         {
            _loc2_.snd.stop();
            SwainAudioPlayer.releaseChannel(_loc2_);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   static function stopAllSounds()
   {
      while(SwainAudioPlayer.activeChannels.length > 0)
      {
         var _loc1_ = SwainAudioPlayer.activeChannels[SwainAudioPlayer.activeChannels.length - 1];
         _loc1_.snd.stop();
         SwainAudioPlayer.releaseChannel(_loc1_);
      }
   }
   static function soundLibrary(inName)
   {
      var _loc2_ = undefined;
      if(inName == "test1")
      {
         return inName;
      }
      if(inName == "test2")
      {
         return inName;
      }
      if(inName == "test3")
      {
         return inName;
      }
      if(inName == "sound1")
      {
         return inName;
      }
      if(inName == "sound2")
      {
         return inName;
      }
      _loc2_ = "S_";
      if(inName == "door1")
      {
         _loc2_ += "Door";
      }
      if(inName == "explode")
      {
         _loc2_ += "Explode";
      }
      if(inName == "explodewet")
      {
         _loc2_ += "Explode_Wet";
      }
      if(inName == "metalbang")
      {
         _loc2_ += "MetalBang";
         trace("BANG");
      }
      if(inName == "clang")
      {
         _loc2_ += "Clang" + SwainMath.randomNumber(1,4);
      }
      if(inName == "static")
      {
         _loc2_ += "Static" + SwainMath.randomNumber(1,3);
      }
      if(inName == "break")
      {
         _loc2_ += "Break";
      }
      if(inName == "zipline")
      {
         _loc2_ += "Zipline";
      }
      if(inName == "earth")
      {
         _loc2_ += "Earth" + SwainMath.randomNumber(1,2);
      }
      if(inName == "res1")
      {
         _loc2_ += "ResPatient";
      }
      if(inName == "res2")
      {
         _loc2_ += "ResBoom";
      }
      if(inName == "zombieres")
      {
         _loc2_ += "Zombie" + SwainMath.randomNumber(1,3);
      }
      if(inName == "magic2_cast")
      {
         _loc2_ += "Magic1";
      }
      if(inName == "magic2_explode")
      {
         _loc2_ += "Magic2";
      }
      if(inName == "magic1_cast")
      {
         _loc2_ += "Magic3";
      }
      if(inName == "activator1")
      {
         _loc2_ += "Activator1";
      }
      if(inName == "activator2")
      {
         _loc2_ += "Activator2";
      }
      if(inName == "bombbeep")
      {
         _loc2_ += "Bomb1";
      }
      if(inName == "ppk")
      {
         _loc2_ += "Gun_PPK";
      }
      if(inName == "beretta")
      {
         _loc2_ += "Gun_Beretta";
      }
      if(inName == "glock")
      {
         _loc2_ += "Gun_Glock";
      }
      if(inName == "prokiller")
      {
         _loc2_ += "Gun_Prokiller";
      }
      if(inName == "deagle")
      {
         _loc2_ += "Gun_Deagle";
      }
      if(inName == "browning")
      {
         _loc2_ += "Gun_Browning";
      }
      if(inName == "fiveseven")
      {
         _loc2_ += "Gun_Fiveseven";
      }
      if(inName == "luger")
      {
         _loc2_ += "Gun_Luger";
      }
      if(inName == "uspmatch")
      {
         _loc2_ += "Gun_USPMatch";
      }
      if(inName == "automagv")
      {
         _loc2_ += "Gun_Automag";
      }
      if(inName == "p1445")
      {
         _loc2_ += "Gun_P1445";
      }
      if(inName == "500")
      {
         _loc2_ += "Gun_500";
      }
      if(inName == "357")
      {
         _loc2_ += "Gun_357";
      }
      if(inName == "smg1")
      {
         _loc2_ += "Gun_SMG1";
      }
      if(inName == "smg2")
      {
         _loc2_ += "Gun_SMG2";
      }
      if(inName == "smg3")
      {
         _loc2_ += "Gun_SMG3";
      }
      if(inName == "m11")
      {
         _loc2_ += "Gun_M11";
      }
      if(inName == "uzi")
      {
         _loc2_ += "Gun_Uzi";
      }
      if(inName == "thompson")
      {
         _loc2_ += "Gun_Thompson";
      }
      if(inName == "mp40")
      {
         _loc2_ += "Gun_MP40";
      }
      if(inName == "steyr")
      {
         _loc2_ += "Gun_Steyr";
      }
      if(inName == "sr3")
      {
         _loc2_ += "Gun_SR3";
      }
      if(inName == "m249")
      {
         _loc2_ += "Gun_M249";
      }
      if(inName == "fnfal")
      {
         _loc2_ += "Gun_FNFAL";
      }
      if(inName == "famas")
      {
         _loc2_ += "Gun_FAMAS";
      }
      if(inName == "ar15")
      {
         _loc2_ += "Gun_AR15";
      }
      if(inName == "ak74")
      {
         _loc2_ += "Gun_AK74";
      }
      if(inName == "shotgun")
      {
         _loc2_ += "Gun_Shotgun";
      }
      if(inName == "shotguncock")
      {
         _loc2_ += "Gun_ShotgunCock";
      }
      if(inName == "m203")
      {
         _loc2_ += "Gun_M203";
      }
      if(inName == "chaingun")
      {
         _loc2_ += "Gun_Mini" + SwainMath.randomNumber(1,2);
      }
      if(inName == "tar21")
      {
         _loc2_ += "Gun_TAR21";
      }
      if(inName == "g36")
      {
         _loc2_ += "Gun_G36";
      }
      if(inName == "ecannon")
      {
         _loc2_ += "Gun_ECannon";
      }
      if(inName == "silencer")
      {
         _loc2_ += "Gun_Silencer";
      }
      if(inName == "emptyclip")
      {
         _loc2_ += "Gun_EmptyClip";
      }
      if(inName == "swapgun")
      {
         _loc2_ += "Gun_Swap";
      }
      if(inName == "ricochet")
      {
         _loc2_ += "Gun_Ricochet";
      }
      if(inName == "reload")
      {
         _loc2_ += "Gun_Reload";
      }
      if(inName == "slash")
      {
         _loc2_ += "Melee_Slash" + SwainMath.randomNumber(1,8);
      }
      if(inName == "blunt")
      {
         _loc2_ += "Melee_Blunt" + SwainMath.randomNumber(1,18);
      }
      if(inName == "swish")
      {
         _loc2_ += "Melee_Swish" + SwainMath.randomNumber(1,3);
      }
      if(inName == "swishlow")
      {
         _loc2_ += "Melee_SwishLow";
      }
      if(inName == "swapmelee")
      {
         _loc2_ += "Melee_Swap";
      }
      if(inName == "blockmelee")
      {
         _loc2_ += "Melee_Block" + SwainMath.randomNumber(1,5);
      }
      if(inName == "injury")
      {
         _loc2_ += "Injury" + SwainMath.randomNumber(1,2);
      }
      if(inName == "land")
      {
         _loc2_ += "Land" + SwainMath.randomNumber(1,6);
      }
      if(inName == "landhard")
      {
         _loc2_ += "LandHard";
      }
      if(inName == "menu")
      {
         _loc2_ += "Track_Menu";
      }
      if(inName == "stage1")
      {
         _loc2_ += "Track_Stage1";
      }
      if(inName == "stage2")
      {
         _loc2_ += "Track_Stage2";
      }
      if(inName == "stage3")
      {
         _loc2_ += "Track_Stage3";
      }
      if(inName == "stage4")
      {
         _loc2_ += "Track_Stage4";
      }
      if(inName == "stage5")
      {
         _loc2_ += "Track_Stage5";
      }
      if(inName == "stage6")
      {
         _loc2_ += "Track_Stage6";
      }
      if(inName == "stage7")
      {
         _loc2_ += "Track_Stage7";
      }
      if(inName == "stage8")
      {
         _loc2_ += "Track_Stage8";
      }
      if(inName == "club1")
      {
         _loc2_ += "Track_Club1";
      }
      if(inName == "club2")
      {
         _loc2_ += "Track_Club2";
      }
      if(inName == "boss1")
      {
         _loc2_ += "Track_Boss1";
      }
      if(inName == "zombie1")
      {
         _loc2_ += "Track_Zombie1";
      }
      if(inName == "zombie2")
      {
         _loc2_ += "Track_Zombie2";
      }
      if(inName == "zombie3")
      {
         _loc2_ += "Track_Zombie3";
      }
      if(inName == "paper1")
      {
         _loc2_ += "Paper1";
      }
      if(inName == "paper2")
      {
         _loc2_ += "Paper2";
      }
      if(inName == "menu1")
      {
         _loc2_ += "Menu1";
      }
      if(inName == "menu2")
      {
         _loc2_ += "Menu2";
      }
      if(inName == "menu3")
      {
         _loc2_ += "Menu3";
      }
      if(inName == "menu4")
      {
         _loc2_ += "Menu4";
      }
      if(inName == "menu5")
      {
         _loc2_ += "Menu5";
      }
      if(inName == "buy")
      {
         _loc2_ += "StoreBuy";
      }
      if(inName == "nobuy")
      {
         _loc2_ += "StoreNoBuy";
      }
      if(inName == "talk")
      {
         _loc2_ += "Talk";
      }
      return _loc2_;
   }
   static function returnVolume(inName)
   {
      var _loc1_ = 100;
      if(inName == "land")
      {
         _loc1_ *= 0.5;
      }
      if(inName == "swish")
      {
         _loc1_ *= 0.5;
      }
      if(inName == "swapmelee")
      {
         _loc1_ *= 0.6;
      }
      if(inName == "swapgun")
      {
         _loc1_ *= 0.7;
      }
      if(inName == "ricochet")
      {
         _loc1_ *= 0.6;
      }
      if(inName == "door")
      {
         _loc1_ *= 0.6;
      }
      if(inName == "clang")
      {
         _loc1_ *= 0.9;
      }
      if(inName == "reload")
      {
         _loc1_ *= 0.5;
      }
      if(inName == "break")
      {
         _loc1_ *= 0.5;
      }
      if(inName == "static")
      {
         _loc1_ *= 0.6;
      }
      if(inName == "menu1")
      {
         _loc1_ *= 0.5;
      }
      if(inName == "menu2")
      {
         _loc1_ *= 0.2;
      }
      if(inName == "menu3")
      {
         _loc1_ *= 0.9;
      }
      if(inName == "menu4")
      {
         _loc1_ *= 0.6;
      }
      if(inName == "menu5")
      {
         _loc1_ *= 0.5;
      }
      return _loc1_;
   }
   static function setTrackVolume(inTrack)
   {
      if(inTrack == "zombie1")
      {
         SwainAudioPlayer.volumeMusic = 0.75;
      }
      else
      {
         SwainAudioPlayer.volumeMusic = 0.5;
      }
   }
}