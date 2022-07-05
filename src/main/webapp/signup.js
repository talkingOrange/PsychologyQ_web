//로그인 페이지 기능 구현

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




//회원가입 페이지 기능 구현

var form = document.userInfo;
var passRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;


// 필수 입력사항 미입력시 회원가입 불가

function userInfoCheck() {

    if (!form.user_id.value) {
        alert("아이디를 입력하세요");
        form.user_id.focus();
        return false;
    }

    if (form.ID_chk.value == "ID_Uncheck") {
        form.ID_check.focus();
        alert("아이디 중복확인 버튼을 누르세요.")
        return false;
    }

    if (!form.user_pwd.value) {
        alert("패스워드를 입력하세요");
        form.user_pwd.focus();
        return false;
    }

    if (!passRule.test(form.user_pwd.value)) {
        alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
        form.user_pwd.focus();
        return false;
    }

    if (!form.passwordCheck.value) {
        alert("패스워드를 한 번 더 입력하세요");
        form.passwordCheck.focus();
        return false;
    }

    if (form.passwordSameChk.value == "passwordSame_Uncheck") {
        alert("패스워드 재확인이 완료되지 않았습니다.");
        form.passwordSameChk.focus();
        return false;
    }

    if (!form.user_name.value) {
        alert("이름을 입력하세요");
        form.user_name.focus();
        return false;
    }


    if (form.agreeCheck.value != "agree") {
        alert("개인정보 수집, 이용 동의에 체크하지 않있습니다.");
        agreeCheck.focus();
        return false;
    }

    form.submit();
}


// 입력값 수정 시 다시 중복체크 진행

function inputID() {
    form.ID_chk.value = "ID_Uncheck";
    form.user_id.focus();
}


function inputPassword() {
    form.passwordSameChk.value = "passwordSame_Uncheck";
    form.user_pwd.focus();
}


function inputPasswordCheck() {
    form.passwordSameChk.value = "passwordSame_Uncheck";
    form.passwordCheck.focus();
}


//아이디 중복체크 완료 팝업 //백엔드에서 아이디 중복체크 기능 연결

function ID_Check() {
    if (form.user_id.value == "") {
        alert("ID가 입력되지 않았습니다.");
        user_id.focus();
        return false;
    }

	// TODO 자바를 통해 디비와 연결해서 아이디 중복 체크를 한다.
	var form_data = {
      user_id: form.user_id.value,
    };

	$.ajax({
      type: "POST",
      url: "checkDuplicate.jsp",
      data: form_data,

      success: function(response) {
		var result=response.replace(/^.*?<body>(.*?)<\/body>.*?$/s,"$1").trim();
        if(result == "success") {
		  form.ID_chk.value = "ID_Check";
		  alert("아이디 중복체크가 완료되었습니다.");
        } else if (result == "duplicate") {
          alert("아이디가 중복입니다!")
		  form.ID_chk.value == "ID_Uncheck"
        } else if (result == "unknown") {
	      form.ID_chk.value == "ID_Uncheck"
		  alert("데이터베이스 오류입니다!")
		}
      },
      error: function() {
        alert("폼 제출 에러입니다!")
      }
	});
}

//비밀번호 입력 확인

function passwordSame_Check() {
    
    var pass1 = form.user_pwd.value;
    var pass2 = form.passwordCheck.value;

    if (pass1 == "") {
        alert("패스워드가 입력되지 않았습니다.");
        return false;
    }
    
    if (pass2 == "") {
        alert("패스워드가 입력되지 않았습니다.");
        return false;
    }
    
    if (pass1==pass2) {
        form.passwordSameChk.value = "passwordSame_Check"
        alert("비밀번호 재확인이 완료되었습니다.");
    }

    if (pass1!=pass2) {
        alert("패스워드가 다릅니다.");
        return false;
    }
}

//개인정보 수집, 이용 미동의 시 회원가입 진행 불가

function getAgree() {
    form.agreeCheck.value = "agree";
}
