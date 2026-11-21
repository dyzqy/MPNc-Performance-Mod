class com.newgrounds.components.FlashAdBase extends MovieClip
{
   var onUnload;
   var _adListener;
   var adContainer;
   var newgroundsButton;
   var _fullScreen;
   var _ad;
   var _adFeedLoader;
   var _showBorder = true;
   var adType = com.newgrounds.components.FlashAdBase.prototype.VIDEO_ADS;
   var VIDEO_ADS = "Video";
   var SIMPLE_ADS = "Simple";
   function FlashAdBase()
   {
      super();
      try
      {
         System.security.allowDomain("server.cpmstar.com");
         System.security.allowInsecureDomain("server.cpmstar.com");
      }
      catch(error)
      {
      }
      this.gotoAndStop("idle");
      this._x = int(this._x);
      this._y = int(this._y);
      this.stop();
      if(this._newgroundsButton)
      {
         this._newgroundsButton.onRelease = this.onNGClick;
      }
      this.onUnload = this.removeAd;
      var _loc4_ = this;
      this._adListener = {onLoadError:function(target, error, httpStatus)
      {
         target._parent.onAdError(target,error,httpStatus);
      }};
      if(this.fullScreen)
      {
         this.drawFullScreenRect();
      }
      if(com.newgrounds.API.adFeedURL)
      {
         this.loadAdFeed();
      }
      else
      {
         com.newgrounds.API.addEventListener(com.newgrounds.APIEvent.API_CONNECTED,{target:this,func:this.loadAdFeed});
      }
   }
   function get _adContainer()
   {
      return this.adContainer;
   }
   function get _newgroundsButton()
   {
      return this.newgroundsButton;
   }
   function get fullScreen()
   {
      return this._fullScreen;
   }
   function set fullScreen(v)
   {
      this._fullScreen = v;
      if(v)
      {
         this.drawFullScreenRect();
      }
      else
      {
         this.clear();
      }
   }
   function get showBorder()
   {
      return this._showBorder;
   }
   function set showBorder(value)
   {
      this._showBorder = value;
      if(this._showBorder)
      {
         if(this._ad)
         {
            var _loc2_ = this._ad.getProgress(this._adContainer);
            if(_loc2_.bytesLoaded >= _loc2_.bytesTotal)
            {
               this.gotoAndStop("loaded");
            }
            else
            {
               this.gotoAndStop("loading");
            }
         }
         else
         {
            this.gotoAndStop("idle");
         }
      }
      else
      {
         this.gotoAndStop("noBorder");
      }
   }
   function loadAdFeed(event)
   {
      if(event == undefined)
      {
         event = null;
      }
      this._adFeedLoader = new LoadVars();
      var target = this;
      this._adFeedLoader.onData = function(data)
      {
         target.onAdFeedLoaded(data);
      };
      this._adFeedLoader.load(com.newgrounds.API.adFeedURL,this._adFeedLoader);
   }
   function onAdFeedLoaded(data)
   {
      if(data && data != "")
      {
         this.loadAd(data);
      }
      else
      {
         this.onAdError();
      }
   }
   function loadAd(adURL)
   {
      if(this.adType != this.VIDEO_ADS)
      {
         if(adURL.indexOf("?") >= 0)
         {
            adURL += "&";
         }
         else
         {
            adURL += "?";
         }
         adURL += "blockoverlays=1";
      }
      this._ad = new MovieClipLoader();
      this._ad.addListener(this._adListener);
      this._adContainer._lockroot = true;
      this._ad.loadClip(adURL,this._adContainer);
   }
   function removeAd()
   {
      this._adFeedLoader.onData = null;
      this._adFeedLoader = null;
      this._ad.removeListener(this._adListener);
      if(this._adContainer)
      {
         this._ad.unloadClip(this._adContainer);
      }
      this._ad = null;
   }
   function onAdError(target, error, httpStatus)
   {
      com.newgrounds.Logger.logError("Unable to load ad.");
      this.removeAd();
   }
   function onNGClick()
   {
      com.newgrounds.API.loadNewgrounds();
   }
   function drawFullScreenRect()
   {
      this._x = (Stage.width - this._width) / 2;
      this._y = (Stage.height - this._height) / 2;
      this.beginFill(0);
      this.moveTo(- Stage.width,- Stage.height);
      this.lineTo(Stage.width,- Stage.height);
      this.lineTo(Stage.width,Stage.height);
      this.lineTo(- Stage.width,Stage.height);
      this.lineTo(- Stage.width,- Stage.height);
      this.endFill();
   }
}
