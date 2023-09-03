// app/assets/javascripts/application.js
//= require jquery
//= require jquery_ujs
//= require_tree .



// app/assets/javascripts/application.js
$(document).ready(function() {
  $('.menu-parent a ').click(function() {
    $(this).parent().toggleClass('active');
  });
});



  document.addEventListener("DOMContentLoaded", function() {
    const userDiv = document.querySelector(".user");
    const logoutDiv = document.querySelector("#logout");

    userDiv.addEventListener("click", function() {
      logoutDiv.style.display = logoutDiv.style.display === "none" ? "block" : "none";
    });
  });


  
  
  
  