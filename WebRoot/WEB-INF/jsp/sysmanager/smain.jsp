<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>系统管理主界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
a {
	color: black;
	text-decoration: none;
}
</style>
<link rel="stylesheet" type="text/css" href="./CSS/mcss/mp.css">
</head>
<body bgcolor="#F2F1D7">
	<center><h1>用户管理</h1></center>
	<div class="head" style="width: 100%;height: 10%;"><center>
	<span><a href="${pageContext.request.contextPath }/sys/umanage.action" target="main">学生用户管理</a></span>-----
	<span><a href="${pageContext.request.contextPath }/sys/rmanage.action" target="main">食堂用户管理</a></span></center>
	</div>
	<div class="main" style="width: 100%;height: 80%;">
	<iframe name="main" width="100%;" height="100%;">
	</iframe>
	</div>
</body>
