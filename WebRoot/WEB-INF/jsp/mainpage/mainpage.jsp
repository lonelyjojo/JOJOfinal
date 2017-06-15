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

<title>食堂主界面</title>

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
	<center>
			当前用户:${user.uname}--<a href="${pageContext.request.contextPath }/user/changepass.action?uid=${uid}">修改密码</a> <hr/> 
		<div class="head" id="head">
			<div>
				<center>
				<span><a href="${pageContext.request.contextPath }/restaurant/showhotrank.action" target="main">查看热门排行</a></span>
				<span><a href="${pageContext.request.contextPath }/restaurant/showbadrank.action" target="main">查看差评排行</a></span>
				<br/>
				<c:if test="${not empty rlist}">
					<c:forEach varStatus="s" var="res" items="${rlist}">
					<li class="headres" ><a href="${pageContext.request.contextPath }/restaurant/showoneres.action?rid=${res.rid}&uid=${uid}" target="main">${res.rname}</a></li>
					<li>||</li>
				</c:forEach>
				</c:if>
				
				
				</center>
		
			</div>
		</div>
		<div class="main" id="main">
			<iframe
				width=100% height=100% name="main">
					<img alt="" src="./IMG/welcome.jpg">
				</iframe>
		</div>
	</center>
</body>
