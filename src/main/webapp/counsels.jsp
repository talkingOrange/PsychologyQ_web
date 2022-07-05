<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.json.JSONArray" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PsychologyQ</title>
    <link rel="stylesheet" type="text/css" href="counsels.css">
    <link rel="stylesheet" href="ligne.css">
    <link rel="stylesheet" href="paginate.css">
    <script type="text/javascript" src="paginate.js"></script>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = (String)session.getAttribute("userId");
	String userNname = (String)session.getAttribute("userNname");
	String loginout;
	String loginouturl;
	if (userId == null){
		loginout = "로그인";
		loginouturl="login.jsp";
	}
	else {
		loginout = "로그아웃";
		loginouturl = "logout";
	}
	JSONArray counsels = (JSONArray) request.getAttribute("counsels");
%>
<body>
    <header>
        <a class="logo" href="MainPage.jsp"><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->
        <nav>
            <ul class="nav-items">
                <li><a href="MainPage.jsp">홈</a></li>
                <li>&#124;</li>
                <li><a href="myPage.jsp">마이페이지</a></li>
                <li>&#124;</li>
                <li><a href=<%=loginouturl %>><%=loginout %></a></li>
            </ul>
        </nav>
    </header>

    <div id="main">
        <div id="contents">
            <div>
                <h2>&gt;상담소 모음&lt;</h2>
                <h6>상담소를 클릭하면 하단에서 해당 상담소 정보를 볼 수 있습니다.</h6>
            </div>

            <div class="panel">
                <div class="body">
                    <div class="input-group">
                        <h5> <label for="searchBox"><img class="searchPicture" src="./image/search.png"></label>
                            <input type="text" id="searchBox" placeholder="지역/상담소/키워드 검색...">
                            <a href="counsels.jsp">X</a>
                        </h5>
                    </div>
                </div>
            </div>
            <form action="selectStarAvrg.jsp" method="POST" name="clinicInform" id="clinicInform">
                <table class="myTable table hover" id="collection">
                    <thead>
                        <tr>
                            <!--지역명은 시,군으로.-->
                            <th>별점 평균</th>
                            <th>상담소 이름</th>
                            <th>
                                <div class="showEllipsis">주소</div>
                            </th>
                        </tr>
                    </thead>
                    <tbody class="counsels">
                        <script id="counselInfo_template" type="text/template">
                            <tr class="counsel"  id="{몇번째}">
                                <td>{별점}</td>
                                <td>{상담소이름}</td>
                                <td><div class="showEllipsis">{주소}</div></td>
                            </tr>
			</script>
                    </tbody>
                </table>

                <hr class="line" color="BDBDBD" width="97%" style="margin:5% 0 5% 0; border-color: black; border-radius: 2em; ">

                <table id="content-counseling">
                    <tr>
                        <td>
                            <h4 id="ex1_Result1">상담소 이름</h4>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div style="display: inline;"><img src="./image/별.png" class="stars"></div>
                            <div id="ex1_Result2" style="display: inline;"> - / 5</div>
                        </td>
                        <td rowspan="2">
                            <div id="map" style="width:400px;height:400px;"></div>
                        </td>
                    </tr>

                    <tr>
                        <td align="left" style="height:80%; width:35%; vertical-align: top; padding-top:4%;">
                            <br><img src="./image/위치(1).png" class="icon"> 위치 <span id="counsel_add">정보 없음</span>
                            <br><img src="./image/전화번호(1).png" class="icon"> 전화번호 <span id="counsel_no">정보 없음</span>
                            <br><img src="./image/정보(1).png" class="icon"> 정보 <a href='#' id="counsel_info"> 정보 없음 </a>
                        </td>
                    </tr>
                </table>
            </form>
            <button id="addReview"><a href='#'>리뷰 보기 →</a></button>
        </div>

        <div id="sidebar"><br>
            <ul>
                <li><a href="counsels" class="active">상담소 검색</a></li>
                <li><a href="reviews">상담후기 검색</a></li>
                <li><a href="reviewPost.jsp">상담후기 작성</a></li>
                <li><a href="CommPostList.jsp">심리 커뮤니티</a></li>
              </ul>
        </div>


    </div>

    <div id="footer">Footer</div>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="./counsels.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b624c0a460e2419117f43c07d53bb04&libraries=services"></script>
<script>

var counsels = <%= counsels.toString() %>
var html = document.querySelector("#counselInfo_template").innerHTML;
var resultHTML = "";
var img;
var star;

for(var i=0; i < counsels.length; i++) {
    resultHTML += html.replace("{몇번째}", i)
    				   .replace("{상담소이름}", counsels[i].counsel_name)
                       .replace("{별점}", counsels[i].star_avrg)
                       .replace("{주소}", counsels[i].counsel_add);
    
}
document.querySelector(".counsels").innerHTML += resultHTML; 


// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
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
ps.keywordSearch('심리상담', placesSearchCB); 

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
        document.getElementById("ex1_Result1").innerText = place.place_name;
        document.getElementById("counsel_add").innerText = place.road_address_name;
        document.getElementById("counsel_no").innerText = place.phone;
        document.getElementById("counsel_info").innerText = 'https://map.kakao.com/link/map/' + place.id;
        document.getElementById("counsel_info").href = document.getElementById("counsel_info").innerText;
        for(var i=0; i < counsels.length; i++) {
            if(counsels[i].counsel_name === place.place_name){
            	document.getElementById("ex1_Result2").innerText = counsels[i].star_avrg;
            }
            
        }
        infowindow.open(map, marker);
    });
}
</script>
    </script>
</body>

</html>
