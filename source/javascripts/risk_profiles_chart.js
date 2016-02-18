$(document).ready(function() {
  $('#conservative').on('click', function (e) {
    e.preventDefault();
    $("#pieChartContainer").attr("src", "/images/risk/conservative.svg");
    $('#balanced').removeClass('selected');
    $('#conservative').addClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#balanced').on('click', function (e) {
    e.preventDefault();
    $("#pieChartContainer").attr("src", "/images/risk/balanced.svg");
    $('#conservative').removeClass('selected');
    $('#balanced').addClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#growth').on('click', function (e) {
    e.preventDefault();
    $("#pieChartContainer").attr("src", "/images/risk/growth.svg");
    $('#balanced').removeClass('selected');
    $('#conservative').removeClass('selected');
    $('#growth').addClass('selected');
  });
});