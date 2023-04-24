<%--
  Created by IntelliJ IDEA.
  User: yuanwei
  Date: 2023/4/20
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>订单统计</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
  <script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/echarts.min.js"></script>
</head>
<body>
<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">柱状图</div>
        <div class="layui-card-body">
          <div id="bar-chart" style="height: 300px;"></div>
        </div>
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">折线图</div>
        <div class="layui-card-body">
          <div id="line-chart" style="height: 300px;"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
  layui.use(['layer'], function () {

    var layer = layui.layer;

    // 异步加载数据
    $.ajax({
      type: "GET",
      url: "/orderInfo", // 数据接口
      success: function(data) {
        // 将数据格式化为 ECharts 需要的格式
        // 柱状图
        var barChart = echarts.init(document.getElementById('bar-chart'));
        var barOption = {
          title: {
            text: '订单统计'
          },
          tooltip: {},
          legend: {
            data: ['订单数']
          },
          xAxis: {
            type: 'category',
            data: data.times // 使用后端传来的时间作为 x 轴数据
          },
          yAxis: {
            type: 'value'
          },
          series: [{
            name: '订单数',
            data: data.counts, // 使用后端传来的订单数量作为 y 轴数据
            type: 'line'
          }]
        };
        barChart.setOption(barOption);
        var option = {
          xAxis: {
            type: 'category',
            data: data.times // 使用后端传来的时间作为 x 轴数据
          },
          yAxis: {
            type: 'value'
          },
          series: [{
            data: data.counts, // 使用后端传来的订单数量作为 y 轴数据
            type: 'line'
          }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
      },
      error: function() {
        alert("获取数据失败！");
      }
    });
    /*// 获取订单数据
    var data = [];
    for (var i = 0; i < 7; i++) {
      data.push(Math.floor(Math.random() * 100));
    }

    // 柱状图
    var barChart = echarts.init(document.getElementById('bar-chart'));
    var barOption = {
      title: {
        text: '订单统计'
      },
      tooltip: {},
      legend: {
        data: ['订单数']
      },
      xAxis: {
        data: ['第一天', '第二天', '第三天', '第四天', '第五天', '第六天', '第七天']
      },
      yAxis: {},
      series: [{
        name: '订单数',
        type: 'bar',
        data: data
      }]
    };
    barChart.setOption(barOption);

    // 折线图
    var lineChart = echarts.init(document.getElementById('line-chart'));
    var lineOption = {
      title: {
        text: '订单统计'
      },
      tooltip: {},
      legend: {
        data: ['订单数']
      },
      xAxis: {
        data: ['第一天', '第二天', '第三天', '第四天', '第五天', '第六天', '第七天']
      },
      yAxis: {},
      series: [{
        name: '订单数',
        type: 'line',
        data: data
      }]
    };
    lineChart.setOption(lineOption);*/
  });
</script>
</body>
</html>