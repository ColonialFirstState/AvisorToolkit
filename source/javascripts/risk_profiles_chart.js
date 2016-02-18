$(document).ready(function () {
  if($("#pieChartContainer").length === 0) {
    return
  }

  CanvasJS.addColorSet("customColorSet1", ["#204581", "#279EEE"]);
  var chartOptions = {
    animationEnabled: true,
    animationDuration: 600,
    colorSet: "customColorSet1",
    toolTip: {
      enabled: false
    },
    data: [
      {
        type: "pie",
        visible: true,
        highlightEnabled: false,
        name: "aus-shares",
        startAngle: -90,
        markerType: "none",
        indexLabel: "#percent%",
        indexLabelPlacement: "inside",
        indexLabelFontSize: 28,
        indexLabelFontColor: "white",
        indexLabelFontFamily: "Open sans, sans-serif",
        indexLabelFontWeight: 100,
      }
    ]
  };

  renderPieChartOnClick('#conservative', [{ y: 30 }, { y: 70 }], chartOptions);
  renderPieChartOnClick('#balanced',     [{ y: 70 }, { y: 30 }], chartOptions);
  renderPieChartOnClick('#growth',       [{ y: 85 }, { y: 15 }], chartOptions);
  $('#conservative').click();
});

/*
 * From http://canvasjs.com/docs/charts/chart-options/animationenabled/
 * "Animation is supported only during the initial chart render.
 *  But you can workaround this by re-creating the entire chart."
 */
function renderPieChartOnClick(button, dataPoints, chartOptions) {
  $(button).on('click', function (e) {
    e.preventDefault();
    var pieChart = new CanvasJS.Chart("pieChartContainer", chartOptions);
    pieChart.options.data[0].dataPoints = dataPoints;
    pieChart.render();
    $('.canvasjs-chart-credit').hide();
  });
}
