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
<title>学生用户登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="./CSS/rcss/style.css">

<script type="text/javascript" src="./JS/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
 var flag =true;
	function checkusername() {
		var uname = $("#uname").val();
		if (uname.trim() == "") {
			alert("用户名不能为空！");
			return false;
		} else {
		$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/user/checkisexist.action",
				data:"uname="+uname,
				dataType:"text",
				async:false,
				success:function(msg){
					if(msg != "yes"){
					flag = false;
					alert("该用户名不存在！");	
					}else{
					flag=true;
					}
				}
			});
		
		
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
	
	function checkname() {
	if(!flag){
	alert("哥！你是不是还没注册啊！");
	}
		return flag;
	}
	window.onload=outputerror;
	
	function outputerror() {
	var errorvalue=$("#error").val();
	if(errorvalue!=""){
		alert(errorvalue);
	}
	}
</script>
</head>
<body>
	<section class="container">
    <div class="login">
      <h1>学生用户登录</h1>
      <input type="hidden" value="${error}" id="error"/>
      <form  onsubmit="return checkname()" method="post" action=" ${pageContext.request.contextPath }/user/doulogin.action" enctype="application/x-www-form-urlencoded">
        <p><input type="text" name="uname" id="uname" placeholder="用户名" required="required" onblur="checkusername()" value="${name}"></p>
        <p><input type="password" name="upassword" id="upassword" value="" placeholder="密码"  required="required" onblur="checkpassword()"></p>
        <p class="remember_me">
          <label>
            <input type="hidden" name="remember_me" id="remember_me" >
            
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="登录"></p>
      </form>
    </div>

    <div class="login-help">
      <p>没有账号? <a href="${pageContext.request.contextPath }/user/uregist.action">立即注册</a>.</p>
    </div>
  </section>
<div style="text-align:center;">
<p>create：<a href="" target="_blank">JOJO</a></p>
</div>
</body>
</html>
