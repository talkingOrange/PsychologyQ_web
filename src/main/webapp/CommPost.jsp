<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PsychologyQ</title>
    <link rel="stylesheet" type="text/css" href="Comm_Post.css">
    <link rel="stylesheet" type="text/css" href="CommPostView.css">
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
%>
<body>
    <header>
        <a class="logo" href="MainPage.jsp"  ><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->        <nav>
            <ul class="nav-items">
                <li><a href="MainPage.jsp" >홈</a></li>
                <li>&#124;</li>
                <li><a href="myPage.jsp" >마이페이지</a></li>
                <li>&#124;</li>
                <li><a href=<%=loginouturl %>><%=loginout %></a></li>
            </ul>
        </nav>
    </header>
    <div id="main">
        <div id="contents">
            <div id="community-rolling-banner">
                <div id='rollong-banner'>
                    <form action="심리QDB.sql" method="GET" name='rolling'>
                        <ul class='rollings'>
                            <li>
                                <a href='#'>
                                    <img src="image/정보글_광고신청.jpg" alt="롤링배너이미지" style="width: 100%; max-width: 100%; height: 100%; max-height: 100%;">
                                </a>
                            </li>
                            <li>
                                <a href='#'>
                                    <img src='image/%EA%B8%B0%EC%81%A8%EC%9D%B4.png' art="광고문의" style="width: 100%; max-width: 100%; height: 100%; max-height: 100%;">
                                </a>
                            </li>
                            <li>
                                <a href='#'>
                                    <img src="image/sea.png" alt="광고문의2" style="width: 100%; max-width: 100%; height: 100%; max-height: 100%;">
                                </a>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
            <div id=community>
                <div class="community-left-menu">
                    <ul>
                        <li><a href="CommPostList.jsp">전체글</a></li>
                        <li><a href="CommAnnounce.jsp">공지사항</a></li>
                        <li><a href="CommUserRule.jsp">이용규칙</a></li>
                    </ul>
                </div>
                <br>
                <div id="community-table">
                    <form action="simliq.sql" method="post" style="text-align: left;">
                        <div id="button-align">
                            <button type="submit" onclick="submitWrite()">글쓰기</button>
                        </div>
                        <br>
                        <hr><br>
                        <div id="community-content">
                            <div class="content-title">
                                <textarea placeholder="제목을 입력해주세요." id="comment-title-write" required style="height: 40px;"></textarea>
                            </div>
                            <div class="content-writing">
                                <div class="content-container">
                                    <section class="comment-canvas">
                                        <article class="comment-wrap">
                                            <div class="comment-text">
                                                <textarea id="comment-text-write" placeholder="글을 작성해주세요." required></textarea>
                                            </div>
                                        </article>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </form>
                    <br>
                    <hr>
                </div>
            </div>
        </div>
        <div id="sidebar"><br>
            <ul>
                <li><a href="counsels">상담소 검색</a></li>
                <li><a href="reviews">상담후기 검색</a></li>
                <li><a href="reviewPost.jsp">상담후기 작성</a></li>
                <li><a href="CommPostList.jsp" class="active">심리 커뮤니티</a></li>
            </ul>
            </div>
            
            </div>
    <div id="footer">Footer</div>
    <script type="text/javascript" src="Community.js"></script>
</body></html>
    