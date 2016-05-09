$(document).ready(function() {
  $('#conservative').on('click', function (e) {
    e.preventDefault();
    $("#pieChartContainer").attr("src", "/images/risk/conservative.svg");
    $("#riskDefinition").attr("src", "/images/risk/very-low-risk.svg");
    $('#balanced').removeClass('selected');
    $('#conservative').addClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#balanced').on('click', function (e) {
    e.preventDefault();
    $("#pieChartContainer").attr("src", "/images/risk/balanced.svg");
    $("#riskDefinition").attr("src", "/images/risk/medium-risk.svg");
    $('#conservative').removeClass('selected');
    $('#balanced').addClass('selected');
    $('#growth').removeClass('selected');
  });

  $('#growth').on('click', function (e) {
    e.preventDefault();
    $("#pieChartContainer").attr("src", "/images/risk/growth.svg");
    $("#riskDefinition").attr("src", "/images/risk/very-high-risk.svg");
    $('#balanced').removeClass('selected');
    $('#conservative').removeClass('selected');
    $('#growth').addClass('selected');
  });
});
