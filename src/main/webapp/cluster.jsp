<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" ></c:set>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>聚类和关联调参页面</title>
</head>
<link rel="stylesheet" href="/easyui/themes/default/easyui.css">
<link rel="stylesheet" href="/easyui/themes/icon.css">
<script type="text/javascript" src="/easyui/jquery.min.js"></script>
<script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
<body>
    <div style="width: 502px;margin: auto;padding-top: 20px">
        <a id="cluster" href="#" onclick="userCluster()" class="easyui-linkbutton" data-options="">用户聚类</a>
        <div style="text-align: center">
            <h3>聚类结果</h3>
            <table id="dataTable" class="easyui-datagrid" data-options="width:500,height:200">
                <thead>
                <tr>
                    <th data-options="field:'cId',width:100">id</th>
                    <th data-options="field:'cTitle',width:100">类别名</th>
                    <th data-options="field:'userIds',width:290">用户id</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>

    </div>
    <div style="width: 502px;margin: auto;padding-top: 20px;">
        <span>用户类别：</span>
        <select id="cc" class="easyui-combobox" name="dept" style="width:200px;">
            <option value="1">NO:001</option>
            <option value="2">NO:002</option>
            <option value="3">NO:003</option>
        </select>
        <a id="btn1" href="#" onclick="itemAssociate()" class="easyui-linkbutton" data-options="">对该类用户进行关联规则分析</a>
    </div>
</body>
<script>
    function userCluster() {
        $.ajax({
            type: 'POST',
            url: '${ctx}' + '/cluster_asso/userClassify.do',
            success: function (data) {
                if (data.status == 200){
                    $.messager.alert('提示',data.msg,'info');
                    $.ajax({
                        type: 'POST',
                        url: '${ctx}' + '/cluster_asso/getUserGroup.do',
                        dataType: 'json',
                        success: function (data) {
                            $('#dataTable').datagrid('loadData',data.result);
                        }
                    });
                } else {
                    $.messager.alert('提示',data.msg,'error');
                }
            }
        });
    }

    function itemAssociate() {
        let cid = $('#cc').combobox('getValue');
        $.ajax({
            type: 'POST',
            url: '${ctx}' + '/cluster_asso/associateItem.do',
            data: {cId : cid},
            success: function (data) {
                if (data.status == 200){
                    $.messager.alert('提示',data.msg,'info');
                } else {
                    $.messager.alert('提示',data.msg,'error');
                }
            }
        });
    }

    $(function(){

    });
</script>
</html>
