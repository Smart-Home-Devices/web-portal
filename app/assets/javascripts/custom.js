$(function(){
	$('#bs-example-navbar-collapse-1').on('show.bs.collapse',function(){
		$('.sidebar').css({'top':'226px'});		
	});
	$('#bs-example-navbar-collapse-1').on('hide.bs.collapse',function(){
		$('.sidebar').css({'top':'50px'});		
	});
});