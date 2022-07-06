# PsychologyQ_web



## DEMO 영상
https://www.youtube.com/watch?v=_Q-X2Md4SEo



## 제작 의도

 코로나 19로 인해 우울감, 무기력함 등 부정적인 감정을 토로하는 이들이 늘어났습니다. 심지어 코로나19가 장기화 되면서 분노의 감정을 의미하는 코로나 레드까지 등장했습니다. 국민 정신건강에 적신호가 켜진 것입니다. 
 
 반면에 국립정신건강센터의 국민 정신건강 지식 및 태도 조사(2019.11)에 따르면, ‘정신건강 문제를 경험했을 당시에 누군가와 상담(상의)을하거나 병원을 방문한 적이 있다’는 응답자는 22.0% 뿐이었습니다.
 
이는 우리나라 국민이 정신건강 문제에 대해 올바른 조치를 취하지 못하고 있다는 점을 시사합니다. 
    
 저희 팀은 우리나라 사람들이 심리상담을 받는 데에 어려움을 겪는 이유로 심리상담에 대한 정보 부족을 들었습니다. 심리상담 서비스를 받고자 하여도, 실제 이용객들에 대한 후기나 심리상담 센터 및 서비스의 정보가 부족하여 단념하게 됩니다.

즉, 현재 우리나라 사람들이 심리상담 서비스에 호기심과 필요성을 느끼고 있으나 정보가 부족하다는 것입니다.
 
우리는 심리상담서비스에 대한 리뷰 웹페이지를 만들어 해당 문제를 완화하고자 했습니다. 

이에 이 웹 사이트를 통해 기대하는 바는, 
 
 첫째, 심리상담의 필요성을 느낀 이들이 시작도 전에 단념하지 않도록 돕는 것입니다.
 
 둘째, 심리상담 센터에서 내담자들의 피드백을 관찰할 수 있게 되면서, 심리상담 서비스의 질 향상과 발전을 도모하게 하여 선순환 구조를 이끄는 것입니다.


## 차별 요소

 10만 이상의 사람들이 다운로드 받은, 심리상담 어플인,  ‘트로스트’ , ‘마인드 카페’ 라는 것이 존재합니다.
 
 저희는 이 어플의 부족한 점과 차별점을 두어 웹을 개발했습니다.
 
 심리Q는 ‘트로스트’ , ‘ 마인드카페’ 처럼 사용자가 ‘트로스트’, ‘마인드카페’라는 이름을 가진 하나의 심리상담소에 대한 정보만을 얻을 수 있는 것과는 달리,
 
 우리나라 곳곳에 있는 심리상담소에 대한 리뷰, 정보를 공유합니다. 
 
 이는 사용자들이 자신에게 적합한 심리상담 서비스를 찾을 수 있도록 도외주고, 심리상담 센터에서 피드백을 받게 되어 서비스의 질 향상과 발전을 도모하여, 선순환 구조를 이끌 수 있을 것입니다. 


=볼거리=
1. 마이페이지는 유저의 달력으로 상담일정을 관리하고 상담일지 작성과 상담일지 확인이 가능한 페이지입니다. 

 달력은 자바스크립트를 이용해 현재 날짜는 노란 동그라미로, 선택한 날짜는 빨간 동그라미로 보이게 하고 왼쪽에 날짜를 연동했습니다, 

 그리고 이전달과 다음달로 넘어갈 수 있도록 제작했습니다. 

 추가로 시각적인 재미를 주기 위해 움직이는 이모티콘을 넣었습니다.

 내담자가 모두 입력하면 날짜를 클릭했을 때 내담자가 저장한 상담 예약 시간과 상담소 이름이 하단에 나타나게 서버로 ajax요청을 보내서 현재 내담자 의 예약 내역을 불러오도록 저장하였습니다. 

 또한 해당 날짜에서 상담 일지쓰기를 클릭하면 이렇게 상담 일지 입력 창이 뜨게 됩니다.



