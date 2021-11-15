<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-14
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script type="text/javascript" src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>
</head>
<body>
<div id="chart-container">
</div>
<script>
    var chart = LightweightCharts.createChart(document.getElementById("chart-container"), {
        container_id: "chart-container",
        width: ${param.width},
        height: ${param.height},
        layout: {
            backgroundColor: 'rgba(255, 255, 255, 0.9)',
            textColor: 'rgba(0, 0, 0, 0.9)',
        },
        grid: {
            vertLines: {
                color: 'rgba(197, 203, 206, 0.5)',
            },
            horzLines: {
                color: 'rgba(197, 203, 206, 0.5)',
            },
        },
        crosshair: {
            mode: LightweightCharts.CrosshairMode.Normal,
        },
        rightPriceScale: {
            borderColor: 'rgba(197, 203, 206, 0.8)',
        },
        timeScale: {
            borderColor: 'rgba(197, 203, 206, 0.8)',
        },
    });

    var candleSeries = chart.addCandlestickSeries({});
    var volumeSeries = chart.addHistogramSeries({
        color: '#26a69a',
        priceFormat: {
            type: 'volume',
        },
        priceScaleId: '',
        scaleMargins: {
            top: 0.8,
            bottom: 0,
        },
    });
    // 더미 데이터가 들어있는 상태
    // todo: 주식 api를 사용해서 데이터를 받아오도록 수정하기
    fetch('https://poloniex.com/public?command=returnChartData&currencyPair=BTC_LTC&start=1548979200&end=1560240441&period=86400')
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            candleSeries.setData(data.map(bar => {
                return {
                    time: bar.date,
                    high: bar.high,
                    low: bar.low,
                    open: bar.open,
                    close: bar.close };
            }))
            volumeSeries.setData(data.map(bar => {
                return {
                    time: bar.date,
                    value: bar.volume
                }
            }))
            ;
        });
</script>
</body>
</html>
