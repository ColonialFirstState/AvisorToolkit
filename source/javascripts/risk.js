$(document).ready(function() {
  $('#conservative').on('click', function(e) {
    e.preventDefault();
    $("#risk-profile-title").text("Conservative portfolio");
    $('#conservative').addClass('selected');
    $('#balanced').removeClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#balanced').on('click', function(e) {
    e.preventDefault();
    $("#risk-profile-title").text("Balanced portfolio");
    $('#conservative').removeClass('selected');
    $('#balanced').addClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#growth').on('click', function(e) {
    e.preventDefault();
    $("#risk-profile-title").text("Growth portfolio");
    $('#conservative').removeClass('selected');
    $('#balanced').removeClass('selected');
    $('#growth').addClass('selected');
  });
});
