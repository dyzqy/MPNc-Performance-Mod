class com.newgrounds.encoders.json.JSON
{
   static var start;
   static var cache;
   static var interval;
   static var encode_chunks = 20000;
   static var decode_chunks = 20000;
   static var busy = false;
   function JSON()
   {
   }
   static function encode(arg, noquotes)
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc6_ = undefined;
      var _loc1_ = "";
      var _loc4_ = undefined;
      if(arg.isSServerVar())
      {
         var _loc8_ = "sservervariable";
      }
      else
      {
         _loc8_ = typeof arg;
      }
      switch(_loc8_)
      {
         case "sservervariable":
            return "?" + arg.getEncodedValue();
         case "object":
            if(arg)
            {
               if(arg instanceof Array)
               {
                  _loc2_ = 0;
                  while(_loc2_ < arg.length)
                  {
                     _loc4_ = com.newgrounds.encoders.json.JSON.encode(arg[_loc2_]);
                     if(_loc1_)
                     {
                        _loc1_ += ",";
                     }
                     _loc1_ += _loc4_;
                     _loc2_ = _loc2_ + 1;
                  }
                  return "[" + _loc1_ + "]";
               }
               if(typeof arg.toString != "undefined")
               {
                  for(_loc2_ in arg)
                  {
                     _loc4_ = arg[_loc2_];
                     if(typeof _loc4_ != "undefined" && typeof _loc4_ != "function")
                     {
                        _loc4_ = com.newgrounds.encoders.json.JSON.encode(_loc4_);
                        if(_loc1_)
                        {
                           _loc1_ += ",";
                        }
                        _loc1_ += com.newgrounds.encoders.json.JSON.encode(_loc2_) + ":" + _loc4_;
                     }
                  }
                  return "{" + _loc1_ + "}";
               }
            }
            return "null";
         case "number":
            return !isFinite(arg) ? "null" : String(arg);
         case "string":
            _loc6_ = arg.length;
            if(noquotes)
            {
               var _loc7_ = "";
            }
            else
            {
               _loc7_ = "\"";
            }
            _loc1_ = _loc7_;
            _loc2_ = 0;
            while(_loc2_ < _loc6_)
            {
               _loc3_ = arg.charAt(_loc2_);
               if(_loc3_ >= " ")
               {
                  if(_loc3_ == "\\" || _loc3_ == "\"")
                  {
                     _loc1_ += "\\";
                  }
                  _loc1_ += _loc3_;
               }
               else
               {
                  switch(_loc3_)
                  {
                     case "\b":
                        _loc1_ += "\\b";
                        break;
                     case "\f":
                        _loc1_ += "\\f";
                        break;
                     case "\n":
                        _loc1_ += "\\n";
                        break;
                     case "\r":
                        _loc1_ += "\\r";
                        break;
                     case "\t":
                        _loc1_ += "\\t";
                        break;
                     default:
                        _loc3_ = _loc3_.charCodeAt();
                        _loc1_ += "\\u00" + Math.floor(_loc3_ / 16).toString(16) + (_loc3_ % 16).toString(16);
                  }
               }
               _loc2_ += 1;
            }
            return _loc1_ + _loc7_;
         case "boolean":
            return String(arg);
         default:
            return "null";
      }
   }
   static function background_encode(arg, callback)
   {
      if(com.newgrounds.encoders.json.JSON.busy)
      {
         trace("[Newgrounds Encoder] :: Cannot encode a new file until the previous file is completed");
         return false;
      }
      if(!callback)
      {
         trace("[Newgrounds Encoder] :: Missing a callback function, skipping encode");
         return false;
      }
      com.newgrounds.encoders.json.JSON.busy = true;
      var _loc2_ = new Date();
      com.newgrounds.encoders.json.JSON.start = _loc2_.getTime();
      com.newgrounds.encoders.json.JSON.cache = {busy:false,complete:false,arg:arg,target:arg,parents:[],encoded:"",callback:callback,encode_chunk:function()
      {
         com.newgrounds.encoders.json.JSON.encode_chunk();
      }};
      if(com.newgrounds.encoders.json.JSON.getType(arg) == "object")
      {
         com.newgrounds.encoders.json.JSON.cache.encoded = "{";
      }
      else if(com.newgrounds.encoders.json.JSON.getType(arg) == "array")
      {
         com.newgrounds.encoders.json.JSON.cache.encoded = "[";
      }
      com.newgrounds.encoders.json.JSON.interval = setInterval(com.newgrounds.encoders.json.JSON.cache,"encode_chunk",25);
      return true;
   }
   static function background_decode(arg, callback)
   {
      if(com.newgrounds.encoders.json.JSON.busy)
      {
         trace("[Newgrounds Encoder] :: Cannot decode a new file until the previous file is completed");
         return false;
      }
      if(!callback)
      {
         trace("[Newgrounds Encoder] :: Missing a callback function, skipping decode");
         return false;
      }
      com.newgrounds.encoders.json.JSON.busy = true;
      var _loc1_ = new Date();
      com.newgrounds.encoders.json.JSON.start = _loc1_.getTime();
      com.newgrounds.encoders.json.JSON.cache = {busy:false,callback:callback,complete:false,arg:arg,pos:0,parents:["root"],target:null,scratch:"",decode_chunk:function()
      {
         com.newgrounds.encoders.json.JSON.decode_chunk();
      }};
      com.newgrounds.encoders.json.JSON.interval = setInterval(com.newgrounds.encoders.json.JSON.cache,"decode_chunk",25);
      return true;
   }
   static function decode(text)
   {
      var at = 0;
      var ch = " ";
      var _value;
      var _error = function(m)
      {
         throw {name:"JSONError",message:m,at:at - 1,text:text};
      };
      var _next = function()
      {
         ch = text.charAt(at);
         at += 1;
         return ch;
      };
      var _white = function()
      {
         while(ch)
         {
            if(ch <= " ")
            {
               _next();
            }
            else
            {
               if(ch != "/")
               {
                  break;
               }
               switch(_next())
               {
                  case "/":
                     while(_next() && ch != "\n" && ch != "\r")
                     {
                     }
                     break;
                  case "*":
                     _next();
                     while(true)
                     {
                        if(ch)
                        {
                           if(ch == "*")
                           {
                              if(_next() == "/")
                              {
                                 break;
                              }
                           }
                           else
                           {
                              _next();
                           }
                        }
                        else
                        {
                           _error("Unterminated comment");
                        }
                     }
                     _next();
                     break;
                  default:
                     _error("Syntax error");
               }
            }
         }
      };
      var _string = function()
      {
         var _loc4_ = undefined;
         var _loc1_ = "";
         var _loc3_ = undefined;
         var _loc2_ = undefined;
         var _loc5_ = false;
         if(ch == "\"")
         {
            while(_next())
            {
               if(ch == "\"")
               {
                  _next();
                  return _loc1_;
               }
               if(ch == "\\")
               {
                  switch(_next())
                  {
                     case "b":
                        _loc1_ += "\b";
                        break;
                     case "f":
                        _loc1_ += "\f";
                        break;
                     case "n":
                        _loc1_ += "\n";
                        break;
                     case "r":
                        _loc1_ += "\r";
                        break;
                     case "t":
                        _loc1_ += "\t";
                        break;
                     case "u":
                        _loc2_ = 0;
                        _loc4_ = 0;
                        while(_loc4_ < 4)
                        {
                           _loc3_ = parseInt(_next(),16);
                           if(!isFinite(_loc3_))
                           {
                              _loc5_ = true;
                              break;
                           }
                           _loc2_ = _loc2_ * 16 + _loc3_;
                           _loc4_ += 1;
                        }
                        if(_loc5_)
                        {
                           _loc5_ = false;
                           break;
                        }
                        _loc1_ += String.fromCharCode(_loc2_);
                        break;
                     default:
                        _loc1_ += ch;
                  }
               }
               else
               {
                  _loc1_ += ch;
               }
            }
         }
         _error("Bad string");
      };
      var _array = function()
      {
         var _loc1_ = [];
         if(ch == "[")
         {
            _next();
            _white();
            if(ch == "]")
            {
               _next();
               return _loc1_;
            }
            while(ch)
            {
               _loc1_.push(_value());
               _white();
               if(ch == "]")
               {
                  _next();
                  return _loc1_;
               }
               if(ch != ",")
               {
                  break;
               }
               _next();
               _white();
            }
         }
         _error("Bad array");
      };
      var _object = function()
      {
         var _loc2_ = undefined;
         var _loc1_ = {};
         if(ch == "{")
         {
            _next();
            _white();
            if(ch == "}")
            {
               _next();
               return _loc1_;
            }
            while(ch)
            {
               _loc2_ = _string();
               _white();
               if(ch != ":")
               {
                  break;
               }
               _next();
               _loc1_[_loc2_] = _value();
               _white();
               if(ch == "}")
               {
                  _next();
                  return _loc1_;
               }
               if(ch != ",")
               {
                  break;
               }
               _next();
               _white();
            }
         }
         _error("Bad object");
      };
      var _number = function()
      {
         var _loc1_ = "";
         var _loc2_ = undefined;
         if(ch == "-")
         {
            _loc1_ = "-";
            _next();
         }
         while(ch >= "0" && ch <= "9")
         {
            _loc1_ += ch;
            _next();
         }
         if(ch == ".")
         {
            _loc1_ += ".";
            while(_next() && ch >= "0" && ch <= "9")
            {
               _loc1_ += ch;
            }
         }
         _loc2_ = 1 * _loc1_;
         if(!isFinite(_loc2_))
         {
            _error("Bad number");
         }
         return _loc2_;
      };
      var _word = function()
      {
         switch(ch)
         {
            case "t":
               if(_next() == "r" && _next() == "u" && _next() == "e")
               {
                  _next();
                  return true;
               }
               break;
            case "f":
               if(_next() == "a" && _next() == "l" && _next() == "s" && _next() == "e")
               {
                  _next();
                  return false;
               }
               break;
            case "n":
               if(_next() == "u" && _next() == "l" && _next() == "l")
               {
                  _next();
                  return null;
               }
               break;
         }
         _error("Syntax error");
      };
      _value = function()
      {
         _white();
         switch(ch)
         {
            case "{":
               return _object();
            case "[":
               return _array();
            case "\"":
               return _string();
            case "-":
               return _number();
            default:
               return !(ch >= "0" && ch <= "9") ? _word() : _number();
         }
      };
      return _value();
   }
   static function getType(v)
   {
      if(v instanceof Array)
      {
         return "array";
      }
      return typeof v;
   }
   static function decode_chunk()
   {
      if(!com.newgrounds.encoders.json.JSON.cache.busy && !com.newgrounds.encoders.json.JSON.cache.complete)
      {
         com.newgrounds.encoders.json.JSON.cache.busy = true;
         var _loc1_ = 0;
         while(_loc1_ < com.newgrounds.encoders.json.JSON.decode_chunks)
         {
            com.newgrounds.encoders.json.JSON.chunk_decoder();
            if(com.newgrounds.encoders.json.JSON.cache.complete)
            {
               break;
            }
            _loc1_ = _loc1_ + 1;
         }
         trace(Math.round(com.newgrounds.encoders.json.JSON.cache.pos / com.newgrounds.encoders.json.JSON.cache.arg.length * 100) + "% decoded");
         com.newgrounds.encoders.json.JSON.cache.busy = false;
      }
      if(com.newgrounds.encoders.json.JSON.cache.complete)
      {
         var _loc2_ = new Date();
         com.newgrounds.encoders.json.JSON.busy = false;
         clearInterval(com.newgrounds.encoders.json.JSON.interval);
         com.newgrounds.encoders.json.JSON.cache.callback(com.newgrounds.encoders.json.JSON.cache.root,_loc2_.getTime() - com.newgrounds.encoders.json.JSON.start);
         com.newgrounds.encoders.json.JSON.cache.arg = "";
      }
   }
   static function encode_chunk()
   {
      if(!com.newgrounds.encoders.json.JSON.cache.busy && !com.newgrounds.encoders.json.JSON.cache.complete)
      {
         com.newgrounds.encoders.json.JSON.cache.busy = true;
         var _loc1_ = 0;
         while(_loc1_ < com.newgrounds.encoders.json.JSON.encode_chunks)
         {
            com.newgrounds.encoders.json.JSON.chunk_encoder();
            if(com.newgrounds.encoders.json.JSON.cache.complete)
            {
               break;
            }
            _loc1_ = _loc1_ + 1;
         }
         com.newgrounds.encoders.json.JSON.cache.busy = false;
      }
      if(com.newgrounds.encoders.json.JSON.cache.complete)
      {
         var _loc3_ = new Date();
         var _loc2_ = _loc3_.getTime();
         com.newgrounds.encoders.json.JSON.busy = false;
         clearInterval(com.newgrounds.encoders.json.JSON.interval);
         com.newgrounds.encoders.json.JSON.cache.callback(com.newgrounds.encoders.json.JSON.cache.encoded,_loc2_ - com.newgrounds.encoders.json.JSON.start);
         com.newgrounds.encoders.json.JSON.cache.encoded = "";
      }
   }
   static function chunk_decoder()
   {
      function _object()
      {
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
         if(!com.newgrounds.encoders.json.JSON.cache.mode)
         {
            com.newgrounds.encoders.json.JSON.cache.mode = "object";
            com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
            _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
            if(_loc1_ != "\"")
            {
               throw "Malformed object key in encoded string. Keys must be wrapped in quotes (\"\")";
            }
            com.newgrounds.encoders.json.JSON.cache.scratch = "";
            _setTargetValue({});
         }
         else if(_loc1_ == ",")
         {
            com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
            _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
            if(_loc1_ != "\"")
            {
               throw "Malformed object key in encoded string. Keys must be wrapped in quotes (\"\")";
            }
            com.newgrounds.encoders.json.JSON.cache.scratch = "";
         }
         else if(_loc1_ == "}")
         {
            _useParent();
         }
         else if(_loc1_ == "\"")
         {
            com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
            _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
            if(_loc1_ != ":")
            {
               throw "Malformed object notation. Object keys and values must be separated by colons(:)";
            }
            _addParent(com.newgrounds.encoders.json.JSON.cache.scratch);
            com.newgrounds.encoders.json.JSON.cache.mode = null;
         }
         else
         {
            if(_loc1_ == "\\")
            {
               com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
               _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
            }
            com.newgrounds.encoders.json.JSON.cache.scratch += _loc1_;
         }
         com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
      }
      function _array()
      {
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
         if(!com.newgrounds.encoders.json.JSON.cache.mode)
         {
            com.newgrounds.encoders.json.JSON.cache.mode = "array";
            com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
            _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
            _setTargetValue([]);
            if(_loc1_ != "]")
            {
               _addArrayKey();
            }
            else
            {
               _useParent();
            }
            return undefined;
         }
         if(_loc1_ == ",")
         {
            _addArrayKey();
         }
         else if(_loc1_ == "]")
         {
            _useParent();
         }
         com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
      }
      function _boolean()
      {
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
         if(_loc1_ == "t")
         {
            _setTargetValue(true);
            com.newgrounds.encoders.json.JSON.cache.pos += 3;
         }
         else
         {
            if(_loc1_ != "f")
            {
               throw "Bool values must be true or false";
            }
            _setTargetValue(false);
            com.newgrounds.encoders.json.JSON.cache.pos += 4;
         }
         _useParent();
      }
      function _null()
      {
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
         if(_loc1_ == "n")
         {
            _setTargetValue(null);
            com.newgrounds.encoders.json.JSON.cache.pos += 2;
            _useParent();
         }
         throw "Null values must be null";
      }
      function _string()
      {
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
         if(!com.newgrounds.encoders.json.JSON.cache.mode)
         {
            if(_loc1_ != "\"")
            {
               throw "Strings must be wrapped in quotes (\"\")";
            }
            com.newgrounds.encoders.json.JSON.cache.scratch = "";
            com.newgrounds.encoders.json.JSON.cache.mode = "string";
         }
         else if(_loc1_ == "\"")
         {
            _setTargetValue(com.newgrounds.encoders.json.JSON.cache.scratch);
            _useParent();
         }
         else
         {
            if(_loc1_ == "\\")
            {
               com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
               _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
               switch(_loc1_)
               {
                  case "n":
                     _loc1_ = "\n";
                     break;
                  case "r":
                     _loc1_ = "\n";
                     break;
                  case "t":
                     _loc1_ = "\t";
                     break;
                  case "u":
                     _loc1_ = "\\" + _loc1_;
               }
            }
            com.newgrounds.encoders.json.JSON.cache.scratch += _loc1_;
         }
         com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
      }
      function _number()
      {
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
         var _loc2_ = "01234567890.-";
         if(!com.newgrounds.encoders.json.JSON.cache.mode)
         {
            com.newgrounds.encoders.json.JSON.cache.mode = "number";
            com.newgrounds.encoders.json.JSON.cache.scratch = "";
         }
         if(_loc2_.indexOf(_loc1_) < 0)
         {
            _setTargetValue(Number(com.newgrounds.encoders.json.JSON.cache.scratch));
            _useParent();
         }
         else
         {
            com.newgrounds.encoders.json.JSON.cache.scratch += _loc1_;
            com.newgrounds.encoders.json.JSON.cache.pos = com.newgrounds.encoders.json.JSON.cache.pos + 1;
         }
      }
      function _setTargetValue(newval)
      {
         var _loc2_ = _getParent().obj;
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.parents[com.newgrounds.encoders.json.JSON.cache.parents.length - 1];
         _loc2_[_loc1_] = newval;
      }
      function _useParent()
      {
         com.newgrounds.encoders.json.JSON.cache.mode = com.newgrounds.encoders.json.JSON.getType(_getParent().obj);
         com.newgrounds.encoders.json.JSON.cache.parents.pop();
      }
      function _getParent()
      {
         var _loc2_ = com.newgrounds.encoders.json.JSON.cache;
         var _loc1_ = 0;
         while(_loc1_ < com.newgrounds.encoders.json.JSON.cache.parents.length - 1)
         {
            _loc2_ = _loc2_[com.newgrounds.encoders.json.JSON.cache.parents[_loc1_]];
            _loc1_ = _loc1_ + 1;
         }
         return {obj:_loc2_,name:com.newgrounds.encoders.json.JSON.cache.parents[_loc1_]};
      }
      function _getCurrent()
      {
         var _loc2_ = com.newgrounds.encoders.json.JSON.cache;
         var _loc1_ = 0;
         while(_loc1_ < com.newgrounds.encoders.json.JSON.cache.parents.length)
         {
            _loc2_ = _loc2_[com.newgrounds.encoders.json.JSON.cache.parents[_loc1_]];
            _loc1_ = _loc1_ + 1;
         }
         return {obj:_loc2_,name:com.newgrounds.encoders.json.JSON.cache.parents[_loc1_]};
      }
      function _addParent(child)
      {
         com.newgrounds.encoders.json.JSON.cache.parents.push(child);
      }
      function _addArrayKey()
      {
         var _loc1_ = _getCurrent().obj.length;
         com.newgrounds.encoders.json.JSON.cache.parents.push(_loc1_);
         com.newgrounds.encoders.json.JSON.cache.mode = null;
      }
      if(com.newgrounds.encoders.json.JSON.cache.pos >= com.newgrounds.encoders.json.JSON.cache.arg.length)
      {
         com.newgrounds.encoders.json.JSON.cache.complete = true;
         return undefined;
      }
      if(com.newgrounds.encoders.json.JSON.cache.mode)
      {
         ("_" + com.newgrounds.encoders.json.JSON.cache.mode)();
      }
      else
      {
         var char = com.newgrounds.encoders.json.JSON.cache.arg.charAt(com.newgrounds.encoders.json.JSON.cache.pos);
         switch(char)
         {
            case "{":
               _object();
               break;
            case "[":
               _array();
               break;
            case "\"":
               _string();
               break;
            case "n":
               _null();
               break;
            case "t":
               _boolean();
               break;
            case "f":
               _boolean();
               break;
            default:
               _number();
         }
      }
   }
   static function chunk_encoder()
   {
      if(com.newgrounds.encoders.json.JSON.cache.complete)
      {
         return undefined;
      }
      var _loc2_ = com.newgrounds.encoders.json.JSON.getType(com.newgrounds.encoders.json.JSON.cache.target);
      switch(_loc2_)
      {
         case "number":
            com.newgrounds.encoders.json.JSON.cache.encoded += com.newgrounds.encoders.json.JSON.cache.target;
            com.newgrounds.encoders.json.JSON.getParent();
            break;
         case "string":
            com.newgrounds.encoders.json.JSON.cache.encoded += "\"" + com.newgrounds.encoders.json.JSON.cache.target.split("\"").join("\\\"") + "\"";
            com.newgrounds.encoders.json.JSON.getParent();
            break;
         case "boolean":
            com.newgrounds.encoders.json.JSON.cache.encoded += com.newgrounds.encoders.json.JSON.cache.target != true ? "false" : "true";
            com.newgrounds.encoders.json.JSON.getParent();
            break;
         case "null":
            com.newgrounds.encoders.json.JSON.cache.encoded += "null";
            com.newgrounds.encoders.json.JSON.getParent();
            break;
         case "array":
            if(com.newgrounds.encoders.json.JSON.cache.target.length < 1)
            {
               com.newgrounds.encoders.json.JSON.cache.encoded += "]";
               com.newgrounds.encoders.json.JSON.getParent();
            }
            else
            {
               com.newgrounds.encoders.json.JSON.cache.parents.push(com.newgrounds.encoders.json.JSON.cache.target);
               com.newgrounds.encoders.json.JSON.cache.target = com.newgrounds.encoders.json.JSON.cache.target[0];
               if(com.newgrounds.encoders.json.JSON.getType(com.newgrounds.encoders.json.JSON.cache.target) == "array")
               {
                  com.newgrounds.encoders.json.JSON.cache.encoded += "[";
               }
               else if(com.newgrounds.encoders.json.JSON.getType(com.newgrounds.encoders.json.JSON.cache.target) == "object")
               {
                  com.newgrounds.encoders.json.JSON.cache.encoded += "{";
               }
            }
            break;
         case "object":
            for(var _loc1_ in com.newgrounds.encoders.json.JSON.cache.target)
            {
               break;
            }
            if(_loc1_ === undefined)
            {
               com.newgrounds.encoders.json.JSON.cache.encoded += "}";
               com.newgrounds.encoders.json.JSON.getParent();
            }
            else
            {
               com.newgrounds.encoders.json.JSON.cache.parents.push(com.newgrounds.encoders.json.JSON.cache.target);
               com.newgrounds.encoders.json.JSON.cache.target = com.newgrounds.encoders.json.JSON.cache.target[_loc1_];
               com.newgrounds.encoders.json.JSON.cache.encoded += "\"" + _loc1_.split("\"").join("\\\"") + "\":";
               if(com.newgrounds.encoders.json.JSON.getType(com.newgrounds.encoders.json.JSON.cache.target) == "array")
               {
                  com.newgrounds.encoders.json.JSON.cache.encoded += "[";
               }
               else if(com.newgrounds.encoders.json.JSON.getType(com.newgrounds.encoders.json.JSON.cache.target) == "object")
               {
                  com.newgrounds.encoders.json.JSON.cache.encoded += "{";
               }
            }
            break;
         default:
            com.newgrounds.encoders.json.JSON.cache.encoded += "null";
            com.newgrounds.encoders.json.JSON.getParent();
      }
   }
   static function getParent()
   {
      if(com.newgrounds.encoders.json.JSON.cache.parents.length > 0)
      {
         var _loc1_ = com.newgrounds.encoders.json.JSON.cache.parents.pop();
         if(com.newgrounds.encoders.json.JSON.getType(_loc1_) == "array")
         {
            _loc1_.shift();
         }
         else
         {
            for(var _loc3_ in _loc1_)
            {
               delete _loc1_[_loc3_];
               break;
            }
         }
         if(com.newgrounds.encoders.json.JSON.getType(_loc1_) == "object" or com.newgrounds.encoders.json.JSON.getType(_loc1_) == "array")
         {
            for(var _loc2_ in _loc1_)
            {
               break;
            }
            if(_loc2_ !== undefined)
            {
               com.newgrounds.encoders.json.JSON.cache.encoded += ",";
            }
         }
         com.newgrounds.encoders.json.JSON.cache.target = _loc1_;
      }
      else
      {
         com.newgrounds.encoders.json.JSON.cache.complete = true;
      }
   }
}
