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

<title>${ruser.rname}菜品管理</title>

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
<link rel="stylesheet" type="text/css" href="./CSS/css/booksMain.css">
</head>

<body bgcolor="#F2F1D7">
	<center>
		<center>紫金小店:${ruser.rname}</center>
		<br />
		<c:if test="${not empty ruser}">
		<span><a href="${pageContext.request.contextPath }/restaurant/adddish.action">加一个菜</a></span>
		<span><a href="${pageContext.request.contextPath }/restaurant/showdishcom.action">查看评论</a></span>	
		<span><a href="${pageContext.request.contextPath }/restaurant/changepass.action">修改密码</a></span>
		</c:if>
		<table>
			<tr class="t1">
				<th>菜品编号</th>
				<th>菜名</th>
				<th>好评数</th>
				<th>差评数</th>
				<th>图像预览</th>
				<th>选择操作</th>
			</tr>
			<c:if test="${not empty dishlist}">
			<c:forEach items="${dishlist}" var="dish">
			<tr>
			<th>${dish.did}</th>
			<th>${dish.dname}</th>
			<th>${dish.gnum}</th>
			<th>${dish.bnum}</th>
			<th><img src="/dish/${dish.dpic }" alt="${dish.dname}" width="300px" height="200px"/></th>
			<th><a href="${pageContext.request.contextPath }/restaurant/dodeletedish.action?did=${dish.did}&rid=${ruser.rid}" >删除</a>
			<a href="${pageContext.request.contextPath }/restaurant/changedish.action?did=${dish.did}&rid=${ruser.rid}">修改</a></th>
			</tr>
			</c:forEach>
		</c:if>
		</table>

	</center>
</body>
</html>