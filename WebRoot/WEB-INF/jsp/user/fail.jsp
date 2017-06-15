<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<base href="<%=basePath%>">
<title>userlogin</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="./CSS/rcss/style.css">

<script type="text/javascript" src="./JS/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">

	function checkusername() {
		var uname = $("#uname").val();
		if (uname.trim() == "") {
			alert("用户名不能为空！");
			return false;
		} else {
			return true;
		}
	}

	function checkpassword() {
		var upassword = $("#upassword").val();
		if (upassword.trim() == "") {
			alert("密码不能为空！");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>

	
失败
</body>
</html>
