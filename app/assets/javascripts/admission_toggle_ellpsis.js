// app/assets/javascripts/admission_toggle_ellpsis.js

$(document).ready(function() {
  $('.ellips').click(function() {
    // Find the parent container of the clicked ellips
    var parentContainer = $(this).closest('.record-container');
    
    // Check if the ellips_popup element within the same parent container is visible
    var ellipsPopup = parentContainer.find('.ellips_popup');
    var isVisible = ellipsPopup.is(':visible');
    
    // Hide all ellips_popup elements
    $('.ellips_popup').hide();
    
    // Toggle the ellips_popup element within the same parent container based on its current visibility
    if (!isVisible) {
      ellipsPopup.show();
    }
  });
});


