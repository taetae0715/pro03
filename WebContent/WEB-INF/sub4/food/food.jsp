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
<title>관광안내 > 관광지도 > 음식점</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
</style>
</head>
<body>
<%@ include file="../../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2 class="title" style="text-align: center;">함안 맛집</h2>
		<article class="agree_fr">
			<div class="box">
			  <article class="media">
			    <div class="media-left">
			      <figure class="image is-128x128">
			        <img src="https://bulma.io/images/placeholders/128x128.png" alt="Image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      <h2>스톤커피</h2>
				        <p>
				         	<strong><span>위치: </span></strong><span>경상남도 함안군 법수면 법수로 577, 2호</span>
				          	<br>
				         	<strong><span>전화번호: </span></strong><span>0507-1415-6993</span>
				          	<br>
				        </p>
			          	<a class="button is-info" href="" >길찾기</a>
			      </div>
			    </div>
			  </article>
			</div>
		</article>		
	</div>
</div>
<%@ include file="../../../footer.jsp" %>
</body>
</html>