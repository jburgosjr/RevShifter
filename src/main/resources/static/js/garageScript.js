$(document).ready(function(){
	$('.modal').modal();
	$('.tabs').tabs();
    $('select:not([multiple])').material_select();
  });

$('#alert_close').click(function(){
    $( "#alert_box" ).fadeOut( "slow", function() {
    });
  });