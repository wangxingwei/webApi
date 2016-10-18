var flag=false;
//全选
function checkedAll(checkAllId,containerId){//全选按钮的ID,内容列表容器ID
    $("#"+checkAllId).click(function(){
        if(!flag){
            checkboxAll(containerId,true);
            flag=true;
        }else{
            checkboxAll(containerId,false);
            flag=false;
        }
    });
}
function checkboxAll(containerId,checked){
    var checkboxs= $("#"+containerId).find("[type='checkbox']");
    for(var i=0;i<checkboxs.length;i++){
        checkboxs[i].checked=checked;
    }
}
//删除
function deleteFn(btnId,containerId,url){//删除按钮ID,内容列表容器ID,删除的请求路径
    $("#"+btnId).click(function(){
        var subId=new Array();
        var checkboxs= $("#"+containerId).find("[type='checkbox']");
        for(var i=0;i<checkboxs.length;i++){
            if(checkboxs[i].checked){
                subId.push(checkboxs[i].value);
            }
        }
        var ids=subId.join(",");
        if(ids!=null && ids!=""){
            if(confirm("确认删除")){
                $.ajax({
                    url:url,
                    data:{
                        id:ids
                    },
                    type:'post',
                    cache:false,
                    dataType:'text',
                    success:function(data) {
                        if("success"==data){
                            alert("删除成功！");
                            callback();
                        }else{
                            alert("删除失败！");
                        }
                    },
                    error:function(){
                        alert("获取数据异常！");
                    }
                });

            }
        }else{
            alert("请选择一条记录!");
        }
    });
}
//参数：按钮ID,内容列表容器ID,请求路径,确认信息，成功提示信息,失败提示信息，成功后执行的方法
function checkAllFn(btnId,containerId,url,confirmMessage,success_tooltip,error_tooltip,callback){
    $("#"+btnId).click(function(){
        var subId=new Array();
        var checkboxs= $("#"+containerId).find("[type='checkbox']");
        for(var i=0;i<checkboxs.length;i++){
            if(checkboxs[i].checked){
                subId.push(checkboxs[i].value);
            }
        }
        var ids=subId.join(",");
        if(ids!=null && ids!=""){
            if(confirm(confirmMessage)){
                $.ajax({
                    url:url,
                    data:{
                        ids:ids
                    },
                    type:'post',
                    cache:false,
                    success:function(data) {
                        if("success"==data){
                            alert(success_tooltip);
                            callback();
                        }else{
                            alert(error_tooltip);
                        }
                    },
                    error:function(){
                        alert("获取数据异常！");
                    }
                });

            }
        }else{
            alert("请选择一条记录!");
        }
    });
}