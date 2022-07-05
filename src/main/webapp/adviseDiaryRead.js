var myTest = new Array('미래는 내일이면 더 나을 것이다. - 댄 퀘일', 
'희망은 날개 달린 것, 영혼에 내려앉아 가사 없는 노래 부르네. 그치지 않는 그 노래. - 에밀리 디킨스',
 '가장 용감한 행동은 자신만을 생각하는 것이다. 큰 소리로. - 가브리엘(코코)샤넬', 
 '천재란 자신에게 주어진 일을 하는 재능 있는 사람일 뿐이다. - 토마스 A. 에디슨', 
 '스스로를 경멸하는 사람은 경멸하는 자신을 존중한다. - 프레드리히 니체', 
 '내 자신에 대한 자신감을 잃으면, 온 세상이 나의 적이 된다. - 랄프 왈도 에머슨');

document.write(randomItem(myTest), '<br />');


// 주어진 배열에서 요소 1개를 랜덤하게 골라 반환하는 함수
function randomItem(a) {
  return a[Math.floor(Math.random() * a.length)];
}

$(document).ready(function(){
	let adviseDate = $('input[name=adviseDate]').val()
	
	$.ajax({
		type: "GET",
		url: `adviseDiaryReadAction.jsp?adviseDate=${adviseDate}`,
		success: function(response) {
			var result=response.replace(/^.*?<body>(.*?)<\/body>.*?$/s,"$1").trim();
			if (result == "need_login") {
				alert("로그인이 필요합니다!");
			} else if (result == "empty") {
				alert("작성한 상담일지가 없습니다!");
			} else if (result == "fail") {
				alert("데이터베이스 오류입니다!");
			} else {
				$('div#write').text(result);
			}
		},
		error: function() {
			alert("데이터 베이스 에러입니다!")
		}
	})
	
})