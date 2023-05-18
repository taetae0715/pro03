<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<%@ page import="kr.go.haman.test.*" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSON Test3</title>
<link href="${path1 }/source/bulma.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
</style>
</head>
<body>
	<div id="container">
	<h2>JSONArray 형태의 ArrayList 객체 출력</h2>
	<br><hr><br>
		<div id="msg">
			<ul id="lst">
			
			</ul>
		</div>
		<button type="button" id="reqBtn">데이터 가져오기</button>
		<script>
		$(document).ready(function(){
			$("#reqBtn").click(function(){
				$.ajax({
					url:"${path1 }/JSONTest3.do",
					type:"post",
					enctype:"UTF-8",
					dataType:"json",
					processDate:false,
					contentType:false,
					async:true,
					cache:false,
					success:function(data){
						$("#lst").empty();
						var trans = data;
						console.log(trans.data);
						var tg = "";
						$.each(trans, function(key, value){
							if(key=="data"){
								for(var i=0; i<value.length; i++){
									tg = "";
									console.log(value[i].id);
									tg = tg + "<div>아이디 : "+value[i].id+"</div>";
									tg = tg + "<div>비밀번호 : "+value[i].pw+"</div>";
									tg = tg + "<div>이름 : "+value[i].name+"</div>"+"<br>";
									$("#lst").append("<li>"+tg+"</li>");
								}
							}
						});
					}
				});
			});
		});
		</script>
	</div>
</body>
</html>