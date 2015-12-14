$(document).ready(function() {
  $('#conservative').on('click', function(e) {
    e.preventDefault();
    $(".medium-risk").attr('class', 'rating-no medium-risk');
    $(".high-risk").attr('class', 'rating-no high-risk');
    $(".low-risk").attr('class', 'rating-yes low-risk');
    $("#risk-profile-title").text("Conservative portfolio");
    $('#conservative').addClass('selected');
    $('#balanced').removeClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#balanced').on('click', function(e) {
    e.preventDefault();
    $(".medium-risk").attr('class', 'rating-yes medium-risk');
    $(".high-risk").attr('class', 'rating-no high-risk');
    $(".low-risk").attr('class', 'rating-no low-risk');
    $("#risk-profile-title").text("Conservative portfolio");
    $("#risk-profile-title").text("Balanced portfolio");
    $('#conservative').removeClass('selected');
    $('#balanced').addClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#growth').on('click', function(e) {
    e.preventDefault();
    $(".medium-risk").attr('class', 'rating-no medium-risk');
    $(".high-risk").attr('class', 'rating-yes high-risk');
    $(".low-risk").attr('class', 'rating-no low-risk');
    $("#risk-profile-title").text("Conservative portfolio");
    $("#risk-profile-title").text("Growth portfolio");
    $('#conservative').removeClass('selected');
    $('#balanced').removeClass('selected');
    $('#growth').addClass('selected');
  });
});
