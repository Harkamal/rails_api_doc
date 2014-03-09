// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function add_fields(link, association, content) {
 var regexp = new RegExp("new_" + association, "g")
 $('.nested-fields').append(content.replace(regexp));
}

function add_success_fields(link, association, content) {
 var regexp = new RegExp("new_" + association, "g")
 $('.success-fields').append(content.replace(regexp));
}

function add_failure_fields(link, association, content) {
 var regexp = new RegExp("new_" + association, "g")
 $('.failure-fields').append(content.replace(regexp));
}