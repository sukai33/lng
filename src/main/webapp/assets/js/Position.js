

$(function () {

    var currentPage = 0;
    var scrollPage = 0;
    var ajaxPage = 0;

    $("#findPositionList").on("click", function () {
        var plateNum = $("#plateNum").val();
        var status = $("#status").val();
        var reportTime = $("#reportTime").val();

        if (plateNum == '' && status == '' && reportTime == '') {
            currentPage = 0;
            ajaxPage = 0;
        }
        $.ajax({
            url: "findPositionList",
            type: "POST",
            data: {
                'plateNum': plateNum,
                'status': status,
                'reportTime': reportTime,
            },
            dataType: "json",
            success: function (date) {
                if (null != date)
                {
                    addRecords(date);
                }
                else
                {
                    alert("没有符合要求信息！")
                }


            },
            error: function () {
                alert("系统异常！");
            }
        });

    });

    function addRecords(data) {
        $("#addNewPositionList").empty();
        $.each(data, function (n, value) {
            var records = "";
            n = n + 1;
            records += "<tr>";
            records += "<td>" + n + "</td>";
            records += "<td>" + value.plateNum + "</td>";
            records += "<td>" + value.speed + "</td>";
            records += "<td>" + value.direction + "</td>";
            records += "<td>" + value.status + "</td>";
            records += "<td>" + value.reportTime + "</td>";
            records += "<td>" + value.longitude + "</td>";
            records += "<td>" + value.latitude + "</td>";
            records += "<td><div class=\"am-btn-toolbar\">\n" +
                "     <div class=\"am-btn-group am-btn-group-xs\">\n" +
                "        <a class='' role='button'onclick='recordDetail(\" + value.id + \",\" + value.plateNum + \")' href='#'  >详细</a>\n" +
                "         <a class='' role='button'onclick='recordDetail(\" + value.id + \",\" + value.plateNum + \")' href='#'  >删除</a>\n" +
                "    </div>\n" +
                "  </div></td>";
            records += "</tr>"
            $("#addNewPositionList").append(records);
        })
    }

})


