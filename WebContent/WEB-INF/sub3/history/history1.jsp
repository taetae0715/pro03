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
<title>함안 광심정</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.img_sec {width:600px;height:705px; background-color:rgb(241,92,48);margin:10px 200px;float:right}
.img1 {display:inline-block;width:570px; height:488px;margin:15px ;}
#img_btn1:checked ~ .img1 {background: url(${path1 }/img/his/haman_gwang.jpg) no-repeat;background-size:570px 488px;}
#img_btn2:checked ~ .img1 {background: url(${path1 }/img/his/haman_gwang2.jpg) no-repeat;background-size:570px 488px;}
#img_btn3:checked ~ .img1 {background: url(${path1 }/img/his/haman_gwang3.jpg) no-repeat;background-size:570px 488px;}
.btn_hidden {display:none}
.img23_wrap {width:570px;height :155px; margin:13.5px 15px;text-align:center }
.sm_img1,.sm_img2,.sm_img3 {width:180px; height:155px}
.sm_img1 {float:left}
.sm_img3 {float:right}

.content_blank {width:100%; height :592px ;background-color:transparent;}
.cont_sec {width:100%; background-color:rgb(252,177,49)}
.cont_art {padding:20px;}
.cont_adr {float:right; text-align:right}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<div style="text-align:right; float:right">
	
	<!-- value에 관광지이름 넣으면 알아서 적용돼요 -->
	<c:set var="mapname" value=" 함안 광심정" />
	<!-- 이곳에 지도주소넣기 -->
	<c:set var="mapaddr" value="경남 함안군 칠북면 봉촌2길 277" />
	<input type="hidden" id="hamAddr" value="${mapaddr }">
	
	
		<h2 class="is-size-2" style="color:rgb(241,92,48);font-weight:bold">${mapname }</h2>
		<hr style="width:265px;margin:0;background-color:lightgray">
	</div>
<section class="img_sec">
	<div class="img1_wrap">
		<input type="radio" name="img_btn" id="img_btn1" checked class="btn_hidden">
		<input type="radio" name="img_btn" id="img_btn2" class="btn_hidden">
		<input type="radio" name="img_btn" id="img_btn3" class="btn_hidden">
	<div class="img1"></div>
	</div>
	<div class="img23_wrap">
	<label for="img_btn1"><img src="${path1 }/img/his/haman_gwang.jpg"  class="sm_img1"></label>
	<label for="img_btn2"><img src="${path1 }/img/his/haman_gwang2.jpg" class="sm_img2"></label>
	<label for="img_btn3"><img src="${path1 }/img/his/haman_gwang3.jpg" class="sm_img3"></label>
	</div>
</section>

<div class="content_blank">
</div>

<section class="cont_sec">
	<article class="cont_art">
	<div style="height:180px"></div>
	<pre>

용성송씨(龍城宋氏) 문중에서 젊은 사람들이 수학을 목적으로 건립한 정자

함안군 칠북면 봉촌리 230번지 내 위치한 광심정(廣心亭)은 조선 선조 2년(1569) 영산군 길곡리에 칩거하고 있던 용성송씨(龍城宋氏) 
문중에서 젊은 사람들이 수학을 목적으로 건립한 정자(亭子)로서 조선 현종 5년(1664)에 성리학자인 송지일(宋知逸)선생이 
선비들과 더불어 학문을 연구하기 위해 자신의 호를 따라서 광심정으로 편액(扁額)하였으며, 낙동강변의 절벽 위에 자리잡고 있다. 
임진왜란(1592) 때 파손되어 여러 번 고쳐 지었다.

건물은 앞면 · 옆면 2칸 규모이며 지붕은 옆면에서 볼 때 여덟 팔자 모양인 팔작지붕이다.
앞쪽은 마루로 꾸몄고, 뒤쪽에는 방을 두었으며, 1995년 5월 2일 문화재자료 제217호로 지정되었다.
	
	
	<span class="cont_adr">
	주소 : ${mapaddr }
관리처  : 문화유산관광담당관 문화유산담당
문의전화 : 055-580-2551</span>
	</pre>
	</article>
</section>
<section>
	<div id="map" style="width:100%;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e5844a91d6f6ebd1c2d952b89252020&libraries=services"></script>

<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
$(document).ready(function(){ 
	var hamanMapName = $("#hamAddr").val();
	//alert(hamanMapName);
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 장소를 검색합니다
		 // 경남 함안군 법수면 악양길 49-10
		ps.keywordSearch(hamanMapName, placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
});
</script>

		
</section>

</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>