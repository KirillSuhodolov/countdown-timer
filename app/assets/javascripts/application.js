// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jcountdown
//= require twitter/bootstrap
//= require_tree .
var date = $("#jcountdown").data('date');

$("#jcountdown").setCountdown({
 //Date for the countdown
 targetDate: date, 
 //Labels for days/hours/minutes/seconds,
 //[ 'Days', 'Hours', 'Minutes', 'Seconds' ] by default
 itemLabels: [ 'D', 'H', 'M', 'S' ] });

var datenow = Date.now
$(function() {
        $( "#datepicker" ).datepicker({
           changeMonth: true,
           changeYear: true
        });
        $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
        $( "#datepicker" ).datepicker( "option", "showAnim", "blind" );
  });

$(function() {
        $( "#event_datejs" ).datepicker({
           changeMonth: true,
           changeYear: true
        });
        $( "#event_datejs" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
        $( "#event_datejs" ).datepicker( "option", "showAnim", "blind" );
  });