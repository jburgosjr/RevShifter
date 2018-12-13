$(document).ready(function(){
    $('.tabs').tabs();
    $('select:not([multiple])').material_select();
  });

$('#alert_close').click(function(){
    $( "#alert_box" ).fadeOut( "slow", function() {
    });
  });