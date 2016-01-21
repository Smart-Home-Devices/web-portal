$(function(){
	$('#bs-example-navbar-collapse-1').on('show.bs.collapse',function(){
		$('.sidebar').css({'top':'226px'});		
	});
	$('#bs-example-navbar-collapse-1').on('hide.bs.collapse',function(){
		$('.sidebar').css({'top':'50px'});		
	});
	if( $('.dene1').length){
	setInterval(function(){
      setTimeout(function(){
      	
      $('.dene1').css({
        // "background": "-moz-linear-gradient(top, #D60808 0%, #8E0101 100%)",
        //     "background": "-webkit-gradient(linear, left top, left bottom, color-stop(0%, #D60808), color-stop(100%, #8E0101))",
    "background": "-webkit-linear-gradient(top, #D60808 0%, #8E0101 100%)"
        // "background": "-o-linear-gradient(top, #D60808 0%, #8E0101 100%) " 
    
          });
          $('.denem1').css({
        // "background": "-moz-linear-gradient(top, #FF0202 0%, #D60808 100%)",
            // "background": "-webkit-gradient(linear, left top, left bottom, color-stop(0%, #FF0202), color-stop(100%, #D60808))",
    "background": "-webkit-linear-gradient(top, #FF0202 0%, #D60808 100%)"
          });
        },500);
      
        $('.denem1').css({
        // "background": "-moz-linear-gradient(top, #191919 0%, #101010 100%)",
        //     "background": "-webkit-gradient(linear, left top, left bottom, color-stop(0%, #191919), color-stop(100%, #101010))",
    "background": "-webkit-linear-gradient(top, #191919 0%, #101010 100%)"
        // "background": "-o-linear-gradient(top, #191919 0%, #101010 100%)"
          });
            $('.dene1').css({
        // "background": "-moz-linear-gradient(top, #1B1B1B 0%, #000000 100%)",
            // "background": "-webkit-gradient(linear, left top, left bottom, color-stop(0%, #1B1B1B), color-stop(100%, #000000))",
    "background": "-webkit-linear-gradient(top, #1B1B1B 0%, #000000 100%)"
        // "background": "-o-linear-gradient(top, #1B1B1B 0%, #000000 100%)"  
      });     
    },1500);
	}
});