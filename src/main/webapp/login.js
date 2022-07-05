// 아이디 비밀번호 찾기 페이지 이동
function find_ID_PW_Form() {
    alert('아이디/ 비밀번호 찾기 페이지로 이동합니다.');
    location.href = "[HTML]회원정보검색 레이아웃.html";
}


// 회원가입 페이지 이동
function go_Membership_Form() {
    alert('회원가입 페이지로 이동합니다.');
    location.href = "[HTML]회원가입 레이아웃.html";
}

// 로그인 동작 완료 시 마이페이지로 이동
function login_Save() {
    if (confirm("로그인하시겠습니까?")) {
        // 자바에서 아이디, 비밀번호 맞는지 확인
        //location.href = "[HTML]메인페이지 레이아웃.html";
    }
}