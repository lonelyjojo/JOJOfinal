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
<title>修改密码</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="./CSS/rcss/style.css">

<script type="text/javascript" src="./JS/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
	var flag = true;
	function checkpassword() {
		var rpassword = $("#rpassword").val();
		if (rpassword.trim() == "") {
			alert("密码不能为空！");
			return false;
		} else {
			return true;
		}
	}
	function checkpassword1() {
		var rpassword = $("#rpassword").val();
		var rpassword1 = $("#rpassword1").val();
		if (rpassword1.trim() == "") {
			alert("请再次输入密码！");
		} else {
			if (rpassword.trim() != rpassword1.trim()) {
				alert("两次输入的密码不一致！");
				flag = false;
				return false;
			} else {
				flag = true;
				return true;
			}
		}
	}
	function regist() {
		return checkpassword() && checkpassword1();
	}
</script>
</head>
<body>

	<section class="container">
	<div class="login">
		<h1>修改密码</h1>
		<form onsubmit="return regist()" method="post"
			action=" ${pageContext.request.contextPath }/restaurant/dochangerpass.action"
			enctype="application/x-www-form-urlencoded">
			<p>
				<input type="hidden" name="rid" value="${ruser.rid}">
			</p>
			<p>
				新密码<input type="password" name="rpassword" id="rpassword" value=""
					placeholder="密码" required="required" onblur="checkpassword()">
			</p>
			<p>
				再输一次<input type="password" id="rpassword1" required="required"
					onblur="checkpassword1()">
			</p>
			<p class="remember_me">
				<label> <input type="hidden" name="remember_me"
					id="remember_me">
				</label>
			</p>
			<p class="submit">
				<input type="submit" name="commit" value="修改">
			</p>
		</form>
	</div>

	<div class="login-help"></div>
	</section>
	<div style="text-align:center;">
		<p>
			create：<a href="" target="_blank">JOJO</a>
		</p>
	</div>
</body>
</html>
