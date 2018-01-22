<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加用户</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="/assets/css/admin.css">
    <link rel="stylesheet" href="/assets/css/app.css">
</head>

<body data-type="generalComponents">

<jsp:include page="../common/top.jsp"></jsp:include>

<div class="tpl-page-container tpl-page-header-fixed">

    <jsp:include page="../common/menu.jsp"></jsp:include>

    <div class="tpl-content-wrapper">
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    角色管理
                    /<small style="color: #697882">角色查询</small>
                </div>
            </div>
            <div class="tpl-block ">
                <div class="am-g tpl-amazeui-form">
                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal">
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">账户名 / Name</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-name" placeholder="账户名 / Name">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">性别 / Sex</label>
                                <div class="am-u-sm-9">
                                    <select class="am-form-label" style="height: 38px">
                                        <option value ="男" >男</option>
                                        <option value ="女" >女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
                                <div class="am-u-sm-9">
                                    <input type="email" id="user-email" placeholder="输入你的电子邮件 / Email">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
                                <div class="am-u-sm-9">
                                    <input type="tel" id="user-phone" placeholder="输入你的电话号码 / Telephone">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
                                <div class="am-u-sm-9">
                                    <input type="number" pattern="[0-9]*" id="user-QQ" placeholder="输入你的QQ号码">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-weibo" class="am-u-sm-3 am-form-label">地址 / Address</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="user-weibo" placeholder="输入你的地址 / Address">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
                                <div class="am-u-sm-9">
                                    <textarea class="" rows="5" id="user-intro" placeholder="输入个人简介"></textarea>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="button" class="am-btn am-btn-primary">确认提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/amazeui.min.js"></script>
<script src="/assets/js/app.js"></script>
<script>
    $(document).ready(function(){

        $(".tpl-left-nav-list li a").each(function(){

            $this = $(this);

            if($this[0].href==String(window.location)){

                $this.addClass("active");
                $("#role").addClass("active");
            }

        });

    });
</script>
</body>

</html>