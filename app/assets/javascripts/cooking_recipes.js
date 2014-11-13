// Handles destroying the related fields_for
$(document).on('click', 'a.destroy_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  
  if($(this).closest('.sortable-item')) {
    $(this).closest('.sortable-item').hide();
    update_items_order();
  } else {
    $(this).closest('.row').hide();
  }
  event.preventDefault();
});


// update order index of direction items
update_items_order = function() {
  $(".sortable-item:visible input[name$='[sort_order]']").each(function(index, element) {
    $(this).val(index);
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

$(document).ready(initialize_sorting);
$(document).on('page:load', initialize_sorting);
