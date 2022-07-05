
/**최대 글자수 */
$('#reviewText').keyup(function submitCheck(e){
    var content = $(this).val();

    $('#counter').html("("+content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

    if (content.length > 1000){
        alert("최대 1000자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 1000));
        $('#counter').html("(1000 / 최대 1000자)");
    }
});

/**저장 및 수정 버튼 클릭시 input 박스들 확인*/
$('#saveButton').click(function (i){
  var cont = $('#reviewText').val();
  var hospital = $('.hospitalName').val();
  var cnt=0;
  var size=document.getElementsByClassName('detailSearch');
  
  for(var i=0;i<size.length;i++){

    if(size[i].checked){ cnt++;}
}

 if(document.getElementById('hospitalName').value == "" ){
    alert("상담소명을 입력해주세요."); 
    document.getElementById('hospitalName').focus();
    return false;
  }
  else if(document.getElementById('date').value == ""){
    alert("방문 날짜를 입력해주세요."); 
    document.getElementById('date').focus();
    return false;
  }
else if(cont.length < 50) {
$('#reviewText').val(cont.substr(0, 50));
alert('입력한 글자가 50자 이상이어야 합니다.');
document.getElementById('reviewText').focus();
return false;
}else if (!cnt) {
  alert("사용할 응답항목을 1개 이상 체크하세요.");
  return false;
}else if(cont.length >= 50){

  $('#reviewText').val(cont.substr(51, 1000));
  alert('저장되었습니다.');
}

});


$('#reviseButton').click(function (i){
var cont = $('#reviewText').val();
var hospital = $('.hospitalName').val();


if(document.getElementById('hospitalName').value == "" ){
  alert("상담소명을 입력해주세요."); 
  document.getElementById('hospitalName').focus();
  return false;
}
else if(document.getElementById('date').value == ""){
  alert("방문 날짜를 입력해주세요."); 
  document.getElementById('date').focus();
  return false;
}
else if(cont.length < 50) {
$('#reviewText').val(cont.substr(0, 50));
alert('입력한 글자가 50자 이상이어야 합니다.');
document.getElementById('reviewText').focus();
return false;
}
else if(cont.length >= 50){

$('#reviewText').val(cont.substr(51, 1000));
alert('수정되었습니다.');
}

});
