<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>表格筛选功能示例</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<div class="layui-container">
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="filterName" placeholder="请输入姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn" lay-submit lay-filter="filter">筛选</button>
            </div>
        </div>
    </div>
    <table id="myTable" lay-filter="myFilter"></table>
</div>

<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['element','form','table','util'], function(){
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util,
            form=layui.form;


        table.render({
            elem: '#myTable',
            url: '/allOrderInfo',
            filter: true, // 开启筛选功能
            cols:[[
                {field: 'oID', title: '序号', align: 'center', filter: '1'}
                ,{field: 'houseDesc', title: '房屋详情', align: 'center', filter: '2'}
                ,{field: 'houseModel', title: '几室几厅', align: 'center', filter: '3'}
                ,{field: 'houseArea', title: '面积', align: 'center', filter: '4'}
                ,{field: 'houseFloor', title: '楼层', align: 'center', filter: '5'}
                ,{field: 'houseType', title: '出租方式', align: 'center', filter: '6'}
                ,{field: 'housePrice', title: '价格', align: 'center', filter: '7'}
                ,{field: 'houseAddress', title: '地址', align: 'center', filter: '8'}
                ,{field: 'houseLinkMan', title: '联系人', align: 'center', filter: '9'}
                ,{field: 'communityName', title: '小区名', align: 'center', filter: '10'}
                ,{field: 'houseOriented', title: '朝向', align: 'center', filter: '11'}
                ,{field: 'orderTime', title: '订单时间', align: 'center', filter: '12',
                    templet:function(d){return util.toDateString(d.orderTime)}}
                ,{field: 'orderUser', title: '订单人', align: 'center' , filter: '13'}
                ,{title: '操作', align: 'center',toolbar:"#tools"}
            ]],
        });

        // 监听筛选按钮点击事件
        form.on('submit(filter)', function(data){
            var name = data.field.filterName; // 获取姓名筛选条件的值
            // 执行表格重载
            table.reload('myTable', {
                where: { // 设定异步数据接口的额外参数，这里传递筛选条件
                    name: name
                },
                page: {
                    curr: 1 // 重载后从第一页开始
                }
            });
            return false; // 阻止表单提交
        });
    });
</script>
</body>
</html>