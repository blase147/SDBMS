// app/assets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require_tree .



// app/assets/javascripts/application.js
$(document).ready(function() {
  $('.menu-parent ').click(function() {
    $(this).parent().toggleClass('active');
  });
});



document.addEventListener("DOMContentLoaded", function() {
  const userDiv = document.querySelector(".user");
  const logoutDiv = document.querySelector("#logout");

  userDiv.addEventListener("click", function() {
    logoutDiv.classList.toggle("hidden"); // Toggle the "hidden" class
  });
});



  
  
  
  