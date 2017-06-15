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
<title>食堂用户登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="./CSS/rcss/style.css">

<script type="text/javascript" src="./JS/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
var flag=true;
	function checkusername() {
		var rname = $("#rname").val();
		if (rname.trim() == "") {
			alert("用户名不能为空！");
			return false;
		} else {
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/restaurant/checkisexist.action",
				data:"rname="+rname,
				dataType:"text",
				async:false,
				success:function(msg){
					if(msg != "yes"){
					flag = false;
					alert("该用户不存在！");	
					}else{
					flag = true;
					}
				}
			});
				return flag;
		}
	}

	function checkpassword() {
		var rpassword = $("#rpassword").val();
		if (rpassword.trim() == "") {
			alert("密码不能为空！");
			return false;
		} else {
			return true;
		}
	}
	
	function checkname() {
		if(!flag){
		alert("哥！你要先注册才能登录啊！");		
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
      <h1>食堂用户登录</h1>
      <input type="hidden" value="${error}" id="error"/>
      <form onsubmit="return checkname()" method="post" action=" ${pageContext.request.contextPath }/restaurant/dorlogin.action" enctype="application/x-www-form-urlencoded">
        <p><input type="text" name="rname" id="rname" value="${name}" placeholder="用户名" required="required" onblur="checkusername()" ></p>
        <p><input type="password" name="rpassword" id="rpassword" value="" placeholder="密码"  required="required" onblur="checkpassword()"></p>
        <p class="remember_me">
          <label>
            <input type="hidden" name="remember_me" id="remember_me" >
            
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="登录"></p>
      </form>
    </div>

    <div class="login-help">
      <p>没有账号? <a href="${pageContext.request.contextPath }/restaurant/rregist.action">立即注册</a>.</p>
    </div>
  </section>
<div style="text-align:center;">
<p>create：<a href="" target="_blank">JOJO</a></p>
</div>
</body>
</html>
