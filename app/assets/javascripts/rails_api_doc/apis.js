// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function add_fields(link, association, content) {
 var regexp = new RegExp("new_" + association, "g")
 $('.nested-fields').append(content.replace(regexp));
}