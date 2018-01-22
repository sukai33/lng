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
                    车辆管理
                    /<small style="color: #697882">车辆位置列表</small>
                </div>

            </div>
            <div class="am-form-inline" role="form" align="center">
            <div class="am-input-group">
                <span class="am-input-group-label">选择车辆</span>
                <input type="text" class="am-form-field"  id= "plateNum" placeholder="请输入车牌号...">
            </div>

            <div class="am-input-group">
                <span class="am-input-group-label" style="width: 72px">状态</span>
                <select type="text"  id="status" class="am-form-field gas_time_st" style="width: 150px" />
                <option value="">请选择状态</option>
                <option value="1">行驶</option>
                <option value="2">静止</option>
                <option value="3">未知</option>
                </select>
            </div>

            <div class="am-input-group">
                <span class="am-input-group-label">统计时间</span>
                <input type="text" id="reportTime"  class="am-form-field gas_time_end" placeholder="选择日期" data-am-datepicker="{theme: 'success'}" onfocus="this.blur();"/>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="am-btn am-btn-secondary am-radius  "
                    id="findPositionList"><span class="am-icon-search"></span>&nbsp;搜&nbsp;索

                <%--</button>
                <button type="button" class="am-btn am-btn-secondary am-radius  " id="exportChargeInfos"
                        id="qkss" style="background-color: #585858;border-color: #585858">
                    <span class="am-icon-arrow-up"></span>&nbsp;导出充值明细--%>

            </button>
        </div>
            <table class="am-table am-table-hover table-main">
                <thead>
                <tr>
                    <th class="table-author am-hide-sm-only">序号</th>
                    <th class="table-author am-hide-sm-only">车牌号</th>
                    <th class="table-author am-hide-sm-only">速度</th>
                    <th class="table-author am-hide-sm-only">方向</th>
                    <th class="table-author am-hide-sm-only">状态</th>
                    <th class="table-author am-hide-sm-only">统计时间</th>
                    <th class="table-author am-hide-sm-only">经度</th>
                    <th class="table-author am-hide-sm-only">纬度</th>
                    <th class="table-set">操作</th>
                </tr>
                </thead>
                <tbody id="addNewPositionList">
                <c:if test="${!empty PositionList}">
                    <c:forEach var="positionList" items="${PositionList}" varStatus="sta">
                        <tr>
                            <td>${sta.index+1}</td>
                            <td>${positionList.plateNum}</td>
                            <td>${positionList.speed}</td>
                            <td>${positionList.direction}</td>
                            <td>${positionList.status}</td>
                            <td>${positionList.reportTime}</td>
                            <td>${positionList.longitude}</td>
                            <td>${positionList.latitude}</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <a class="" role="button"
                                           onclick='gasrecordDetail("${consumList.record_id}","${consumList.card_id}")'
                                           href='#'>编辑</a>
                                        <a class="" role="button"
                                           onclick='gasrecordDetail("${consumList.record_id}","${consumList.card_id}")'
                                           href='#'>删除</a>
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
<script src="${pageContext.request.contextPath}/assets/js/Position.js" type="text/javascript"  charset="UTF-8"></script>
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