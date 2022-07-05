
// ================================
// START YOUR APP HERE
// ================================
const init = {
  monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
  dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
  today: new Date(),
  monForChange: new Date().getMonth(),
  activeDate: new Date(),
  getFirstDay: (yy, mm) => new Date(yy, mm, 1),
  getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
  nextMonth: function () {
    let d = new Date();
    d.setDate(1);
    d.setMonth(++this.monForChange);
    this.activeDate = d;
    return d;
  },
  prevMonth: function () {
    let d = new Date();
    d.setDate(1);
    d.setMonth(--this.monForChange);
    this.activeDate = d;
    return d;
  },
  addZero: (num) => (num < 10) ? '0' + num : num,
  activeDTag: null,
  getIndex: function (node) {
    let index = 0;
    while (node = node.previousElementSibling) {
      index++;
    }
    return index;
  }
};

const $calBody = document.querySelector('.cal-body');
const $btnNext = document.querySelector('.btn-cal.next');
const $btnPrev = document.querySelector('.btn-cal.prev');

/**
 * @param {number} date
 * @param {number} dayIn
*/
function loadDate (date, dayIn) {
  document.querySelector('.cal-date').textContent = date;
  document.getElementById('cal-date').value = date;
  document.querySelector('.cal-day').textContent = init.dayList[dayIn];
}

function writeadvise() {
	let monList= ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
	let day = $(".cal-date").text();
	let month=$(".cal-month").text();
	let year=$(".cal-year").text();
	
	month=monList.indexOf(month)+1;
	location.href=`advise-diary.jsp?today=${year}-${month}-${day}`;
};
function readadvise(){
	let monList= ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
	let day = $(".cal-date").text();
	let month=$(".cal-month").text();
	let year=$(".cal-year").text();
	
	month=monList.indexOf(month)+1;
	location.href=`adviseDiaryRead.jsp?today=${year}-${month}-${day}`;
}


/**
 * @param {date} fullDate
 */
function loadYYMM (fullDate) {
  let yy = fullDate.getFullYear();
  let mm = fullDate.getMonth();
  let firstDay = init.getFirstDay(yy, mm);
  let lastDay = init.getLastDay(yy, mm);
  let markToday;  // for marking today date
  
  if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
    markToday = init.today.getDate();
  }

  document.querySelector('.cal-month').textContent = init.monList[mm];
  document.querySelector('.cal-year').textContent = yy;
  document.getElementById('cal-month').value = mm + 1;
  document.getElementById('cal-year').value = yy;

  let trtd = '';
  let startCount;
  let countDay = 0;
  for (let i = 0; i < 6; i++) {
    trtd += '<tr>';
    for (let j = 0; j < 7; j++) {
      if (i === 0 && !startCount && j === firstDay.getDay()) {
        startCount = 1;
      }
      if (!startCount) {
        trtd += '<td>'
      } else {
        let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
        trtd += '<td class="day';
        trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
        trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
      }
      trtd += (startCount) ? ++countDay : '';
      if (countDay === lastDay.getDate()) { 
        startCount = 0; 
      }
      trtd += '</td>';
    }
    trtd += '</tr>';
  }
  $calBody.innerHTML = trtd;
}

/**
 * @param {string} val
 */
function createNewList (val) {
  let id = new Date().getTime() + '';
  let yy = init.activeDate.getFullYear();
  let mm = init.activeDate.getMonth() + 1;
  let dd = init.activeDate.getDate();
  const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

  let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

  let eventData = {};
  eventData['date'] = date;
  eventData['memo'] = val;
  eventData['complete'] = false;
  eventData['id'] = id;
  init.event.push(eventData);
  $todoList.appendChild(createLi(id, val, date));
}

loadYYMM(init.today);
loadDate(init.today.getDate(), init.today.getDay());

$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

