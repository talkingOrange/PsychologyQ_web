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
                                    <span id=contents-title>심리Q 커뮤니티 이용 시 회원 준수사항</span>
                                </div>
                                <br>
                                <div id="comment-content" style="min-height: 690px;"><span id="writing-contents-view" style="letter-spacing :1.0px; word-spacing:-1px; line-height:30px;">
                                        <b>1. 회원간 서로 배려하고 예의를 지킵니다.</b>
                                        <br>
                                        <br>
                                        (1) 내 생각과 다른 의견도 규칙위반이 아닌 한 존중합니다. 다른 의견에 대해 비판할 수는 있어도 무조건 비난해서는 안됩니다.
                                        <br>
                                        (2) 다른 이용자에 대한 존중의 의미로 존댓말을 사용하고, 닉네임 뒤에 “님”을 붙여 부릅니다.
                                        <br>
                                        (3) 욕설, 비속어의 사용을 금지합니다. (욕설임을 알 수 있는 자음, 기호 등 포함)
                                        <br>
                                        (4) 다른 회원에 대한 무분별한 비난이나 인신공격을 하지 않습니다.
                                        <br>
                                        (5) 과도한 추측이나 일반화로 다른 회원을 비난하지 않습니다.
                                        <br>
                                        (6) 다른 의견에 대하여 무조건적인 비하를 하여서는 안됩니다.
                                        <br>
                                        (7) 비방 또는 분란을 조장하는 허위사실이나 근거없는 정보를 유포해서는 안됩니다.
                                        <br>
                                        <br>
                                        <br>

                                        <b>2. 다른 회원을 속이거나, 개인 또는 단체의 이익을 목적으로 부정하게 활동할 수 없습니다.</b><br>
                                        <br>
                                        (1) 반복적으로 다른 이용자를 속일 목적으로 게시물을 작성할 수 없습니다.
                                        <br>
                                        (2) 일반적인 회원으로 가장하여 홍보성 게시물을 작성하여서는 안됩니다.
                                        <br>
                                        (3) 바이럴마케팅이나 전문적인 판매, 홍보(블로그, 동영상, 앱 등)를 위한 활동은 금지됩니다.
                                        <br>
                                        (4) 이미지 링크용도, 추천인코드, 권한획득 목적의 게시물 반복 작성 등 개인적 이득을 위한 활동을 하실 수 없습니다.
                                        <br>
                                        (5) 특정 단체에 대한 긍정적 또는 부정적 여론조성을 위해 부당하게 활동할 수 없습니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>3. 본인의 정보로 회원가입을 하고 활동해야 합니다.</b>
                                        <br>
                                        <br>
                                        (1) 1인 1아이디를 사용하며, 타인의 정보로 가입 및 활동할 수 없습니다.
                                        <br>
                                        (2) 부당하게 2개 이상의 아이디를 사용하거나 하나의 아이디를 2인 이상이 사용하는 경우 해당 아이디는 이용제한 대상이 될 수 있습니다.
                                        <br>
                                        (3) 징계회피 목적의 탈퇴 후 재가입, 타인 명의를 사용하여 활동하는 경우 등이 확인되면 해당 아이디는 이용이 제한됩니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>4. 법률 기타 법령 및 공공질서, 미풍양속에 반하는 내용의 게시물을 작성할 수 없습니다.</b>
                                        <br>
                                        <br>
                                        (1) 청소년에게 유해할 수 있는 외설적 표현물(글, 사진, 영상, 링크 등)을 게시하지 않습니다.
                                        <br>
                                        (2) 불법행위 방법 소개, 의욕 고취 등 범법행위를 교사, 방조하는 내용의 게시물을 작성하지 않습니다.
                                        <br>
                                        (3) 법령에 의해 금지되는 게시물을 올릴 수 없습니다.
                                        <br>
                                        (4) 유관기관의 요청이나 명령이 있는 경우 그에 따른 조치가 진행될 수 있습니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>5. 타인의 권리를 침해하는 행위를 제한합니다.</b>
                                        <br>
                                        <br>
                                        (1) 저작권을 침해하는 게시물을 작성하지 않습니다. (기사 전문전재, 음악 배포 등)
                                        <br>
                                        (2) 식별가능한 타인의 초상을 무단으로 게시하여서는 안됩니다. (허용된 경우 제외)
                                        <br>
                                        (3) 타인의 재산권을 침해하는 내용이거나 허위의 사실로 영업을 방해할 목적의 게시물을 작성하지 않습니다.
                                        <br>
                                        (4) 타인의 권리를 침해하는 게시물은 침해 당사자의 요청에 의해 삭제될 수 있습니다. (삭제요청 및 처리과정 안내)
                                        <br>
                                        <br>
                                        <br>
                                        <b>6. 종교 비난, 선교/포교 활동을 제한합니다.</b>
                                        <br>
                                        <br>
                                        (1) 특정 종교에 대한 과도한 비난 및 이를 이유로 한 분란조장 행위를 하지 않습니다.
                                        <br>
                                        (2) 자신의 종교적 신념을 강요하거나 포교를 목적으로 한 활동은 제한됩니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>7. 특정 집단에 대한 차별 및 무조건적 비난을 하여서는 안됩니다.</b>
                                        <br>
                                        <br>
                                        (1) 인종, 성별, 국적, 연령, 지역, 장애 등 구분이 가능한 집단에 대하여 그 구성원에게 굴욕감이나 불이익을 줄 수 있는 게시물을 작성하지 않습니다.
                                        <br>
                                        (2) 학벌, 재산, 직업, 생활양식, 취향, 종교, 정치적 견해 등을 이유로 무조건적인 비난을 하지 않습니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>8. 다른 이용자의 이용에 방해가 되는 행위를 할 수 없습니다.</b>
                                        <br>
                                        <br>
                                        (1) 타인에게 혐오감을 주거나 불쾌하게 할 수 있는 게시물 작성을 금지합니다.
                                        <br>
                                        (2) 특수문자의 과도한 사용, 도배성 게시물/댓글 등 다른 이용자에게 불편을 주는 경우 해당 게시물은 삭제될 수 있습니다.
                                        <br>
                                        (3) 영화, 소설의 반전 등 스포일러 공개는 가급적 자제하며, 불가피한 경우 적당한 방법으로 표시하여 다른 이용자를 배려합니다.
                                        <br>
                                        (4) 이용자를 속이거나 과도하게 놀라게 할 목적의 게시물(이른바 낚시글)은 자제하여 주시기 바랍니다.
                                        <br>
                                        (5) 고의적으로 규칙위반 게시물 작성 후 삭제를 반복하는 경우 작성자는 이용이 제한될 수 있습니다.
                                        <br>
                                        (6) 바이러스 프로그램 유포, 스팸쪽지 등 타인에게 피해를 주는 행위를 금지합니다.
                                        <br>
                                        (7) 무분별하고 반복적인 비난 댓글, 괴롭힘을 위한 게시글 및 댓글 작성 등의 스토킹 행위를 하지 않습니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>9. 게시판의 용도에 맞게 게시물을 작성하셔야 합니다.</b>
                                        <br>
                                        <br>
                                        (1) 사이트 이용규칙 및 각 게시판 규칙을 잘 지키며, 위반에 따른 불이익을 받는 일이 없도록 해주시기 바랍니다.
                                        <br>
                                        (2) 의미 없는 내용 또는 공백만 적어서 올리는 게시글은 작성하실 수 없습니다.
                                        <br>
                                        (3) 사이트에 맞지 않는 글을 작성하실 경우 해당 게시글 잠정 블럭/이동/삭제 처리 될 수 있으며, 이는 작성자에게 통보 없이 운영자를 통해 처리가 이루어 질 수 있습니다.
                                        <br>
                                        <br>
                                        <br>
                                        <b>10. 비회원은 글을 작성 할 수 없으며 심리Q에 가입한 회원에 한하여 글을 작성 할 수 있습니다.</b>
                                        <br>
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
</body></html>
