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
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734973-fec0c855-7055-447a-ba07-25add0cc16bc.gif"/><br>회원가입 성공<br>
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734975-5d98fcdc-6736-42e6-80b9-3b114336874f.gif"/><br>회원가입 실패 - 아이디 중복<br>
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734977-c2966c69-b4c1-4975-849a-b6a1ddd575f5.gif"/><br>회원가입 실패 - 아이디 패스워드 불일치<br>
### 로그인
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734979-6d7c12f2-00de-433b-9a63-88dfdd2926a2.gif"/><br>로그인 성공<br>
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734963-042e096a-57e2-44c6-87f3-e3591cf63511.gif"/><br>로그인 실패<br>
### 카테고리, 이미지 리스트
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734971-c60494b8-284c-4698-8e64-9791ef20d67e.gif"/><br>이미지 스크롤 페이지<br>
### 이미지 추가
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734967-547bf9dc-0f16-4631-b7ce-57e21071791f.gif"/><br>앨범에서 저장<br>
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734968-e68456cf-0790-46b7-91a0-cb3712604d67.gif"/><br>카메라에서 저장<br>
### 이미지 상세정보
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734965-549bf15a-630d-4b9e-bedd-83d6da1e0514.gif"/><br>상세정보 조회<br>
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734970-2c5eb27e-a429-4499-b742-2a7e054fe547.gif"/><br>카테고리 변경<br>
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734964-f710611c-c339-49d2-a724-e152613c1959.gif"/><br>사진 삭제<br>
### 홈 이동 및 로그아웃
<img width="80%" src="https://user-images.githubusercontent.com/64102831/227734972-2818c540-59f3-4df1-be95-0afe9424d366.gif"/><br>앱 상단바<br>

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
