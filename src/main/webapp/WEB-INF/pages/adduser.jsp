<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<div class="wapper" style="width: 500px;margin-top: 40px">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">添加用户信息</legend>
    </fieldset>
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="password" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required|pass" placeholder="密码"
                       autocomplete="off"
                       class="layui-input" lay-verify="pass">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="password" name="phonenumber" lay-verify="required|pass" placeholder="手机号"
                       autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">长度为11位数字的手机号</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-inline">
                <input type="password" name="name" lay-verify="required|pass" placeholder="昵称"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateAdmin">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'form','layer'], function () {
        var element = layui.element,
            form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;
        form.verify({
            pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
        });

        form.on('submit(updateAdmin)',function (data) {
            var pwd = $("input[name='newpwd']").val();
            var pwd2 = $("input[name='newpwdagain']").val();
            if(pwd!=pwd2){
                layer.msg("两次输入密码密码不一样",{icon:5});
                $("input[name='newpwdagain']").focus();
                return false;
            }
            $.post("updateAdminPwd",data.field,function (res) {
                if(res=="OK"){
                    layer.msg("密码修改成功",{icon:1});
                    $("form")[0].reset();
                }else if(res=="ERROR"){
                    layer.msg("原密码错误",{icon:5});
                }else{
                    layer.msg("修改失败",{icon:5});
                }
            });
            return false;
        })
    });
</script>
</body>
</html>