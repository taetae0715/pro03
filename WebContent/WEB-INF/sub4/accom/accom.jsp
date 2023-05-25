<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광안내 > 관광지도 > 숙박시설</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 300px; height: 250px; }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2 class="title" style="text-align: center;">함안 숙박시설 소개
		<c:if test="${sid=='admin' }">
          <a class="button is-info is-outlined is-small" href="AccomAdd.do"><strong>신규등록</strong></a>
        </c:if>
        </h2>
		<article class="agree_fr">
			<div class="box">
				<c:forEach var="Accom" items="${AccomList }">
			  <article class="media">
			    <div class="media-left">
			      <figure>
			        <img src='${path1 }/data/accom/${Accom.file1 }' alt="${Accom.title }" class="image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      <br><h2>${Accom.title }</h2>
				        <p>
				         	<strong><span>위치: </span></strong><span>${fn:substringAfter(Accom.addr, ') ' )}</span>
				          	<br>
				         	<strong><span>전화번호: </span></strong><span>${Accom.tel }</span>
				          	<br>
				        </p>
			          	<a class="button is-info" href="" >길찾기</a>
			          	<c:if test="${sid=='admin' }">
        				  <a class="button is-link is-light" href="${path1 }/AccomUpdate.do?ano=${Accom.ano }"><strong>수정</strong></a>
        				  <a class="button is-light" href="${path1 }/AccomDel.do?ano=${Accom.ano }" onclick="return delCheck()"><strong>삭제</strong></a>
        				</c:if>
        				<script>
						function delCheck(){
							let message="해당 숙박시설 정보가 사라집니다. 정말로 삭제하시겠습니까?";
							if(confirm(message)){ return true; } 
							else { return false; }
						}
						</script>
			      </div>
			    <c:if test="${empty AccomList }">
					<strong>게시글이 존재하지 않습니다.</strong>
				</c:if>	
			    </div>
			  </article>
			    </c:forEach>
			</div>
		</article>		
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>