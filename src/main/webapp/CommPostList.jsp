<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PsychologyQ</title>
    <link rel="stylesheet" type="text/css" href="Comm_Post.css">
    <link rel="stylesheet" type="text/css" href="CommPost.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
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
                <li><a href="myPage.jsp">마이페이지</a></li>
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
                <div id="community-table">
                    <form action="심리QDB.sql" method="GET" name='rolling'>
                        <table class="table table-striped table-hover table border">
                            <!--한 페이지에 글 15개 출력-->
                           
                            <thread>
                                <tr id="contentThTr">
                                    <th width=10%>번호</th>
                                    <th width=50%>제목</th>
                                    <th width=20%>작성자</th>
                                    <th width=20%>날짜</th>
                                </tr>
                                <tbody>
                                <% 
       Class.forName("org.mariadb.jdbc.Driver");
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       try {
          String dbURL = "jdbc:mariadb://127.0.0.1:3306/simliq";
         String dbID ="root";
         String dbPassword = "root";
         
         conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
         
         pstmt = conn.prepareStatement("SELECT * from commposttbl;");
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
             

       %>
                                    <tr class="contentTr">
                                        <td><%= rs.getString("post_no") %></td>
                                        <td><%= rs.getString("post_title") %></td>
                                        <td><%= rs.getString("post_writer") %></td>
                                        <td><%= rs.getString("post_date") %></td>
                                    </tr>
                                         
                   <%
         }
    }catch(SQLException se){
        se.printStackTrace();
    }finally{
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
            %>
                                </tbody>
                            </thread>
                        </table>
                        <div id="community-bottom">
                            <form action="심리QDB.sql" method="post">
                                <input type="text" id="search-comment" placeholder="Search">
                                <input type="button" onclick="searchComment()" value="검색">
                                <a href="CommPost.jsp"><input type="button" id="writingConentButton" value="글쓰기"></a>
                            </form>
                        </div>
                    </form>
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
    