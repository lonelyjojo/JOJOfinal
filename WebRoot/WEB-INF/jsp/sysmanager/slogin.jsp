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
<title>系统管理员登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="./CSS/rcss/style.css">

<script type="text/javascript" src="./JS/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
	function checkusername() {
		var sname = $("#sname").val();
		if (sname.trim() == "") {
			alert("用户名不能为空！");
			return false;
		} else {
			return true;
		}
	}

	function checkpassword() {
		var spassword = $("#spassword").val();
		if (spassword.trim() == "") {
			alert("密码不能为空！");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>

	<section class="container">
    <div class="login">
      <h1>管理员登录</h1>
      <form method="post" action=" ${pageContext.request.contextPath }/sys/doslogin.action" enctype="application/x-www-form-urlencoded">
        <p><input type="text" name="sname" id="sname" value="" placeholder="用户名" required="required" onblur="checkusername()"></p>
        <p><input type="password" name="spassword" id="spassword" value="" placeholder="密码"  required="required" onblur="checkpassword()"></p>
        <p class="remember_me">
          <label>
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="登录"></p>
      </form>
    </div>

    <div class="login-help">
    </div>
  </section>
<div style="text-align:center;">
<p>create：<a href="" target="_blank">JOJO</a></p>
</div>
</body>
</html>
