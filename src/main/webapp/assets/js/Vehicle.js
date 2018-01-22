
$(document).ready(function() {

    // var currentPage = 0;
    // var scrollPage = 0;
    // var ajaxPage = 0;

    $("#findVehicleList").on("click", function () {
        var plateNum = $("#plateNum").val();
        var userName = $("#userName").val();
        var company = $("#company").val();
        /*
        if (plateNum == '' && userName == '' && company == '') {
            currentPage = 0;
            ajaxPage = 0;
        }*/
        $.ajax({
            url: "/admin/findVehicleList",
            type: "POST",
            data: {
                'plateNum': plateNum,
                'userName': userName,
                'company': company,
            },
            dataType: "json",
            success: function (date) {
                if (null != date) {
                    addRecords(date);
                }
                else {
                    alert("没有符合要求信息！")
                }


            },
            error: function () {
                alert("系统异常！");
            }
        });

    });
});
    function addRecords(data) {
        $("#addNewVehicleList").empty();
        $.each(data, function (n, value) {
            var records = "";
            n = n + 1;
            records += "<tr>";
            records += "<td>" + n + "</td>";
            records += "<td>" + value.plateNum + "</td>";
            records += "<td>" + value.userName + "</td>";
                records += "<td>" + value.phoneNum + "</td>";
            records += "<td>" + value.company + "</td>";
            records += "<td>" + value.depNum + "</td>";
            records += "<td>" + value.depName + "</td>";
            /*records += "<td>" + value.terNum + "</td>";
            records += "<td>" + value.terStatus + "</td>";
            records += "<td>" + value.potNum + "</td>";
            records += "<td>" + value.potStatus + "</td>";
            records += "<td>" + value.serviceEndTime + "</td>";
            records += "<td>" + value.serviceStatus + "</td>";*/
         /*   records += "<td><a class='' role='button' " +
                "onclick='recordDetail(" + value.id + "," + value.plateNum + ")' " +
                "href='#'  >详细</a> <td>\n" +*/
            records += "<td>" +
                "  <div class=\"am-btn-toolbar\">\n" +
                "     <div class=\"am-btn-group am-btn-group-xs\">\n" +
                "         <a class='' role='button' onclick='findVehicleDetail(" + value.id + ",\"" + value.plateNum + "\")' href='#'  >编辑</a>\n" +
                "          <a class='' role='button' href='/admin/deleteVehicle?id="+value.id+"'>删除</a>" +
                "      </div>\n" +
                "   </div>\n" +
                "  </td>";
            records += "</tr>"
            $("#addNewVehicleList").append(records);
        })
    }




function showList() {
    $("#recordList").show();
    $("#findVehicleDetail").css("display", "none");

}

function findVehicleDetail(id, plateNum) {
    $.ajax({
        url: "/admin/findVehicleDetail",
        type: "POST",
        data: {
            'id': id,
            'plateNum': plateNum,
        },
        dataType: "json",
        success: function (data) {
            $("#recordList").css("display", "none");
            var records = "";
            records += "<tr>";
            records += "<th width='10%'>车牌号</th>";
            records += "<td width='15%'>  " + data.plateNum + "</td>";
            records += "<th width='10%'>客户名称</th>";
            records += "<td width='15%'><input value='" + data.userName+ "'></input></td>";
            records += "</tr>"

            records += "<tr>";
            records += "<th width='10%'>电话</th>";
            records += "<td width='15%'><input value='" + data.phoneNum+ "'></input></td>";
            records += "<th width='10%'>所属公司</th>";
            records += "<td width='15%'><input value='" + data.company + "'></input></td>";
            records += "</tr>"

            records += "<tr>";
            records += "<th width='10%'>部门号</th>";
            records += "<td width='15%'><input value='" + data.depNum + "'></input></td>";
            records += "<th width='10%'>部门名</th>";
            records += "<td width='15%'><input value='" + data.depName + "'></input></td>";
            records += "</tr>"

            records += "<tr>";
            records += "<th width='10%'>终端号</th>";
            records += "<td width='15%'>" + data.terNum + "</td>";
            records += "<th width='10%'>终端状态</th>";
            records += "<td width='15%'><input value='" + data.terStatus + "'></input></td>";
            records += "</tr>"

            records += "<tr>";
            records += "<th width='10%'>气瓶号</th>";
            records += "<td width='15%'>" + data.potNum + "</td>";
            records += "<th width='10%'>气瓶状态</th>";
            records += "<td width='15%'><input value='" + data.potStatus + "'></input></td>";
            records += "</tr>"

            records += "<tr>";
            records += "<th width='10%'>服务到期时间</th>";
            records += "<td width='15%'><input value='" + data.serviceEndTime + "'></input></td>";
            records += "<th width='10%'>服务状态</th>";
            records += "<td width='15%'><input value='" + data.serviceStatus + "'></input></td>";
            records += "</tr>"
            $("#detailTbody").empty();
            $("#detailTbody").append(records);
            $("#findVehicleDetail").show();
        },
        error: function () {
            alert("系统错误");
        }
    });
}




