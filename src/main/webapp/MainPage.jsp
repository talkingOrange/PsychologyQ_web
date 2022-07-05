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
    <link rel="stylesheet" type="text/css" href="MainPage.css">
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
                <li><a href="MainPage.jsp"  class="nav-active">홈</a></li>
                <li>&#124;</li>
                <li><a href="myPage.jsp">마이페이지</a></li>
                <li>&#124;</li>
                <li><a href=<%=loginouturl %>><%=loginout %></a></li>
            </ul>
        </nav>
    </header>

    <h1>logo</h1>
    <div id="rollingBanners">
        <form action="reviews" method="GET" name='rolling'>
            <div id="Reviews">
                <h2>B e s t &nbsp; R e v i e w s</h2><br><br>
                <ul class="rollings">
                    <script type="text/javascript" src="MainPage.js"></script>
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
         
         pstmt = conn.prepareStatement("SELECT * from reviewtbl;");
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
             

       %>
                   <li> <a href="reviews">
                            <h7><%= rs.getString("review_cont") %></h7>

                            <br><br><br><br><br>

                            <h5><%= rs.getString("visit_date")%></h5>
                            <h5><%= rs.getString("counsel_name")%></h5> 
                        </a></li>
                        
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
                </ul>
            </div>
        </form>
    </div>

    <div id="main">
        <div id="contents">
            <form action="CounselList.jsp" method="post" name='searchList'>
                <div id="search">
                    <table id="contentsTable">
                        <tr>
                            <td>
                                <input type="text" placeholder="병원명 검색" id="searchName">
                            </td>
                            <td>
                                <button type="submit" value="search" id="searchButton">
                                <li><a href="CounselList.jsp">검색</a></li>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            <br><br><br>
            <form action="simliq.sql" method="GET" name='rankList'>
                <dl id="rank-list">                      
                        <dd>
                        <ol>
                            <h3>
                                상담소 랭킹(별점 높은 순)<br>
                            </h3>
                            
 <% 
      				 Class.forName("org.mariadb.jdbc.Driver");
      				 Connection conn2 = null;
       				PreparedStatement pstmt2 = null;
       					ResultSet rs2 = null;
       
       try {
          String dbURL = "jdbc:mariadb://127.0.0.1:3306/simliq";
         String dbID ="root";
         String dbPassword = "root";
         
         conn2=DriverManager.getConnection(dbURL,dbID,dbPassword);
         
         pstmt2 = conn2.prepareStatement("SELECT counsel_name, RANK() over (ORDER BY total_star) AS star_rank FROM reviewtbl;");
         
         rs2 = pstmt2.executeQuery();
         
         while(rs2.next()) {
             
       %>              
                            <li>
                            <h7><%= rs2.getString("counsel_name") %></h7>    
                            </li>                                       
                        </ol>
                    </dd>
                    
          <%
         }
    }catch(SQLException se2){
        se2.printStackTrace();
    }finally{
        if(rs2 != null) rs2.close();
        if(pstmt2 != null) pstmt2.close();
        if(conn2 != null) conn2.close();
    }
            %>
                  
                </dl>
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
   
</body></html>
