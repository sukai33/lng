<%@ page language="java" pageEncoding="UTF-8" import="java.util.*"
		 contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>登录</title>
	<meta name="description" content="这是一个 index 页面">
	<meta name="keywords" content="index">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="renderer" content="webkit">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="icon" type="image/png" href="assets/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<link rel="stylesheet" href="assets/css/amazeui.min.css" />
	<link rel="stylesheet" href="assets/css/admin.css">
	<link rel="stylesheet" href="assets/css/app.css">
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script src="assets/js/md5.js"></script>
	<script src="assets/js/app.js"></script>
</head>

<body data-type="login">

<div class="am-g myapp-login">
	<div class="myapp-login-logo-block  tpl-login-max">
		<div class="myapp-login-logo-text">
			<div class="myapp-login-logo-text">
				Awary HE <span> Login</span> <i class="am-icon-skyatlas"></i>

			</div>
		</div>

		<div class="login-font">
			<i>Log In </i> or <span> Sign Up</span>
		</div>
		<div class="am-u-sm-10 login-am-center">
			<form id="login" method="post" action="admin/login" class="am-form">
					<div class="am-form-group">
						<input type="tel" class="" id="tel" placeholder="输入11位手机号"
							   onkeyup="this.value=this.value.replace(/\D/g, '')">
					</div>
					<div class="am-form-group">
						<input type="password" class="" id="pwd" placeholder="设置个密码吧">
					</div>
					<p><button type="submit" class="am-btn am-btn-secondary am-round" style="width: 49.5%">登录</button>
						<button type="submit" class="am-btn am-btn-secondary am-round" style="width: 49.5%">注册</button></p>
			</form>
		</div>
	</div>
</div>
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1"
	 id="my-modal-loading">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			登陆中...
		</div>
		<div class="am-modal-bd">
			<span class="am-icon-spinner am-icon-spin"></span>
		</div>
	</div>
</div>

</body>
<script>
    $("form").submit(function (e) {
		e.preventDefault();
        $("#my-modal-loading").modal('open');
        $.ajax( {
            url : "admin/login?tel="+$("#tel").val()+ "&pwd="+md5($("#pwd").val()),
            dataType : "json",
            type : "post",
            success : function(data) {
                if (data.resultcode == 200) {
                    location.href = "admin/loginSuccess";
                } else if (data.result != null) {
                   $("#my-modal-loading").modal('close');
                   alert(data.result);
               }
            },
            error : function(data) {
                $("#my-modal-loading").modal('close');
                alert("服务器内部异常");
            }
        });
    });
</script>
</html>