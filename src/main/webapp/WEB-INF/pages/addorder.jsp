<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>预定房间</title>
    <!-- 引入layui的样式文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <style>
        #room-page {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #fff;
            padding: 10px;
        }

        .btn-wrapper {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        .btn-wrapper button {
            width: 60%;
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<%--<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">房源列表</legend>
    </fieldset>
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">房间1</div>
                    <div class="layui-card-body" style="width: 300px;">
                        <img src="https://picsum.photos/300/200" alt="房间1图片">
                        <p>房间1描述</p>
                        <button class="layui-btn layui-btn-primary layui-btn-sm">预定</button>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">房间2</div>
                    <div class="layui-card-body" style="width: 300px;">
                        <img src="https://picsum.photos/300/200" alt="房间1图片">
                        <p>房间1描述</p>
                        <button class="layui-btn layui-btn-primary layui-btn-sm">预定</button>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">房间3</div>
                    <div class="layui-card-body" style="width: 300px;">
                        <img src="https://picsum.photos/300/200" alt="房间1图片">
                        <p>房间1描述</p>
                        <button class="layui-btn layui-btn-primary layui-btn-sm">预定</button>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">房间3</div>
                    <div class="layui-card-body" style="width: 300px;">
                        <img src="https://picsum.photos/300/200" alt="房间1图片">
                        <p>房间1描述</p>
                        <button class="layui-btn layui-btn-primary layui-btn-sm">预定</button>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">房间3</div>
                    <div class="layui-card-body" style="width: 300px;">
                        <img src="https://picsum.photos/300/200" alt="房间1图片">
                        <p>房间1描述</p>
                        <button class="layui-btn layui-btn-primary layui-btn-sm">预定</button>
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">房间3</div>
                    <div class="layui-card-body" style="width: 300px;">
                        <img src="https://picsum.photos/300/200" alt="房间1图片">
                        <p>房间1描述</p>
                        <button class="layui-btn layui-btn-primary layui-btn-sm">预定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'carousel', 'layer','form'], function () {
        var layer = layui.layer,
            $ = layui.jquery;
        $(".layui-btn").click(function() {
            layer.open({
                title: '预定房间',
                content: `
      <form class="layui-form">
        <div class="layui-form-item">
          <label class="layui-form-label">用户名</label>
          <div class="layui-input-block">
            <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">手机号</label>
          <div class="layui-input-block">
            <input type="tel" name="phone" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="submit">提交</button>
          </div>
        </div>
      </form>
    `,
                area: ['500px', '300px']
            });
        });
    });

</script>--%>
<!-- 房源展示页面 -->
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">订单列表</legend>
    </fieldset>

    <div class="room-list" style="text-align: center;">
        <ul class="layui-clear" id="room-grid"></ul>
    </div>
    <div id="room-page"></div>
</div>

<!-- 定义模板 -->
<script type="text/html" id="room-tpl">
    {{# layui.each(d.data, function(index, item){ }}
    <li class="layui-col-xs6 layui-col-sm4 layui-col-md4">
        <div class="room-item">
            <img src="{{item.houseImage}}" alt="{{item.communityName}}" style="height: 60%;width: 60%;">
            <h3>{{item.communityName}}</h3>
            <p class="price">{{item.housePrice}} 元/天</p>
            <%--<button class="layui-btn layui-btn-primary layui-btn-sm reserve-btn" data-id="{{item.id}}">预定</button>--%>
            <div class="btn-wrapper">
                <button class="layui-btn layui-btn-primary layui-btn-sm reserve-btn" data-id="{{item.id}}">预定</button>
            </div>
        </div>
    </li>
    {{# }); }}
</script>

<script>
    layui.use(['laypage', 'laytpl','layer','jquery'], function(){
        var laypage = layui.laypage,
            laytpl = layui.laytpl,
            layer=layui.layer,
            $=layui.jquery;

        $.ajax({
            url: 'findAllHouse',
            type:'GET',
            data: {
                page: 1, // 当前页码
                limit: 12 // 每页显示的数量
            },
            dataType: 'json',
            success: function(res) {
                if (res.code === 0) {
                    // 将获取到的房源数据赋值给 roomData
                    var roomData = res.data;
                    laypage.render({
                        elem: 'room-page',
                        count: res.count, // 将总数替换为从后端获取的数据
                        limit: 12,
                        layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
                        jump: function(obj){
                            var start = (obj.curr - 1) * obj.limit,
                                end = obj.curr * obj.limit;
                            var data = {
                                data: roomData.slice(start, end)
                            };
                            laytpl($('#room-tpl').html()).render(data, function(html){
                                $('#room-grid').html(html);
                            });
                        }
                    });
                } else {
                    layer.msg(res.msg);
                }
            },
            error: function() {
                layer.msg('请求失败');
            }
        });

        // 预定按钮点击事件
        $(document).on('click', '.reserve-btn', function(){
            var roomId = $(this).data('id');
            layer.open({
                type: 1,
                title: '预定房间',
                area: ['500px', '500px'],
                content: '<div>请输入您的用户名和手机号</div>', // 此处可以放置预定窗口的内容
                btn: ['确认', '取消'],
                yes: function(index, layero){
                    // 在此处可以进行预定操作
                    layer.msg('预定成功');
                    layer.close(index);
                }
            });
        });
    });
</script>
</body>
</html>