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

<title>My JSP 'resdish.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<c:if test="${not empty dishlist}">
		<c:forEach varStatus="s" var="dish" items="${dishlist}">
			<div class="box">
				<img width="500px" height="500px" src="/dish/${dish.dpic}" />
				菜名：${dish.dname}
			</div>
			<style>
.box {
	width: 300px;
	text-align: center;
	font-szie: 18px;
}

.box img {
	width: 100%;
}
</style>
		</c:forEach>

	</c:if>

</body>
</html>
