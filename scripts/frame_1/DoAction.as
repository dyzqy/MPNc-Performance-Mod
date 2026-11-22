var rightClick = new ContextMenu();
rightClick.hideBuiltInItems();
_root.menu = rightClick;
// 21/11/2026 dyzqy: As I call it, the Mask Trick! Because scrollRect makes it so anything beside what is supposed to be shown, isn't shown OR calculated!
_root.scrollRect = new flash.geom.Rectangle(0, 0, 850, 530);
Object.registerClass("world_map",MadnessWorldMap);
Object.registerClass("madness_world",MadWorld);
Object.registerClass("madness_particle",MadnessParticle);
Object.registerClass("madness_obstacle",MadnessObstacle);
Object.registerClass("madness_game_select",MadnessGameSelect);
Object.registerClass("madness_doors",MadnessDoors);
Object.registerClass("madness_character",MadnessCharacter);
Object.registerClass("madness_activator",MadnessActivator);

if (_root.stats_mc == undefined) {
   var STATS_W = 140;
   var STATS_H = 100;
   var TARGET_FPS = 30;

   var stats_mc = _root.createEmptyMovieClip("stats_mc", 99999);
   stats_mc._x = 0;
   stats_mc._y = 530 - STATS_H;

   stats_mc.lineStyle(1, 0x333366, 100);
   stats_mc.beginFill(0x000028, 92);
   stats_mc.moveTo(0, 0);
   stats_mc.lineTo(STATS_W, 0);
   stats_mc.lineTo(STATS_W, STATS_H);
   stats_mc.lineTo(0, STATS_H);
   stats_mc.lineTo(0, 0);
   stats_mc.endFill();

   var statsStyle = new TextField.StyleSheet();
   statsStyle.setStyle("xml", {fontSize:"10px", fontFamily:"_sans", leading:"0px"});
   statsStyle.setStyle("fps", {color:"#ffff00", fontWeight:"bold"});
   statsStyle.setStyle("ms", {color:"#00ff00", fontWeight:"bold"});

   stats_mc.createTextField("label_txt", 1, 4, 2, STATS_W - 8, 28);
   var statsText = stats_mc["label_txt"];
   statsText.multiline = true;
   statsText.wordWrap = true;
   statsText.html = true;
   statsText.condenseWhite = true;
   statsText.selectable = false;
   statsText.styleSheet = statsStyle;

   var graphW = STATS_W - 4;
   var graphH = STATS_H - 32;
   var statsGraph = new flash.display.BitmapData(graphW, graphH, false, 0x000022);
   var statsRect = new flash.geom.Rectangle(graphW - 1, 0, 1, graphH);
   var graph_mc = stats_mc.createEmptyMovieClip("graph_mc", 2);
   graph_mc._x = 2;
   graph_mc._y = 30;
   graph_mc.attachBitmap(statsGraph, 1);

   var g25 = Math.floor(graphH * 0.25);
   var g50 = Math.floor(graphH * 0.50);
   var g75 = Math.floor(graphH * 0.75);
   statsGraph.fillRect(new flash.geom.Rectangle(0, g25, graphW, 1), 0x161644);
   statsGraph.fillRect(new flash.geom.Rectangle(0, g50, graphW, 1), 0x222258);
   statsGraph.fillRect(new flash.geom.Rectangle(0, g75, graphW, 1), 0x161644);

   function drawGraphSeg(bmp, x, y1, y2, col) {
      var topY = Math.min(y1, y2);
      var botY = Math.max(y1, y2);
      if (botY - topY < 2) {
         botY = topY + 1;
      }
      if (topY < 0) {
         topY = 0;
      }
      if (botY >= bmp.height) {
         botY = bmp.height - 1;
      }
      bmp.fillRect(new flash.geom.Rectangle(x, topY, 1, (botY - topY) + 1), col);
   }

   var timer = getTimer();
   var ms = timer;
   var ms_prev = timer;
   var fps = 0;
   var lastFps = 0;

   var firstSample = true;
   var prevFpsY = graphH - 1;
   var prevMsY = graphH - 1;

   statsText.htmlText = "<xml><fps>FPS: 0 / " + TARGET_FPS + "</fps><ms>MS: 0 ms</ms></xml>";

   stats_mc.onEnterFrame = function() {
      var topDepth = _root.getNextHighestDepth();
      if (topDepth > 2130690045) {
         topDepth = 2130690045;
      }
      if (this.getDepth() < topDepth - 1) {
         this.swapDepths(topDepth);
      }

      var sr = _root.scrollRect;
      if (sr != undefined) {
         this._x = sr.x;
         this._y = sr.y + sr.height - STATS_H;
      } else {
         this._x = 0;
         this._y = Stage.height - STATS_H;
      }

      timer = getTimer();
      var deltaMs = timer - ms;
      ms = timer;

      if (timer - 1000 > ms_prev) {
         ms_prev = timer;

         var fps_g = Math.min(graphH - 1, Math.max(0, (fps / TARGET_FPS) * (graphH - 1)));
         var ms_g = Math.min(graphH - 1, Math.max(0, deltaMs >> 1));

         var currFpsY = Math.round((graphH - 1) - fps_g);
         var currMsY = Math.round((graphH - 1) - ms_g);

         if (firstSample) {
            prevFpsY = currFpsY;
            prevMsY = currMsY;
            firstSample = false;
         }

         statsGraph.scroll(-1, 0);
         statsGraph.fillRect(statsRect, 0x000022);

         statsGraph.setPixel(graphW - 1, g25, 0x161644);
         statsGraph.setPixel(graphW - 1, g50, 0x222258);
         statsGraph.setPixel(graphW - 1, g75, 0x161644);

         drawGraphSeg(statsGraph, graphW - 1, prevMsY, currMsY, 0x00ff00);
         drawGraphSeg(statsGraph, graphW - 1, prevFpsY, currFpsY, 0xffff00);

         prevFpsY = currFpsY;
         prevMsY = currMsY;

         lastFps = fps;
         fps = 0;
      }

      fps++;
      statsText.htmlText = "<xml><fps>FPS: " + lastFps + " / " + TARGET_FPS + "</fps><ms>MS: " + deltaMs + " ms</ms></xml>";
   };
}