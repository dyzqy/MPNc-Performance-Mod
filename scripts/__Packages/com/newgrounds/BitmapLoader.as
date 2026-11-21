class com.newgrounds.BitmapLoader extends com.newgrounds.APIEventDispatcher
{
   var _bitmapData;
   var _url;
   var _loader;
   var _loaderClip;
   static var _cacheSeed = 0;
   var _loaded = true;
   function BitmapLoader(defaultBitmap, url)
   {
      super();
      this._bitmapData = defaultBitmap;
      this._url = url;
   }
   function get url()
   {
      return this._url;
   }
   function set url(v)
   {
      this._loaded = false;
      this._url = v;
   }
   function get bitmapData()
   {
      return this._bitmapData;
   }
   function set bitmapData(v)
   {
      this._bitmapData = v;
      this._loaded = true;
   }
   function get loaded()
   {
      return this._loaded;
   }
   function disposeLoader()
   {
      if(this._loader)
      {
         if(this._loaderClip._parent == _root)
         {
            this._loader.unloadClip(this._loaderClip.bitmap);
            this._loaderClip.removeMovieClip();
         }
         this._loader = null;
         this._loaderClip = null;
      }
   }
   function load()
   {
      if(!this._url || this._url == "")
      {
         this.onLoadComplete();
         return undefined;
      }
      this._loaded = false;
      if(this._bitmapData)
      {
         this._bitmapData.dispose();
         this._bitmapData = null;
      }
      this.disposeLoader();
      this.attachBitmap(null);
   }
   function attachBitmap(parent)
   {
      if(!parent)
      {
         parent = _root;
      }
      var _loc5_ = parent.getNextHighestDepth();
      var _loc3_ = parent.createEmptyMovieClip("__bitmap" + _loc5_,_loc5_);
      if(!this._loaded && this._url && this._url != "")
      {
         _loc3_.createEmptyMovieClip("bitmap",0);
         this._loader = new MovieClipLoader();
         this._loaderClip = _loc3_;
         if(parent == _root)
         {
            this._loaderClip._visible = false;
         }
         var thisObj = this;
         this._loaderClip.onEnterFrame = function()
         {
            thisObj.pollLoad();
         };
         this._loader.addListener({onLoadError:function()
         {
            thisObj.onLoadComplete();
         }});
         this._loader.loadClip(this._url,_loc3_.bitmap);
      }
      else
      {
         _loc3_.attachBitmap(this._bitmapData,0);
      }
      return _loc3_;
   }
   function pollLoad()
   {
      if(this._loaderClip._width)
      {
         this.onLoadComplete();
      }
   }
   function onLoadComplete()
   {
      var _loc2_ = undefined;
      if(this._loader && this._loaderClip && this._loaderClip._width)
      {
         try
         {
            this._loaderClip.onEnterFrame = null;
            _loc2_ = new flash.display.BitmapData(this._loaderClip._width,this._loaderClip._height,true,0);
            _loc2_.draw(this._loaderClip);
            this._bitmapData = _loc2_;
            this._loaded = true;
         }
         catch(error)
         {
            if(_loc2_)
            {
               _loc2_.dispose();
            }
         }
      }
      this.disposeLoader();
      this.dispatchEvent(new com.newgrounds.APIEvent(com.newgrounds.APIEvent.ICON_LOADED,this,!this._loaded ? com.newgrounds.APIEvent.ERROR_BAD_FILE : null));
   }
}
