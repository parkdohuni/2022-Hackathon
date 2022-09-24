# 🫡Intro
&nbsp;안녕하세요 저희는 팀 레몬에이드입니다🍋🍸 

&nbsp;저희는 자유세션을 선정하여, **대구 지역 아동 가정 구성원의 삶을 윤택하게 만들자**라는 주제로 본 프로젝트를 진행하였습니다.

<img src="https://user-images.githubusercontent.com/70834586/192095122-64d4ba1c-3fd9-419a-8f14-ad5e4450b0bf.png" width="300" height="200">

 &nbsp;대구 지역 **아동 가정**이 가기 좋은 장소를 **플러터**를 통해 개발한 **'아이랑'** 앱을 통해 확인할 수 있습니다. 
 
# 👨‍👩‍👧‍👦아이랑
## 프로젝트 소개
&nbsp;아동 가정은 외출이 버겁습니다. 노키즈존의 등장으로 카페, 식당을 가는 일도 많은 노력이 필요합니다. 영유아들은 마스크를 착용하기도 힘들기 때문에 미세먼지가 많은 날에는 아예 외출을 자제하기도 합니다.
  
&nbsp;저희 **아이랑** 앱은 본 문제를 해결하고자 제작하였습니다. 
 
&nbsp;대구 시 구별로 노키즈존이 아닌 장소를 지도상에서 확인할 수 있고, 정보 또한 보기 쉽게 간편화하였습니다. 오늘의 미세먼지에 따라 대구 시에 가기 좋은 장소를 추천해줍니다. 마지막으로 다음주에는 어떤 날이 외출하기 좋은 날일까에 대한 궁금증도 해결해줍니다. 각 구별로 향후 7일간 미세먼지 양을 예측하여 한동안 피해야 할 구, 가기 좋은 구를 확인하실 수 있습니다.
  
&nbsp;대구시의 아동 가정이 더 편리한 생활을 누리실 수 있도록 아이랑 앱이 함께 하겠습니다🤝

## 활용 기술
&nbsp; iOS/Android 운영체제에 관계 없이 서비스가 가능하도록 Flutter를 사용하여 본 앱을 제작하였습니다.


&nbsp; 미세먼지를 예측하기 위하여 ml_algo API를 사용하였습니다. 'air.daegu.go.kr'에서 각 구의 일별 미세먼지 데이터를 가져와서 내일의 미세먼지 값을 target 값으로 학습하였습니다. 알고리즘은 continuous한 값을 추정하기 위해 Regression 모델 중 KnnRegressor를 사용하였습니다. 예측을 수행할 때는 네이버 날씨 사이트에서 오늘 미세먼지 값을 크롤링하여 일주일간의 미세먼지 값을 예측하였습니다.

&nbsp; Flutter에서 제공하는 scrollable_list_tabview package를 활용하여 전체 리스트를 한번에 확인할 수 있으면서도 편리하게 특정 index로 이동할 수 있도록 하였습니다.
예스키즈존의 정보를 수집하기 위해 BeautifulSoup library를 활용하였습니다. '대구 예스키즈존'키워드로 데이터를 수집 후 시각화하여 나온 카페들을 중심으로 json형태로 앱 화면에 데이터를 보여주었습니다.

<img src="https://user-images.githubusercontent.com/87708291/192111825-2b1d21d8-29b2-4ce2-8647-dd342a394a42.png" width="150" height="100">


# 🎥Youtube
Link: 

# ⚠️Caution
Run>Edit Configurations>Additional run args>--no-sound-null-safety 설정해주세요!

<img src="https://user-images.githubusercontent.com/70834586/192093388-60e8c759-ae4c-4233-a630-772c967cdcb9.png" width="300" height="200">
