<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSON Test2</title>
<link href="${path1 }/source/bulma.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
</style>
</head>
<body>
	<div id="container">
	<h2>JSON 형태의 일반 객체 출력</h2>
	<br><hr><br>
		<div id="msg">
			<ul id="lst">
			
			</ul>
		</div>
		<button type="button" id="reqBtn">데이터 가져오기</button>
		<script>
		$(document).ready(function(){
			var params = { id:"jws" };
			$("#reqBtn").click(function(){
				$.ajax({
					url:"${path1 }/JSONTest2.do",
					type:"post",
					dataType:"json",
					data:params,
					success:function(obj){
						var mem = obj;
						$("#lst").append("<li>아이디 : "+mem.id+"</li>");
						$("#lst").append("<li>비밀번호 : "+mem.pw+"</li>");
						$("#lst").append("<li>이름 : "+mem.name+"</li>");
						//console.log(obj);
					}
				});
			});
		});
		</script>
	</div>
</body>
</html>