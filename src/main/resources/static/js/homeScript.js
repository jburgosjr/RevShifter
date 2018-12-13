$(document).ready(function(){
    $('.modal').modal();
  });

$('#alert_close').click(function(){
    $( "#alert_box" ).fadeOut( "slow", function() {
    });
  });