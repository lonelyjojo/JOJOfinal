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
	function checkdishname() {
		var dname = $("#dname").val();
		if (dname.trim() == "") {
			alert("菜名不能为空！");
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
      <h1>菜品编号${dish.did}</h1>
      <form onsubmit="return checkdishname()" method="post" enctype="multipart/form-data" action=" ${pageContext.request.contextPath }/restaurant/dochangedish.action">
        <p><input type="hidden" name="did" value="${dish.did}"> </p>
        <p>菜名:<input type="text" id="dname" required="required"  name="dname" value="${dish.dname}" onblur="checkdishname()"> </p>
        <p>图片:<img src="/dish/${dish.dpic}" width="300px" height="200px" /></p>
        <p><input type="file" name="dpicture"></p>
        <p class="remember_me">
          <label>
          </label>
        </p>
        <p class="submit"><input type="submit" name="commit" value="修改"></p>
      </form>
    </div>

    <div class="login-help">
    </div>
  </section>
<div style="text-align:center;">
</div>
</body>
</html>
