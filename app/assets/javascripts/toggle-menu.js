// app/assets/javascripts/toggle-menu.js

$(document).ready(function() {
    // Select the parent menu items with submenu
    $('.menu-parent').click(function() {
      // Toggle the submenu's visibility
      $(this).find('.menu-subitems').toggle();
    });
  });
  
  