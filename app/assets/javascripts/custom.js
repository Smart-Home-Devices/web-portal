function updateSensors(){
  $.getScript("/sensors.js");
  setTimeout(updateSensors, 5000);
}
function updateDevices(){
  $.getScript("/devices.js");
  setTimeout(updateDevices, 5000);
}

var update;
var update1;
$(function(){

  if (update){
   clearTimeout(update);
  }
  update = setTimeout(updateSensors, 5000);
  if (update1){
   clearTimeout(update1);
  }
  update1 = setTimeout(updateDevices, 5000);
	$('#bs-example-navbar-collapse-1').on('show.bs.collapse',function(){
		$('.sidebar').css({'top':'226px'});		
	});
	$('#bs-example-navbar-collapse-1').on('hide.bs.collapse',function(){
		$('.sidebar').css({'top':'50px'});		
	});
});