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
<title>JSON Test4</title>
<link href="${path1 }/source/bulma.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
.title { text-align: center; padding: 30px; }
#lst { margin-left: 200px; }
#sidebar { width:200px; float:left; }
#dataform { width:900px; float:right; }
</style>
</head>
<body>
<header class="header" style="padding:24px; width:100%; text-align:center;">
	<h1 class="title">JSON 형태로 검색하여 일반 객체 불러오기</h1>
</header>
    <div class="container">
    	<aside class="menu" id="sidebar">
		  <p class="menu-label">
		    General
		  </p>
		  <ul class="menu-list">
		    <li><a>Dashboard</a></li>
		    <li><a>Customers</a></li>
		  </ul>
		  <p class="menu-label">
		    Administration
		  </p>
		  <ul class="menu-list">
		    <li><a>Team Settings</a></li>
		    <li>
		      <a class="is-active">Manage Your Team</a>
		      <ul>
		        <li><a>Members</a></li>
		        <li><a>Plugins</a></li>
		        <li><a>Add a member</a></li>
		      </ul>
		    </li>
		    <li><a>Invitations</a></li>
		    <li><a>Cloud Storage Environment Settings</a></li>
		    <li><a>Authentication</a></li>
		  </ul>
		  <p class="menu-label">
		    Transactions
		  </p>
		  <ul class="menu-list">
		    <li><a>Payments</a></li>
		    <li><a>Transfers</a></li>
		    <li><a>Balance</a></li>
		  </ul>
		</aside>
		<div id="dataform">
			<hr><br>
			<nav class="level">
			  <!-- Left side -->
			  <div class="level-left">
			    <div class="level-item">
			      <p class="subtitle is-5">
			        <strong>검색할 아이디 입력</strong>
			      </p>
			    </div>
			    <div class="level-item">
			      <div class="field has-addons">
			        <p class="control">
			          <input class="input" type="text" id="id" name="id" placeholder="Find a post">
			        </p>
			        <p class="control">
			          <button type="button" class="button is-info" id="reqBtn">데이터 가져오기</button>
			        </p>
			      </div>
			    </div>
			  </div>
			  </nav>
			<div id="msg">
				<ul id="lst">
				
				</ul>
			</div>
			<br><hr>
			<script>
			$(document).ready(function(){
				$("#reqBtn").click(function(){
					//var id= $("#id").val();
					if($("#id").val()==""){
						alert("검색할 아이디를 입력하세요.");
						$("#id").focus();
						return;
					}
					var params = { id:$("#id").val() };
					$.ajax({
						url:"${path1 }/JSONTest2.do",
						type:"post",
						dataType:"json",
						data:params,
						success:function(obj){
							$("#lst").empty();
							var mem = obj;
							if(typeof mem.id!="undefined"){
								$("#lst").append("<li>아이디 : "+mem.id+"</li>");
								$("#lst").append("<li>비밀번호 : "+mem.pw+"</li>");
								$("#lst").append("<li>이름 : "+mem.name+"</li>");
							} else {
								$("#lst").append("<li>해당 데이터가 존재하지 않습니다.</li>");
							}
						}
					});
				});
			});
			</script> 
		</div>
	</div>
</body>
</html>