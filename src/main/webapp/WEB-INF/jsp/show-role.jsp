<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户查询</title>
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
            <table class="am-table am-table-hover table-main">
                <thead>
                <tr>
                    <th class="table-id">ID</th>
                    <th class="table-title">角色名</th>
                    <th class="table-type">角色code</th>
                    <th class="table-author am-hide-sm-only">部门</th>
                    <th class="table-author am-hide-sm-only">角色描述</th>
                    <th class="table-set">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${!empty roleList}">
                    <c:forEach var="role" items="${roleList}">
                        <tr>
                        <td>${role.role_id}</td>
                        <td>${role.role_name}</td>
                        <td>${role.role_code}</td>
                        <td>${role.dept}</td>
                        <td>${role.role_info}</td>
                        <td>
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</button>
                                    <button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</button>
                                </div>
                            </div>
                        </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

</div>


<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/amazeui.min.js"></script>
<script src="/assets/js/app.js"></script>
</body>
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
</html>