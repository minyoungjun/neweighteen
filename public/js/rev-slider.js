(function($){
    "use strict";

	$(document).ready(function(){

      var winSize = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight
      }

      var sliderHeight = 900;
      if (winSize.width > winSize.height){
        sliderHeight = 500;
      }


	    jQuery('.tp-banner').revolution({
			delay:12000,
			startwidth:1200,
			startheight: sliderHeight,
			hideThumbs:10,

			parallax:"scroll",
			parallaxBgFreeze:"on",
			parallaxLevels:[10,20,30,40,50,60,70,80,90,100],

			fullWidth:"on",
      forceFullWidth:"on",

			navigationType:"off",							
			navigationStyle:"preview1",

			hideArrowsOnMobile:"on",
			
			touchenabled:"on",
			onHoverStop:"off",
			spinner:"spinner4"
		});
	});
	
})(jQuery);
