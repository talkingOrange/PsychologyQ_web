<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="login.css">
    <title>PsychologyQ</title>
</head>

<body>
    <header>
        <a class="logo" href="MainPage.jsp"><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->
        <nav>
            <ul class="nav-items">
                <li><a href="MainPage.jsp">홈</a></li>
                <li>|</li>
                <li><a href="myPage.jsp">마이페이지</a></li>
                <li>|</li>
                <li><a href="login.jsp">로그인</a></li>
            </ul>
        </nav>
    </header>

    <h1>logo</h1>

    <div id="main">
        <div id="contents">
            <div class="login">
                <form method="post" action="loginAction.jsp">
                    <h1>Log-in</h1>
                    <br>
                    <div class="login_id">
                        <h4>ID</h4>
                        <input type="text" name="user_id" id="" placeholder="ID">
                    </div>
                    <div class="login_pw">
                        <h4>Password</h4>
                        <input type="password" name="user_pwd" id="" placeholder="Password">
                    </div>
                    <br>
                    <div class="bottom_action">
                        <input type="button" onclick="" value="회원가입">
                        <input type="submit" value="로그인">

                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="footer">Footer</div>
</body>

</html>
