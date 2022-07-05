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
    <link rel="stylesheet" href="./ligne_paginatejs-master/css/ligne.css">
    <link rel="stylesheet" href="./ligne_paginatejs-master/css/paginate.css">
    <script type="text/javascript" src="./ligne_paginatejs-master/js/paginate.js"></script>
</head>

<body>
    <header>
        <a class="logo" href="#home"><img src="./image/심리Q.png" width="75px" style="margin-left: 5%;"></a> <!-- 로고 사진-->
        <nav>
            <ul class="nav-items">
                <li><a href="#home">홈</a></li>
                <li>|</li>
                <li><a href="#mypage">마이페이지</a></li>
                <li>|</li>
                <li><a href="#login">로그인</a></li>
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
                                <div id="comment-content-title">
                                    <span id=contents-title>심리Q 커뮤니티 이용규칙</span>
                                </div>
                                <br>
                                <div id="comment-content" style="min-height: 690px;"><span id="writing-contents-view" style="letter-spacing :1.0px; word-spacing:-1px; line-height:30px;">
                                        <b>1. 개인 정보</b><br><br>
                                        다른 사람의 표시명을 제외한 개인 정보를 공유하는 행위는 허용되지 않으며,
                                        자신의 개인 정보 역시 공유하지 않는 것이 좋습니다.
                                        다른 사람의 부 계정 이름이나 실제 거주지, 실명 등을 공유하거나
                                        공유하겠다고 협박하는 행위는 허용되지 않습니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>2. 불관용과 차별</b><br><br>
                                        심리Q는 어떠한 형태의 혐오나 차별도 용인하지 않습니다.
                                        심리Q는 다양한 인종, 민족, 피부색, 종교, 성 정체성,
                                        성적 지향성, 능력, 출신 국가의 회원을 환영합니다.
                                        다른 사용자나 집단을 비하하거나, 무시하거나,
                                        혐오 발언을 하거나, 폄하하지 말아 주세요.
                                        <br>
                                        <br>
                                        <br>
                                        <b>3. 따돌림 및 괴롭힘</b><br><br>
                                        글 작성, 댓글 이용 중에 타인을 존중해 주세요.
                                        타인 괴롭히기, 협박, 위협, 외설적인 언행, 모욕, 비난,
                                        개인 정보 침해, 학대 등은 모두 규정을 위반하는 행위입니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>4. 타인 사칭</b><br><br>
                                        다른 사용자나 스트리머, 유명인, 정부 관계자,
                                        심리Q 직원 등을 타인을 사칭하지 마세요.
                                        다른 사람을 기만하거나 사취하기 위해
                                        다른 사람의 신분을 사칭하는 행위는 허용되지 않습니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>5. 위험하거나 불법적인 행위</b><br><br>
                                        각 지역의 법률을 준수하고 도박, 약물 사용, 피싱,
                                        인신매매, 성매매, 신상 털기, 거짓 신고, 폭력을
                                        미화하거나 조장하는 콘텐츠 공유 등
                                        불법적이거나 위험한 행위에 참여하거나
                                        이를 조장하지 마세요.
                                        자신 또는 타인을 해치겠다는 위협은
                                        아주 심각한 규칙 위반 행위로 간주됩니다.
                                        농담으로라도 절대 그런 말은 하지 마세요.
                                        <br>
                                        <br>
                                        <br>
                                        <b>6. 사기 및 기만 행위</b><br><br>
                                        다른 회원들을 이용하지 마세요. 타인의 계정 정보를
                                        비정상적인 방법으로 알아내거나,
                                        계정 또는 개인 정보를 구입하거나 판매하는 등의
                                        사기 또는 기만 행위는 금지됩니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>7. 부적절한 콘텐츠</b><br><br>
                                        심리Q 내의 콘텐츠나 커뮤니케이션, 활동은
                                        다른 사람의 긍정적인 경험을 방해하지 않아야 합니다.
                                        모든 콘텐츠는 콘텐츠 가이드라인을 따라야 합니다.
                                    </span>
                                </div>
                            </div>
                        </form>
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
</body>

</html>
