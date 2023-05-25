<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
<style>
.title { padding-top:10px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
#work { margin-left: 110px; }
</style>
</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
	<section class="agree_fr">
		<h2 class="title" style="text-align: center;">회원 목록</h2>
		<div class="box">
		<table class="table">
			<thead>
				<tr>
					<th>순번</th><th>아이디</th><th>회원명</th><th>가입일</th>
					<th style="text-align: center;">개별 작업
						<a href="${path1 }/InsertUser.do" class="button is-info is-outlined" id="work">회원 등록</a>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td id="uid">
						<a href="${path1 }/AdminUserDetail.do?id=${user.id }" title="${user.hpw }"><strong>${user.id }</strong></a>
					</td>
					<td><span title="${user.addr }">${user.name }</span></td>
					<td>
						<fmt:parseDate value="${user.regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
						<span title="전화번호 : ${user.tel }, 이메일 : ${user.email }"><fmt:formatDate value="${regdate }" pattern="yyyy년 MM월 dd일" /></span>
					</td>
					<td>
						<a href="${path1 }/AdminUpdateUser.do?id=${user.id }" class="button is-warning is-light">정보 수정</a>
						<a href="${path1 }/AdminResetUser.do?id=${user.id }" class="button is-success is-light" title="회원 전화번호 뒤 네자리로 초기화됩니다.">비밀번호 초기화</a>
						<a href="${path1 }/AdminDeleteUser.do?id=${user.id }" class="button is-danger is-light">회원 삭제</a>
					</td>						
				</tr>
				</c:forEach>
				<c:if test="${empty userList }">
				<tr>
					<td colspan="4">존재하지 않는 회원입니다.</td>
				</tr>
				</c:if>	
			</tbody>
		</table>
		</div>
		</section>
		<c:if test="${!empty sid }">
		<div class="btn-group">
			<a href="${path1 }/InsertUser.do" class="btn btn-primary">회원 등록</a>
		</div>
		</c:if>
	</div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>