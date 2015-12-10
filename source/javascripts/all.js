//= require_tree .
$(document).ready(function() {
  $('#conservative').on('click', function(e) {
    e.preventDefault();
    $("#risk-profile-chart").attr("src","/images/risk/conservative.svg");
    $("#risk-profile-title").text("Conservative portfolio");
    $('#conservative').addClass('selected');
    $('#balanced').removeClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#balanced').on('click', function(e) {
    e.preventDefault();
    $("#risk-profile-chart").attr("src","/images/risk/balanced.svg");
    $("#risk-profile-title").text("Balanced portfolio");
    $('#conservative').removeClass('selected');
    $('#balanced').addClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#growth').on('click', function(e) {
    e.preventDefault();
    $("#risk-profile-chart").attr("src","/images/risk/growth.svg");
    $("#risk-profile-title").text("Growth portfolio");
    $('#conservative').removeClass('selected');
    $('#balanced').removeClass('selected');
    $('#growth').addClass('selected');
  });

  $(window).swipeleft(function(e){
    e.preventDefault();
    $('.next > a.centered').click();
  });

  $(window).swiperight(function (e) {
    e.preventDefault();
    $('.previous > a.centered').click();
  });
});

var startup = function() {
  resize_static_images();
};

window.onload = startup;
