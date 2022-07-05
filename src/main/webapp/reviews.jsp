<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONArray" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PsychologyQ</title>
    <link rel="stylesheet" type="text/css" href="reviews.css">
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
	
	JSONArray reviews = (JSONArray) request.getAttribute("reviews");

%>

<body>
    <header>
        <a class="logo" href="MainPage.jsp"><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->
        <nav>
            <ul class="nav-items">
                <li><a href="MainPage.jsp">홈</a></li>
                <li>&#124;</li>
                <li><a href="myPage.jsp"">마이페이지</a></li>
                <li>&#124;</li>
                <li><a href=<%=loginouturl %>><%=loginout %></a></li>
            </ul>
        </nav>
    </header>

    <div id="main">
        <div id="contents">
            <div>
                <p>&gt;상담후기 작성하기&lt;</p>
                <h6>상담소를 클릭하면 하단에서 상세 후기를 볼 수 있습니다.</h6>
            </div>
            <div class="panel">
                <div class="body">
                    <div class="input-group">
                        <h5> <label for="searchBox"><img class="searchPicture" src="./image/search.png"></label>
                            <input type="text" id="searchBox" placeholder="지역/상담소/키워드 검색...">
                            <a href="[HTML]상담리뷰모음.html">X</a>
                        </h5>
                    </div>
                </div>
            </div>
            <form action="심리QDB.sql" method="POST" name="reviewInform" id="reviewInform">
                <table class="myTable table hover" id="collection">
                    <thead>
                        <tr>
                            <!--지역명은 시,군으로.-->
                            <th>지역</th>
                            <th>별점</th>
                            <th>상담소 이름</th>
                            <th>
                                <div class="showEllipsis">키워드</div>
                            </th>
                        </tr>
                    </thead>
                    <tbody class="reviews">
                        <script id="review-template" type="text/template">
                            <tr class="review" id={몇번째} onClick="showReview(this.id)">
                                <td>{지역}</td>
                                <td>{별점}</td>
                                <td>{상담소 이름}</td>
                                <td><div class="showEllipsis">{키워드}</div></td>
                            </tr>
			</script>
                    </tbody>
                </table>


                <hr class="line" color="BDBDBD" width="97%" style="margin:5% 0 5% 0; border-color: black; border-radius: 2em; ">

                <h2 class="con">&gt;게시글 상세&lt;</h2>
                <section class="article-detail table-common con row" class="reviewShow">

                    <table class="cell reviewShow" style="display:none">
                        <!-- <script id="reviewShow-template" type="text/template"> -->
                        <thead>
                            <tr class="article-title">
                                <td align="center">병원명</td>
                                <td colspan="3" id="counselName">&#123;counselName&#125;</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="article-info">
                                <th>방문 날짜</th>
                                <td id="visitDate">&#123;visitDate&#125;</td>
                                <th>방문 횟수</th>
                                <td id="nthVisit">&#123;nthVisit&#125;</td>
                            </tr>
                            <tr class="article-body">
                                <td colspan="4" id="reviewCont">&#123;reviewCont&#125;</td>
                            </tr>
                            <tr>
                                <th>전반적인 만족도</th>
                                <td id="totalStar">&#123;totalStar&#125;</td>
                                <th>상담사 태도</th>
                                <td id="attitudeStar">&#123;attitudeStar&#125;</td>
                            </tr>
                            <tr>
                                <th>예약 편의성</th>
                                <td id="bookingStar">&#123;bookingStar&#125;</td>
                                <th>상담소 위치</th>
                                <td id="locationStar">&#123;locationStar&#125;</td>
                            </tr>
                            <tr>
                                <th>키워드</th>
                                <td colspan="3" id="keyword">&#123;keyword&#125;</td>
                            </tr>
                        </tbody>
                        <!-- </script> -->
                    </table>
                </section>
            </form>

            <div class="col-lg-12" id="ex1_Result1"></div>
            <div class="col-lg-12" id="ex1_Result2"></div>

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
    <script src="reviews.js"></script>


</body>
<script>
    var reviews = <%= reviews.toString() %>
        var html = document.querySelector("#review-template").innerHTML;
    var resultHTML = "";
    var img;
    var star;

    for (var i = 0; i < reviews.length; i++) {
        star = reviews[i].totalStar;
        if (star == 0) {
            img = "<img src=\"./image/별0.png\" id=\"star\" value=\"0\">";
        } else if (star == 1) {
            img = "<img src=\"./image/별20.png\" id=\"star\" value=\"1\">";
        } else if (star == 2) {
            img = "<img src=\"./image/별40.png\" id=\"star\" value=\"2\">";
        } else if (star == 3) {
            img = "<img src=\"./image/별60.png\" id=\"star\" value=\"3\">";
        } else if (star == 4) {
            img = "<img src=\"./image/별80.png\" id=\"star\" value=\"4\">";
        } else {
            img = "<img src=\"./image/별100.png\" id=\"star\" value=\"5\">";
        }
        resultHTML += html.replace("{몇번째}", i)
            .replace("{지역}", "{지역}")
            .replace("{별점}", img)
            .replace("{상담소 이름}", reviews[i].counselName)
            .replace("{키워드}", reviews[i].keyword);

    }
    document.querySelector(".reviews").innerHTML += resultHTML;


    function showReview(clicked_id) {
        if (document.querySelector(".reviewShow").style.display == "none")
            document.querySelector(".reviewShow").style.display = "block";
        document.querySelector("#counselName").innerText = reviews[clicked_id].counselName;
        document.querySelector("#visitDate").innerText = reviews[clicked_id].visitDate;
        document.querySelector("#nthVisit").innerText = reviews[clicked_id].nthVisit;
        document.querySelector("#totalStar").innerText = returnStar(reviews[clicked_id].totalStar);
        document.querySelector("#attitudeStar").innerText = returnStar(reviews[clicked_id].attitudeStar);
        document.querySelector("#bookingStar").innerText = returnStar(reviews[clicked_id].bookingStar);
        document.querySelector("#locationStar").innerText = returnStar(reviews[clicked_id].locationStar);
        document.querySelector("#reviewCont").innerText = reviews[clicked_id].reviewCont;
        document.querySelector("#keyword").innerText = reviews[clicked_id].keyword;
    }

    function returnStar(star) {
        if (star == 0) {
            star = "☆☆☆☆☆";
        } else if (star == 1) {
            star = "★☆☆☆☆";
        } else if (star == 2) {
            star = "★★☆☆☆";
        } else if (star == 3) {
            star = "★★★☆☆";
        } else if (star == 4) {
            star = "★★★★☆";
        } else {
            star = "★★★★★";
        }
        return star;
    }

</script>

</html>
