// app/assets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require_tree .



// app/assets/javascripts/application.js
$(document).ready(function() {
  $('.menu-parent a').click(function(event) {
    event.preventDefault();
    $(this).parent().toggleClass('active open'); // Add 'open' class here
  });
});

  
  
  
  