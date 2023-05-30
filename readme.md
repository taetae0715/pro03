# 프로젝트 개요

## 프로젝트 이름: 함안 문화관광 웹 애플리케이션

## 프로젝트 기간: 2023.05.17~05.31

## 프로젝트 참여: 조태정

## 자바 버전: jdk 1.8

## 자바 스크립트 버전: 1.0

## 다이나믹 웹 모듈: 3.1

## 사용 DBMS: MySQL8

## 자바 사용 라이브러리: crypto, Json, cos, commons, mail

## CSS 프레임워크: bulma

## 자바스크립트 플러그인: jOuery

## 자바스크립트 api: daum 주소 api, Json 데이터 처리, iamport 결제 api

## 프로젝트 데이터 처리 패턴: MVC2
## (View -> Controller -> Model -> Controller -> View)

## 프로젝트 주요 기능: 공지사항, 회원, 고객민원 및 답변, 여행갤러리, 리뷰 등

## 프로젝트 특이사항
- 회원가입 시 중복 체크는 Json을 활용하여 별도의 팝업 창이 없이 현재 창에서 구현
- 회원가입 시 주소의 입력은 daum 주소 api를 활용하여 주소 전달
- 회원의 비밀번호는 md5, sha256, aes256 등으로 암호화하여 처리
- 회원가입 후에는 네이버 메일 서버 또는 Gmail 메일 서버로 가입 축하 이메일 발송
- 공지사항은 파일 첨부(업로드) 기능을 함께 구현
- 공지사항은 전체 목록의 페이징 처리와 검색 기능 구현
- 공지사항 글의 상세보기 화면에서 해당 게시된 공지 중에서 파일 다운로드 기능 추가
- 결제 기능은 결제 api 기능을 활용하여 다양한 방법으로 결제 테스트가 가능
- 배송 시스템은 우체국택배, CJ대한통운, 롯데택배, 로젠택배, 한진택배, CU 편의점 택배, 경동 택배, EMS 택배 등으로 한다.
- 배송 시스템의 배송상태는 회원이 결제 후에 배송전으로 관리자가 배송을 등록하면 배송중 또는 배송완료로 처리
- 이용후기는 댓글과 별점 등으로 구성하여 게시될 수 있도록 처리

<br>

-----------------------------------------------------------------------------------

# 프로젝트 설계

## 개념적 설계
- usecase
![usecase](./img/draw/usecase.png "usecase")

## 논리적 설계
- 정보공학적 ERD
![정보공학적 ERD](./img/draw/erd.png "정보공학적 ERD")

## 물리적 설계
- 테이블 설계표
![테이블 설계표](./img/table.JPG "테이블 설계표")
- 데이터베이스 ERD
![데이터베이스 ERD](./img/Relational_1.png "데이터베이스 ERD")

## 클래스 설계
- 클래스 다이어그램
![클래스 다이어그램](./img/classdiagram.png "클래스 다이어그램")

## 시퀀스 설계
- 시퀀스 설명
![공지사항 목록 프로세스](./img/sequence/seq1.PNG "공지사항 목록 프로세스")
![공지사항 글 보기 프로세스](./img/sequence/seq2.PNG "공지사항 글 보기 프로세스")
![공지사항 글 쓰기 프로세스](./img/sequence/seq3.PNG "공지사항 글 쓰기 프로세스")

## 프로젝트 구성도
![프로젝트 구성도](./img/pro02explorer.JPG "프로젝트 구성도")
