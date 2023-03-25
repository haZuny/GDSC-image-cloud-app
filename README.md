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
|회원가입 성공|회원가입 실패_아이디 중복|회원가입 실패_패스워드 불일치|
|----------|----------|----------|
|[성공](https://user-images.githubusercontent.com/64102831/227734438-688ad581-73b7-4283-b194-42e935cbc01e.mp4)|[실패1](https://user-images.githubusercontent.com/64102831/227734439-514353ab-28b1-4a44-90ae-88c4db8928f9.mp4)|[실패2](https://user-images.githubusercontent.com/64102831/227734440-bbec6460-dcba-499a-8a77-80c99ffea8eb.mp4)|

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
