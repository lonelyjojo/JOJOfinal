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
<body>
	<center>
		<table>
			<tr class="t1">
				<th>学生用户编号</th>
				<th>用户名</th>
				<th>密码</th>
				<th>选择操作</th>
			</tr>
			<c:if test="${not empty ulist}">
				<c:forEach varStatus="s" var="u" items="${ulist}">
					<tr>
						<th>${u.uid}</th>
						<th>${u.uname}</th>
						<th>${u.upassword}</th>
						<th><span><a
								href="${pageContext.request.contextPath }/sys/changeupass.action?uid=${u.uid}">修改密码</a></span>
							<span><a
								href="${pageContext.request.contextPath }/sys/deleteuser.action?uid=${u.uid}">删除</a></span>
						</th>
				</c:forEach>
			</c:if>
		</table>
	</center>
</body>