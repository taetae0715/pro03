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
<title>관광안내 > 관광지도 > 숙박시설</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 300px; height: 250px; }
</style>
</head>
<body>
<%@ include file="../../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2 class="title" style="text-align: center;">함안 숙박시설 소개
		<c:if test="${sid=='admin' }">
          <a class="button is-info is-outlined is-small" href="AccomAdd.do"><strong>신규등록</strong></a>
        </c:if>
        </h2>
		<article class="agree_fr">
			<div class="box">
				<c:forEach var="accom" items="${accomList }">
			  <article class="media">
			    <div class="media-left">
			      <figure>
			        <img src='${path1 }/data/accom/${accom.file1 }' alt="${accom.title }" class="image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      <br><h2>${accom.title }</h2>
				        <p>
				         	<strong><span>위치: </span></strong><span>${accom.addr }</span>
				          	<br>
				         	<strong><span>전화번호: </span></strong><span>${accom.tel }</span>
				          	<br>
				        </p>
			          	<a class="button is-info" href="" >길찾기</a>
			      		<c:if test="${sid=='admin' }">
        				  <a class="button is-link is-light" href="AccomUpdate.do"><strong>수정</strong></a>
        				  <a class="button is-light" href="AccomDel.do"><strong>삭제</strong></a>
        				</c:if>
			      </div>
			    <c:if test="${empty accomList }">
					<strong>게시글이 존재하지 않습니다.</strong>
				</c:if>	
			    </div>
			  </article>
			    </c:forEach>
			</div>
		</article>		
	</div>
</div>
<%@ include file="../../../footer.jsp" %>
</body>
</html>