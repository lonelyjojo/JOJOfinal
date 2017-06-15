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
			async : true,
			success : function(gnum) {
				$("#"+did+"goodpic").attr("src","./IMG/good.png");
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
			async : true,
			success : function(bnum) {
				$("#"+did+"badpic").attr("src","./IMG/bad.png");
				$("#" + did + "bnum").text("" + bnum + "");
			}
		});
		$("#" + id).attr("onclick", "clicked()");
		$("#add" + did + "gnum").attr("onclick", "clicked()");
	}

	function showcom(did,addnum,uid) {
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
								var dmsg; 
								var ddele;
								if(uid==msg.uid){
									dmsg= $("<span></span>");
									 ddele = $("<a title=点击删除评论   href=javascript:; onclick=deletemsg('"+msg.mid+"','"+did+"','"+uid+"')></a>").text(msg.mmsg);
									dmsg.append(ddele);
								}else{
									dmsg= $("<span></span>").text(msg.mmsg);
								}
								var dbr = $("<br/>");
								$("#" + did + "com").append(dmsg,dbr);
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
						success : function(mid) {
								var dmsg = $("<span></span>");
								var ddele = $("<a title=点击删除评论   href=javascript:; onclick=deletemsg('"+mid+"','"+did+"','"+uid+"')></a>").text(msg);
								dmsg.append(ddele);
								var dbr = $("<br/>");
								$("#" + did + "com").append(dmsg, dbr);	
								$("#add" + did + "com").val("");
                                                 } 
							});
			}else{
			alert("想说点什么？");
			}
	}
	
	function  clear(did) {
		$("#add"+did+"com").val("");
	}
	
	function deletemsg(mid,did,uid) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/user/deletemsg.action",
			data : "mid="+mid,
			dataType : "text",
			async : false,
			success : function() {
				clear(did);
				showcom(did,"first",uid);
			}
		});
	}
</script>
</head>

<body>
	<center>
		<center>紫金小店:${rname}</center>
		<br />
		<c:if test="${not empty dishs}">
			<c:forEach var="dish" items="${dishs}" varStatus="index">
				<div id="dishname">菜名:${dish.dname }</div>
				<div id="dishpic">
					<img alt="${dish.dname}" src="/dish/${dish.dpic }" width="300px"
						height="200px"> <br />
				</div>
				<div id="dishjud">
					<a id="add${dish.did}gnum" onclick="addgnum('${dish.did}',this.id)"
						href="javascript:;"><img id="${dish.did}goodpic" src="./IMG/ugood.png" width="26px" height="26px"/>  </a> <span id="${dish.did}gnum">${dish.gnum}</span>
					<a id="add${dish.did}bnum" onclick="addbnum('${dish.did}',this.id)"
						href="javascript:;"><img id="${dish.did}badpic" src="./IMG/ubad.png" width="26px" height="26px"/></a> <span id="${dish.did}bnum">${dish.bnum}
					</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="show${dish.did}com"
						onclick="showcom('${dish.did}','first','${user.uid}')" href="javascript:;">吐槽</a><br /> 
					<div id="${dish.did}dishcom" style="background-attachment: #D492E4;" class="hidecom" width="400px" >
					<div><p align="left" style="margin-left:70px;background:#E4BBEE;">用户吐槽：</p></div>
						<div id="${dish.did}com" style="display:hide" class="appendmsg"></div>
						<br/>
						<textarea id="add${dish.did}com" class="addcom"></textarea>
						<a onclick="addcom('${dish.did}','${uid}')" href="javascript:;">发送吐槽</a>
						<a href="javascript:{clear('${dish.did}')};">clear</a>
					</div>
				</div>
				<hr />
			</c:forEach>
		</c:if>  
		<c:if test="${empty dishs}">
			<p>目前小店里还没有菜!</p>
		</c:if>
	</center>
</body>
</html>