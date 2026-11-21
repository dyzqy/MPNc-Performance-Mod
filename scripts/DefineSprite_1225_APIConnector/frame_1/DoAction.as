function _onLoaded()
{
   gotoAndStop("invisible");
   if(_redirect)
   {
      com.newgrounds.API.loadOfficialVersion();
      return undefined;
   }
}
function _apiConnect()
{
   var _loc2_ = com.newgrounds.API;
   if(_loc2_ && !_loc2_.connected)
   {
      if(!apiId)
      {
         com.newgrounds.Logger.logError("No API ID entered in the API Connector component.","You can create an API ID for this submission at http://newgrounds.com/account/flashapi","Enter your API ID into the API Connector using the Component Inspector (Window -> Component Inspector).");
         return undefined;
      }
      switch(debugMode)
      {
         case "Off":
         default:
            _loc2_.debugMode = _loc2_.RELEASE_MODE;
            break;
         case "Simulate Logged-in User":
            _loc2_.debugMode = _loc2_.DEBUG_MODE_LOGGED_IN;
            break;
         case "Simulate Logged-out User":
            _loc2_.debugMode = _loc2_.DEBUG_MODE_LOGGED_OUT;
            break;
         case "Simulate New Version":
            _loc2_.debugMode = _loc2_.DEBUG_MODE_NEW_VERSION;
            break;
         case "Simulate Host Blocked":
            _loc2_.debugMode = _loc2_.DEBUG_MODE_HOST_BLOCKED;
      }
      _loc2_.addEventListener(com.newgrounds.APIEvent.API_CONNECTED,_onConnected);
      _loc2_.connect(_root,apiId,encryptionKey,movieVersion);
   }
}
function _onConnected(event)
{
   if(redirectOnNewVersion && event.success && event.data.newVersion)
   {
      _redirect = true;
   }
   if(redirectOnHostBlocked && !event.success && event.error == com.newgrounds.APIEvent.ERROR_HOST_BLOCKED)
   {
      _redirect = true;
   }
   if(_redirect)
   {
      gotoAndStop("adPreloader");
      forceAlwaysOnTop();
   }
}
function forceAlwaysOnTop()
{
   var _loc2_ = getNextHighestDepth();
   swapDepths(_loc2_);
   if(Stage)
   {
      _X = (Stage.width - _width) / 2;
      _Y = (Stage.height - _height) / 2;
      _visible = true;
   }
   if(_root && _root instanceof MovieClip)
   {
      MovieClip(_root).stop();
   }
}
stop();
if(_root && _root instanceof MovieClip)
{
   MovieClip(_root).stop();
}
var apiId;
var encryptionKey;
var movieVersion;
var debugMode;
var connectorType;
var redirectOnHostBlocked;
var redirectOnNewVersion;
var adType;
var className;
var _redirect;
_X = int(_X);
_Y = int(_Y);
if(!debugMode)
{
   debugMode = "Simulate Logged-in User";
}
if(!connectorType)
{
   connectorType = "Flash Ad + Preloader";
}
if(!adType)
{
   adType = "Video";
}
if(ad)
{
   ad.adType = adType;
}
switch(connectorType)
{
   case "Flash Ad + Preloader":
      gotoAndStop("adPreloader");
      break;
   case "Flash Ad Only":
      gotoAndStop("ad");
      break;
   case "Invisible":
      gotoAndStop("invisible");
}
_apiConnect();
