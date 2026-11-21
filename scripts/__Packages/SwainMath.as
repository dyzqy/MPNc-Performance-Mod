class SwainMath
{
   static var point_this = new flash.geom.Point(0,0);
   static var point_target = new flash.geom.Point(0,0);
   static var this_distance = new Number();
   static var Xd = new Number();
   static var Yd = new Number();
   static var radAngle = new Number();
   static var rotation_result = new Number();
   function SwainMath()
   {
   }
   static function calculate_rotation(source_x, source_y, target_x, target_y)
   {
      SwainMath.Xd = target_x - source_x;
      SwainMath.Yd = target_y - source_y;
      SwainMath.radAngle = Math.atan2(SwainMath.Yd,SwainMath.Xd);
      SwainMath.rotation_result = int(SwainMath.radAngle * 360 / 6.283185307179586 + 90);
      if(SwainMath.rotation_result > 180)
      {
         SwainMath.rotation_result = -180 + (SwainMath.rotation_result - 180);
      }
      return SwainMath.rotation_result;
   }
   static function move_me(this_mc, this_rotation, this_speed)
   {
      if(this_rotation > 180)
      {
         this_mc._y += this_speed * Math.cos(0.017453292519943295 * this_rotation);
         this_mc._x -= this_speed * Math.sin(0.017453292519943295 * this_rotation);
      }
      else
      {
         this_mc._y -= this_speed * Math.cos(0.017453292519943295 * this_rotation);
         this_mc._x += this_speed * Math.sin(0.017453292519943295 * this_rotation);
      }
   }
   static function move_me2(this_axis, this_rotation, this_speed)
   {
      if(this_rotation > 180)
      {
         if(this_axis == "y")
         {
            return this_speed * Math.cos(0.017453292519943295 * this_rotation);
         }
         if(this_axis == "x")
         {
            return - this_speed * Math.sin(0.017453292519943295 * this_rotation);
         }
      }
      else
      {
         if(this_axis == "y")
         {
            return - this_speed * Math.cos(0.017453292519943295 * this_rotation);
         }
         if(this_axis == "x")
         {
            return this_speed * Math.sin(0.017453292519943295 * this_rotation);
         }
      }
   }
   static function get_position(startX, startY, this_rotation, this_distance, this_axis)
   {
      if(this_axis == "x")
      {
         if(this_rotation > 180)
         {
            return startX - this_distance * Math.sin(0.017453292519943295 * this_rotation);
         }
         return startX + this_distance * Math.sin(0.017453292519943295 * this_rotation);
      }
      if(this_axis == "y")
      {
         if(this_rotation > 180)
         {
            return startY + this_distance * Math.cos(0.017453292519943295 * this_rotation);
         }
         return startY - this_distance * Math.cos(0.017453292519943295 * this_rotation);
      }
   }
   static function get_distance(mc_1, mc_2)
   {
      SwainMath.point_this.x = mc_1._x;
      SwainMath.point_this.y = mc_1._y;
      SwainMath.point_target.x = mc_2._x;
      SwainMath.point_target.y = mc_2._y;
      SwainMath.this_distance = flash.geom.Point.distance(SwainMath.point_this,SwainMath.point_target);
      return SwainMath.this_distance;
   }
   static function get_distance2(mc_1_x, mc_1_y, mc_2_x, mc_2_y)
   {
      SwainMath.point_this.x = mc_1_x;
      SwainMath.point_this.y = mc_1_y;
      SwainMath.point_target.x = mc_2_x;
      SwainMath.point_target.y = mc_2_y;
      SwainMath.this_distance = flash.geom.Point.distance(SwainMath.point_this,SwainMath.point_target);
      return SwainMath.this_distance;
   }
   static function randomNumber(min, max)
   {
      var _loc1_ = Math.floor(Math.random() * (max - min + 1)) + min;
      return _loc1_;
   }
   static function getAxisDistance(inStart, inEnd)
   {
      var _loc1_ = inStart - inEnd;
      if(inStart < inEnd)
      {
         _loc1_ *= -1;
      }
      return _loc1_;
   }
   static function getRotDistance(inRot1, inRot2)
   {
      var _loc1_ = undefined;
      if(inRot1 < inRot2 - 180)
      {
         inRot1 += 360;
      }
      if(inRot1 > inRot2 + 180)
      {
         inRot1 -= 360;
      }
      _loc1_ = inRot1 - inRot2;
      if(_loc1_ < 0)
      {
         _loc1_ *= -1;
      }
      return _loc1_;
   }
   static function shulffleArray(inArray)
   {
      var _loc3_ = new Array();
      var _loc1_ = inArray.concat();
      var _loc2_ = undefined;
      while(_loc1_.length > 0)
      {
         _loc2_ = SwainMath.randomNumber(0,_loc1_.length - 1);
         _loc3_.push(_loc1_[_loc2_]);
         _loc1_.splice(_loc2_,1);
      }
      return _loc3_;
   }
   static function randomElement(inArray)
   {
      return inArray[SwainMath.randomNumber(0,inArray.length - 1)];
   }
   static function removeElement(inElement, inArray)
   {
      var _loc1_ = 0;
      while(_loc1_ < inArray.length)
      {
         if(inElement == inArray[_loc1_])
         {
            inArray.splice(_loc1_,1);
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   static function returnNumberCommas(inNum)
   {
      var _loc1_ = String(inNum);
      var _loc2_ = new String();
      var _loc3_ = 0;
      while(_loc3_ <= String(inNum).length)
      {
         if(_loc1_.length <= 3)
         {
            _loc2_ = _loc1_ + _loc2_;
            break;
         }
         _loc2_ = "," + _loc1_.substr(-3,3) + _loc2_;
         _loc1_ = _loc1_.substr(0,_loc1_.length - 3);
         _loc3_ += 3;
      }
      return _loc2_;
   }
}
