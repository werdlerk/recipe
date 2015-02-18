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
    cursor: "grabbing",
    stop: function( event, ui ) {
      update_items_order();
    }
  });
  // $( "#sortable-items" ).disableSelection();
};

initialize = function() {
  initialize_sorting();

  $("textarea[name$='[description]']").autosize();
  
  // Autocomplete on unit text fields
  $("input[name$='[unit_name]']").autocomplete({
    source: $("input[name$='[unit_name]']:last").data('autocomplete-source')
  });
  // Autocomplete on ingredient text fields
  $("input[name$='[ingredient_name]']").autocomplete({
    source: $("input[name$='[ingredient_name]']:last").data('autocomplete-source')
  });

  // Initalize tooltips
  $('[data-toggle="tooltip"]').tooltip();
}

$(document).ready(initialize);
$(document).on('page:load', initialize);
