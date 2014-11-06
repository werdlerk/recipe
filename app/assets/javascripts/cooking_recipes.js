$(document).ready(function() {

  // Handles destroying the related fields_for
  $('form').on('click', 'a.destroy_fields', function(event) {
    // Set hidden _destroy field to 1
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('.row').hide();
    event.preventDefault();
  });

});