<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/18
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加车辆</title>
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
                    车辆管理
                    /<small style="color: #697882">添加车辆</small>
                </div>
            </div>
            <div class="tpl-block ">
                <div class="am-g tpl-amazeui-form">
                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal">
                            <div class="am-form-group">
                                <label for="plateNum" class="am-u-sm-3 am-form-label">车牌号 / plateNum</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="plateNum" placeholder="车牌号/ Name">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="userName" class="am-u-sm-3 am-form-label">客户名称 / userName</label>
                                <div class="am-u-sm-9">
                                    <input type="text" id="userName" placeholder="客户名称/ Name">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="phoneNum" class="am-u-sm-3 am-form-label">电话 /  Telephone</label>
                                <div class="am-u-sm-9">
                                    <input type="email" id="phoneNum" placeholder="输入你的电话 /  Telephone">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="company" class="am-u-sm-3 am-form-label">电话 / company</label>
                                <div class="am-u-sm-9">
                                    <input type="tel" id="company" placeholder="输入你的所属公司 / company">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="depNum" class="am-u-sm-3 am-form-label">部门号</label>
                                <div class="am-u-sm-9">
                                    <input type="number" pattern="[0-9]*" id="depNum" placeholder="输入你的部门号">
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="depName" class="am-u-sm-3 am-form-label">部门名</label>
                                <div class="am-u-sm-9">
                                    <input type="number" pattern="[0-9]*" id="depName" placeholder="输入你的部门名">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary">确认提交</button>
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
