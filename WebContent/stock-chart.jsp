<%--
  Created by IntelliJ IDEA.
  User: SJ
  Date: 2021-11-14
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <script type="text/javascript" src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div id="chart-container">
</div>
<%
    request.setCharacterEncoding("UTF-8");
    String ticker = request.getParameter("ticker");
%>
<script>
    var chart = LightweightCharts.createChart(document.getElementById("chart-container"), {
        container_id: "chart-container",
        width: ${param.width},
        height: ${param.height},
        // width: 600,
        // height: 300,
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
            mode: LightweightCharts.CrosshairMode.Magnet,
        },
        rightPriceScale: {
            borderColor: 'rgba(197, 203, 206, 0.8)',
        },
        timeScale: {
            borderColor: 'rgba(197, 203, 206, 0.8)',
        },
        localization: {
            locale: 'ko-KR',
            dateFormat: 'yyyy/MM/dd',
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
    let ticker = "<%=ticker%>";
    let apiUrl = "https://yh-finance.p.rapidapi.com/stock/v3/get-historical-data?symbol=" + ticker + "&region=US";
    // console.log(apiUrl)
    fetch(apiUrl, {
        "method": "GET",
        "headers": {
            "x-rapidapi-host": "yh-finance.p.rapidapi.com",
            "x-rapidapi-key": "6f2184902dmsh04c4abc73b2555ap1dd393jsn3a945887a54f"
        }
    })
        .then(response => {
            return response.json();
        })
        .then(function (data){
            let data1 = data["prices"].reverse();
            candleSeries.setData(data1.map(bar => {
                // date api 에서 date는 unix epoch(sec)로 표현되어 있음
                // js Date()에서는 unix epoch의 ms단위 입력을 받음
                // 기본적으로 api에서 미국 시간 기준 데이터를 받아온다.
                // 따라서 정확한 변환을 위해서는 미국시간과 한국시간의 차이를 보정해줘야 한다.
                // 뉴욕 : UTC-5:00
                // 서울 : UTC+9:00
                // 하지만 일단위의 데이터를 받아오고 있기 때문에 시간단위의 차이는 무의미하다고 생각되어
                // 차이 보정을 생략하였다.
                return {
                    time: new Date(bar.date * 1000).toISOString(),
                    high: bar.high,
                    low: bar.low,
                    open: bar.open,
                    close: bar.close
                };
            }))
            volumeSeries.setData(data1.map(bar => {
                return{
                    time: new Date(bar.date * 1000).toISOString(),
                    value: bar.volume
                }
            }));
        })
        .catch(err => {
            console.error(err);
        });
</script>
</body>
</html>
