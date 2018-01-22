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
    <link rel="stylesheet" href="/tree/css/zTreeStyle/zTreeStyle.css">
</head>

<body data-type="generalComponents">

<jsp:include page="../common/top.jsp"></jsp:include>

<div class="tpl-page-container tpl-page-header-fixed">

    <jsp:include page="../common/menu.jsp"></jsp:include>

    <div class="tpl-content-wrapper">
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    机构管理
                    /<small style="color: #697882">添加机构</small>
                </div>
            </div>
            <div class="tpl-block ">
                <div class="am-g tpl-amazeui-form">
                    <form class="am-form am-form-horizontal"  >
                        <div class="am-form-group">
                            <label for="dept_name" class="am-u-sm-3 am-form-label">机构名称 / Name</label>
                            <div class="am-u-sm-9">
                                <input type="text" id="dept_name" style="width: 50%" class="dept_name" placeholder="机构名称 / Name">
                                <input type="hidden" class="role_id" id="doc-ipt-3"   value=""   >
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="mobile" class="am-u-sm-3 am-form-label">联系电话 / Tel</label>
                            <div class="am-u-sm-9">
                                <input type="text" style="width: 50%" id="mobile" class="mobile" placeholder="联系电话 / Tel">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="dept_info" class="am-u-sm-3 am-form-label">机构描述 / Info</label>
                            <div class="am-u-sm-9">
                                <input type="text" id="dept_info"  style="width: 50%" class="dept_info" placeholder="机构描述 / Info">
                            </div>
                        </div>
                        <br>


                        <div class="am-form-group">
                            <div class="am-u-sm-10 am-u-sm-offset-2">
                                <button type="submit" class="am-btn am-btn-success am-btn-default" >确认添加</button>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/amazeui.min.js"></script>
<script src="/assets/js/initNode.js"></script>
<script src="/assets/js/app.js"></script>
<script src="/assets/js/editingRole-list-qxZtree.js"></script>

<script type="text/javascript" src="/tree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="/tree/js/jquery.ztree.excheck-3.5.js"></script>
<script>
    $("form").submit(function () {
        var dept_parentId = 0;
        var dept_name = $(".dept_name").val();
        var mobile = $(".mobile").val();
        var dept_info = $(".dept_info").val();


        $.ajax({
            url: "/role/insertDept",
            data: JSON.stringify({
                "dept_name": dept_name,
                "mobile": mobile,
                "dept_info": dept_info,
                "dept_parentId": dept_parentId,
            }),
            type: 'post',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                alert(eval(data));
                if (eval(data) == "success") {
                    alert("添加成功");
                    $("form")[0].reset();
                    $("select option:eq(0)").attr("selected", "selected");
                    getAllMenu();
                } else {
                    alert("添加失败");
                }
            }, error: function () {
                alert("通信异常");
            }
        });

        return false;
    });
</script>
</body>

</html>