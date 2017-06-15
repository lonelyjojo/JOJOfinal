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
<title>食堂用户注册</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="./CSS/rcss/style.css">

<script type="text/javascript" src="./JS/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
 	 var flag=true;
 	 var passflag=true;
var nlengthflag=true;
	var plengthflag=true;
	function checkusername() {
		var rname = $("#rname").val();
		if (rname.trim() == "") {
			alert("用户名不能为空！");
		} else {
		if(rname.length>20){
			alert("大哥，你用户名过长啦！");
			nlengthflag=false;
			return false;
			}else{
			nlengthflag=true;
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/restaurant/checkisexist.action",
				data:"rname="+rname,
				dataType:"text",
				async:false,
				success:function(msg){
					if(msg != "yes"){
					flag = true;
					}else{
					alert("用户名已存在！");	
					flag = false;
					}
				}
			});
			}
		}
	}

	function checkpassword() {
		var rpassword = $("#rpassword").val();
		if (rpassword.trim() == "") {
			alert("密码不能为空！");
		} else {
		if(rpassword.length>20){
		alert("密码不用这么长的啊！");
		plengthflag=false;
		return false;
		}else{
		plengthflag=true;
		return true;
		}
		}
	}
	function checkpassword1() {
		var rpassword = $("#rpassword").val();
		var rpassword1 = $("#rpassword1").val();
		if (rpassword1.trim() == "") {
			alert("密码不能为空！");
			passflag=false;
		} else {
		if(rpassword.trim()!=rpassword1.trim()){
		alert("两次输入的密码不一致！");
		passflag=false;
		}else{
		passflag=true;
		}
		}
	}
	
	function regist() {
	if(!flag){
	alert("用户名已被占用，请您换一个试试。");
		return flag;
	}
	if(!passflag){
	alert("两次输入的密码不一致！");
	return passflag;
	}
	if(!nlengthflag){
	alert("用户名长度不合法啊！哥！");
	return nlengthflag;
	}
	if(!plengthflag){
	alert("密码长度不合法！");
	return plengthflag;
	}
	return true;
	}
</script>
</head>
<body>

	<section class="container">
    <div class="login">
      <h1>食堂用户注册</h1>
      <form id="myform"  onsubmit="return regist()" method="post" action=" ${pageContext.request.contextPath }/restaurant/dorregist.action" enctype="application/x-www-form-urlencoded">
        <p>用户名：</p><input type="text" name="rname" id="rname" value="" placeholder="用户名" required="required" onblur="checkusername()">
        <p>密码<input type="password" name="rpassword" id="rpassword" value="" placeholder="密码"  required="required" onblur="checkpassword()"></p>
       <p>再输一次<input type="password" id="rpassword1"    required="required" onblur="checkpassword1()"></p>
        <p class="remember_me">
          <label>
            <input type="hidden" name="remember_me" id="remember_me" >
          </label>
        </p>
        <p class="submit"><input type="submit"  name="commit" value="注册"></p>
      </form>
    </div>

    <div class="login-help">
      <p>已有账号? <a href="${pageContext.request.contextPath }/restaurant/rlogin.action">立即登录</a>.</p>
    </div>
  </section>
<div style="text-align:center;">
<p>create：<a href="" target="_blank">JOJO</a></p>
</div>
</body>
</html>
