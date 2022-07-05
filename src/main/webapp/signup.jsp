<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="signup.css">
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
                <li><a href="login.jsp" class="nav-active">로그인</a></li>
            </ul>
        </nav>
    </header>

    <h1>logo</h1>

    <div id="main">
        <div id="contents">
            <div class="membership_register">
                <form name="userInfo" method="post" action="signupAction.jsp">

                    <caption><span class="register_field_caption">계정 생성</span></caption><br>
                    <fieldset class="fieldset_table_border">
                        <table class="PQ_register">
                            <tr>
                                <th>아이디</th>
                                <td><input type="text" name="user_id" placeholder="ID" onkeydown="inputID()" required>
                                    <input type="button" name="ID_check" value="중복확인" onclick="javascript:ID_Check()">
                                    <input type="hidden" name="ID_chk" value="ID_Uncheck">
                                    <br>
                                </td>
                            </tr>
                            <tr>
                                <th>패스워드</th>
                                <td><input type="password" name="user_pwd" onkeydown="inputPassword()" required placeholder="password" maxlength="20" autocomplete="off">
                                </td>
                            </tr>
                            <tr>
                                <th>패스워드 확인</th>
                                <td>
                                    <input type="password" name="passwordCheck" onkeydown="inputPasswordCheck()" required placeholder="password check" maxlength="20" autocomplete="off">

                                    <input type="button" name="passwordSameCheck" value="패스워드 재확인" onclick="javascript:passwordSame_Check()">
                                    <input type="hidden" name="passwordSameChk" value="passwordSame_Uncheck">
                                </td>
                            </tr>
                        </table>
                    </fieldset>

                    <br><br><br>

                    <caption><span class="register_field_caption">회원 정보 입력</span></caption><br>
                    <fieldset class="fieldset_table_border">
                        <table class="PQ_register">
                            <tr>
                                <th>이름</th>
                                <td>
                                    <input type="text" id="userName" name="user_name" maxlength="20" placeholder="홍길동" required>
                                </td>
                            </tr>
                        </table>
                        <div id="agree_check">
                            <input type="radio" name="agreeCheck" onclick="javascript:getAgree()" value="disagree" request>개인정보 수집, 이용에 동의합니다.
                            <br>
                            <span style="font-size: 0.5em">사용자는 개인정보 수집, 이용에 동의하지 않을 수 있으며, 동의하지 않을 시 회원가입이 제한됩니다.</span>
                        </div>
                        <br>
                    </fieldset>
                    <br>
                    <div class="btnfield">
                        <input type="button" value="회원가입" onclick="javascript:userInfoCheck()">
                    </div>

                </form>
            </div>
        </div>
    </div>

    <div id="footer">Footer</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="signup.js"></script>
</body>

</html>
