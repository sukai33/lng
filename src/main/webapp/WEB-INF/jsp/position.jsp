<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>位置监控</title>
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
    <!-- baiduMap api -->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=BWXQXlM3FUCVbmN1xDuUKky0"></script>
</head>

<body data-type="generalComponents">

<jsp:include page="../common/top.jsp"></jsp:include>

<div class="tpl-page-container tpl-page-header-fixed">

    <jsp:include page="../common/menu.jsp"></jsp:include>

    <div class="tpl-content-wrapper">
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    车辆位置实时监控
                </div>
            </div>
            <div class="tpl-block ">
                <div class="am-g tpl-amazeui-form">
                    <div class="am-u-sm-12 am-u-md-9">
                        车牌号 :
                        <input id="plateNum" maxlength="30" style="width: 168px">
                        <button type="button" class="am-btn am-btn-secondary am-radius  "
                                id="findPosition"><span class="am-icon-search"></span>&nbsp;搜&nbsp;索
                        </button>
                    </div>
                </div>
                <br>
                <div id="baiduMap" style="height: 500px"></div>
            </div>
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

    $("#findPosition").on("click", function () {
        var plateNum = $("#plateNum").val();

        $.ajax({
            url: "/admin/findPosition",
            type: "POST",
            data: {
                'plateNum': plateNum,
            },
            dataType: "json",
            success: function (date) {
                baidumap(date);
            },
            error: function () {
                alert("没有该车辆的位置信息")
            }
        });

    });

    function baidumap(position) {
        map = new BMap.Map("baiduMap");  //创建Map实例
        var point = new BMap.Point(position.longitude,position.latitude);  //创建point位置
        if(position.direction=="正北"){
            var myIcon = new BMap.Icon("/assets/img/car0.gif", new BMap.Size(40,40));
        }
        if(position.direction=="东北"){
            var myIcon = new BMap.Icon("/assets/img/car45.gif", new BMap.Size(40,40));
        }
        if(position.direction=="正东"){
            var myIcon = new BMap.Icon("/assets/img/car90.gif", new BMap.Size(40,40));
        }
        if(position.direction=="东南"){
            var myIcon = new BMap.Icon("/assets/img/car135.gif", new BMap.Size(40,40));
        }
        if(position.direction=="正南"){
            var myIcon = new BMap.Icon("/assets/img/car180.gif", new BMap.Size(40,40));
        }
        if(position.direction=="西南"){
            var myIcon = new BMap.Icon("/assets/img/car225.gif", new BMap.Size(40,40));
        }
        if(position.direction=="正西"){
            var myIcon = new BMap.Icon("/assets/img/car270.gif", new BMap.Size(40,40));
        }
        if(position.direction=="西北"){
            var myIcon = new BMap.Icon("/assets/img/car315.gif", new BMap.Size(40,40));
        }
        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
        map.centerAndZoom(point, 15);  //设置地图中心点及缩放级别
        map.addControl(new BMap.NavigationControl());
        var marker = new BMap.Marker(point,{icon:myIcon});  //创建一个Marker点
        map.addOverlay(marker);  //将Marker点覆盖到地图上
        //marker.setAnimation(BMAP_ANIMATION_BOUNCE);  //使Marker点跳动起来
        var opts = {
            width : 200,     // 信息窗口宽度
            height: 180,     // 信息窗口高度
            title : "实时数据" , // 信息窗口标题
        }
        var infoWindow = new BMap.InfoWindow("<br>车牌号:" + position.plateNum +
            "<br>速度：" + position.speed + "km/h" +
            "<br>状态：行驶中"+
            "<br>统计时间：" + position.reportTime, opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow,point); //开启信息窗口
        marker.addEventListener("mouseover", function(){
            map.openInfoWindow(infoWindow,point); //开启信息窗口
        });
        marker.addEventListener("mouseout", function(){
            map.closeInfoWindow(infoWindow,point); //关闭信息窗口
        });

        // 定义一个控件类,即function
        function ZoomControl(){
            // 默认停靠位置和偏移量
            this.defaultAnchor = BMAP_ANCHOR_TOP_RIGHT;
            this.defaultOffset = new BMap.Size(5, 5);
        }

        // 通过JavaScript的prototype属性继承于BMap.Control
        ZoomControl.prototype = new BMap.Control();

        // 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
        // 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
        ZoomControl.prototype.initialize = function(testzomm){

            // 创建一个DOM元素
            var div = document.createElement("div");

            var sonDiv = document.createElement("div");//创建子div
            var img = document.createElement("img");
            img.src = "/assets/img/car90.gif";
            sonDiv.appendChild(img);
            var span = document.createElement("span");
            span.innerText="行驶";////给子sonDiv的文本节点赋值
            sonDiv.appendChild(span);
            sonDiv.style.textAlign = "center";
            sonDiv.style.height = "40px";
            div.appendChild(sonDiv);//将子sonDiv赋值给父parentDiv

            var sonDiv2 = document.createElement("div");//创建子div
            var img2 = document.createElement("img");
            img2.src = "/assets/img/car90_E.gif";
            sonDiv2.appendChild(img2);
            var span2 = document.createElement("span");
            span2.innerText="离线";////给子sonDiv的文本节点赋值
            sonDiv2.appendChild(span2);
            sonDiv2.style.textAlign = "center";
            sonDiv2.style.height = "40px";
            div.appendChild(sonDiv2);//将子sonDiv赋值给父parentDiv

            var sonDiv3 = document.createElement("div");//创建子div
            var img3 = document.createElement("img");
            img3.src = "/assets/img/car90_S.gif";
            sonDiv3.appendChild(img3);
            var span3 = document.createElement("span");
            span3.innerText="停止";////给子sonDiv的文本节点赋值
            sonDiv3.appendChild(span3);
            sonDiv3.style.textAlign = "center";
            sonDiv3.style.height = "40px";
            div.appendChild(sonDiv3);//将子sonDiv赋值给父parentDiv

            var sonDiv4 = document.createElement("div");//创建子div
            sonDiv4.innerText="刷新";////给子sonDiv的文本节点赋值
            sonDiv4.style.textAlign = "center";
            sonDiv4.style.height = "30px";
            div.appendChild(sonDiv4);//将子sonDiv赋值给父parentDiv


            // 设置样式
            div.style.cursor = "pointer";
            div.style.border = "1px solid gray";
            div.style.backgroundColor = "white";
            div.style.height = "150px";
            div.style.width = "108px";

/*            // 绑定事件,点击一次放大两级
            sonDiv.onclick = function(e){
                map.setZoom(map.getZoom() + 1);
            }
            sonDiv2.onclick = function(e){
                map.setZoom(map.getZoom() - 1);
            }
            sonDiv4.onclick = function(e){
                mapp(p);
            }*/
            sonDiv4.onclick = function(e){
                document.getElementById("findPosition").click();
            }

            // 添加DOM元素到地图中
            map.getContainer().appendChild(div);
            // 将DOM元素返回
            return div;
        }
        // 创建控件
        var myZoomCtrl = new ZoomControl();
        // 添加到地图当中
        map.addControl(myZoomCtrl);

    }


</script>
</html>