2. 상담소 검색 페이지는 상담소들의 정보를 모아둔 페이지입니다. 

 상단에는 데이터베이스에서 가져온 상담소의 별점, 이름, 장소 등, 상담소의 정보를 보여주고 하단에는 ‘카카오톡 지도 api’를 활용해서 지도 위에 상담소들 위치를 보여줍니다. 

 지도 위에는 ‘심리상담’이라는 키워드가 들어간 곳에 파란색 마크가 뜨도록 구현했습니다. 

 이런 파란색 상담소 마크들을 클릭하면 왼쪽에 상담소에 대한 정보를 볼 수 있고 url을 클릭하면 지도로 연결되어 상세 정보를 볼 수 있도록 페이지가 넘어갑니다. 


3. 리뷰 게시글 페이지는 사용자가 작성한 리뷰 게시글들을 모아둔 페이지입니다. 자바스크립트를 이용해 페이지네이션과 검색창을 구현하였습니다. 


4. 상담후기 작성 페이지는 사용자가 상담소를 방문한 뒤에는 리뷰 작성 페이지에서 리뷰를 작성하게 됩니다. 

 전반적인 만족도, 상담사 태도, 예약 편의성, 상담소 위치를 5점 만점에 몇 점인지 ‘별’을 이용해 나타낼 수 있습니다. 

 병원명과 방문 날짜, 몇 번째 방문인지 그리고 실제 리뷰 글을 50자 이상 작성하고 해당 상담의 키워드를 고른 뒤에 리뷰를 저장하게 됩니다.

자바스크립트를 이용해 병원명이나 날짜, 후기내용을 입력하지 않으면, 유효성 검사로 알람이 뜨게 하였고, 글자 수를 세어주는 기능을 구현했습니다.




=Capture IMG=

![1  회원가입](https://user-images.githubusercontent.com/88815795/177571443-76e9e56e-e7fa-4b2e-833f-84b800765f60.jpg)
![2  회원가입](https://user-images.githubusercontent.com/88815795/177571451-da7cd95a-a0e7-47a0-9c28-83f5a65f82e3.jpg)
![3  메인페이지](https://user-images.githubusercontent.com/88815795/177571457-4288f35c-c451-44b9-b160-1c65cc574f3b.jpg)
![4  메인페이지](https://user-images.githubusercontent.com/88815795/177571460-9c372aa1-d6f4-404d-b7fb-7bd623c1d264.jpg)
![14  커뮤니티](https://user-images.githubusercontent.com/88815795/177571494-a1646aab-8f9c-4242-ae38-e895eb8a3467.jpg)
![5  게시글 작성](https://user-images.githubusercontent.com/88815795/177571463-8ba57e6f-6e2a-47d9-91f1-9d4c75a9b549.jpg)
![5  게시판](https://user-images.githubusercontent.com/88815795/177571465-f2653009-f931-4eb7-b986-44c981bdc7ca.jpg)
![6 메인페이지](https://user-images.githubusercontent.com/88815795/177571470-3ed5e9c7-622d-4add-bd8c-2ee1d2c569d0.jpg)
![7  마이페이지](https://user-images.githubusercontent.com/88815795/177571474-7b59584d-4a49-48de-ae7c-a6e08774a75c.jpg)
![8  마이페이지](https://user-images.githubusercontent.com/88815795/177571475-74193662-c1ca-468d-8c20-cb60b58a62bf.jpg)
![9  마이페이지](https://user-images.githubusercontent.com/88815795/177571479-baaac3f4-541e-4290-abd6-2f37d6ab887c.jpg)
![10  상담후기](https://user-images.githubusercontent.com/88815795/177571485-7828d002-a658-4257-84ca-60d9d1a89d6b.jpg)
![11  상담후기](https://user-images.githubusercontent.com/88815795/177571486-cc1ab541-6b67-4b2f-b8b3-c0aa768427a4.jpg)
![12  상담후기](https://user-images.githubusercontent.com/88815795/177571487-a7cf096d-6940-47cf-b028-a2f7ac6731b3.jpg)
![13  상담후기](https://user-images.githubusercontent.com/88815795/177571493-2aba5ddc-7b2d-4244-86ae-3613610029ba.jpg)

