function updateSensors(){
  $.getScript("/sensors.js");
  setTimeout(updateSensors, 5000);
}
function updateDevices(){
  $.getScript("/devices.js");
  setTimeout(updateDevices, 5000);
}
function check_connect(){
  var online1 = navigator.onLine;
  if(online == null){
    online = online1;
  }
  // console.log(online);
  // if (x){ console.log('online'); }
  // else{ console.log('offline'); }
  if (online){
    if (!online1){
      console.log('offline'); 
      online = online1;
      window.location.replace('http://localhost:3000');
    }  
  }
  if (!online){
    if (online1){
      console.log('online'); 
      online = online1;
      window.location.replace('https://interiit.herokuapp.com');
    }  
  }    
}

var update;
var update1;
var online;

$(function(){

  // setInterval(check_connect,5000);

  if (update){
   clearTimeout(update);
  }
  update = setTimeout(updateSensors, 5000);
  if (update1){
   clearTimeout(update1);
  }
  update1 = setTimeout(updateDevices, 5000);
	$('#bs-example-navbar-collapse-1').on('show.bs.collapse',function(){
		$('.sidebar').css({'top':'180px'});		
	});
	$('#bs-example-navbar-collapse-1').on('hide.bs.collapse',function(){
		$('.sidebar').css({'top':'0px'});		
	});
});