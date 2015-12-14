$(window).load(function () {
    if ($("#pieChartContainer").length) {

        var chartOptions = {
            animationEnabled: true,
            animationDuration: 600,
            colorSet: "customColorSet1",
            data: [//array of dataSeries
                {
                    type: "pie",
                    visible: true,
                    name: "aus-shares",
                    startAngle: -90,
                    markerType: "none",
                    indexLabel: "#percent%",
                    indexLabelPlacement: "inside",
                    indexLabelFontSize: 30,
                    indexLabelFontColor: "white",
                    indexLabelFontFamily: "Open sans, sans-serif",
                    dataPoints: [{y: 30}, {y: 70}]
                }
            ]
        };
        CanvasJS.addColorSet("customColorSet1",
            [
                "#204581",
                "#279EEE"
            ]);
        var pieChart = new CanvasJS.Chart("pieChartContainer", chartOptions);

        pieChart.render();
        $('.canvasjs-chart-credit').hide();

        $('#conservative').click(function () {
            var pieChart = new CanvasJS.Chart("pieChartContainer", chartOptions);
            pieChart.options.data[0].dataPoints = [{y: 30}, {y: 70}];
            pieChart.render();
            $('.canvasjs-chart-credit').hide();
        });

        $('#balanced').click(function () {
            var pieChart = new CanvasJS.Chart("pieChartContainer", chartOptions);
            pieChart.options.data[0].dataPoints = [{y: 70}, {y: 30}];
            pieChart.render();
            $('.canvasjs-chart-credit').hide();
        });

        $('#growth').click(function () {
            var pieChart = new CanvasJS.Chart("pieChartContainer", chartOptions);
            pieChart.options.data[0].dataPoints = [{y: 85}, {y: 15}];
            pieChart.render();
            $('.canvasjs-chart-credit').hide();
        });
    }
});