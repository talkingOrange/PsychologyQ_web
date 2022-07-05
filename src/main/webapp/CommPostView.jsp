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
        <a class="logo" href="MainPage.jsp" ><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->        <nav>
            <ul class="nav-items">
                <li><a href="MainPage.jsp">홈</a></li>
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
                <br><br>
                <div id="community-table">
                    <div id="community-content">
                        <form action="심리QDB.sql" method="post">
                            <div id="contents-view">
                                <div id="comment-content-title"><span id=contents-title>글 제목이 div를 넘치면 자르고 쩜쩜쩜으로 대체합니다아아아아
                                </span></div>
                            <table id="info-align">
                                <tr>
                                    <td class="comment-user">아이디:<span class="comment-user">디비에서 받기</span></td>
                                    <td class="comment-date"><span class="comment-date">2021-04-02 00:77:77</span></td>
                                </tr>
                            </table>
                            <div id="comment-content"><span id="writing-contents-view">글내용이가로로길면중간에잘라주고세로길이를넘기면자동으로스크롤이생김(360px이상일때스크롤생김)니다아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아아
                                </span>
                            </div>
                            </div>
                        </form>
                    </div>
                    <br>
                    <hr><br>
                    <div class="comment-input">
                        <form action="심리QDB.sql" method="post">
                            <input type="text" id="new-comment" name="new-comment" placeholder="New Comment">
                            <input type="button" onclick="submitComment()" value="글쓰기">
                        </form>
                    </div>
                    <br>
                    <div id="comments">
                        <span id="comments-count">0</span>Comments
                        <hr>
                    </div>
                    <br>
                    <div id="comments-table">
                        <table style="min-width: 100%;">
                            <tbody id="comments-new">
                                <form action="심리QDB.sql" method="get">
                                    <!--기존댓글-->
                                </form>
                            </tbody>
                        </table>
                    </div>
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
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="Community.js"></script>
</body></html>
