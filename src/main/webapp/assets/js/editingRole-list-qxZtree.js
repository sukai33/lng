	/*
	 *  Ztree操作说明
	1、根据id获取树的某个节点：
 	var zTree = $.fn.zTree.getZTreeObj("mytree");
 	var node = zTree.getNodeByParam("id",1);
	2、设置node节点选中状态：
	zTree.selectNode(node);
	3、设置node节点checked选中,有两种方法实现:
	（1）、zTree.checkNode(node, true, true);
	（2）、node.checked = true;
     zTree.updateNode(node);  // 注：设置checked属性之后，一定要更新该节点，否则会出现只有鼠标滑过的时候节点才被选中的情况
	4、获取树的根节点：
	var nodes = zTree.getNodes();
	var pnode = nodes[0]; //注：只有当树的根节点只有一个时，才可以这样取，否则会获取到多个节点
	5、ztree获取选中节点的子节点的方法：// 该方法参考自： http://my.oschina.net/webas/blog/110295 ，本人还未测试。。
	var nodes = zTree.getSelectedNodes();
	var treeNode = nodes[0];
	var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
	for(var i=0;i<treeNode.children.length;i++) {
		var childNode = treeNode.children[i];
		alert('childNode.name: '+childNode.name);
	}
	*/
		
		function popalert(content,style,icon){
			//icon:1表示对号，icon:2表示差号
			var style=(style==null || style=='')?'layui-layer-lan':style;//'layer-ext-moon'
			layer.alert(content, {
				skin: style
				,closeBtn: 2
				,icon: icon
				,shift: 4 //动画类型
			}, function(index){
				layer.close(index);
			});
		}
		//获取选中节点的全局变量
		var wholeCheckedNodes='';
		//获得节点对象
		var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
		var setting = {
			check: {
				enable: true,
				chkStyle: "checkbox",
				autoCheckTrigger: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
            callback:{
                onCheck:onCheck
            }
		};

		
		//获取选中的节点
		 function onCheck(event,treeId,treeNode){
		 		var ids = [];
//		 		var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
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
          	 	
          	 	//alert(treeIdName); //获取选中节点的值和名称
          	 	wholeCheckedNodes=treeId.substring(0,treeId.length-1);
       }
       //获取当前选中节点的子节点id集合,
       //treeNode：当前选中节点的子节点
       function getChildNodes(treeNode) {//1.获取当前节点
    	   
    		var childNodes = ztree.transformToArray(treeNode);//2.用ztree的方法transformToArray()获取当前选中节点（含选中节点）的子节点对象集合。
    		var nodes = new Array();
    		for(i = 0; i < childNodes.length; i++) {//3.遍历集合，取出需要的值。
         		nodes[i] = childNodes[i].id;
    		}
    		return nodes.join(",");
		}
       
       //保存权限设置Ajax
        function saveQxSz(){
    		//提交数据
    		$.ajax({
    			type:"POST",
    			contentType:"application/json;charset=utf-8",
    			url:"RoleController/updateRoleInfo",
    			data:JSON.stringify({
    				"role_id":editQxRoleId,//角色id
    				"pid":wholeCheckedNodes//角色状态
    			}),
    			success:function(data){
    				if(data>0){
						popalert('保存成功！','',1);
    				}else{
    					popalert('保存失败，请联系管理员！','',2);
    				}
    			},error:function(data){
    				
    			}
    		});
        }
        //初始化获得数据库中选中状态
        function initGetQxStatus(id){
        	var treeNodes;
   			//提交数据
   			$.ajax({
   				type:"POST",
   	    		async:false, 
   				contentType:"application/json;charset=utf-8",
   				url:"MenuController/searchzNodesInfo",
   				success:function(data){
   					if(data){
   				        treeNodes = data;
   					}else{
   						popalert('获取失败，请联系管理员！','',2);
   					}
   				},error:function(data){
   					
   				}
   			});

	        //权限树设置
   			$.fn.zTree.init($("#treeDemo"), setting, treeNodes);
	        //$.fn.zTree.init($("#treeDemo"), setting, zNodes);
        	setting.check.chkboxType = { "Y" : "ps", "N" : "ps" };
        	
        	//每次点击授权进来时，先清除选中状态
        	treeObj = $.fn.zTree.getZTreeObj("treeDemo");//获得节点对象
        	treeObj.checkAllNodes(false);//设置所有节点为非选中状态
        	//提交数据
    		$.ajax({
    			type:"POST",
    			contentType:"application/json;charset=utf-8",
    			url:"RoleController/searchRoleInfo",
    			data:JSON.stringify({
    				"role_id":id//角色id
    			}),
    			success:function(data){
					$(data).each(function(i,e){
						//--------------------------------------------设置某个节点选中begin--------------------------------------------------//
						// treeNode.getParentNode();//得到其父节点 
						treeObj=$.fn.zTree.getZTreeObj("treeDemo");
						if(data[i].pid!=null && data[i].pid!=''){
							var qxidstr=(data[i].pid).split(',');
							for(var j=0;j<qxidstr.length;j++){
							
								var node = treeObj.getNodeByParam("id",qxidstr[j]);//让id:11,name:"新建账号" 的选中
								if(node){  
									treeObj.checkNode(node,true,false);//第3个参数代表不选中其子节点；如果设为true会选中所有子节点，但实际子节点只是部分被选中  
								}
								treeObj.updateNode(node);  // 注：设置checked属性之后，一定要更新该节点，否则会出现只有鼠标滑过的时候节点才被选中的情况
							}
						//--------------------------------------------设置某个节点选中end--------------------------------------------------//		
						}
					});
    			},error:function(data){
    				
    			}
    		});
        	
        }

		