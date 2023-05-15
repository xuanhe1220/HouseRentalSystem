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
        <legend style="font-size: 26px">添加用户</legend>
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
                <input type="password" name="password" required lay-verify="required" placeholder="密码"
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
                <input type="password" name="name" lay-verify="required" placeholder="昵称"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="regist">提交</button>
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
                /^[\S]{11}$/
                ,'手机号必须为11位，且不能出现空格'
            ]
        });

        form.on('submit(regist)',function () {
            if($("input[name='uName']").val()!=""&&$("input[name='uPassword']").val()!=""&&$("input[name='uPhoneNumber']").val()!=""&&$("input[name='uNickName']").val()!=""){
                if($("input[name='uPhoneNumber']").val().length==11) {
                    $.post("regist",$('.form').serialize(),function (res) {
                        console.log(res)
                        if(res=='OK'){
                            layer.close(layer_index);
                            layer.alert("注册成功",{icon:1,time:2000});
                            $('.form')[0].reset();
                        }else{
                            layer.msg("注册失败,用户名以存在",{icon:5});
                            $("input[name='username']").focus();
                            return false;
                        }
                    })
                } else {
                    layer.msg("手机号码不存在",{icon:5});
                    $("input[name='phonenumber']").focus();
                    return false;
                }
            }else{
                layer.msg("请填写所有表单");
            }
        })
    });
</script>
</body>
</html>