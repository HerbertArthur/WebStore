<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/initialPage.jsp"></jsp:include>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<link rel="stylesheet" href="">
</head>
<style>
	.input_text{
		width: 300px;
		padding:10px;
	}
</style>
<body>
	<form action="${contextPath}/user/userLogin.do" method="post">
		<div style="margin: 60px auto 0 auto; width: 350px">
			<div style="text-align: center;padding-top: 20px;">
				<h2>爱Shopping商城</h2>
			</div>
			<div class="easyui-panel"  style="width: 350px;margin-top: 20px">
				<div style="padding: 10px 19px 20px 19px;">
					<div id="info_div"></div>
					<div style="padding-top: 10px;">
						<input class="easyui-textbox input_text" name="userName" prompt="账号" data-options="iconCls:'icon-man'">
					</div>
					<div style="padding-top: 10px;">
						<input class="easyui-passwordbox input_text" name="password" prompt="密码" iconWidth="28">
					</div>
					<div style="padding-top: 20px;text-align: right;padding-right: 10px;">
						<a href="#" class="easyui-linkbutton" onclick="userRegister()">注册</a>
						<a href="#" class="easyui-linkbutton" style="margin-left: 10px;" onclick="userLogin()">登录</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	function userLogin() {
		$('form').submit();
    }

    function userRegister() {
	    $('#info_div').hide();
	}

    $(function () {
        let msg = '${msg}';
        if ('' == msg || null == msg) {
            msg = '&nbsp'
        }
        let htmlStr = '<div style="text-align: center">' +
            '<span style="color: red">' + msg + '</span>' +
            '</div>'
        $('#info_div').html(htmlStr);
    });

</script>
</html>