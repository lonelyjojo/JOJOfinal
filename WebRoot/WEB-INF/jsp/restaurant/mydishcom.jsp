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

<title>${ruser.rname}的小店</title>
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
<link rel="stylesheet" type="text/css" href="./CSS/mcss/oner.css">
<script type="text/javascript" src="./JS/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function addgnum(did, id) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/user/doaddgnum.action",
			data : "did=" + did,
			dataType : "text",
			async : false,
			success : function(gnum) {
				$("#" + did + "gnum").text("" + gnum + "");
			}
		});
		$("#" + id).attr("onclick", "clicked()");
		$("#add" + did + "bnum").attr("onclick", "clicked()");
	}

	function addbnum(did, id) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/user/doaddbnum.action",
			data : "did=" + did,
			dataType : "text",
			async : false,
			success : function(bnum) {
				$("#" + did + "bnum").text("" + bnum + "");
			}
		});
		$("#" + id).attr("onclick", "clicked()");
		$("#add" + did + "gnum").attr("onclick", "clicked()");
	}

	function showcom(did, addnum) {
		if (addnum == "first") {
			$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/user/doshowcom.action",
						data : "did=" + did,
						dataType : "text",
						async : false,
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						success : function(mmsg) {
							var s = eval(mmsg);
							$.each(s, function(i, msg) {
								var dmsg = $("<span></span>").text(msg.mmsg);
								var dbr = $("<br/>");
								$("#" + did + "com").append(dmsg, dbr);
							});
						}
					});
		}
		$("#" + did + "dishcom").attr("class", "showcom");
		$("#show" + did + "com").attr("onclick", "hidecom('" + did + "')");
	}

	function hidecom(did) {
		var t = "no";
		$("#" + did + "dishcom").attr("class", "hidecom");
		$("#show" + did + "com").attr("onclick",
				"showcom('" + did + "','" + t + "')");

	}

	function clicked() {
		alert("您已经投过票");
	}

	function addcom(did,uid) {
		var msg = $("#add" + did + "com").val();
			if(msg.trim()!=""){
			$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/user/doaddcom.action",
						data : "did=" + did+"&msg="+msg+"&uid="+uid,
						dataType : "text",
						async : false,
						contentType : "application/x-www-form-urlencoded;charset=utf-8",
						success : function(suc) {
								var dmsg = $("<span></span>").text(msg);
								var dbr = $("<br/>");
								$("#" + did + "com").append(dmsg, dbr);	
								$("#add" + did + "com").val("");
                                                 } 
							});
			}else{
			alert("想说点什么？");
			}
	}
</script>
</head>

<body bgcolor="#F2F1D7">
	<center>
		<center><span>紫金小店:${ruser.rname}</span>
		<span>-------</span>
		<span><a href="${pageContext.request.contextPath }/restaurant/gomanage.action">回到管理</a></span></center>
		<br />
		<c:if test="${not empty dishs}">
			<c:forEach var="dish" items="${dishs}" varStatus="index">
				<div id="dishname">菜名:${dish.dname }</div>
				<div id="dishpic">
					<img alt="${dish.dname}" src="/dish/${dish.dpic }" width="400px"
						height="300px"> <br />
				</div>
				<div id="dishjud">
				<span>点赞数：</span>
				<span id="${dish.did}gnum">${dish.gnum}</span>
				<span>差评数：</span>
				<span id="${dish.did}bnum">${dish.bnum}
				</span> <a id="show${dish.did}com"
						onclick="showcom('${dish.did}','first')" href="javascript:;">吐槽</a><br /> 
					<div id="${dish.did}dishcom" class="hidecom">
					<br/>
						<div id="${dish.did}com" style="display:hide"></div>
						<br/>
					</div>
				</div>
				<hr />
			</c:forEach>
		</c:if>  
		<c:if test="${empty dishs}">
			<p>目前店里还没有菜!</p>
		</c:if>
	</center>
</body>
</html>