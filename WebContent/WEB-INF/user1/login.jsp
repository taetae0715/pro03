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
<title>로그인</title>
<style>
</style>
</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2>로그인</h2>
		<p>${msg }</p>
		<form action="${path }/UserLoginPro.do" method="post">
			<table class="table">
				<tbody>
					<tr>
						<th><label for="id">아이디</label></th>
						<td>
							<input type="text" name="id" id="id" maxlength="15" class="form-control" required autofocus>
						</td>
					</tr>
					<tr>
						<th><label for="pw">비밀번호</label></th>
						<td>
							<input type="password" name="pw" id="pw" maxlength="15" class="form-control" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="로그인" class="btn btn-primary">
							<input type="reset" value="취소" class="btn btn-primary" >
							<button type="button"><a href="${path1 }/UserAgree.do" class="btn btn-success">회원가입</a></button>			
						</td>
					</tr>
				</tbody>
			</table>
		</form>		
	</div>
</div>
</body>
</html>