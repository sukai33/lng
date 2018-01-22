<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>车辆列表</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/view/assets/img/logo.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/view/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/assets/css/app.css">
    <script src="${pageContext.request.contextPath}/view/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/vehicle/Vehicle.js" type="text/javascript"  charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath}/view/assets/js/app.js"></script>

    <style>
        table tbody {
            display:block;
            height:400px;
            overflow-y:auto;
            width: calc( 100% - 1em );

        }

        table thead, tbody tr {
            display:table;
            width:100%;
            table-layout:fixed;
        }

        table thead {
            width: calc( 100% - 1em );
        }
    </style>
</head>

<body data-type="generalComponents">

<jsp:include page="../common/top.jsp"></jsp:include>

<div class="tpl-page-container tpl-page-header-fixed"  id="recordList">

    <div align="center">
        <span class="tpl-header-nav-hover-icf am-margin-right">车辆列表</span><br/>
        <hr width="86%" style="height:1px;border-top: 0.5px solid #b3b3b3;margin-top: 4px" color="#eee"/>
    </div>
    <div class="am-form-inline" role="form" align="center">
        <div class="am-input-group">
            <span class="am-input-group-label">选择车辆</span>
            <input type="text" class="am-form-field"  id= "plateNum" placeholder="请输入车牌号...">
        </div>

        <div class="am-input-group">
            <span class="am-input-group-label">客户名称</span>
            <input type="text"  id="userName" class="am-form-field" placeholder="请输入客户名称..." />
        </div>
        <div class="am-input-group">
            <span class="am-input-group-label">所属公司</span>
            <input type="text" id="company"  class="am-form-field" placeholder="请输入所属公司..."/>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" class="am-btn am-btn-secondary am-radius  "
                id="findVehicleList"><span class="am-icon-search"></span>&nbsp;搜&nbsp;索

        </button>
        <button type="button" class="am-btn am-btn-secondary am-radius  " id="exportChargeInfos"
                id="qkss" style="background-color: #585858;border-color: #585858">
            <span class="am-icon-arrow-up"></span>&nbsp;导出充值明细

        </button>
    </div>
    <div align="center" id="sctable">
        <table class="am-table am-table-hover table-main">
            <thead>
            <tr>
                <th class="table-author am-hide-sm-only" >序号</th>
                <th class="table-author am-hide-sm-only" >车牌号</th>
                <th class="table-author am-hide-sm-only" >客户名称</th>
                <th class="table-author am-hide-sm-only" >电话</th>
                <th class="table-author am-hide-sm-only" >所属公司</th>
                <th class="table-author am-hide-sm-only" >部门号</th>
                <th class="table-author am-hide-sm-only" >部门名</th>
                <th class="table-author am-hide-sm-only" >终端号</th>
                <th class="table-author am-hide-sm-only" >终端状态</th>
                <th class="table-author am-hide-sm-only" >气瓶号</th>
                <th class="table-author am-hide-sm-only" >气瓶状态</th>
                <th class="table-author am-hide-sm-only" >服务到期时间</th>
                <th class="table-author am-hide-sm-only" >服务状态</th>
                <th class="table-set">详情</th>
            </tr>
            </thead>
            <tbody  id="addNewVehicleList">
            <%--<c:if test="${!empty VehicleList}">--%>
            <c:forEach var="vehicleList" items="${VehicleList}" varStatus="sta">
                <tr>
                    <td>${sta.index+1}</td>
                    <td>${vehicleList.plateNum}</td>
                    <td>${vehicleList.userName}</td>
                    <td>${vehicleList.phoneNum}</td>
                    <td>${vehicleList.company}</td>
                    <td>${vehicleList.depNum}</td>
                    <td>${vehicleList.depName}</td>
                    <td>${vehicleList.terNum}</td>
                    <td>${vehicleList.terStatus}</td>
                    <td>${vehicleList.potNum}</td>
                    <td>${vehicleList.potStatus}</td>
                    <td>${vehicleList.serviceEndTime}</td>
                    <td>${vehicleList.serviceStatus}</td>
                    <td><a class="" role="button"
                           onclick='findVehicleDetail("${vehicleList.id}","${vehicleList.plateNum}")'
                           href='#'>详情</a></td>
                </tr>

            </c:forEach>
            <%--  </c:if>--%>
            </tbody>
        </table>
    </div>
</div>

<div class="tpl-page-container tpl-page-header-fixed" style="display: none" id="findVehicleDetail">
    <div align="center" style="height: 70px">
        <div class="am-btn-group">

        </div>
    </div>
    <div align="center">
        <span class="tpl-header-nav-hover-icf am-margin-right">消费明细</span><br/>
        <hr width="86%" style="height:1px;border-top: 0.5px solid #b3b3b3;margin-top: 4px" color="#eee"/>
    </div>

    <div align="center">
        <table class="am-table am-table-hover table-main t1">
            <tbody id="detailTbody">
            </tbody>
        </table>
    </div>
    <div style="text-align: center"><input type="button" name="button1"
                                           style="text-align: center;width: 22%;height: 35px;margin-top: 3%;background-color:#4382F0;border-radius: 2%;"
                                           value="返回上一级"
                                           onclick="showList()"></div>
</div>


<%-- <jsp:include page="../common/footer.jsp"></jsp:include> --%>



</body>
<script>
    $(document).ready(function () {

        $("#oilcard").addClass("s12");
    });
</script>
</html>

