<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="source/bulma.css" rel="stylesheet">
<title>메인 페이지</title>
<style>
.navbar-brand, .navbar-item { height: 56px; }
</style>
</head>
<body>
<header>
<nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="index.jsp">
      <img src="./img/logo.png" width="321px;" height="56px;">
    </a>
    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">공지사항</a>
        <div class="navbar-dropdown">
          <a class="navbar-item" href="">함안소식</a>
          <a class="navbar-item" href="">고객민원</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">축제행사</a>
        <div class="navbar-dropdown">
          <a class="navbar-item" href="">함안수박축제</a>
          <a class="navbar-item" href="">함안낙화놀이</a>
          <a class="navbar-item" href="">해바라기축제</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">함안여행</a>
        <div class="navbar-dropdown">
          <span class="navbar-item"><strong>문화재</strong></span>
          <a class="navbar-item">문화재현황</a>
          <hr class="navbar-divider">
          <span class="navbar-item"><strong>생태관광</strong></span>
          <a class="navbar-item" href="">함안악양둑방</a>
          <a class="navbar-item" href="">입곡문화공원</a>
          <a class="navbar-item" href="">입곡군립공원</a>
          <a class="navbar-item" href="">연꽃테마파크</a>
          <a class="navbar-item" href="">악양생태공원</a>
          <hr class="navbar-divider">
		<span class="navbar-item"><strong>역사여행</strong></span>
		<a class="navbar-item" href="">함안광심정</a>
		<a class="navbar-item" href="">함안악양루</a>
		<a class="navbar-item" href="">원효암 칠성각</a>
		<a class="navbar-item" href="">장춘사 대웅전</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">관광안내</a>
        <div class="navbar-dropdown">
          <span class="navbar-item"><strong>여행갤러리</strong></span>
          <a class="navbar-item" href="">포토갤러리</a>
          <hr class="navbar-divider">
          <span class="navbar-item"><strong>관광지도</strong></span>
          <a class="navbar-item" href="">전통시장</a>
          <a class="navbar-item" href="">음식점</a>
          <a class="navbar-item" href="">숙박시설</a>
          <hr class="navbar-divider">
		<span class="navbar-item"><strong>교통안내</strong></span>
		<a class="navbar-item" href="">시내/시외버스</a>
		<a class="navbar-item" href="">공영버스/농어촌버스</a>
		<a class="navbar-item" href="">기차/택시</a>
        </div>
      </div>
      </div>
    </div>
    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <a class="button is-primary" href="UserLogin.do">
            <strong>로그인</strong>
          </a>
          <a class="button is-light">회원가입</a>
        </div>
      </div>
    </div>
</nav>
</header>
<div>
<h1>메인 페이지</h1>
</div>
</body>
</html>