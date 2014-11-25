// Handles destroying the related fields_for
$(document).on('click', 'a.destroy_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');

  // Update sort order after removing sortable-item
  if($(this).closest('.sortable-item').length > 0) {
    $(this).closest('.sortable-item').closest('.row').hide();
    update_items_order();

  } else if($(this).hasClass('destroy_column')) {
    $(this).closest('.col-md-2').hide();

  } else {
    $(this).closest('.row').hide();
  }
  
  event.preventDefault();
});

// update order index of direction items
update_items_order = function() {
  $(".sortable-item:visible").each(function(index, element) {
    $(this).find("input[name$='[sort_order]']").val(index);
    $(this).find(".sortable-index-display").text(index+1);
  });
}

// Handles sorting of direction items
initialize_sorting = function() {
  $( "#sortable-items" ).sortable({
    placeholder: "sortable-placeholder",
    handle: ".sortable-handle",
    stop: function( event, ui ) {
      update_items_order();
    }
  });
  // $( "#sortable-items" ).disableSelection();
};

initialize_file_upload = function() {
  $(".edit_cooking_recipe, .new_cooking_recipe").fileupload();
}

$(document).ready(initialize_sorting);
$(document).ready(initialize_file_upload);
$(document).on('page:load', initialize_sorting);
$(document).on('page:load', initialize_file_upload);
