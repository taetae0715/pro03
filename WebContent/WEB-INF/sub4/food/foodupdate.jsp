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
<title>관광안내 > 관광지도 > 음식점 > 음식점 수정</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 300px; height: 250px; }
#postcode { width: 250px; margin-right: 10px;}
</style>
</head>
<body>
<%@ include file="../../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
	<h2 class="title" style="text-align: center;">함안 맛집 수정</h2>
	<article class="agree_fr">
		<form action="${path1 }/FoodUpdatePro.do" method="post" enctype="multipart/form-data" class="box">
		<table class="table">
			<tbody>
				<tr>
					<th><label class="label" for="title">상호명</label></th>
					<td>
						<input type="hidden" name="fno" id="fno" value="${food.fno }" />
						<input type="text" name="title" id="title" placeholder="상호명 입력" class="input" value="${food.title }" required />
					</td>
				</tr>
				<tr>
					<th><label class="label" for="tel">전화번호</label></th>
					<td><input type="tel" name="tel" id="tel" maxlength="14" placeholder="ex) 0505-1234-5678" class="input" value="${food.tel }" required></td>
				</tr>
				<tr>
					<th><label class="label" for="post_btn">주소</label></th>
					<td>
					<c:set var="addr1234" value="${fn:substringAfter(food.addr, ' ' )}"/>
					<input type="hidden" name="addr" id="addr" value="${food.addr }" />
					<input type="text" name="postcode" id="postcode" placeholder="우편번호" class="input" value="${fn:substringBefore(food.addr, ' ' )}" readonly>
					<button id="post_btn" onclick="findAddr()" class="button is-info is-rounded">우편번호 검색</button>
					<input type="text" name="address1" id="address1" placeholder="기본 주소" class="input" value="${fn:substringBefore(addr1234, ',' )}" required readonly /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="input" value="${fn:substringAfter(food.addr, ', ' )}" required  /><br>
					</td>
				</tr>
				<tr>
					<th><label class="label" for="file1">첨부파일</label></th>
					<td>
						<input type="file" name="file1" id="file1" value="${food.file1 }" required>
						<span>
						<c:set var="lh" value="${fn:length(noti.file1) }" />
						<c:set var="download" value="${fn:substring(noti.file1,5,lh) }" />
						${download }
						</span><br>
						<input type="radio" name="fileSel" id="fileSel1" onclick="fileCall()" checked>교체 안 함<br> 
						<input type="radio" name="fileSel" id="fileSel2" onclick="fileCall()" >교체<br>
						<input type="file" name="file1" id="file1" class="">
						<input type="hidden" name="file1" id="file2" value="${download }">
						<script>
						function fileCall(){
							var fileSel1 = document.getElementById("fileSel1");
							var fileSel2 = document.getElementById("fileSel2");
							var file1 = document.getElementById("file1");
							var file2 = document.getElementById("file2");
							if(fileSel1.checked){
								file1.style.display = "none";
								file1.setAttribute("disabled");
								file2.removeAttribute("disabled");
							} else {
								file1.style.display = "block";
								file1.removeAttribute("disabled");
								file2.setAttribute("disabled");
							}
						}
						</script>		
					</td>
				</tr>
				<tr>
					<td colspan="2">
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
       				<input type="submit" value="등록하기" class="button is-info"/>
					&nbsp; &nbsp; &nbsp;
       				<input type="reset" value="취소" class="button is-light"/>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<script>
				function findAddr(){
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
			}
		}).open();		
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</article>		
	</div>
</div>
<%@ include file="../../../footer.jsp" %>
</body>
</html>