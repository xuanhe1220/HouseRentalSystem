<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>支付页面</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/layui/2.5.6/css/layui.min.css">
    <style type="text/css">
        body {
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            margin-top: 50px;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }
        .pay-methods {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .pay-method {
            margin-right: 50px;
        }
        .pay-method img {
            width: 32px;
            height: 32px;
            margin-bottom: 10px;
        }
        .pay-method p {
            font-size: 14px;
            color: #666;
        }
        .pay-method:hover {
            cursor: pointer;
            opacity: 0.8;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="/static/img/二维码.png" alt="支付二维码">
    <div class="pay-methods">
        <div class="pay-method">
            <img src="/static/img/visa-01.png" alt="visa">
            <p>VISA</p>
        </div>
        <div class="pay-method">
            <img src="/static/img/微信支付.png" alt="wechat">
            <p>微信支付</p>
        </div>
        <div class="pay-method">
            <img src="/static/img/支付宝支付.png" alt="alipay">
            <p>支付宝支付</p>
        </div>
    </div>
</div>
<script src="https://cdn.staticfile.org/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/layui/2.5.6/layui.min.js"></script>
<script type="text/javascript">
    $(function() {
        // 绑定支付方式点击事件
        $('.pay-method').click(function() {
            alert('你选择了' + $(this).find('p').text() + '支付方式');
        });
    });
</script>
</body>
</html>