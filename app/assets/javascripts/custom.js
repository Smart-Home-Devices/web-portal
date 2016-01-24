function updateSensors(){
   $.getScript("/sensors.js");
  setTimeout(updateSensors, 60000);
}
var update;
$(function(){

  if (update)
   clearTimeout(update);
  update = setTimeout(updateSensors, 60000);

	$('#bs-example-navbar-collapse-1').on('show.bs.collapse',function(){
		$('.sidebar').css({'top':'226px'});		
	});
	$('#bs-example-navbar-collapse-1').on('hide.bs.collapse',function(){
		$('.sidebar').css({'top':'50px'});		
	});
});