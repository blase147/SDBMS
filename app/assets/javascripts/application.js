// app/assets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require_tree .



// app/assets/javascripts/application.js
$(document).ready(function() {
  $('.menu-parent a').click(function() {
    $(this).parent().toggleClass('active');
  });
});





  
  
  
  