$calBody.addEventListener('click', (e) => {
  if (e.target.classList.contains('day')) {
    if (init.activeDTag) {
      init.activeDTag.classList.remove('day-active');
    }
    let day = Number(e.target.textContent);
    loadDate(day, e.target.cellIndex);
    e.target.classList.add('day-active');
    init.activeDTag = e.target;
    init.activeDate.setDate(day);

	let yy = init.activeDate.getFullYear();
  	let mm = init.activeDate.getMonth() + 1;
 	let dd = init.activeDate.getDate();
	
	$.ajax({
		type: "GET",
		url: "scheduleGet",
		data: {
			scheDate: yy+"-"+mm+"-"+dd
		},
		success: function(response) {
			if (response.includes("%%")) {
				let sche_time = response.split("%%")[0];
				let counsel_name = response.split("%%")[1];
				$('h3#counselReservationPlace').text(counsel_name + " 상담소");
				$('h3#counselReservationTime').text("예약 시간 : " + sche_time);
			} else {
				$('h3#counselReservationPlace').text("예약이 없습니다.");
				$('h3#counselReservationTime').text("");
			}
		},
		error: function() {
			alert("폼 제출 에러입니다!");
		}
	}); 

    reloadTodo();
  }
});

$(document).ready(function(){
    /*웹페이지 열었을 때*/
	$("#isBooking").show();
	$("#bookingTime").hide();
	$("#counselingCenter").hide();
	$("#tail").hide();

	$('#isBooking').on('click', function(){  
	if($('#isBooking').prop('checked')){
    	$("#bookingTime").show();
    	$("#counselingCenter").show();
   		$("#tail").show();
    	$(".clicked-date").css('padding', '40px 26px 20px 26px');

	}
	else{
		$("#bookingTime").hide();
		$("#counselingCenter").hide();
		$("#tail").hide();
		$(".clicked-date").css('padding', '40px 26px 50px 26px');

	}});
	
	let yy = init.today.getFullYear();
  	let mm = init.today.getMonth() + 1;
 	let dd = init.today.getDate();
	
	$.ajax({
		type: "GET",
		url: "scheduleGet",
		data: {
			scheDate: yy+"-"+mm+"-"+dd
		},
		success: function(response) {
			if (response.includes("%%")) {
				let sche_time = response.split("%%")[0];
				let counsel_name = response.split("%%")[1];
				$('h3#counselReservationPlace').text(counsel_name + " 상담소");
				$('h3#counselReservationTime').text("예약 시간 : " + sche_time);
			} else {
				$('div#counselReservation > h3').text("예약이 없습니다.");
				$('div#counselReservation > h4').text("");
			}
		},
		error: function() {
			alert("폼 제출 에러입니다!");
		}
	});  
});

  

  /**이미지 클릭시 변환 */
  $(document).ready(function(){
    /*웹페이지 열었을 때*/
    $("#기쁨이").show();
    $("#편안이").hide();
    $("#불안이").hide();
    $("#행복이").hide();
    $("#슬픔이").hide();


      $("#기쁨이").click(function(){
          $("#기쁨이").hide();
          $("#편안이").show();
      });

      $("#편안이").click(function(){
          $("#불안이").show();
          $("#편안이").hide();
        });

      $("#불안이").click(function(){
         $("#행복이").show();
         $("#불안이").hide();
        });

       $("#행복이").click(function(){
          $("#슬픔이").show();
          $("#행복이").hide();
        });

          $("#슬픔이").click(function(){
            $("#기쁨이").show();
            $("#슬픔이").hide();
      });
  });

  $(function(){
    $(".stop").show();
    $(".play").hide();

    $('.play').click(function(){
    // [재생] 버튼을 클릭하면 running 속성 적용
      $('#imageMove').css('animation-play-state','running');
      $(".play").hide();
      $(".stop").show();
    });
    $('.stop').click(function(){
    // [멈춤] 버튼을 클릭하면 paused 속성 적용
      $('#imageMove').css('animation-play-state','paused');
      $(".stop").hide();
      $(".play").show();
    });
  });


 
  $(function(){
  
  
    $('#counselingSave').click( function() { 
      if(document.getElementById('bookingTime').value == "" ){
        alert("예약 시간을 입력해주세요."); 
      }
      else if(document.getElementById('counselingCenter').value == ""){
        alert("예약한 상담소 이름을 입력해주세요."); 
      }
      else{
  
      alert("예약 일정이 저장되었습니다."); 
    
          }
    });
  });

  $('#something').click(function() {
    location.reload();
    });

