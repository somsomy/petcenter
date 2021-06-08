# 개인프로젝트 배포

#### 주소 : https://petcenter.herokuapp.com/



------

## 프로젝트 주제

유기동물(고양이) 보호센터 

JSP 기반의 프로젝트를 Spring Boot 기반으로 전환하여 배포

개발기간 : 2020.12.28 ~ 2021.01.25 (JSP)

전환기간 : 2021.04 ~

------

## 개발도구 및 환경

- 운영체제 : MS Window10
- 서버 : Apache Tomcat 8.0
- DB :  MySQL(5.7)
- 개발 언어 : JAVA(JDK1.8), Javascript, HTML5, CSS3
- IDE : IntelliJ IDEA
- 프레임워크 : Spring Boot(2.5.0), MyBatis
- API : Kakao Map
- 라이브러리 : jQuery, jstl
- 클라우드 서비스 : AWS S3, AWS RDS, Heroku

------

## 전환 전 프로젝트 보기

JSP 프로젝트 : https://github.com/somsomy/JSP-project

------

## 구현

###### 회원

- 회원가입
  - 아이디, 비밀번호, 닉네임 정규표현식 이용하여 적합 여부 판별
  - 우편번호 검색 API 활용하여 주소 입력
  - Ajax 로 아이디와 닉네임 중복 확인

|                              전                              |                              후                              |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
|            새 창을 띄워 아이디와 닉네임 중복확인             |          중복확인 버튼 클릭 시 Ajax로 중복여부 확인          |
| ![전](https://user-images.githubusercontent.com/78060557/121213135-f0894e00-c8b8-11eb-8efe-de2f1c7ea36b.png) | ![111111](https://user-images.githubusercontent.com/78060557/121212973-c899ea80-c8b8-11eb-8d4e-16d9761a7c28.gif) |

- 마이페이지
  - Ajax를 이용한 회원정보 수정 처리

<img src="https://user-images.githubusercontent.com/78060557/121213230-04cd4b00-c8b9-11eb-83bd-49d2aa0bad66.gif" alt="22222" width="400" />



###### 게시판

- 공지사항
  - 관리자 계정으로 접속 시 글 등록, 수정, 삭제 가능
  - 동적 쿼리를 이용한 게시글 제목 검색 기능
  - 페이징
- 위치
  - Kakao Map API 를 활용하여 주소 좌표에 마커를 띄워 지도에 표시
- 입양 게시판
  - 회원가입하여 로그인한 회원만 글 등록 가능
  - 본인 글에서만 글 수정, 삭제 버튼 활성화
  - 동적 쿼리를 이용한 게시글 제목 검색 기능
  - 페이징

![문의](https://user-images.githubusercontent.com/78060557/121213372-1f9fbf80-c8b9-11eb-821e-271ab5fecc57.png)



- 후원 게시판
  - 후원 유형, 금액을 선택하여 후원 정보 등록
- 자원봉사 게시판
  - 관리자 계정으로 게시글 등록 가능
  - 가입한 회원이 로그인 시 댓글 작성창 활성화
  - Ajax를 이용하여 댓글 등록, 수정, 삭제 
  - 게시글과 댓글 페이징

<img src="https://user-images.githubusercontent.com/78060557/121213454-30e8cc00-c8b9-11eb-8641-6904f6b500a5.gif" alt="33333" width="500" />

- 문의 게시판
  - 관리자 계정으로 게시글 등록 가능
  - 가입한 회원이 로그인 시 문의글 작성 가능

![큐앤](https://user-images.githubusercontent.com/78060557/121213547-48c05000-c8b9-11eb-8c64-6374dcecff5c.png)

###### 관리자

- 고양이 정보 등록, 수정, 삭제
- 정보 등록 시 카테고리에 따라 보호중인 아이들 게시판이나 입양완료 게시판에 노출