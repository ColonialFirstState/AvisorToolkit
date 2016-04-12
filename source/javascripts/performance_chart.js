$(document).ready(function () {
  if($("#chartContainer").length === 0){
    return;
  }

  var font       = "Open Sans, sans-serif";
  var gridColour = "#E9EDF4";
  var chart      = new CanvasJS.Chart("chartContainer", {
    animationEnabled: true,
    toolTip: {
      enabled: false
    },
    axisY: {
      prefix: "$",
      maximum: 70000,
      title: "Return on $10,000 invested ($AUD)",
      titleFontSize: 12,
      gridThickness: 1,
      gridColor: gridColour,
      lineColor: gridColour,
      lineThickness: 1,
      tickColor: gridColour,
      tickThickness: 1,
      titleFontFamily: font,
      labelFontFamily: font
    },
    axisX: {
      tickLength: 10,
      interval: 120,
      maximum: 245,
      valueFormatString: " ",
      lineColor: gridColour,
      lineThickness: 1,
      tickColor: gridColour,
      tickThickness: 1,
      titleFontFamily: font,
      labelFontFamily: font,
      labelFormatter: function ( e ) {
        if (e.value === 0)
          return "1995";
        if (e.value === 120)
          return "2005";
        if (e.value === 240)
          return "2015";
      }
    },
    data: [//array of dataSeries
      lineOption('aus-shares',  AUS_SHARES_DATA,  "#225AB7"),
      lineOption('int-shares',  INT_SHARES_DATA,  "#204581"),
      lineOption('property',    PROPERTY_DATA,    "#279EEE"),
      lineOption('fixed',       FIXED_DATA,       "#F58C23"),
      lineOption('cash',        CASH_DATA,        "#12A99C"),
      lineOption('diversified', DIVERSIFIED_DATA, "#2F4F4F"),
      // Chart does not show x-axis labels on render if no data is visible
      // insert dummy data and set visible to true to get around this problem
      $.extend(
        lineOption('make_empty_chart_consistent', [ { x: 0, y: 1}, { x: 1, y: 1}], "#E2E3E5"),
        { visible: true }
      )
    ]
  });

  chart.render();

  $('.canvasjs-chart-credit').hide();

  $('.legend').on('click', function (e) {
    var id = this.id;
    for (var key in chart.options.data) {
      if (chart.options.data[key].name == id) {
        chart.options.data[key].visible = !chart.options.data[key].visible;
        var cssClass = chart.options.data[key].visible ? "active" : "disabled";
        $("div#" + id).attr('class', 'legend ' + cssClass);
        chart.render();
        return;
      }
    }
  })
});

function lineOption(name, dataPoints, lineColour) {
  return {
    type: "line",
    lineThickness: 1,
    visible: false,
    name: name,
    color: lineColour,
    markerType: "none",
    dataPoints: dataPoints
  };
};
