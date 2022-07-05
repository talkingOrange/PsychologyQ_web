<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PsychologyQ</title>
    <link rel="stylesheet" type="text/css" href="myPage.css">
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
%>

<body>
    <header>
      <a class="logo" href="MainPage.jsp" ><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->        <nav>
            <ul class="nav-items">
                <li><a href="MainPage.jsp">홈</a></li>
                <li>&#124;</li>
                <li ><a href="myPage.jsp" class="nav-active">마이페이지</a></li>                <li>&#124;</li>
                <li><a href=<%=loginouturl %>><%=loginout %></a></li>
            </ul>
        </nav>
    </header>

    <div id="main">
        <div id="contents">
            <div class="my-calendar clearfix">
                <div class="clicked-date">
                  <form action="scheduleSave" method="POST" name="date">
                  <div class="cal-day"></div>	<!-- 요일 -->
                  <div class="cal-date"></div>	<!-- 날짜 -->
                  <input type="hidden" id="cal-date" name="cal-date" value="" />
                  <div><h2>* 상담 예약이 잡혀 있나요? <input type="checkbox" value="상담예약유무" name="isBooking" id="isBooking"></h2>
                    <div id="tail">
                    <h4><br>  ㄴ <input type="time" name="bookingTime" id="bookingTime">
                    <br>  ㄴ <input type="text" name="counselingCenter" id="counselingCenter" placeholder="예약한 상담소 이름">
                <button type="submit" name="counselingSave" id="counselingSave" onclick="">저장</button></h4>

               	</div>
           	</div>
     	</div>
        <div class="calendar-box">
            <div class="ctr-box clearfix">
                <button type="button" title="prev" class="btn-cal prev">
                    </button>
                    <span class="cal-month"></span>	<!-- 월 -->
                 		<input type="hidden" id="cal-month" name="cal-month" value="" />
                    <span class="cal-year"></span>	<!-- 년도 -->
                 		<input type="hidden" id="cal-year" name="cal-year" value="" />  
                </form>
                    <button type="button" title="next" class="btn-cal next">
                    </button>
             </div>
                  <table class="cal-table">
                    <thead>
                      <tr>
                        <th>S</th>
                        <th>M</th>
                        <th>T</th>
                        <th>W</th>
                        <th>T</th>
                        <th>F</th>
                        <th>S</th>
                      </tr>
                    </thead>
                    <tbody class="cal-body"></tbody>
                  </table>
                </div>
              </div>
              <!-- // .my-calendar -->
              
              <hr size="9cm" color="BDBDBD" width="97%" style="border-color: black; border-radius: 2em;">

              <hr size="9cm" color="BDBDBD" width="97%" style="border-color: black; border-radius: 2em;">
              <div id="imageMove"><img src="./image/기쁨이.png" width="26px" id="기쁨이"style="cursor: pointer;">
                <img src="./image/불안이.png" width="26px" id="불안이" style="cursor: pointer;">
                <img src="./image/편안이.png" width="26px" id="편안이"style="cursor: pointer;">
                <img src="./image/슬픔이.png" width="26px" id="슬픔이"style="cursor: pointer;">
                <img src="./image/행복이.png" width="26px" id="행복이"style="cursor: pointer;">
            </div>
            <button class="play">재생</button>
            <button class="stop">멈춤  </button>

            
              <form action="심리QDB.sql" method="GET" name="date">

            <div id="schblock">
            	<h3 id="counselReservationPlace">{상담소 이름} 상담소</h3>
                <h3 id="counselReservationTime">예약 시간: {예약 시간}</h4>
                <!--<div id="rvblock">
               작성한 리뷰 없음 &nbsp &nbsp
              <a href="리뷰작성페이지"><u>리뷰 작성하러 가기</u></a>
              &nbsp|&nbsp
              <a href="상담 일지 작성하러 가기"><u>상담 일지 작성하러 가기</u></a>
            </div>-->
                <div id="rvblock">
                    <a href="reviews" class="rvlink"><u>작성한 리뷰 보러 가기 |  </u></a>
                    <button type="button" onclick="javascript:writeadvise()" href="advise-diary.jsp" class="rvlink"><u>상담 일지 쓰러 가기 </u></button>
                    <button type="button" onclick="javascript:readadvise()" href="adviseDiaryRead.jsp" class="rvlink"><u>상담 일지 보러 가기</u></button>
                </div>
            </div>
            </form>
        </div>
        <div id="sidebar"><br>
            <ul>
              <li><a href="counsels">상담소 검색</a></li>
              <li><a href="reviews">상담후기 검색</a></li>
              <li><a href="reviewPost.jsp">상담후기 작성</a></li>
              <li><a href="CommPostList.jsp">심리 커뮤니티</a></li>
            </ul>
        </div>
    </div>

    <div id="footer">Footer</div>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="myPage.js"></script>
</html>