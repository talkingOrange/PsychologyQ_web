<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PsychologyQ</title>
<link rel="stylesheet" type="text/css" href="./advise-diary.css">

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
		<a class="logo" href="MainPage.jsp"  ><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->		<!-- 로고 사진<img src="">-->
		<nav>
			<ul class="nav-items">
				<li><a href="MainPage.jsp" >홈</a></li>
				<li>&#124;</li>
				<li ><a href="myPage.jsp" class="nav-active">마이페이지</a></li>				<li>&#124;</li>
                <li><a href=<%=loginouturl %>><%=loginout %></a></li>
			</ul>
		</nav>
	</header>

	<div id="main">
		<div id="contents">
			<br> <br> <br>
			<hr size="9cm" color="BDBDBD" width="97%"
				style="border-color: black; border-radius: 2em;">
			<form action="adviseDiaryAction.jsp" method="POST" name="reviseSaveButton">
			<table id="contents" width="93%">


				<tr align="center">
					<!-- 달력 날짜 누르면 해당 날짜로 연동 필요 -->
					<!--HTML도 수정이 가능한데, 무슨 태그를 써야 데베로 연결시킬 수 있을지 모르겠음. 도움 필요.  -->
					
						<td align="left" colspan="2" height="12%" width="75%">
						<h3><%= request.getParameter("today").split("-")[0] + "년 " + request.getParameter("today").split("-")[1] + "월 " + request.getParameter("today").split("-")[2] + "일" %>
						</h3>
								</td>
					

				</tr>


				<!--사용자 일기와 투두리스트 데베에 저장-->
				<tr height="70%">
				<input type="hidden" name="adviseDate" value=<%= request.getParameter("today") %>>
				</input>
					<!--글을 입력한 뒤, 저장 누르면 글 수정 불가하게 하기.-->
					<td colspan="2"><textarea name=content id=diarycontent
							placeholder="|오늘 하루를 간단히 기록해요. "
							style="padding: 4%; width: 100%; background-color: rgba(179, 234, 242, 1); border-radius: 5%; border: 0px;"
							autofocus></textarea></td>
					<!--추가하면 체크리스트 항목 추가, 제거하면 마지막 항목 제거-->
					
				</tr>
			</table>

			<hr size="9cm" color="BDBDBD" width="97%"
				style="border-color: black; border-radius: 2em; margin-top: -5px;">


			<div id="buttonId">
				<table>
					<!--수정버튼 클릭후 데이터 수정 가능토록 하기.-->
					<!-- 저장버튼 클릭후 데이터 저장 + 저장 완료 메시지 창 띄우기 -->
					<tr align="rignt" height="20%">
						<!--버튼 누르면 데베랑 연결시키기-->
						
							<!--<td width="50%"><button class="styled" type="button"
									onclick="javascript:revise('수정되었습니다.')">수정</button></td>-->
							<td width="70px">
								<button class="styled" type="button"
									onclick="javascript:save('저장하시겠습니까?')">저장</button>
							</td>
						

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
				<li><a href="reviewPost.jsp">상담후기 작성</a></li>
				<li><a href="CommPostList.jsp">심리 커뮤니티</a></li>
			  </ul>
			</div>
			
			</div>

	<div id="footer">Footer</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script src="advise-diary.js"></script>
</body>

</html>