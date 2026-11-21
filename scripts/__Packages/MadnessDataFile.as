class MadnessDataFile
{
   var headWounds;
   var bodyWounds;
   var myCharacter;
   var headType;
   var bodyType;
   var handType;
   var footType;
   var myHeight;
   var myWidth;
   var myDepth;
   var myShootHeight;
   var myHeadHeight;
   var myScale;
   var noCollide;
   var amSlow;
   var bulletEater;
   var myBoss;
   var autoHit;
   var noPaint;
   var selfShoot;
   var attackNeutrals;
   var weakToDash;
   var disarmHelm;
   var fastDeath;
   var noRange;
   var hitStopAttack;
   var freakOut;
   var amZombie;
   var noHeadshots;
   var noDodge;
   var autoAware;
   var autoDash;
   var noWieldGuns;
   var noZombie;
   var noHands;
   var amEvader;
   var amAbom;
   var headGearResurrect;
   var improvedChump;
   var knockdownDash;
   var weaponStealer;
   var meleeShy;
   var grabBreaker;
   var fastDeteriorate;
   var slamGrab;
   var noAimShots;
   var strongGrip;
   var amInvincible;
   var standStill;
   var thrownBlock;
   var myNaturalArmorHead;
   var myNaturalArmorBody;
   var meleeHealth;
   var myName;
   var myHealth;
   var mySpeed;
   var myAccel;
   var myDash;
   var myReload;
   var myBlood;
   var myLevel;
   var traitBravery;
   var traitCover;
   var traitDistracted;
   var traitTriggerFinger;
   var traitCombatSkill;
   var traitAwareness;
   var myStartup;
   var myHealthMax;
   var myTactics;
   var myTacticsMax;
   var myDodge;
   var myMagic;
   var explodeDeath;
   var myUnarmed;
   var myRoster;
   var statSTR;
   var statDEX;
   var statEND;
   var statTAC;
   var statAWR;
   var statLEAD;
   var skillMelee;
   var skillUnarmed;
   var skillPistol;
   var skillRevolver;
   var skillSMG;
   var skillShotgun;
   var skillRifle;
   var skillHeavy;
   var modSpeed;
   var modDmg;
   var modRecharge;
   var modArmor;
   var modAllySmart;
   var modHurtTactics;
   var modRange;
   var mySlowMoMax;
   var mySlowMo;
   var mySprite;
   var mySpeedBoost = 1;
   var myBossPhase = new Number();
   var amSpecial = false;
   var headSpray = 0;
   var bodySpray = 0;
   var amSurprised = true;
   var myObjective = undefined;
   var objectiveRequired = undefined;
   var objectiveHidden = undefined;
   var myIconPos = new Number();
   var skillCap = 30;
   var statCap = 30;
   var myXP = 0;
   var statPoints = 0;
   var skillPoints = 0;
   var xpMelee = 0;
   var xpUnarmed = 0;
   var xpPistol = 0;
   var xpSMG = 0;
   var xpShotgun = 0;
   var xpRifle = 0;
   var myHireCost = new Number();
   var myWaves = 0;
   var myKills = 0;
   var amHarvested = false;
   var myWeapons = new Array();
   var myWeapon = new Number();
   var weaponArray = new Array();
   var myHat = new Array();
   var myMouth = new Array();
   var myMask = new Array();
   var myShirt = new Array();
   var lifeStatus = "active";
   var saveAsActive = false;
   var saveAsLeader = false;
   var arenaLockArmor = false;
   var perkSidearm1 = false;
   var perkKnockdown1 = false;
   var perkBlockBreak = false;
   var perkStunDash1 = false;
   var perkKnockdown2 = false;
   var perkStunDash2 = false;
   var perkDodge1 = false;
   var perkReload1 = false;
   var perkDodge2 = false;
   var perkBlock1 = false;
   var perkDodge3 = false;
   var perkBlock2 = false;
   var perkLowAcc1 = false;
   var perkCoverShoot = false;
   var perkTacBar1 = false;
   var perkLowAcc2 = false;
   var perkLowAcc3 = false;
   var perkTacBar2 = false;
   var perkArmor1 = false;
   var perkArmor2 = false;
   var perkStunProof1 = false;
   var perkArmor3 = false;
   var perkStunProof2 = false;
   var perkImmuneLowDmg = false;
   var perkTeamBonus1 = false;
   var perkFearMonger1 = false;
   var perkTeamBonus2 = false;
   var perkFearMonger2 = false;
   var perkTeamBonus3 = false;
   var perkFearMonger3 = false;
   var perkHeadshotCrits = false;
   var perkBulletTime1 = false;
   var perkBulletTime2 = false;
   var perkArmorPierce = false;
   var perkBulletTime3 = false;
   var perkBulletTime4 = false;
   var perkPistolAccuracy1 = false;
   var perkPistolReload = false;
   var perkPistolROF1 = false;
   var perkPistolEffectiveness = false;
   var perkPistolAccuracy2 = false;
   var perkPistolROF2 = false;
   var perkSMGAim1 = false;
   var perkSMGReload = false;
   var perkSMGTacDamage = false;
   var perkSMGRange = false;
   var perkSMGAim2 = false;
   var perkSMGROF = false;
   var perkRifleTacDamage = false;
   var perkRifleRange1 = false;
   var perkRifleAccuracy = false;
   var perkRifleEffectiveness = false;
   var perkRifleRange2 = false;
   var perkRifleReload = false;
   var perkShotgunDamage = false;
   var perkShotgunROF1 = false;
   var perkShotgunShots1 = false;
   var perkShotgunROF2 = false;
   var perkShotgunReload = false;
   var perkShotgunShots2 = false;
   var perkMeleeMoves1 = false;
   var perkMeleePistolWhip = false;
   var perkMeleeMoves2 = false;
   var perkMeleeDisarm = false;
   var perkMeleeMoves3 = false;
   var perkMeleeMoves4 = false;
   var perkUnarmedMoves1 = false;
   var perkUnarmedSpeed1 = false;
   var perkUnarmedMoves2 = false;
   var perkUnarmedSpeed2 = false;
   var perkUnarmedMoves3 = false;
   var perkUnarmedSpeed3 = false;
   function MadnessDataFile()
   {
      this.myWeapons = new Array();
      this.myHat = new Array();
      this.myMouth = new Array();
      this.myMask = new Array();
      this.myShirt = new Array();
      this.weaponArray = new Array();
      this.headWounds = new Array();
      this.bodyWounds = new Array();
   }
   function createExisting(inChar)
   {
      var _loc4_ = ["myName","myCharacter","myHeight","myWidth","myShootHeight","myHealth","mySpeed","myAccel","myDash","myReload","myBlood","traitBravery","traitCover","traitDistracted","traitTriggerFinger","myHat","myShirt","myMask","myMouth","lifeStatus","myIconPos"];
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         this[_loc4_[_loc2_]] = inChar[_loc4_[_loc2_]];
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < inChar.myWeapons.length)
      {
         this.createWeapon(_loc2_,inChar.myWeapons[_loc2_].myType,inChar.myWeapons[_loc2_].myTag.substr(-8,8) == "Silencer");
         _loc2_ = _loc2_ + 1;
      }
   }
   function createNew(inChar)
   {
      this.myCharacter = inChar;
      this.headType = this.bodyType = this.handType = this.footType = inChar;
      this.myHeight = 94;
      this.myWidth = 50;
      this.myDepth = 16;
      this.myShootHeight = 50;
      this.myHeadHeight = 50;
      this.myIconPos = SwainMath.randomNumber(1,4);
      this.myWeapons = new Array();
      this.weaponArray = new Array();
      this.myScale = 1;
      this.noCollide = false;
      this.amSlow = false;
      this.bulletEater = false;
      this.myBoss = "";
      this.autoHit = false;
      this.noPaint = false;
      this.selfShoot = false;
      this.attackNeutrals = false;
      this.weakToDash = false;
      this.disarmHelm = false;
      this.fastDeath = false;
      this.noRange = false;
      this.hitStopAttack = false;
      this.freakOut = false;
      this.amZombie = false;
      this.noHeadshots = false;
      this.noDodge = false;
      this.autoAware = false;
      this.autoDash = false;
      this.noWieldGuns = false;
      this.noZombie = false;
      this.noHands = false;
      this.amEvader = false;
      this.amAbom = false;
      this.headGearResurrect = false;
      this.improvedChump = false;
      this.knockdownDash = false;
      this.weaponStealer = false;
      this.meleeShy = false;
      this.grabBreaker = false;
      this.fastDeteriorate = false;
      this.slamGrab = false;
      this.noAimShots = false;
      this.strongGrip = false;
      this.amInvincible = false;
      this.standStill = false;
      this.thrownBlock = false;
      this.myNaturalArmorHead = 0;
      this.myNaturalArmorBody = 0;
      this.meleeHealth = 3;
      if(this.myCharacter == "woody")
      {
         this.myName = "Dummy";
         this.myCharacter = "civ";
         this.myHealth = 8;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 1;
         this.traitBravery = 1;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 1;
         this.traitCombatSkill = 1;
         this.traitAwareness = 4;
         this.applyStats(3,3,3,3,0,3,null,10,10,10,10,10,10,10,10);
         this.headType = this.bodyType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "coward")
      {
         this.myName = "Deserter";
         this.myCharacter = "civ";
         this.myHealth = 8;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 1;
         this.traitBravery = -1;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 1;
         this.traitCombatSkill = 1;
         this.traitAwareness = 4;
         this.applyStats(1,1,1,1,0,1,null,0,0,0,0,0,0,0,0);
         this.headType = this.bodyType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "civ")
      {
         this.myName = "Grunt";
         this.myHealth = 8;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 1;
         this.traitBravery = 1;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 1;
         this.traitCombatSkill = 1;
         this.traitAwareness = 4;
         this.weaponArray = ["ppk","beretta","glock20"];
         this.applyStats(1,1,1,1,0,1,null,0,0,0,0,0,0,0,0);
      }
      else if(this.myCharacter == "scientist")
      {
         this.myName = "Lab Geek";
         this.myHealth = 8;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 1;
         this.traitBravery = 1;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 1;
         this.traitCombatSkill = 1;
         this.traitAwareness = 4;
         if(SwainMath.randomNumber(0,6) == 0)
         {
            this.myStartup = "startup_ponder";
         }
         this.applyStats(1,1,1,1,0,1,null,0,0,0,0,0,0,0,0);
         this.headType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "agent" || this.myCharacter == "agent_classic")
      {
         this.myName = "Agent";
         this.myHealth = 12;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 80;
         this.myBlood = "red";
         this.myLevel = SwainMath.randomNumber(2,4);
         this.traitBravery = 3;
         this.traitCover = 1;
         this.traitDistracted = 7;
         this.traitTriggerFinger = 4;
         this.traitCombatSkill = 3;
         this.traitAwareness = 7;
         if(this.myCharacter == "agent_classic")
         {
            this.traitBravery = 3;
            this.traitCover = 4;
            this.traitDistracted = 5;
            this.traitTriggerFinger = 7;
            this.traitCombatSkill = 5;
         }
         this.weaponArray = ["ppk","beretta","glock20"];
         this.applyStats(4,4,4,4,2,4,null,5,5,5,5,5,5,5,5);
         this.handType = this.footType = this.bodyType = "agent";
      }
      else if(this.myCharacter == "agent2")
      {
         this.myName = "Agent Mk1";
         this.myHealth = 18;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 70;
         this.myBlood = "yellow";
         this.myLevel = SwainMath.randomNumber(5,7);
         this.traitBravery = 5;
         this.traitCover = 1;
         this.traitDistracted = 4;
         this.traitTriggerFinger = 7;
         this.traitCombatSkill = 5;
         this.traitAwareness = 7;
         this.weaponArray = ["ppk","beretta","glock20","prokiller460","deagle","hk2","mp7","tmp","mp5k","pm9","oa93","500snub","357snub","ar15"];
         this.applyStats(7,7,7,7,4,7,null,10,10,10,10,10,10,10,10);
         this.handType = this.footType = "agent";
      }
      else if(this.myCharacter == "agent3")
      {
         this.myName = "Agent Mk0";
         this.myHealth = 25;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 70;
         this.myBlood = "yellow";
         this.myLevel = SwainMath.randomNumber(9,11);
         this.traitBravery = 7;
         this.traitCover = 1;
         this.traitDistracted = 3;
         this.traitTriggerFinger = 7;
         this.traitCombatSkill = 9;
         this.traitAwareness = 8;
         this.weaponArray = ["ppk","beretta","glock20","prokiller460","deagle","hk2","mp7","tmp","mp5k","pm9","oa93","500snub","357snub","ar15"];
         this.createWeapon(0,this.weaponArray[SwainMath.randomNumber(0,this.weaponArray.length - 1)],false);
         this.createWeapon(1,this.weaponArray[SwainMath.randomNumber(0,this.weaponArray.length - 1)],false);
         this.weaponArray = new Array();
         this.applyStats(10,15,10,10,5,10,null,15,15,15,15,15,15,15,15);
         this.handType = this.footType = "agent";
      }
      else if(this.myCharacter == "mag")
      {
         this.myName = "Mag Agent";
         this.myHealth = 300;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 70;
         this.myBlood = "red";
         this.myLevel = 15;
         this.myScale = 2.5;
         this.noCollide = true;
         this.selfShoot = true;
         this.fastDeteriorate = true;
         this.amSlow = true;
         this.bulletEater = true;
         this.myBoss = "mag1";
         this.autoHit = true;
         this.noPaint = true;
         this.noRange = true;
         this.myStartup = "startup_roar";
         this.traitBravery = 7;
         this.traitCover = 1;
         this.traitDistracted = 3;
         this.traitTriggerFinger = 7;
         this.traitCombatSkill = 10;
         this.traitAwareness = 8;
         this.createWeapon(0,"ppk",false);
         this.myWeapons[0].myClips = 2000;
         this.myWeapons[0].noPickup = true;
         this.myWeapons[0].myDamage *= 3;
         this.applyStats(30,5,0,20,0,3,null,15,15,15,15,15,15,15,15);
         this.myHealth = 2500;
         this.myHealthMax = 2500;
         this.myTactics = 0;
         this.myTacticsMax = 0;
      }
      else if(this.myCharacter == "fatboy")
      {
         this.myName = "Fatboy";
         this.myCharacter = "fatboy";
         this.myHealth = 25;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.25;
         this.myReload = 70;
         this.myBlood = "red";
         this.myLevel = 10;
         this.meleeHealth = 5;
         this.myScale = 1.4;
         this.noCollide = true;
         this.weakToDash = true;
         this.disarmHelm = true;
         this.selfShoot = true;
         this.amSlow = true;
         this.bulletEater = true;
         this.noPaint = false;
         this.autoHit = true;
         this.fastDeath = true;
         this.myStartup = "startup_roar";
         this.traitBravery = 1;
         this.traitCover = 1;
         this.traitDistracted = 3;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 2;
         this.traitAwareness = 8;
         this.weaponArray = ["hk2","mp7","tmp","mp5k","pm9","oa93"];
         this.createWeapon(0,this.weaponArray[SwainMath.randomNumber(0,this.weaponArray.length - 1)],false);
         this.myWeapons[0].myClips = 2000;
         this.myWeapons[0].noPickup = true;
         this.weaponArray = new Array();
         this.applyStats(20,1,20,3,0,3,null,10,10,10,10,10,10,10,10);
         this.myHealth = 220;
         this.myHealthMax = 220;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.createArmor("armorgolem1");
         this.createArmor("helmetgolem1");
      }
      else if(this.myCharacter == "fatman")
      {
         this.myName = "Fatman";
         this.myCharacter = "fatboy";
         this.myHealth = 25;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 70;
         this.myBlood = "red";
         this.myLevel = 15;
         this.meleeHealth = 7;
         this.myScale = 1.5;
         this.noCollide = true;
         this.weakToDash = true;
         this.disarmHelm = true;
         this.selfShoot = true;
         this.amSlow = true;
         this.bulletEater = true;
         this.noPaint = MadnessGameSelect.gameMode == "story";
         this.autoHit = true;
         this.fastDeath = true;
         this.hitStopAttack = true;
         this.freakOut = true;
         this.myStartup = "startup_roar";
         this.traitBravery = 1;
         this.traitCover = 1;
         this.traitDistracted = 3;
         this.traitTriggerFinger = 6;
         this.traitCombatSkill = 3;
         this.traitAwareness = 8;
         this.weaponArray = ["megahammer"];
         this.createWeapon(0,"megahammer",false);
         this.createWeapon(1,"chaingun",false);
         this.myWeapons[1].myClips = 20000;
         this.myWeapons[0].noPickup = true;
         this.myWeapons[1].noPickup = true;
         this.weaponArray = new Array();
         this.applyStats(20,1,20,3,0,3,null,15,15,15,15,15,15,15,15);
         this.myHealth = 500;
         this.myHealthMax = 500;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.createArmor("armorgolem2");
         this.createArmor("helmetgolem2");
         this.headType = this.bodyType = this.handType = this.footType = "fatboy";
      }
      else if(this.myCharacter == "hank")
      {
         this.myName = "Hank";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 80;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 30;
         this.traitBravery = 10;
         this.traitCover = 6;
         this.traitDistracted = 1;
         this.traitTriggerFinger = 6;
         this.traitCombatSkill = 8;
         this.traitAwareness = 10;
         this.myWeapons[0].myClips = 200;
         this.myWeapons[1].myClips = 200;
         this.applyStats(25,30,25,25,0,25,null,25,25,25,25,25,25,25,25);
      }
      else if(this.myCharacter == "sanford")
      {
         this.myName = "Sanford";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 50;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 15;
         this.traitBravery = 5;
         this.traitCover = 5;
         this.traitDistracted = 5;
         this.traitTriggerFinger = 4;
         this.traitCombatSkill = 6;
         this.traitAwareness = 8;
         this.applyStats(15,15,15,15,0,15,null,15,15,15,15,15,15,15,15);
      }
      else if(this.myCharacter == "deimos")
      {
         this.myName = "Deimos";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 50;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 15;
         this.traitBravery = 5;
         this.traitCover = 5;
         this.traitDistracted = 5;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 6;
         this.traitAwareness = 8;
         this.applyStats(15,15,15,15,0,15,null,15,15,15,15,15,15,15,15);
      }
      else if(this.myCharacter == "jesus")
      {
         this.myName = "Jesus";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 80;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 20;
         this.myDodge = undefined;
         this.traitBravery = 7;
         this.traitCover = 4;
         this.traitDistracted = 2;
         this.traitTriggerFinger = 7;
         this.traitCombatSkill = 10;
         this.traitAwareness = 9;
         this.myMagic = "jesus1";
         this.myDodge = "jesus";
         this.applyStats(25,25,25,25,0,25,null,25,25,25,25,25,25,25,25);
      }
      else if(this.myCharacter == "jesus2")
      {
         this.myName = "Dr.Christoff";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 80;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 20;
         this.traitBravery = 7;
         this.traitCover = 4;
         this.traitDistracted = 2;
         this.traitTriggerFinger = 7;
         this.traitCombatSkill = 10;
         this.traitAwareness = 9;
         this.createArmor("shades13");
         this.applyStats(15,15,15,15,0,15,null,15,15,15,15,15,15,15,15);
         this.handType = this.footType = "civ";
         this.bodyType = "scientist3";
      }
      else if(this.myCharacter == "tricky")
      {
         this.myName = "Tricky";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 80;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 20;
         this.traitBravery = 10;
         this.traitCover = 1;
         this.traitDistracted = 6;
         this.traitTriggerFinger = 10;
         this.traitCombatSkill = 10;
         this.traitAwareness = 6;
         this.weaponArray = ["mp7"];
         this.applyStats(25,25,25,25,0,25,null,25,25,25,25,25,25,25,25);
      }
      else if(this.myCharacter == "tricky2")
      {
         this.myName = "Dr.Hofnarr";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 80;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 20;
         this.traitBravery = 10;
         this.traitCover = 1;
         this.traitDistracted = 6;
         this.traitTriggerFinger = 10;
         this.traitCombatSkill = 10;
         this.traitAwareness = 6;
         this.createArmor("shades11");
         this.applyStats(15,15,15,15,0,15,null,15,15,15,15,15,15,15,15);
         this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "blockhead")
      {
         this.myName = "Blockhead";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 20;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "yellow";
         this.myLevel = 8;
         this.traitBravery = 10;
         this.traitCover = 1;
         this.traitDistracted = 10;
         this.traitTriggerFinger = 3;
         this.traitCombatSkill = 4;
         this.traitAwareness = 2;
         this.weaponArray = ["ar15","sr3","ak74","m16","aug","ak74u","hk416","fnfal","m249","famas","oa93","pm9","mp5","mp5k","tmp","mp7","hk2"];
         this.applyStats(10,10,10,10,0,10,null,10,10,10,10,10,10,10,10);
      }
      else if(this.myCharacter == "swain")
      {
         this.myName = "The Swain";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 20;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 10;
         this.traitBravery = 6;
         this.traitCover = 4;
         this.traitDistracted = 3;
         this.traitTriggerFinger = 7;
         this.traitCombatSkill = 5;
         this.traitAwareness = 7;
         this.weaponArray = ["ar15","sr3","ak74","m16","aug","ak74u","hk416","fnfal","m249","famas","oa93","pm9","mp5","mp5k","tmp","mp7","hk2"];
         this.applyStats(10,10,10,10,0,10,null,10,10,10,10,10,10,10,10);
      }
      else if(this.myCharacter == "krinkels")
      {
         this.myName = "Krinkels";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 20;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 12;
         this.traitBravery = 7;
         this.traitCover = 9;
         this.traitDistracted = 7;
         this.traitTriggerFinger = 2;
         this.traitCombatSkill = 6;
         this.traitAwareness = 7;
         this.assignCustom("hat",this.myHat,["hair1"],1);
         this.assignCustom("mask",this.myMask,["shades2"],1);
         this.assignCustom("mouth",this.myMouth,["chin1"],1);
         this.weaponArray = ["ar15","sr3","ak74","m16","aug","ak74u","hk416","fnfal","m249","famas","oa93","pm9","mp5","mp5k","tmp","mp7","hk2"];
         this.applyStats(10,10,10,10,0,10,null,10,10,10,10,10,10,10,10);
      }
      else if(this.myCharacter == "cheshyre")
      {
         this.myName = "Cheshyre";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 20;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 11;
         this.traitBravery = 3;
         this.traitCover = 6;
         this.traitDistracted = 4;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 5;
         this.traitAwareness = 7;
         this.grabBreaker = true;
         this.assignCustom("mask",this.myMask,["cheshyre"],1);
         this.assignCustom("shirt",this.myShirt,["armor_hoody"],1);
         this.weaponArray = ["ar15","sr3","ak74","m16","aug","ak74u","hk416","fnfal","m249","famas","oa93","pm9","mp5","mp5k","tmp","mp7","hk2"];
         this.applyStats(10,10,10,10,0,10,null,10,10,10,10,10,10,10,10);
         this.headType = this.bodyType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "luis")
      {
         this.myName = "Luis";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.myHealth = 20;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 11;
         this.traitBravery = 3;
         this.traitCover = 6;
         this.traitDistracted = 4;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 5;
         this.traitAwareness = 7;
         this.assignCustom("hat",this.myHat,["hair_luis","hat_luis"],1);
         this.assignCustom("mask",this.myMask,["luis"],1);
         this.assignCustom("shirt",this.myShirt,["poncho","machette"],1);
         this.weaponArray = ["machette","bowieknife"];
         this.applyStats(10,10,10,10,0,10,null,10,10,10,10,10,10,10,10);
         this.headType = this.bodyType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "arena")
      {
         this.myName = "Player";
         this.amSpecial = true;
         this.myCharacter = "civ";
         this.myHealth = 8;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 1;
         this.traitBravery = 1;
         this.traitCover = 1;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 1;
         this.traitCombatSkill = 1;
         this.traitAwareness = 8;
         this.applyStats(0,0,0,0,0,0,null,0,0,0,0,0,0,0,0);
         this.headType = this.bodyType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "arenatest")
      {
         this.myName = "Player";
         this.amSpecial = true;
         this.myCharacter = "civ";
         this.myHealth = 8;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 30;
         this.traitBravery = 1;
         this.traitCover = 1;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 1;
         this.traitCombatSkill = 1;
         this.traitAwareness = 8;
         this.applyStats(20,20,20,20,20,20,null,20,20,20,20,20,20,20,20);
         this.headType = this.bodyType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "arena_merc")
      {
         this.myName = "Mercenary";
         this.amSpecial = true;
         this.myCharacter = "civ";
         this.myHealth = 8;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 1;
         this.traitBravery = 1;
         this.traitCover = 1;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 1;
         this.traitCombatSkill = 1;
         this.traitAwareness = 8;
         this.applyStats(0,0,0,0,0,0,null,0,0,0,0,0,0,0,0);
         this.headType = this.bodyType = this.handType = this.footType = "civ";
      }
      else if(this.myCharacter == "zombie" || this.myCharacter == "zombie_scientist")
      {
         this.myName = "Zombie";
         this.applyStats(10,1,1,20,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 60;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 3;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 4;
         this.bulletEater = false;
         this.amZombie = true;
         this.noHeadshots = false;
         this.noDodge = true;
         this.noWieldGuns = true;
         this.weaponStealer = false;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 1;
         this.traitAwareness = 0;
         this.headType = "zombie" + SwainMath.randomNumber(1,3);
         if(this.myCharacter == "zombie")
         {
            this.bodyType = "tricky";
         }
         this.handType = this.footType = "tricky";
      }
      else if(this.myCharacter == "zombie_agent" || this.myCharacter == "zombie_agent_classic")
      {
         this.myName = "Zombie";
         this.applyStats(12,1,1,20,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 120;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 3;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 4;
         this.bulletEater = false;
         this.amZombie = true;
         this.noHeadshots = false;
         this.noDodge = true;
         this.noWieldGuns = true;
         this.weaponStealer = true;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 1;
         this.traitAwareness = 0;
         if(this.myCharacter == "zombie_agent")
         {
            this.createArmor("agent1_mask");
         }
         if(this.myCharacter == "zombie_agent_classic")
         {
            this.createArmor("agent1_mask_b");
         }
         this.headType = "zombie" + SwainMath.randomNumber(1,3);
         this.bodyType = "zombie_agent";
         this.handType = this.footType = "tricky";
      }
      else if(this.myCharacter == "zombie_agent2")
      {
         this.myName = "Zombie";
         this.applyStats(15,1,1,25,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 150;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 3;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "yellow";
         this.myLevel = 6;
         this.bulletEater = false;
         this.amZombie = true;
         this.noHeadshots = false;
         this.noDodge = true;
         this.autoAware = true;
         this.noWieldGuns = true;
         this.weaponStealer = true;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 1;
         this.traitAwareness = 0;
         this.createArmor("agent2_mask");
         this.headType = "zombie_yellow";
         this.bodyType = "zombie_agent2";
         this.handType = this.footType = "tricky";
      }
      else if(this.myCharacter == "zombie_agent3")
      {
         this.myName = "Zombie";
         this.applyStats(20,1,1,25,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 200;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 3;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "yellow";
         this.myLevel = 8;
         this.bulletEater = false;
         this.amZombie = true;
         this.noHeadshots = false;
         this.noDodge = true;
         this.autoAware = true;
         this.autoDash = true;
         this.noWieldGuns = true;
         this.weaponStealer = true;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 1;
         this.traitAwareness = 0;
         this.createArmor("agent3_mask");
         this.headType = "zombie_yellow";
         this.bodyType = "zombie_agent3";
         this.handType = this.footType = "tricky";
      }
      else if(this.myCharacter == "zombie_fatboy")
      {
         this.myName = "Zombie G03LM";
         this.applyStats(25,1,1,30,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 400;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 2;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 12;
         this.myScale = 1.4;
         this.noCollide = true;
         this.weakToDash = true;
         this.disarmHelm = true;
         this.selfShoot = true;
         this.amSlow = true;
         this.bulletEater = true;
         this.noPaint = false;
         this.autoHit = true;
         this.fastDeath = true;
         this.amZombie = true;
         this.noHeadshots = false;
         this.noDodge = true;
         this.autoAware = true;
         this.noWieldGuns = true;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 1;
         this.traitAwareness = 0;
         this.createArmor("armorgolem_zombie");
         if(SwainMath.randomNumber(1,3) < 3)
         {
            this.createArmor("helmetgolem_zombie");
         }
         this.headType = "zombie_fatboy";
         this.bodyType = this.handType = this.footType = "tricky";
      }
      else if(this.myCharacter == "zombie_riot")
      {
         this.myName = "Zombie";
         this.applyStats(15,1,1,25,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 150;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 3;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "red";
         this.myLevel = 6;
         this.bulletEater = false;
         this.amZombie = true;
         this.noHeadshots = false;
         this.noDodge = true;
         this.autoAware = true;
         this.noWieldGuns = true;
         this.weaponStealer = true;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 8;
         this.traitTriggerFinger = 5;
         this.traitCombatSkill = 1;
         this.traitAwareness = 0;
         this.handType = this.footType = "tricky";
      }
      else if(this.myCharacter == "abom")
      {
         this.myName = "Abomination";
         this.applyStats(10,1,1,20,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 60;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 5;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "darkred";
         this.myLevel = 4;
         this.bulletEater = false;
         this.noHeadshots = false;
         this.noDodge = true;
         this.noWieldGuns = true;
         this.noZombie = true;
         this.noHands = true;
         this.amEvader = true;
         this.amAbom = true;
         this.autoHit = true;
         this.knockdownDash = true;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 6;
         this.traitTriggerFinger = 10;
         this.traitCombatSkill = 8;
         this.traitAwareness = 8;
         this.createArmor("handstraps");
         this.headType = "abom" + SwainMath.randomNumber(1,3);
         this.bodyType = "abom" + SwainMath.randomNumber(1,2);
         this.handType = this.footType = "jesus";
      }
      else if(this.myCharacter == "patient")
      {
         this.myName = "Patient";
         this.applyStats(15,15,1,30,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 35;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 4;
         this.myAccel = this.mySpeed / 2;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "darkred";
         this.myLevel = 6;
         this.bulletEater = false;
         this.autoAware = false;
         this.headGearResurrect = true;
         this.noWieldGuns = false;
         this.weaponStealer = true;
         this.noHeadshots = true;
         this.improvedChump = true;
         this.noZombie = true;
         this.noDodge = true;
         this.fastDeteriorate = true;
         this.explodeDeath = 2;
         this.traitBravery = 2;
         this.traitCover = 0;
         this.traitDistracted = 4;
         this.traitTriggerFinger = 9;
         this.traitCombatSkill = 5;
         this.traitAwareness = 7;
         this.myNaturalArmorHead = 5;
         this.handType = this.footType = "civ";
         this.headType = "experiment";
         this.bodyType = "patient" + SwainMath.randomNumber(1,2);
      }
      else if(this.myCharacter == "experiment")
      {
         this.myName = "Experiment";
         this.applyStats(25,10,1,30,0,1,null,0,0,0,0,0,0,0,0);
         this.myHealth = 120;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 4;
         this.myAccel = this.mySpeed / 2;
         this.myDash = 1.3;
         this.myReload = 90;
         this.myBlood = "darkred";
         this.myLevel = 12;
         this.traitBravery = 7;
         this.myScale = 1.25;
         this.noCollide = true;
         this.selfShoot = true;
         this.bulletEater = false;
         this.noPaint = false;
         this.autoHit = true;
         this.headGearResurrect = true;
         this.noZombie = true;
         this.autoAware = false;
         this.noHeadshots = true;
         this.noDodge = true;
         this.noWieldGuns = true;
         this.improvedChump = true;
         this.traitBravery = 10;
         this.traitCover = 0;
         this.traitDistracted = 3;
         this.traitTriggerFinger = 4;
         this.traitCombatSkill = 1;
         this.traitAwareness = 10;
         this.myNaturalArmorBody = 6;
         this.myNaturalArmorHead = 5;
         this.handType = "jesus";
      }
      else if(this.myCharacter == "riot")
      {
         this.myName = "Riot Agent";
         this.applyStats(16,15,5,20,5,10,null,15,15,15,15,15,15,15,15);
         this.myHealth = 25;
         this.myTacticsMax = this.myTactics = Math.floor(this.myTactics * 0.65);
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 70;
         this.myBlood = "red";
         this.myLevel = 8;
         this.meleeShy = true;
         this.grabBreaker = true;
         this.traitBravery = 7;
         this.traitCover = 8;
         this.traitDistracted = 6;
         this.traitTriggerFinger = 7;
         this.traitCombatSkill = 10;
         this.traitAwareness = 8;
         this.weaponArray = ["ppk","beretta","glock20","prokiller460","deagle","hk2","mp7","tmp","mp5k","pm9","oa93","500snub","357snub","ar15"];
         this.createWeapon(0,this.weaponArray[SwainMath.randomNumber(0,this.weaponArray.length - 1)],false);
         this.createWeapon(1,"billyclub",false);
         this.weaponArray = new Array();
         this.myNaturalArmorHead = 4;
         this.myNaturalArmorBody = 4;
         this.handType = this.footType = "agent";
      }
      else if(this.myCharacter == "mag2")
      {
         this.myName = "Mag Agent";
         this.applyStats(23,5,0,20,0,3,null,15,15,15,15,15,15,15,15);
         this.myHealth = 1300;
         this.myHealthMax = 1300;
         this.myTactics = 0;
         this.myTacticsMax = 0;
         this.mySpeed = 6;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.3;
         this.myReload = 70;
         this.myBlood = "darkred";
         this.myLevel = 15;
         this.myScale = 2.5;
         this.noCollide = true;
         this.selfShoot = true;
         this.fastDeteriorate = true;
         this.slamGrab = true;
         this.noDodge = true;
         this.amSlow = false;
         this.bulletEater = true;
         this.myBoss = "mag2";
         this.autoHit = true;
         this.noPaint = true;
         this.noRange = true;
         this.knockdownDash = true;
         this.myStartup = "startup_roar";
         this.amAbom = true;
         this.traitBravery = 7;
         this.traitCover = 1;
         this.traitDistracted = 3;
         this.traitTriggerFinger = 9;
         this.traitCombatSkill = 10;
         this.traitAwareness = 8;
         this.myNaturalArmorHead = 2;
         this.myNaturalArmorBody = 2;
         this.createArmor("armor_mag2");
         this.createArmor("helmet_mag2");
      }
      else if(this.myCharacter == "phobos")
      {
         this.myName = "Phobos";
         this.amSpecial = true;
         this.arenaLockArmor = true;
         this.applyStats(25,30,25,25,0,25,null,25,25,25,25,25,25,25,25);
         this.myHealth = 200;
         this.mySpeed = 3;
         this.myAccel = this.mySpeed / 4;
         this.myDash = 1.4;
         this.myReload = 60;
         this.myBlood = "red";
         this.myLevel = 40;
         this.autoAware = true;
         this.myScale = 1.2;
         this.noCollide = true;
         this.selfShoot = true;
         this.fastDeteriorate = false;
         this.noPaint = true;
         this.noAimShots = true;
         this.meleeShy = true;
         this.strongGrip = true;
         this.thrownBlock = true;
         this.myDodge = "phobos";
         this.traitBravery = 6;
         this.traitCover = 9;
         this.traitDistracted = 2;
         this.traitTriggerFinger = 10;
         this.traitCombatSkill = 15;
         this.traitAwareness = 10;
         this.createWeapon(0,"binarysword",false);
         this.myStartup = "startup_phobos";
         this.handType = this.footType = "jesus";
      }
      this.myReload = 96;
      this.myHealthMax = this.myHealth;
      if(this.weaponArray.length > 0)
      {
         this.createWeapon(0,this.weaponArray[SwainMath.randomNumber(0,this.weaponArray.length - 1)],false);
      }
      if(this.amZombie || this.amAbom)
      {
         this.attackNeutrals = true;
      }
      this.myUnarmed = ItemGenerator.unarmedWeapon();
   }
   function createWeapon(inSlot, inType, silencer)
   {
      var _loc2_ = new Object();
      _loc2_ = ItemGenerator.createWeapon(inType,silencer);
      this.equipItem(_loc2_,inSlot);
   }
   function createArmor(inType)
   {
      var _loc2_ = new Object();
      _loc2_ = ItemGenerator.createArmor(inType);
      this.equipItem(_loc2_,0);
   }
   function equipItem(inItem, forceSlot)
   {
      if(inItem != undefined)
      {
         if(inItem.myCat == "melee" || inItem.myCat == "electric" || inItem.myCat == "smg" || inItem.myCat == "pistol" || inItem.myCat == "revolver" || inItem.myCat == "shotgun" || inItem.myCat == "rifle" || inItem.myCat == "heavy" || inItem.myCat == "heavy_rifle")
         {
            if(forceSlot != null)
            {
               this.unequipItem("weapon" + String(forceSlot),forceSlot == 2);
               this.giveItem(inItem,forceSlot);
            }
            else if((inItem.myCat == "pistol" || inItem.myCat == "revolver") && (this.myWeapons[0] != undefined || this.myWeapons[1] == undefined))
            {
               this.unequipItem("weapon1",false);
               this.giveItem(inItem,1);
            }
            else
            {
               this.unequipItem("weapon0",false);
               this.giveItem(inItem,0);
            }
         }
         else if(inItem.myCat == "shirt")
         {
            this.unequipItem(inItem.myCat,forceSlot == 2);
            this.giveItem(inItem,forceSlot);
         }
         else if(inItem.myCat == "hat")
         {
            this.unequipItem(inItem.myCat,forceSlot == 2);
            this.giveItem(inItem,forceSlot);
         }
         else if(inItem.myCat == "mask")
         {
            this.unequipItem(inItem.myCat,forceSlot == 2);
            this.giveItem(inItem,forceSlot);
         }
         else if(inItem.myCat == "mouth")
         {
            this.unequipItem(inItem.myCat,forceSlot == 2);
            this.giveItem(inItem,forceSlot);
         }
      }
   }
   function unequipItem(inCat, inStore)
   {
      var _loc3_ = undefined;
      if(inStore)
      {
         _loc3_ = 2;
      }
      else if(inCat == "weapon1")
      {
         _loc3_ = 1;
      }
      else
      {
         _loc3_ = 0;
      }
      var _loc2_ = undefined;
      if(inCat.substr(0,6) == "weapon")
      {
         _loc2_ = this.myWeapons;
         if(!inStore)
         {
            this.myRoster.addWeapon(_loc2_[_loc3_]);
         }
      }
      else
      {
         if(inCat == "hat")
         {
            _loc2_ = this.myHat;
         }
         else if(inCat == "mask")
         {
            _loc2_ = this.myMask;
         }
         else if(inCat == "mouth")
         {
            _loc2_ = this.myMouth;
         }
         else if(inCat == "shirt")
         {
            _loc2_ = this.myShirt;
         }
         if(!inStore)
         {
            this.myRoster.addArmor(_loc2_[_loc3_]);
         }
      }
      if(_loc2_ != undefined)
      {
         if(_loc3_ != 2)
         {
            _loc2_[_loc3_].myOwner = undefined;
         }
         _loc2_[_loc3_] = undefined;
      }
   }
   function giveItem(inItem, inSlot)
   {
      var _loc3_ = undefined;
      if(inItem.myCat == "melee" || inItem.myCat == "smg" || inItem.myCat == "electric" || inItem.myCat == "pistol" || inItem.myCat == "revolver" || inItem.myCat == "shotgun" || inItem.myCat == "rifle" || inItem.myCat == "heavy" || inItem.myCat == "heavy_rifle")
      {
         _loc3_ = this.myWeapons;
         if(inSlot != 2)
         {
            this.myRoster.removeWeapon(inItem);
         }
      }
      else
      {
         if(inItem.myCat == "shirt")
         {
            _loc3_ = this.myShirt;
         }
         else if(inItem.myCat == "hat")
         {
            _loc3_ = this.myHat;
         }
         else if(inItem.myCat == "mask")
         {
            _loc3_ = this.myMask;
         }
         else if(inItem.myCat == "mouth")
         {
            _loc3_ = this.myMouth;
         }
         if(inSlot != 2)
         {
            this.myRoster.removeArmor(inItem);
         }
      }
      _loc3_[inSlot] = inItem;
      if(inSlot != 2)
      {
         inItem.myOwner = this;
      }
   }
   function assignCustom(inCat, inCurrent, inArray, inRatio)
   {
      if(SwainMath.randomNumber(1,inRatio) == 1)
      {
         var _loc2_ = new Object();
         _loc2_.myType = inArray[SwainMath.randomNumber(0,inArray.length - 1)];
         _loc2_.myCat = inCat;
         _loc2_.myOwner = this;
         this.equipItem(_loc2_,0);
      }
   }
   function randomizeCharacter(inVariety)
   {
      var _loc3_ = ["myHealth","traitBravery","traitCover","traitDistracted","traitTriggerFinger","traitCombatSkill"];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         this[_loc3_[_loc2_]] *= SwainMath.randomNumber((- inVariety) * 1000,inVariety * 1000) / 1000;
         _loc2_ = _loc2_ + 1;
      }
      this.myHealthMax = this.myHealth;
   }
   function applyStats(inStr, inDex, inTac, inEnd, inLead, inAwr, SPACER, inMelee, inUnarmed, inPistol, inRevolver, inSMG, inShotgun, inRifle, inHeavy)
   {
      this.statSTR = inStr;
      this.statDEX = inDex;
      this.statEND = inEnd;
      this.statTAC = inTac;
      this.statAWR = inAwr;
      this.statLEAD = inLead;
      this.skillMelee = inMelee;
      this.skillUnarmed = inUnarmed;
      this.skillPistol = inPistol;
      this.skillRevolver = inRevolver;
      this.skillSMG = inSMG;
      this.skillShotgun = inShotgun;
      this.skillRifle = inRifle;
      this.skillHeavy = inHeavy;
      this.changeStats();
      this.assignPerks();
   }
   function changeStats()
   {
      if(this.amSpecial && false)
      {
         this.statDEX = 1 + Math.floor(this.myLevel / 2);
         this.statSTR = 1 + Math.floor(this.myLevel / 2);
         this.statTAC = 1 + Math.floor(this.myLevel / 2);
         this.statEND = 1 + Math.floor(this.myLevel / 2);
         this.statLEAD = 1 + Math.floor(this.myLevel / 2);
         this.statAWR = 1 + Math.floor(this.myLevel / 2);
      }
      if(this.amSpecial)
      {
         this.mySpeed = 4.8;
      }
      else
      {
         this.mySpeed = 4.5;
      }
      this.modSpeed = 1 + this.statDEX / 45;
      this.modDmg = 1 + this.statSTR / 15;
      this.modRecharge = 1 + this.statTAC / 10;
      this.modArmor = 1 + this.statEND / 15;
      this.modAllySmart = 1 + this.statLEAD / 15;
      this.modHurtTactics = 1 + this.statAWR / 50;
      this.modRange = this.statAWR * 1.5;
      this.myHealth = 6 + Math.floor(this.myLevel);
      if(this.amSpecial)
      {
         this.myHealth += 10;
      }
      this.myHealthMax = this.myHealth;
      this.myTactics = 0;
      var _loc2_ = 5;
      while(_loc2_ <= this.myLevel && _loc2_ < 45)
      {
         this.myTactics += Math.floor(5 * (0.7 - _loc2_ / 100));
         _loc2_ = _loc2_ + 1;
      }
      if(MadnessDataFile.havePerk("perkTacBar1",this))
      {
         this.myTactics += 10;
      }
      if(MadnessDataFile.havePerk("perkTacBar2",this))
      {
         this.myTactics += 10;
      }
      if(this.amSlow)
      {
         this.myTactics = 0;
      }
      this.myTacticsMax = this.myTactics;
      this.mySlowMoMax = 400;
      this.mySlowMo = 0;
   }
   function assignPerks()
   {
      this.perkSidearm1 = false;
      this.perkKnockdown1 = false;
      this.perkBlockBreak = false;
      this.perkStunDash1 = false;
      this.perkKnockdown2 = false;
      this.perkStunDash2 = false;
      this.perkDodge1 = false;
      this.perkReload1 = false;
      this.perkDodge2 = false;
      this.perkBlock1 = false;
      this.perkDodge3 = false;
      this.perkBlock2 = false;
      this.perkLowAcc1 = false;
      this.perkCoverShoot = false;
      this.perkTacBar1 = false;
      this.perkLowAcc2 = false;
      this.perkLowAcc3 = false;
      this.perkTacBar2 = false;
      this.perkArmor1 = false;
      this.perkArmor2 = false;
      this.perkStunProof1 = false;
      this.perkArmor3 = false;
      this.perkStunProof2 = false;
      this.perkImmuneLowDmg = false;
      this.perkTeamBonus1 = false;
      this.perkFearMonger1 = false;
      this.perkTeamBonus2 = false;
      this.perkFearMonger2 = false;
      this.perkTeamBonus3 = false;
      this.perkFearMonger3 = false;
      this.perkHeadshotCrits = false;
      this.perkBulletTime1 = false;
      this.perkBulletTime2 = false;
      this.perkArmorPierce = false;
      this.perkBulletTime3 = false;
      this.perkBulletTime4 = false;
      this.perkPistolAccuracy1 = false;
      this.perkPistolReload = false;
      this.perkPistolROF1 = false;
      this.perkPistolEffectiveness = false;
      this.perkPistolAccuracy2 = false;
      this.perkPistolROF2 = false;
      this.perkSMGAim1 = false;
      this.perkSMGReload = false;
      this.perkSMGTacDamage = false;
      this.perkSMGRange = false;
      this.perkSMGAim2 = false;
      var _loc2_ = false;
      this.perkRifleTacDamage = false;
      this.perkRifleRange1 = false;
      this.perkRifleAccuracy = false;
      this.perkRifleEffectiveness = false;
      this.perkRifleRange2 = false;
      this.perkRifleReload = false;
      this.perkShotgunDamage = false;
      this.perkShotgunROF1 = false;
      this.perkShotgunShots1 = false;
      this.perkShotgunROF2 = false;
      this.perkShotgunReload = false;
      this.perkShotgunShots2 = false;
      this.perkMeleeMoves1 = false;
      this.perkMeleePistolWhip = false;
      this.perkMeleeMoves2 = false;
      this.perkMeleeDisarm = false;
      this.perkMeleeMoves3 = false;
      this.perkMeleeMoves4 = false;
      this.perkUnarmedMoves1 = false;
      this.perkUnarmedSpeed1 = false;
      this.perkUnarmedMoves2 = false;
      this.perkUnarmedSpeed2 = false;
      this.perkUnarmedMoves3 = false;
      this.perkUnarmedSpeed3 = false;
      if(this.statSTR >= 5)
      {
         this.perkSidearm1 = true;
      }
      if(this.statSTR >= 10)
      {
         this.perkKnockdown1 = true;
      }
      if(this.statSTR >= 15)
      {
         this.perkBlockBreak = true;
      }
      if(this.statSTR >= 20)
      {
         this.perkStunDash1 = true;
      }
      if(this.statSTR >= 25)
      {
         this.perkKnockdown2 = true;
      }
      if(this.statSTR >= 30)
      {
         this.perkStunDash2 = true;
      }
      if(this.statDEX >= 5)
      {
         this.perkDodge1 = true;
      }
      if(this.statDEX >= 10)
      {
         this.perkReload1 = true;
      }
      if(this.statDEX >= 15)
      {
         this.perkDodge2 = true;
      }
      if(this.statDEX >= 20)
      {
         this.perkBlock1 = true;
      }
      if(this.statDEX >= 25)
      {
         this.perkDodge3 = true;
      }
      if(this.statDEX >= 30)
      {
         this.perkBlock2 = true;
      }
      if(this.statTAC >= 5)
      {
         this.perkLowAcc1 = true;
      }
      if(this.statTAC >= 10)
      {
         this.perkCoverShoot = true;
      }
      if(this.statTAC >= 15)
      {
         this.perkTacBar1 = true;
      }
      if(this.statTAC >= 20)
      {
         this.perkLowAcc2 = true;
      }
      if(this.statTAC >= 25)
      {
         this.perkTacBar2 = true;
      }
      if(this.statTAC >= 30)
      {
         this.perkLowAcc3 = true;
      }
      if(this.statEND >= 5)
      {
         this.perkArmor1 = true;
      }
      if(this.statEND >= 10)
      {
         this.perkArmor2 = true;
      }
      if(this.statEND >= 15)
      {
         this.perkStunProof1 = true;
      }
      if(this.statEND >= 20)
      {
         this.perkArmor3 = true;
      }
      if(this.statEND >= 25)
      {
         this.perkStunProof2 = true;
      }
      if(this.statEND >= 30)
      {
         this.perkImmuneLowDmg = true;
      }
      if(this.statLEAD >= 5)
      {
         this.perkTeamBonus1 = true;
      }
      if(this.statLEAD >= 10)
      {
         this.perkFearMonger1 = true;
      }
      if(this.statLEAD >= 15)
      {
         this.perkTeamBonus2 = true;
      }
      if(this.statLEAD >= 20)
      {
         this.perkFearMonger2 = true;
      }
      if(this.statLEAD >= 25)
      {
         this.perkTeamBonus3 = true;
      }
      if(this.statLEAD >= 30)
      {
         this.perkFearMonger3 = true;
      }
      if(this.statAWR >= 5)
      {
         this.perkHeadshotCrits = true;
      }
      if(this.statAWR >= 10)
      {
         this.perkBulletTime1 = true;
      }
      if(this.statAWR >= 15)
      {
         this.perkBulletTime2 = true;
      }
      if(this.statAWR >= 20)
      {
         this.perkArmorPierce = true;
      }
      if(this.statAWR >= 25)
      {
         this.perkBulletTime3 = true;
      }
      if(this.statAWR >= 30)
      {
         this.perkBulletTime4 = true;
      }
      if(this.skillPistol >= 5)
      {
         this.perkPistolAccuracy1 = true;
      }
      if(this.skillPistol >= 10)
      {
         this.perkPistolReload = true;
      }
      if(this.skillPistol >= 15)
      {
         this.perkPistolROF1 = true;
      }
      if(this.skillPistol >= 20)
      {
         this.perkPistolEffectiveness = true;
      }
      if(this.skillPistol >= 25)
      {
         this.perkPistolAccuracy2 = true;
      }
      if(this.skillPistol >= 30)
      {
         this.perkPistolROF2 = true;
      }
      if(this.skillSMG >= 5)
      {
         this.perkSMGAim1 = true;
      }
      if(this.skillSMG >= 10)
      {
         this.perkSMGReload = true;
      }
      if(this.skillSMG >= 15)
      {
         this.perkSMGTacDamage = true;
      }
      if(this.skillSMG >= 20)
      {
         this.perkSMGRange = true;
      }
      if(this.skillSMG >= 25)
      {
         this.perkSMGAim2 = true;
      }
      if(this.skillSMG >= 30)
      {
         _loc2_ = true;
      }
      if(this.skillRifle >= 5)
      {
         this.perkRifleTacDamage = true;
      }
      if(this.skillRifle >= 10)
      {
         this.perkRifleRange1 = true;
      }
      if(this.skillRifle >= 15)
      {
         this.perkRifleAccuracy = true;
      }
      if(this.skillRifle >= 20)
      {
         this.perkRifleEffectiveness = true;
      }
      if(this.skillRifle >= 25)
      {
         this.perkRifleRange2 = true;
      }
      if(this.skillRifle >= 30)
      {
         this.perkRifleReload = true;
      }
      if(this.skillShotgun >= 5)
      {
         this.perkShotgunDamage = true;
      }
      if(this.skillShotgun >= 10)
      {
         this.perkShotgunROF1 = true;
      }
      if(this.skillShotgun >= 15)
      {
         this.perkShotgunShots1 = true;
      }
      if(this.skillShotgun >= 20)
      {
         this.perkShotgunROF2 = true;
      }
      if(this.skillShotgun >= 25)
      {
         this.perkShotgunReload = true;
      }
      if(this.skillShotgun >= 30)
      {
         this.perkShotgunShots2 = true;
      }
      if(this.skillMelee >= 5)
      {
         this.perkMeleeMoves1 = true;
      }
      if(this.skillMelee >= 10)
      {
         this.perkMeleePistolWhip = true;
      }
      if(this.skillMelee >= 15)
      {
         this.perkMeleeMoves2 = true;
      }
      if(this.skillMelee >= 20)
      {
         this.perkMeleeDisarm = true;
      }
      if(this.skillMelee >= 25)
      {
         this.perkMeleeMoves3 = true;
      }
      if(this.skillMelee >= 30)
      {
         this.perkMeleeMoves4 = true;
      }
      if(this.skillUnarmed >= 5)
      {
         this.perkUnarmedMoves1 = true;
      }
      if(this.skillUnarmed >= 10)
      {
         this.perkUnarmedSpeed1 = true;
      }
      if(this.skillUnarmed >= 15)
      {
         this.perkUnarmedMoves2 = true;
      }
      if(this.skillUnarmed >= 20)
      {
         this.perkUnarmedSpeed2 = true;
      }
      if(this.skillUnarmed >= 25)
      {
         this.perkUnarmedMoves3 = true;
      }
      if(this.skillUnarmed >= 30)
      {
         this.perkUnarmedSpeed3 = true;
      }
   }
   function healMeMinor()
   {
      this.myHealth = this.myHealthMax;
      this.myTactics = this.myTacticsMax;
      this.mySprite.amBleeding = false;
   }
   function healMe()
   {
      this.myHealth = this.myHealthMax;
      this.myTactics = this.myTacticsMax;
      var _loc3_ = 3;
      var _loc2_ = 0;
      while(_loc2_ < this.headWounds.length)
      {
         if(this.headWounds[_loc2_].myAge == undefined)
         {
            this.headWounds[_loc2_].myAge = 0;
         }
         else
         {
            this.headWounds[_loc2_].myAge = this.headWounds[_loc2_].myAge + 1;
         }
         if(this.headWounds[_loc2_].myType != "stitch" && SwainMath.randomNumber(1,_loc3_) == 1 || this.headWounds[_loc2_].myAge >= 2)
         {
            this.headWounds.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
         else if(this.headWounds[_loc2_].myType.substr(0,5) != "punch" && this.headWounds[_loc2_].myType != "stitch")
         {
            this.headWounds[_loc2_].myType = "stitch";
            this.headWounds[_loc2_].myVariant = SwainMath.randomNumber(1,6);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      while(_loc2_ < this.bodyWounds.length)
      {
         if(this.bodyWounds[_loc2_].myAge == undefined)
         {
            this.bodyWounds[_loc2_].myAge = 0;
         }
         else
         {
            this.bodyWounds[_loc2_].myAge = this.bodyWounds[_loc2_].myAge + 1;
         }
         if(this.bodyWounds[_loc2_].myType != "stitch" && SwainMath.randomNumber(1,_loc3_) == 1 || this.bodyWounds[_loc2_].myAge >= 2)
         {
            this.bodyWounds.splice(_loc2_,1);
            _loc2_ = _loc2_ - 1;
         }
         else if(this.bodyWounds[_loc2_].myType.substr(0,5) != "punch" && this.bodyWounds[_loc2_].myType != "stitch")
         {
            this.bodyWounds[_loc2_].myType = "stitch";
            this.bodyWounds[_loc2_].myVariant = SwainMath.randomNumber(1,6);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.bodySpray = 0;
      this.headSpray = 0;
      _loc2_ = 0;
      while(_loc2_ < 2)
      {
         this.myWeapons[_loc2_].myClips = this.myWeapons[_loc2_].startClips;
         this.myWeapons[_loc2_].myAmmo = this.myWeapons[_loc2_].myAmmoMax;
         this.myWeapons[_loc2_].myHealth = this.myWeapons[_loc2_].myHealthMax;
         _loc2_ = _loc2_ + 1;
      }
      this.myWeapon = 0;
   }
   function removeScars()
   {
      this.headWounds = new Array();
      this.bodyWounds = new Array();
   }
   static function applyPerkDescription(inStat, inNum, inTextName, inTextDescription, inChar)
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      if(inStat == "STR")
      {
         if(inNum == 0)
         {
            _loc3_ = "Stat: Strength";
            _loc2_ = "  A measure of your raw strength.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Sidearm";
            _loc2_ = "  Carry a second weapon.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Knockdown 1";
            _loc2_ = "  Your blunt melee and unarmed attacks have a greater chance of knocking down enemies.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Block Breaker";
            _loc2_ = "  Your Melee and Unarmed attacks are unblockable (but may still be parried).";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Stun-Dash 1";
            _loc2_ = "  Your dash attacks stun opponents.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Knockdown 2";
            _loc2_ = "  Your blunt melee and unarmed attacks have a greater chance of knocking down enemies.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Stun-Dash 2";
            _loc2_ = "  Your dash attacks knock over opponents.";
         }
         else
         {
            _loc3_ = "Strength " + inNum;
            _loc2_ = "Melee/Unarmed damage + " + String(Math.floor(inNum * 100 / 1.5) / 100) + "%";
         }
      }
      if(inStat == "DEX")
      {
         if(inNum == 0)
         {
            _loc3_ = "Stat: Dexterity";
            _loc2_ = "  Your speed and agility.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Dodge 1";
            _loc2_ = "  When taking a Tac-Bar hit, you will automatically evade the shot, decreasing further damage (Enabled at Level 5).";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Fast-Load";
            _loc2_ = "  Swap weapons more quickly.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Dodge 2";
            _loc2_ = "  Perform an active sliding dodge with increased skill.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Bullet Block";
            _loc2_ = "  Your Melee block will stop bullets at minor Tactics loss.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Dodge 3";
            _loc2_ = "  Perform  an active flipping dodge with ninja-like skill.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Bullet Deflect";
            _loc2_ = "  Your Melee weapon will deflect bullets back at opponents.";
         }
         else
         {
            _loc3_ = "Dexterity " + inNum;
            _loc2_ = "Move speed + " + String(Math.floor(inNum * 100 / 2) / 100) + "%";
         }
      }
      if(inStat == "TAC")
      {
         if(inNum == 0)
         {
            _loc3_ = "Stat: Tactics";
            _loc2_ = "  Battle savy and your tactical integrity while under fire.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Evade 1";
            _loc2_ = "  Take half Tac-Bar damage from low-accuracy shots.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Cover Fire";
            _loc2_ = "  Take half Tac-Bar damage when hit while firing from cover.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Tac-Bar 1";
            _loc2_ = "  Boost to your Tac-Bar.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Evade 2";
            _loc2_ = "  Take half Tac-Bar damage from Melee and Unarmed attacks.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Tac-Bar 2";
            _loc2_ = "  Bigger boost to your Tac-Bar.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Evade 3";
            _loc2_ = "  Take no Tac-Bar damage from low-accuracy shots.";
         }
         else
         {
            _loc3_ = "Tactics " + inNum;
            _loc2_ = "Tac-Bar Recharge + " + String(Math.floor(inNum * 100 / 1) / 100) + "%";
         }
      }
      if(inStat == "END")
      {
         if(inNum == 0)
         {
            _loc3_ = "Stat: Endurance";
            _loc2_ = "  The ability to withstand damage of all kinds and to lift heavy armor.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Armor 1";
            _loc2_ = "  You may wear light-class armor.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Armor 2";
            _loc2_ = "  You may wear medium-class armor.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Stun-Proof 1";
            _loc2_ = "  Low- to Mid-damage attacks no longer cause you to be stunned.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Armor 3";
            _loc2_ = "  You may wear heavy-class armor.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Stun-Proof 2";
            _loc2_ = "  You are not stunned by any form of damage.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Immunity";
            _loc2_ = "  Low-damage shots inflict next to no damage to you.";
         }
         else
         {
            _loc3_ = "Endurance " + inNum;
            _loc2_ = "Damage Reduction + " + String(Math.floor(inNum * 100 / 1.5) / 100) + "%";
         }
      }
      if(inStat == "LEAD")
      {
         if(inNum == 0)
         {
            _loc3_ = "Stat: Leadership";
            _loc2_ = "  The level of skill and morale your teammates will exhibit in combat, and the fear you inspire in enemies.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Team Bonus 1";
            _loc2_ = "  Small increase to morale and decision-making skill of allies. Plus one squadmate.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Fearmonger 1";
            _loc2_ = "  Small decrease to the morale and reaction-time of opponents. Plus one squadmate.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Team Bonus 2";
            _loc2_ = "  Medium increase to morale and decision-making skill of allies. Plus one squadmate.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Fearmonger 2";
            _loc2_ = "  Medium decrease to the morale and reaction-time of opponents. Plus one squadmate.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Team Bonus 3";
            _loc2_ = "  Large increase to morale and decision-making skill of allies. Plus one squadmate.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Fearmonger 3";
            _loc2_ = "  Large decrease to the morale and reaction-time of opponents. Plus one squadmate.";
         }
         else
         {
            _loc3_ = "Leadership " + inNum;
            _loc2_ = "Ally reaction-time - " + String(Math.floor(inNum * 100 / 1.5) / 100) + "%";
         }
      }
      if(inStat == "AWR")
      {
         if(inNum == 0)
         {
            _loc3_ = "Stat: Awareness";
            _loc2_ = "  Your time-sense and ability to perceive the weaknesses of opponents.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Headshots";
            _loc2_ = "  Headshots deal increased damage.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Bullet-Time 1";
            _loc2_ = "  Retain full movement speed during Bullet-Time.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Bullet-Time 2";
            _loc2_ = "  Retain full Melee and Unarmed attack speed during Bullet-Time.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Armor-Piercing";
            _loc2_ = "  Close-range attacks ignore the enemy\'s medium or light armor.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Bullet-Time 3";
            _loc2_ = "  Retain full ranged attack speed during Bullet-Time.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Bullet-Time 4";
            _loc2_ = "  Increased movement speed during Bullet-Time.";
         }
         else
         {
            _loc3_ = "Awareness " + inNum;
            _loc2_ = "Tac-Bar damage + " + String(Math.floor(inNum * 100 / 5) / 100) + "%";
         }
      }
      if(inStat == "Pistol")
      {
         if(inNum == 0)
         {
            _loc3_ = "Skill: Pistols";
            _loc2_ = "  Ability to wield small, single-handed ranged weapons.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Pistol Accuracy 1";
            _loc2_ = "  Tighten up the accuracy of pistol shots when standing still.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Pistol Reload";
            _loc2_ = "  Doubletime your pistol reload.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Pistol ROF 1";
            _loc2_ = "  Increased rate of fire with pistols.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Pistol Effectiveness";
            _loc2_ = "  Pistols hit more often outside their effective range.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Pistol Accuracy 2";
            _loc2_ = "  Further increase the accuracy of pistol shots when standing still.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Pistol ROF 2";
            _loc2_ = "  Even better rate of fire with pistols.";
         }
         else
         {
            _loc3_ = " Pistols " + inNum;
            _loc2_ = "Increase " + inNum;
         }
      }
      if(inStat == "SMG")
      {
         if(inNum == 0)
         {
            _loc3_ = "Skill: SMGs";
            _loc2_ = "  Ability to wield small, two-handed ranged weapons.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: SMG Aim 1";
            _loc2_ = "  Increased accuracy the longer you hold down the trigger of your SMG.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: SMG Reload";
            _loc2_ = "  Doubletime your SMG reload.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: SMG Tac Damage";
            _loc2_ = "  Increased SMG damage on Tac-Bar hits versus stationary targets.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: SMG Range";
            _loc2_ = "  Increase the effective range of SMGs.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: SMG Aim 2";
            _loc2_ = "  Even greater accuracy the longer you hold down the trigger of your SMG.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: SMG ROF";
            _loc2_ = "  Increased rate of fire with SMGs.";
         }
         else
         {
            _loc3_ = " SMGs " + inNum;
            _loc2_ = "Increase " + inNum;
         }
      }
      if(inStat == "Rifle")
      {
         if(inNum == 0)
         {
            _loc3_ = "Skill: Rifles";
            _loc2_ = "  Ability to wield large, two-handed ranged weapons.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Rifle Tac Damage";
            _loc2_ = "  Increased rifle damage on Tac-Bar hits versus stationary targets.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Rifle Range 1";
            _loc2_ = "  Increase the effective range of rifles.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Rifle Accuracy";
            _loc2_ = "  Tighten up the accuracy of rifle shots when standing still.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Rifle Effectiveness";
            _loc2_ = "  Rifles hit more often outside their effective range.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Rifle Range 2";
            _loc2_ = "  Increase the effective range of rifles.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Rifle Reload";
            _loc2_ = "  Doubletime your rifle reload.";
         }
         else
         {
            _loc3_ = " Rifles " + inNum;
            _loc2_ = "Increase " + inNum;
         }
      }
      if(inStat == "Shotgun")
      {
         if(inNum == 0)
         {
            _loc3_ = "Skill: Shotguns";
            _loc2_ = "  Ability to wield large, two-handed scatter weapons.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Shotgun Damage";
            _loc2_ = "  Increase damage of point-blank shotgun blasts.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Shotgun ROF 1";
            _loc2_ = "  Increased rate of fire with pump shotguns.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Shot Increase 1";
            _loc2_ = "  Each blast of your shotgun fires an additional pellet.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Shotgun ROF 2";
            _loc2_ = "  Even better rate of fire with pump shotguns.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Shotgun Reload";
            _loc2_ = "  Doubletime your shotgun reload.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Shot Increase 2";
            _loc2_ = "  Each blast of your shotgun fires two additional pellets.";
         }
         else
         {
            _loc3_ = " Shotguns " + inNum;
            _loc2_ = "Increase " + inNum;
         }
      }
      if(inStat == "Melee")
      {
         if(inNum == 0)
         {
            _loc3_ = "Skill: Melee";
            _loc2_ = "  Ability to wield melee weapons at close range, or thrown.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Beginner Combos";
            _loc2_ = "  Launch three basic melee attacks in quick succession.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Pistol Whip";
            _loc2_ = "  Use your ranged weapon as a slugging instrument at close range.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Advanced Combos";
            _loc2_ = "  Your three-hit combos feature more advanced moves.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Disarm";
            _loc2_ = "  Timed blocking of an opponent\'s melee attack will disarm their weapon.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Expert Combos";
            _loc2_ = "  Combos no longer include low-level attacks, and have a vastly improved cooldown time.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Master Combos";
            _loc2_ = "  Your three-hit combos end with a devastating finisher attack.";
         }
         else
         {
            _loc3_ = " Melee " + inNum;
            _loc2_ = "Increase " + inNum;
         }
      }
      if(inStat == "Unarmed")
      {
         if(inNum == 0)
         {
            _loc3_ = "Skill: Unarmed";
            _loc2_ = "  Ability to wield one\'s fists as weapons.";
         }
         else if(inNum == 5)
         {
            _loc3_ = "Perk: Basic Pugilist";
            _loc2_ = "  Throw quality punches.";
         }
         else if(inNum == 10)
         {
            _loc3_ = "Perk: Pummel 1";
            _loc2_ = "  Decrease the cooldown of your punches slightly.";
         }
         else if(inNum == 15)
         {
            _loc3_ = "Perk: Advanced Pugilist";
            _loc2_ = "  Turn your fists into lethal weapons with some new moves.";
         }
         else if(inNum == 20)
         {
            _loc3_ = "Perk: Pummel 2";
            _loc2_ = "   Decrease the cooldown of your punches moderately.";
         }
         else if(inNum == 25)
         {
            _loc3_ = "Perk: Expert Pugilist";
            _loc2_ = "  Unleash devastating martial arts moves.";
         }
         else if(inNum == 30)
         {
            _loc3_ = "Perk: Pummel 3";
            _loc2_ = "   Increase the actual speed of all unarmed attacks.";
         }
         else
         {
            _loc3_ = " Unarmed " + inNum;
            _loc2_ = "Increase " + inNum;
         }
      }
      if(inChar["stat" + inStat] != undefined && inChar["stat" + inStat] >= inNum || inChar["skill" + inStat] != undefined && inChar["skill" + inStat] >= inNum)
      {
         inTextName.textColor = 65280;
      }
      else
      {
         inTextName.textColor = 16711680;
      }
      inTextName.text = _loc3_;
      inTextDescription.text = _loc2_;
   }
   function buyStat(inStat, inCat)
   {
      if(this[inCat + "Points"] > 0)
      {
         this[inCat + inStat]++;
         this[inCat + "Points"]--;
         this.changeStats();
         this.assignPerks();
      }
   }
   function copyCharacter(inChar)
   {
      for(var _loc3_ in inChar)
      {
         this[_loc3_] = inChar[_loc3_];
      }
   }
   static function havePerk(inPerk, inChar)
   {
      return inChar[inPerk];
   }
   static function getLevelUpXP(inLevel, inXP)
   {
      return 100 * inLevel - 0.5 * (inLevel - 0) * 100;
   }
   function applyXP(inXP)
   {
      this.myXP += inXP;
      if(this.myXP >= MadnessDataFile.getLevelUpXP(this.myLevel))
      {
         if(this != MadnessRoster.playerRoster.teamLeader && this.traitCombatSkill < 10 && this.traitCombatSkill < this.myLevel / 3 + SwainMath.randomNumber(-2,2))
         {
            this.traitCombatSkill = this.traitCombatSkill + 1;
            trace("Character level up! He gained a combat skill point just now (good boy!)");
         }
         this.myLevel = this.myLevel + 1;
         this.statPoints += 3;
         this.skillPoints += 3;
         this.myXP -= MadnessDataFile.getLevelUpXP(this.myLevel);
         this.changeStats();
      }
   }
   function autoApplyPoints()
   {
      var _loc2_ = ["Unarmed","Melee","Pistol","SMG","Rifle","Shotgun"];
      var _loc3_ = undefined;
      while(this.skillPoints > 0 && !this.allSkillsFull("skill",_loc2_))
      {
         _loc3_ = _loc2_[SwainMath.randomNumber(0,_loc2_.length - 1)];
         if(this["skill" + _loc3_] < this.statCap)
         {
            this.buyStat(_loc3_,"skill");
         }
      }
      _loc2_ = ["STR","DEX","TAC","END","LEAD","AWR"];
      while(this.statPoints > 0 && !this.allSkillsFull("stat",_loc2_))
      {
         _loc3_ = _loc2_[SwainMath.randomNumber(0,_loc2_.length - 1)];
         if(this["stat" + _loc3_] < this.statCap)
         {
            this.buyStat(_loc3_,"stat");
         }
      }
   }
   function allSkillsFull(inType, inArray)
   {
      var _loc2_ = 0;
      while(_loc2_ < inArray.length)
      {
         if(this[inType + inArray[_loc2_]] < this.statCap)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      return true;
   }
   function randomStats(inLvl)
   {
      if(inLvl > 25)
      {
         inLvl = 25;
      }
      inLvl = SwainMath.randomNumber(1,inLvl);
      if(inLvl < 1)
      {
         inLvl = 1;
      }
      this.myLevel = inLvl;
      this.applyHireCost(inLvl);
      this.skillPoints += this.myLevel * 3;
      this.statPoints += this.myLevel * 3;
      this.autoApplyPoints();
      this.traitBravery = SwainMath.randomNumber(1,10);
      this.traitDistracted = SwainMath.randomNumber(1,10);
      this.traitTriggerFinger = SwainMath.randomNumber(1,10);
      this.traitCover = SwainMath.randomNumber(1,10);
      this.traitCombatSkill = this.myLevel / 3 + SwainMath.randomNumber(0,5);
      if(this.traitCombatSkill > 10)
      {
         this.traitCombatSkill = 10;
      }
   }
   function applyHireCost(inLvl)
   {
      return this.myHireCost = inLvl * 100 * (SwainMath.randomNumber(950,1100) / 1050);
   }
   static function findHighestSkill(inChar)
   {
      var _loc2_ = ["Unarmed","Melee","Pistol","SMG","Rifle","Shotgun"];
      var _loc3_ = new Number();
      var _loc5_ = undefined;
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         if(inChar["skill" + _loc2_[_loc1_]] > _loc3_)
         {
            _loc3_ = inChar["skill" + _loc2_[_loc1_]];
            _loc5_ = _loc2_[_loc1_];
         }
         _loc1_ = _loc1_ + 1;
      }
      return _loc5_;
   }
   function mixStats()
   {
      var _loc2_ = ["Unarmed","Melee","Pistol","SMG","Rifle","Shotgun"];
      var _loc4_ = undefined;
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         this["skill" + _loc2_[_loc3_]] += SwainMath.randomNumber(-3,3);
         if(this["skill" + _loc2_[_loc3_]] > this.statCap)
         {
            this["skill" + _loc2_[_loc3_]] = this.statCap;
         }
         if(this["skill" + _loc2_[_loc3_]] < 0)
         {
            this["skill" + _loc2_[_loc3_]] = 0;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc2_ = ["STR","DEX","TAC","END","LEAD","AWR"];
      _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         this["stat" + _loc2_[_loc3_]] += SwainMath.randomNumber(-3,3);
         if(this["stat" + _loc2_[_loc3_]] > this.statCap)
         {
            this["stat" + _loc2_[_loc3_]] = this.statCap;
         }
         if(this["stat" + _loc2_[_loc3_]] < 0)
         {
            this["stat" + _loc2_[_loc3_]] = 0;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function myEcho()
   {
      trace("Here I am - " + this.myName);
   }
   function checkGunUse()
   {
   }
   static function replicateCharacter(inTarget)
   {
      var _loc1_ = new MadnessDataFile();
      _loc1_.createNew(inTarget.myCharacter);
      _loc1_.myName = inTarget.myName;
      _loc1_.myLevel = inTarget.myLevel;
      _loc1_.myXP = inTarget.myXP;
      _loc1_.skillPoints = inTarget.skillPoints;
      _loc1_.statPoints = inTarget.statPoints;
      _loc1_.myKills = inTarget.myKills;
      _loc1_.myWaves = inTarget.myWaves;
      _loc1_.amSpecial = inTarget.amSpecial;
      _loc1_.traitBravery = inTarget.traitBravery;
      _loc1_.traitCover = inTarget.traitCover;
      _loc1_.traitDistracted = inTarget.traitDistracted;
      _loc1_.traitTriggerFinger = inTarget.traitTriggerFinger;
      _loc1_.traitCombatSkill = inTarget.traitCombatSkill;
      _loc1_.statSTR = inTarget.statSTR;
      _loc1_.statDEX = inTarget.statDEX;
      _loc1_.statTAC = inTarget.statTAC;
      _loc1_.statEND = inTarget.statEND;
      _loc1_.statLEAD = inTarget.statLEAD;
      _loc1_.statAWR = inTarget.statAWR;
      _loc1_.skillPistol = inTarget.skillPistol;
      _loc1_.skillSMG = inTarget.skillSMG;
      _loc1_.skillRifle = inTarget.skillRifle;
      _loc1_.skillShotgun = inTarget.skillShotgun;
      _loc1_.skillMelee = inTarget.skillMelee;
      _loc1_.skillUnarmed = inTarget.skillUnarmed;
      _loc1_.assignPerks();
      _loc1_.changeStats();
      if(_loc1_.myXP == undefined)
      {
         _loc1_.myXP = 0;
      }
      if(_loc1_.myKills == undefined)
      {
         _loc1_.myKills = 0;
      }
      if(_loc1_.myWaves == undefined)
      {
         _loc1_.myWaves = 0;
      }
      var _loc6_ = ItemGenerator.replicateWeapon(inTarget.myWeapons[0]);
      var _loc5_ = ItemGenerator.replicateWeapon(inTarget.myWeapons[1]);
      _loc1_.myWeapons = new Array();
      _loc1_.myWeapons.push(_loc6_);
      _loc1_.myWeapons.push(_loc5_);
      var _loc3_ = ItemGenerator.createArmor(inTarget.myShirt[0].myType);
      _loc1_.myShirt = new Array();
      _loc1_.myShirt.push(_loc3_);
      var _loc4_ = ItemGenerator.createArmor(inTarget.myMask[0].myType);
      _loc1_.myMask = new Array();
      _loc1_.myMask.push(_loc4_);
      var _loc7_ = ItemGenerator.createArmor(inTarget.myHat[0].myType);
      _loc1_.myHat = new Array();
      _loc1_.myHat.push(_loc7_);
      var _loc8_ = ItemGenerator.createArmor(inTarget.myMouth[0].myType);
      _loc1_.myMouth = new Array();
      _loc1_.myMouth.push(_loc8_);
      return _loc1_;
   }
   static function returnZombieType(inType)
   {
      if(inType.substr(0,5) == "agent" || inType == "riot" || inType == "scientist")
      {
         return "zombie_" + inType;
      }
      return "zombie";
   }
}
