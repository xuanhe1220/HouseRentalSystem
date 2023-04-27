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
  <meta charset="UTF-8">
  <title>订单统计</title>
  <link rel="stylesheet" href="https://cdn.bootcss.com/layui/2.5.6/css/layui.min.css">
  <script src="https://cdn.bootcss.com/layui/2.5.6/layui.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/echarts@5.2.2/dist/echarts.min.js"></script>
</head>
<body>

<div class="layui-fluid" style="margin-top: 40px;">
  <fieldset class="layui-elem-field layui-field-title">
    <legend style="font-size: 26px">订单统计</legend>
  </fieldset>
  <div id="order-chart" style="height: 400px;"></div>
  <div id="order-line" style="height: 400px;"></div>
</div>
<script>
  // 获取订单信息
  layui.use(['jquery'], function () {
    var $ = layui.jquery;
    $.ajax({
      url: '/orderInfo',
      type: 'get',
      success: function (data) {
        var counts = data.counts;
        var times = data.times;

        // 绘制柱状图
        var orderChart = echarts.init(document.getElementById('order-chart'));
        var option = {
          title: {
            text: '最近七天订单量'
          },
          tooltip: {},
          xAxis: {
            data: times
          },
          yAxis: {},
          series: [{
            name: '订单量',
            type: 'bar',
            data: counts
          }]
        };
        orderChart.setOption(option);

        // 绘制折线图
        var orderLine = echarts.init(document.getElementById('order-line'));
        var option2 = {
          title: {
            text: '最近七天订单量趋势'
          },
          tooltip: {},
          xAxis: {
            data: times
          },
          yAxis: {},
          series: [{
            name: '订单量',
            type: 'line',
            data: counts
          }]
        };
        orderLine.setOption(option2);
      },
      error: function () {
        layer.msg('获取订单信息失败');
      }
    });
  });
</script>
</body>
</html>