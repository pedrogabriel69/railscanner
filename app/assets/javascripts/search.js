$(document).ready(function() {
  $('.search_form').submit(function() {
    var initial_station;
    var final_station;

    initial_station = $(this).find('#initial_station');
    final_station = $(this).find('#final_station');

    console.log('lalalala');

    if (initial_station.val() == final_station.val()) {
    	alert('You should choose other final station');
    	return false;
    }
  });
});