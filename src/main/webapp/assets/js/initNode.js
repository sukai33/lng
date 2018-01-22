var selnode ;
function initNode(node){

    var setting = {
        view: {
            selectedMulti: false
        },
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeCheck: beforeCheck,
            onCheck: onCheck
        }
    };

    var zNodes = node;
    var code, log, className = "dark";
    function beforeCheck(treeId, treeNode) {
        className = (className === "dark" ? "":"dark");
        showLog("[ "+getTime()+" beforeCheck ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name );
        return (treeNode.doCheck !== false);
    }
    function onCheck(e, treeId, treeNode) {
    	
    	var ids = [];
 		var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
 		var nodes=treeObj.getCheckedNodes(true);//获得被选中的节点
 		treeName="";
 		treeId="";
 		treeIdName="";
  	 	for(var i=0;i<nodes.length;i++){
  	 		treeName+=nodes[i].name + ","; //获取选中节点的name
  	 		treeId+=nodes[i].id+","; //获取选中节点的id
  	 		treeIdName+=nodes[i].id+':'+nodes[i].name+';';//获取选中节点的id:name的字符串
   		
  	 		ids[i] = nodes[i].id; //获取选中节点的id
  	 		//console.log(ids);
  	 	}
  	 	    selnode=treeIdName;
  	 	//alert(treeIdName); //获取选中节点的值和名称
  	 	wholeCheckedNodes=treeId.substring(0,treeId.length-1);
        showLog("[ "+getTime()+" onCheck ]&nbsp;&nbsp;&nbsp;&nbsp;" + treeNode.name );
    }
    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='"+className+"'>"+str+"</li>");
        if(log.children("li").length > 6) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    function getTime() {
        var now= new Date(),
                h=now.getHours(),
                m=now.getMinutes(),
                s=now.getSeconds(),
                ms=now.getMilliseconds();
        return (h+":"+m+":"+s+ " " +ms);
    }

    function checkNode(e) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                type = e.data.type,
                nodes = zTree.getSelectedNodes();
        if (type.indexOf("All")<0 && nodes.length == 0) {
            alert("请先选择一个节点");
        }

        if (type == "checkAllTrue") {
            zTree.checkAllNodes(true);
        } else if (type == "checkAllFalse") {
            zTree.checkAllNodes(false);
        } else {
            var callbackFlag = $("#callbackTrigger").attr("checked");
            for (var i=0, l=nodes.length; i<l; i++) {
                if (type == "checkTrue") {
                    zTree.checkNode(nodes[i], true, false, callbackFlag);
                } else if (type == "checkFalse") {
                    zTree.checkNode(nodes[i], false, false, callbackFlag);
                } else if (type == "toggle") {
                    zTree.checkNode(nodes[i], null, false, callbackFlag);
                }else if (type == "checkTruePS") {
                    zTree.checkNode(nodes[i], true, true, callbackFlag);
                } else if (type == "checkFalsePS") {
                    zTree.checkNode(nodes[i], false, true, callbackFlag);
                } else if (type == "togglePS") {
                    zTree.checkNode(nodes[i], null, true, callbackFlag);
                }
            }
        }
    }

    function setAutoTrigger(e) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.check.autoCheckTrigger = $("#autoCallbackTrigger").attr("checked");
        $("#autoCheckTriggerValue").html(zTree.setting.check.autoCheckTrigger ? "true" : "false");
    }

    $(document).ready(function(){
        var s = $("#treeDemo");
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#checkTrue").bind("click", {type:"checkTrue"}, checkNode);
        $("#checkFalse").bind("click", {type:"checkFalse"}, checkNode);
        $("#toggle").bind("click", {type:"toggle"}, checkNode);
        $("#checkTruePS").bind("click", {type:"checkTruePS"}, checkNode);
        $("#checkFalsePS").bind("click", {type:"checkFalsePS"}, checkNode);
        $("#togglePS").bind("click", {type:"togglePS"}, checkNode);
        $("#checkAllTrue").bind("click", {type:"checkAllTrue"}, checkNode);
        $("#checkAllFalse").bind("click", {type:"checkAllFalse"}, checkNode);

        $("#autoCallbackTrigger").bind("change", {}, setAutoTrigger);
    });
}