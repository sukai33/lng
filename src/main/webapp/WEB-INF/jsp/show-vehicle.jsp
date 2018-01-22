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
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/amazeui.min.js"></script>
    <script src="/assets/js/app.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/Vehicle.js" type="text/javascript"  charset="UTF-8"></script>
</head>

<body data-type="generalComponents">

<jsp:include page="../common/top.jsp"></jsp:include>

<div class="tpl-page-container tpl-page-header-fixed" >

    <jsp:include page="../common/menu.jsp"></jsp:include>

    <div class="tpl-content-wrapper">
        <div class="tpl-portlet-components" id="recordList">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    车辆管理
                    /<small style="color: #697882">车辆列表</small>
                </div>
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
              <%--  <button type="button" class="am-btn am-btn-secondary am-radius  " id="exportChargeInfos"
                        id="qkss" style="background-color: #585858;border-color: #585858">
                    <span class="am-icon-arrow-up"></span>&nbsp;导出充值明细

                </button>--%>
            </div>
            <table class="am-table am-table-hover table-main">
                <thead>
                <tr>
                    <th class="table-id">序号</th>
                    <th class="table-title">车牌号</th>
                    <th class="table-type">客户名称</th>
                    <th class="table-author am-hide-sm-only" >电话</th>
                    <th class="table-author am-hide-sm-only" >所属公司</th>
                    <th class="table-author am-hide-sm-only" >部门号</th>
                    <th class="table-author am-hide-sm-only" >部门名</th>
                  <%--  <th class="table-author am-hide-sm-only" >终端号</th>
                    <th class="table-author am-hide-sm-only" >终端状态</th>
                    <th class="table-author am-hide-sm-only" >气瓶号</th>
                    <th class="table-author am-hide-sm-only" >气瓶状态</th>
                    <th class="table-author am-hide-sm-only" >服务到期时间</th>
                    <th class="table-author am-hide-sm-only" >服务状态</th>--%>
                    <th class="table-set">操作</th>
                </tr>
                </thead>
                <tbody id="addNewVehicleList">
                <c:if test="${!empty VehicleList}">
                    <c:forEach var="vehicleList" items="${VehicleList}" varStatus="sta">
                        <tr>
                            <td>${sta.index+1}</td>
                            <td>${vehicleList.plateNum}</td>
                            <td>${vehicleList.userName}</td>
                            <td>${vehicleList.phoneNum}</td>
                            <td>${vehicleList.company}</td>
                            <td>${vehicleList.depNum}</td>
                            <td>${vehicleList.depName}</td>
                            <%--<td>${vehicleList.terNum}</td>--%>
                            <%--<td>${vehicleList.terStatus}</td>--%>
                            <%--<td>${vehicleList.potNum}</td>--%>
                            <%--<td>${vehicleList.potStatus}</td>--%>
                            <%--<td>${vehicleList.serviceEndTime}</td>--%>
                            <%--<td>${vehicleList.serviceStatus}</td>--%>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <a class="" role="button"
                                           onclick='findVehicleDetail ("${vehicleList.id}","${vehicleList.plateNum}")'
                                        href="#">编辑</a>
                                        <%--<input class="" type="button" value="删除"
                                           onclick='deleteVehicle("${vehicleList.id}")'></input>--%>
                                        <a class="" role="button"
                                           href='/admin/deleteVehicle?id=${vehicleList.id}'>删除</a>
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

<div class="tpl-portlet-components" style="display: none" id="findVehicleDetail">
    <div class="portlet-title">
        <div class="caption font-green bold">
            车辆列表
            /<small style="color: #697882">车辆详情</small>
        </div>
    </div>
    <table class="am-table am-table-hover table-main">
        <tbody id="detailTbody">
        </tbody>
    </table>

    <div style="text-align: center"><input type="button" name="button1"
                                          style="text-align: center;width: 22%;height: 35px;margin-top: 3%;background-color:#4382F0;border-radius: 2%;"
                                          value="返回上一级"
                                          onclick="showList()">
                      <input type="button" name="button1"
                                          style="text-align: center;width: 22%;height: 35px;margin-top: 3%;background-color:#4382F0;border-radius: 2%;"
                                          value="确认提交"
                                          onclick="showList(${vehicleList.id})">
    </div>
</div>



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