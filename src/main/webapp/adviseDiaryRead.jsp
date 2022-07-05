<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PsychologyQ</title>
    <link rel="stylesheet" type="text/css" href="./adviseDiaryRead.css">
  
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
            <li ><a href="MainPage.jsp">홈</a></li>
            <li >&#124;</li>
            <li><a href="myPage.jsp" class="active">마이페이지</a></li>
            <li >&#124;</li>
            <li><a href=<%=loginouturl %>><%=loginout %></a></li>
          </ul>
        </nav>
      </header>
    
    <div id="main">
        <div id="contents">
          <div class="back"><a href="myPage.jsp"></a> <h4>뒤로가기 <</h4> </a></div>
          <hr size="9cm" color="BDBDBD" width="97%" style="border-color: black; border-radius: 2em;">

          <form action="심리QDB.sql" method="GET" name="date">
          <input type="hidden" name="adviseDate" value=<%= request.getParameter("today") %>>
          <table id="contents" width = "93%" >
            <tr align="center">
               <!-- 달력 날짜 누르면 해당 날짜로 연동 필요 -->
                <td align ="left" colspan ="2" height="12%"width= "75%">
                	<h3><%= request.getParameter("today").split("-")[0] + "년 " + request.getParameter("today").split("-")[1] + "월 " + request.getParameter("today").split("-")[2] + "일" %>
					</h3>
                </td>
            </tr>

            <tr height="70%"  >
              <!--글 불러오기-->
                <td  colspan="2" >
                	<div id="write"></div>
                </td>
            </tr>
          </table>
          </form>
          <script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
          <script src="adviseDiaryRead.js"></script>

          <hr size="9cm" color="BDBDBD" width="97%" style="border-color: black; border-radius: 2em; margin-top:2%;">

          <img src="꽃.png" id=flower >

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

</html>