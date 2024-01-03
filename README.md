# Busan-Inundation-Factor-Analysis

# 개요

<img src="img\슬라이드3.JPG"></img>

- 공공데이터와 머신러닝을 활용하여 부산광역시 침수 재해 발생의 주요 요인을 도출한 프로젝트<br>
- 발표 자료: https://drive.google.com/file/d/1Sd35ijYQwdkprENB-PUcAhR855FEf0j6/view?usp=sharing
  <br>
  <br>
  <br>

## 문제 상황

<img src="img\슬라이드5.JPG"></img><img src="img\슬라이드7.JPG"></img>

- 기후변화 등으로 인해 부산광역시에 침수 재해가 급증하였고 인명, 재산 등의 피해가 발생함.
- 따라서 침수 재해 발생에 영향을 미치는 주요 요인을 파악하고 이에 대한 대응책을 찾고자 함.

## 후보 요인

<img src="img\슬라이드9.JPG"></img>

- 강수량, 인구밀도, 하수도보급률, 지역 면적 내 하수도 설치율, 하수처리구역 내 면적, 배수량, 유수지 면적 내 유수지 용량, 태풍 발생 여부
- y 변수 : 침수심

## 사용 기술

### 전처리

<img src="img\슬라이드10.JPG"></img>
<img src="img\슬라이드11.JPG"></img>

### 머신러닝 모델

- <b> 다변량 회귀 분석 <br><br>
  <img src="img\슬라이드13.JPG"></img>
  <img src="img\슬라이드14.JPG"></img>
  <img src="img\슬라이드15.JPG"></img>
  <img src="img\슬라이드16.JPG"></img>

- <b> 선형회귀 <br><br>
  <img src="img\슬라이드17.JPG"></img>
  <img src="img\슬라이드18.JPG"></img>

- <b>KNN <br><br>
  <img src="img\슬라이드19.JPG"></img>
  <img src="img\슬라이드20.JPG"></img>

## 결과 (상위 요인 3가지)

- 다변량 회귀 분석 : 강수량, 하수도보급률, 하수처리구역 내 면적 <br><br>
  <img src="img\슬라이드21.JPG"></img>

- 선형회귀, KNN : 강수량, 지역 면적 내 하수도 설치율, 배수량 <br><br>
  <img src="img\슬라이드22.JPG"></img>
  <img src="img\슬라이드23.JPG"></img>

## 기대효과

<img src="img\슬라이드25.JPG"></img>

## 활용가능성

<img src="img\슬라이드26.JPG"></img>

## 정책 제언

<img src="img\슬라이드27.JPG"></img>
