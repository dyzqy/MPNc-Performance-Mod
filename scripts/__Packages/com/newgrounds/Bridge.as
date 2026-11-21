class com.newgrounds.Bridge
{
   var _widgetId;
   var _inConnection;
   var _outConnection;
   function Bridge(id)
   {
      this._widgetId = id;
      this._inConnection = new LocalConnection();
      this._outConnection = new LocalConnection();
      this._inConnection.receiveEvent = this.receiveEvent;
      try
      {
         this._inConnection.connect("rec_" + this._widgetId);
      }
      catch(error)
      {
      }
      com.newgrounds.Logger.addEventListener(com.newgrounds.APIEvent.LOG,{target:this,func:this.onLogMessage});
   }
   function onLogMessage(event)
   {
      try
      {
         this._outConnection.send(this._widgetId,"sendEvent","trace",String(event.data));
      }
      catch(error)
      {
      }
   }
   function sendEvent(command, parameters)
   {
      if(this._outConnection)
      {
         parameters = {data:parameters};
         this._outConnection.send(this._widgetId,"sendEvent",command,parameters);
      }
   }
   function receiveEvent(event, parameters)
   {
   }
   function onStatus(event)
   {
   }
}
