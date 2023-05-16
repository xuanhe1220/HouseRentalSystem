<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有房源信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">房源列表</legend>
    </fieldset>
    <table id="allHouse" lay-filter="house"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element','form','table'],function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table;

        var dt = table.render({
            elem:"#allHouse",
            url:"findLeaseableHouse",
            toolbar: '#toolbar',
            page:true,
            cols:[[
                {field: 'hID', title: '序号', align: 'center'}
                ,{field: 'houseDesc', title: '房屋详情', align: 'center'}
                ,{field: 'houseModel', title: '几室几厅', align: 'center'}
                ,{field: 'houseArea', title: '面积', align: 'center'}
                ,{field: 'houseFloor', title: '楼层', align: 'center'}
                ,{field: 'houseType', title: '出租方式', align: 'center'}
                ,{field: 'housePrice', title: '价格', align: 'center'}
                ,{field: 'houseAddress', title: '地址', align: 'center'}
                ,{field: 'houseLinkMan', title: '联系人', align: 'center'}
                ,{field: 'communityName', title: '小区名', align: 'center'}
                ,{field: 'houseOriented', title: '朝向', align: 'center'}
                ,{field: 'publisher', title: '发布人', align: 'center'}
                ,{title: '操作', align: 'center',toolbar:"#tools"},
            ]]
        });

        table.on('tool(house)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;

            if(layEvent ==="order"){
                // 弹出一个iframe层，加载二维码付款页面
                layer.open({
                    type: 2,
                    title: '确认用户信息',
                    area: ['500px', '250px'],
                    content: '/toConfirmUserPage',
                    shadeClose: true,
                    btn: ['完成预定'],
                    btnAlign: 'c',
                    yes: function(index, layero) {
                        layer.ready(function() {
                            var username = layero.find('#username').val(); // 获取用户名输入框的值
                            var phonenumber = layero.find('#phone').val(); // 获取手机号输入框的值
                            // 在这里可以使用username和phonenumber进行后续的操作
                            layer.alert("用户名: " + username + "<br>手机号: " + phonenumber);
                        });

                        $.post("confirmUser",{username:username,phonenumber:phonenumber},function(data){
                            if(data=="OK"){
                                $.post("newOrder",{username:username},function(data){
                                    if(data=="OK"){
                                        layer.alert("预定成功！",{icon:1});
                                    }else{
                                    }
                                })
                            }else{
                                layer.alert("用户名和手机号不匹配，预定失败！",{icon:1});
                            }
                        });

                        layer.close(index);  // 关闭弹窗
                        // 这里可以写处理支付结果的代码
                    }
                });
                /*window.location="toAdminUpdateHousePage?hID="+data.hID;*/
            }
        });




    })
</script>
<script type="text/html" id="tools">
    <div style="width: 80px;">
        <a class="layui-btn layui-btn-xs" lay-event="order">订房</a>
    </div>
</script>

<!-- 定义搜索工具栏 -->
<script type="text/html" id="toolbar">

</script>
</body>
</html>