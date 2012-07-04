// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(function() {

  // Update the location choices based on checked large expansions
  $('.large-expansion input').change(function() {
    var form = $(this).closest('form').serialize();
    $.ajax('/', {
      data: form,
      success: function(result) {
        options = $(result).find('#location-select').html();
        $('#location-select').html(options);
      }
    });
  });

});