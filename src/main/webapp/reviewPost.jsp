<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>PsychologyQ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PsychologyQ</title>
    <link rel="stylesheet" type="text/css" href="reviewPost.css">
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
            <p>&gt;상담후기 작성하기&lt;</p>
            <hr size="9cm" color="BDBDBD" width="97%" style="border-color: black; border-radius: 2em; ">

            <!--사용자가 선택한 별점/상담소 정보를 저장한다.-->
            <form action="review" method="POST" name="reviewPage">
                <table id="totalStar">
                    <tr>
                        <td width="23%">
                            <h2>전반적인 만족도</h2>
                        </td>
                        <td>
                            <div class="rate">
                                <input type="radio" id="star5" name="totalPoints" value="5" />
                                <label for="star5" title="text">5 stars</label>
                                <input type="radio" id="star4" name="totalPoints" value="4" />
                                <label for="star4" title="text">4 stars</label>
                                <input type="radio" id="star3" name="totalPoints" value="3" />
                                <label for="star3" title="text">3 stars</label>
                                <input type="radio" id="star2" name="totalPoints" value="2" />
                                <label for="star2" title="text">2 stars</label>
                                <input type="radio" id="star1" name="totalPoints" value="1" />
                                <label for="star1" title="text">1 star</label>
                            </div>
                        </td>
                    </tr>
                </table>
                <table id="detailStar">
                    <tr>
                        <th align="left" width="27%" id="rateFactor">
                            <h1>상담사 태도</h1>
                        </th>
                        <td class="rate1">
                            <div class="rateAttitude">
                                <input type="radio" id="star10" name="attitudePoints" value="5" />
                                <label for="star10" title="text">5 stars</label>
                                <input type="radio" id="star9" name="attitudePoints" value="4" />
                                <label for="star9" title="text">4 stars</label>
                                <input type="radio" id="star8" name="attitudePoints" value="3" />
                                <label for="star8" title="text">3 stars</label>
                                <input type="radio" id="star7" name="attitudePoints" value="2" />
                                <label for="star7" title="text">2 stars</label>
                                <input type="radio" id="star6" name="attitudePoints" value="1" />
                                <label for="star6" title="text">1 star</label>
                            </div>
                        </td>
                        <td rowspan="3" class="inform" width="50%">
                            <div class="information">
                                <ol align="left">
                                    <li>
                                        <h3>* 상담소명:<br></h3> <input type="text" name="userHospital" id="hospitalName" style="width: 55%; margin: 3px 0px 8px 3px;" />
                                    </li>
                                    <li>
                                        <h3>* 방문 날짜: </h3><input type="date" name="visitDate" id="date" style="width: 80%; border:0px; margin: 3px 0px 8px 3px;" />
                                    </li>
                                    <li>
                                        <h3>* <input type="number" name="visitNum" min="1" max="99" id="num" value="1" font-align="left" style="width: 16%; " />번째 방문</h3>
                                    </li>
                                    <!--사용자가 다녀간 정보-->
                                </ol>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th align="left">
                            <h1>예약 편의성</h1>
                        </th>
                        <td class="rate2">
                            <div class="rateComfortable">
                                <input type="radio" id="star15" name="bookingPoints" value="5" />
                                <label for="star15" title="text">5 stars</label>
                                <input type="radio" id="star14" name="bookingPoints" value="4" />
                                <label for="star14" title="text">4 stars</label>
                                <input type="radio" id="star13" name="bookingPoints" value="3" />
                                <label for="star13" title="text">3 stars</label>
                                <input type="radio" id="star12" name="bookingPoints" value="2" />
                                <label for="star12" title="text">2 stars</label>
                                <input type="radio" id="star11" name="bookingPoints" value="1" />
                                <label for="star11" title="text">1 star</label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th align="left">
                            <h1>상담소 위치</h1>
                        </th>
                        <td class="rate3">
                            <div class="rateLocation">
                                <input type="radio" id="star20" name="locationPoints" value="5" />
                                <label for="star20" title="text">5 stars</label>
                                <input type="radio" id="star19" name="locationPoints" value="4" />
                                <label for="star19" title="text">4 stars</label>
                                <input type="radio" id="star18" name="locationPoints" value="3" />
                                <label for="star18" title="text">3 stars</label>
                                <input type="radio" id="star17" name="locationPoints" value="2" />
                                <label for="star17" title="text">2 stars</label>
                                <input type="radio" id="star16" name="locationPoints" value="1" />
                                <label for="star16" title="text">1 star</label>
                            </div>
                        </td>
                    </tr>
                </table>

                <hr size="9cm" color="BDBDBD" width="97%" style="border-color: black; border-radius: 2em; margin-top: -5px; margin-bottom:3%;">

                <div>
                    <!--사용자가 적은 리뷰와 키워드 저장(나중에 상담소 찾기에서 불러옴.)-->
                    <span style="color:#aaa;" id="counter">(0 / 최대 1000자)</span>

                    <textarea id="reviewText" name=content placeholder="다른 사용자들에게 도움이 될 리뷰를 작성해주세요. (50자 이상) " autofocus></textarea>

                    <h5><br>[ 키워드 선택 ]</h5>
                    <h6><br> 심리평가 및 검사 </h6>
                    <h4>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="종합심리검사">종합심리검사</label>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="영유아발달검사">영유아발달검사</label>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="주의력집중검사">주의력집중검사</label>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="성격유형검사">성격유형검사</label>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="새학기적응검사">새학기적응검사</label>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="부부검사">부부검사</label>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="지능 및 적성검사">지능 및 적성검사</label>
                        <label><input type="radio" class="detailSearch" name="keyword1" value="외상후스트레스">외상후스트레스</label>
                    </h4>
                    <h6><br> 아동심리상담</h6>
                    <h4>
                        <label><input type="radio" class="detailSearch" name="keyword2" value="ADHD">ADHD</label>
                        <label><input type="radio" class="detailSearch" name="keyword2" value="틱장애">틱장애</label>
                        <label><input type="radio" class="detailSearch" name="keyword2" value="새학기증후군">새학기증후군</label>
                        <label><input type="radio" class="detailSearch" name="keyword2" value="스마트폰중독">스마트폰중독</label>
                        <label><input type="radio" class="detailSearch" name="keyword2" value="소아 우울증">소아 우울증</label>
                        <label><input type="radio" class="detailSearch" name="keyword2" value="아동성폭행">아동성폭행</label>
                        <label><input type="radio" class="detailSearch" name="keyword2" value="전반적 발달장애">전반적 발달장애</label>
                    </h4>

                    <h6><br> 청소년 심리상담</h6>
                    <h4>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="청소년우울증">청소년우울증</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="(집단)따돌림">(집단)따돌림</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="시험불안">시험불안</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="부모/자녀문제">부모/자녀문제</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="학교부적응">학교부적응</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="대인기피증">대인기피증</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="게임중독증">게임중독증</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="학교폭력">학교폭력</label>
                        <label><input type="radio" class="detailSearch" name="keyword3" value="가정폭력">가정폭력</label>
                    </h4>

                    <h6><br> 성인심리상담</h6>
                    <h4>
                        <label><input type="radio" class="detailSearch" name="keyword4" value="우울증">우울증</label>
                        <label><input type="radio" class="detailSearch" name="keyword4" value="공황장애">공황장애</label>
                        <label><input type="radio" class="detailSearch" name="keyword4" value="대인관계장애">대인관계장애</label>
                        <label><input type="radio" class="detailSearch" name="keyword4" value="부부갈등">부부갈등</label>
                        <label><input type="radio" class="detailSearch" name="keyword4" value="불안장애">불안장애</label>
                        <label><input type="radio" class="detailSearch" name="keyword4" value="가족상담">가족상담</label>
                    </h4>

                    <h6><br> 심리치료</h6>
                    <h4>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="심리치료">심리치료</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="놀이치료">놀이치료</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="언어치료">언어치료</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="학습치료">학습치료</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="미술치료">미술치료</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="인지치료">인지치료</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="연극치료">연극치료</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="부모교육">부모교육</label>
                        <label><input type="radio" class="detailSearch" name="keyword5" value="사회성발달치료">사회성발달치료</label>
                    </h4>
                </div>

                <div id="buttonId">
                    <table style="margin-top: 25%;">
                        <!--수정버튼 클릭후 데이터 수정 가능토록 하기.-->
                        <!-- 저장버튼 클릭후 데이터 저장 + 저장 완료 메시지 창 띄우기 -->
                        <tr align="rignt" height="20%">
                            <td width="50%"><button class="styled" type="button" id="reviseButton" name="reviewRevise">
                                    수정
                                </button></td>
                            <td width="70px">
                                <button class="styled" id="saveButton" type="submit" value="확인" name="reviewSave">
                                    저장
                                </button>

                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>


        <div id="sidebar"><br>
            <ul>
                <li><a href="counsels">상담소 검색</a></li>
                <li><a href="reviews">상담후기 검색</a></li>
                <li><a href="reviewPost.jsp" class="active">상담후기 작성</a></li>
                <li><a href="CommPostList.jsp">심리 커뮤니티</a></li>
            </ul>
        </div>

    </div>

    <div id="footer">Footer</div>

    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="reviewPost.js"></script>

</body>

</html>
