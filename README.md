# [GDSC] 이미지 분류 클라우드 애플리케이션

내가 찍은 사진을 카테고리 별로 분류하여 서버에 저장하는 애플리케이션입니다.<br>
App, Server, ML을 모두 사용해야하는 주제로 간단한 토이프로젝트를 진행하며 만들었습니다.

<br>

## 기능
1. 앱에 로그인하고 클라우드에 등록할 사진을 선택
2. ML로 사진의 종류 분류(ex. 음식, 풍경, 인물, 동물)
3. 카테고리별로 서버에 저장, 필요할 때 불러옴

<br>

## ML 분류
- 음식
- 동물
- 풍경
- 인물
- 인테리어
- 사물
- 기타
총 7개 카테고리로 분류

<br>

## 실행 화면
### 회원가입
<img width="80%" src=""/><br>회원가입 성공<br>
<img width="80%" src=""/><br>회원가입 실패 - 아이디 중복<br>
<img width="80%" src=""/><br>회원가입 실패 - 아이디 패스워드 불일치<br>
### 로그인
<img width="80%" src=""/><br>로그인 성공<br>
<img width="80%" src=""/><br>로그인 실패 - 아이디 중복<br>
### 카테고리, 이미지 리스트
<img width="80%" src=""/><br>이미지 스크롤 페이지<br>
### 이미지 추가
<img width="80%" src=""/><br>앨범에서 저장<br>
<img width="80%" src=""/><br>카메라에서 저장<br>
### 이미지 상세정보
<img width="80%" src=""/><br>상세정보 조회<br>
<img width="80%" src=""/><br>카테고리 변경<br>
<img width="80%" src=""/><br>사진 삭제<br>
### 홈 이동 및 로그아웃
<img width="80%" src=""/><br>앱 상단바<br>

<br>

## 기술 스택
- FE
  - Flutter
- BE
  - Spring Boot
- ML
  - Tensorflow
  - TFlite

<br>

## 기여자
- [권하준/App](https://github.com/haZuny)
- [이건희/Server](https://github.com/GeonHui2)
- [손민기/ML]
