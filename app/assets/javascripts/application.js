//= require jquery
//= require jquery_ujs
//= require cocoon
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {
  datepicker = $('[data-provide=datepicker]');
  datepicker.datepicker({"format": "dd/mm/yyyy", "weekStart": 1, "autoclose": true});
  datepicker.keydown(function(e){
    e.preventDefault();
  });
});