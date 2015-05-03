//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require cocoon
//= require bootstrap-sprockets
//= require_tree .

@import "bootstrap-datepicker";

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().after(content.replace(regex, new_id));
    $('#new_component_fields').modal('show');
}
