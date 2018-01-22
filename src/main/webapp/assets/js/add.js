$("form").submit(function () {
    if (selnode == undefined) {
        alert("请选择权限信息");
        return false;
    }
    var array = selnode.split(";");
    var menuid = "";
    var role_name = $(".role_name").val();
    var role_info = $(".role_info").val();
    var role_code = $(".role_code").val();
    var dept = $("#depts").val();


    for (var i = 0; i < array.length - 1; i++) {
        if (i == array.length - 2) {
            menuid += array[i].substring(0, array[i].indexOf(":"));
        } else {
            menuid += array[i].substring(0, array[i].indexOf(":")) + ",";
        }

    }


    $.ajax({
        url: "/role/insertRole",
        data: JSON.stringify({
            "role_code": role_code,
            "role_name": role_name,
            "role_info": role_info,
            "menu_id": menuid,
            "dept": dept
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

$(document).ready(function(){
    //获取所有菜单
    getAllMenu();

    getAllDept();
    $(".tpl-left-nav-list li a").each(function(){

        $this = $(this);

        if($this[0].href==String(window.location)){

            $this.addClass("active");
            $("#role").addClass("active");
        }

    });

});
function getAllMenu(){
    $.ajax({
        url:"/admin/findAllMenu",
        success:function(data){
            data=eval(data);
            initNode(data);
        },error:function(){
            alert("获取菜单信息异常");
        }
    });
}

function getAllDept(){
    $.ajax({
        url:"/admin/findAllDept",
        success:function(data){
            var datas = data.result;
            for (var i in datas){
                $("#depts").append("<option>" + datas[i] + "</option>");
            }
        },error:function(){
            alert("获取所有部门信息异常");
        }
    })
}