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
<title>加菜</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet" href="./CSS/rcss/style.css">

<script type="text/javascript" src="./JS/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
	function checkusername() {
		var dname = $("#dname").val();
		if (dname.trim() == "") {
			alert("菜名不能为空！");
			return false;
		} else {
			return true;
		}
	}
	function checkpic() {
		var dpic=$("#dpic").val();
		if(null==dpic){
		alert("请选择菜品图片！");
		return false;
		}else{
		return true;
		}
	}
	function checkall() {
		return checkpic()&&checkusername();
	}
</script>
</head>
<body>

	<section class="container">
    <div class="login">
      <h1>加菜</h1>
      <form onsubmit="return checkall()"  method="post" enctype="multipart/form-data" action=" ${pageContext.request.contextPath}/restaurant/doadddish.action" enctype="application/x-www-form-urlencoded">
        <p><input type="text" name="dname" id="dname" value="" placeholder="菜名" required="required" onblur="checkusername()"></p>
        <p><input type="file" name="dpicture" id="dpic"  required="required"></p>
        <p class="remember_me">
          <label>
            <input type="hidden" name="remember_me" id="remember_me" >
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="添加"></p>
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
