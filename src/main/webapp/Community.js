//롤링 배너 구현

let banner = {
    rollId: null,
    interval: 2000,

    //롤링 배너 초기화
    rollInit: function (newinterval) {
        if (parseInt(newinterval) > 0) {
            this.interval = newinterval;
        }
        //현재 배너
        let firstitem = document.querySelector('.rollings li');
        if (firstitem) {
            firstitem.classList.add('currentroll');
        }
        //다음 배너
        let seconditem = document.querySelectorAll('.rollings li')[1];
        if (seconditem) {
            seconditem.classList.add('nextroll');
        }
        //이전 배너
        document.querySelector('.rollings li:last-child').classList.add('prevroll');
        this.rollId = setInterval(this.rollNext, this.interval); //롤링 인터벌 호출k
    },

    //다음 배너 롤링
    rollNext: function () {
        if (document.querySelector('.prevroll')) {
            document.querySelector('.prevroll').classList.remove('prevroll');
        }
        if (document.querySelector('.currentroll')) {
            document.querySelector('.currentroll').classList.add('prevroll');
            document.querySelector('.currentroll').classList.remove('currentroll');
        }
        if (document.querySelector('.nextroll')) {
            document.querySelector('.nextroll').classList.add('currentroll');
            document.querySelector('.nextroll').classList.remove('nextroll');
        }
        //다음 이미지 있으면 다음 롤링 이미지로 선택, 없으면 첫번째 이미지를 롤링 이미지로 지정
        if (document.querySelector('.currentroll').nextElementSibling) {
            document.querySelector('.currentroll').nextElementSibling.classList.add('nextroll');
        } else {
            document.querySelector('.rollings li').classList.add('nextroll');
        }
    }
}

document.addEventListener('DOMContentLoaded', function () {
    banner.rollInit(2000); // 배너 롤링
});


//글작성 구현


function submitWrite() {
    const titleEL = document.getElementById('comment-title-write');
    const title = titleEL.value.trim();
    const writeContentEL = document.getElementById('comment-text-write');
    const writeContent = writeContentEL.value.trim();
    
    if (title) {
        if (writeContent) {
            alert("글이 작성되었습니다.")
        }
        else {
            alert("내용을 입력하세요.")
            return false;
        }
    }
    
    else {
        alert("제목을 입력하세요.")
        return false;
    }
}

function warnEmpty() {
    alert("Write some texts.");
}


function dateToString(date) {
    const dateString = date.toISOString();
    const dateToString = dateString.substring(0, 10) + " " + dateString.substring(11, 19);
    return dateToString;
}


//댓글 작성 구현

function submitComment() {
    const newcommentEL = document.getElementById('new-comment');
    const newcomment = newcommentEL.value.trim();
    
    if (newcomment) {
        const contentEL = document.createElement('td');
        contentEL.classList.add('comment-content');
        contentEL.innerText = newcommentEL.value;
        
        const dateEL = document.createElement('td');
        dateEL.classList.add("comment-date");
        const dateString = dateToString(new Date());
        dateEL.innerText = dateString;

        const userEL=document.createElement('td');
        userEL.classList.add("comment-user");
        userEL.innerText="익명"; //유저네임
        
        var br = document.createElement('br');
        var hr = document.createElement('hr');
        
        const commentEL = document.createElement('tr');
        commentEL.classList.add('comment-new');
        commentEL.appendChild(userEL);
        commentEL.appendChild(br);
        commentEL.appendChild(contentEL);
        commentEL.appendChild(br);
        commentEL.appendChild(dateEL);
        
        
        document.getElementById('comments-new').appendChild(hr);
        document.getElementById('comments-new').appendChild(commentEL);
        newcommentEL.value = "";

        
        const countEL = document.getElementById('comments-count');
        const count = countEL.innerText;
        countEL.innerText = parseInt(count)+1;
          
        alert("댓글 작성이 완료되었습니다.");
    }
    else warnEmpty();
}

function searchComment() {
    const searchEL = document.getElementById('search-comment');
    const search = searchEL.value.trim();
    
    if (!search) {
        alert("검색내용을 입력하세요.")
        return false;
    }
}
