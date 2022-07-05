/**이미지 추가 */
const browseBtn = document.querySelector('.browse');
const realInput = document.querySelector('#real-input');

browseBtn.addEventListener('click',()=>{
	realInput.click();
});

/**이미지 미리보기*/
function uploadImgPreview() {

    // @breif 업로드 파일 읽기

    let fileList = document.getElementById( "real-input" ).files;

    // @breif 업로드 파일 읽기

    function readAndPreview( fileList ) {

        // @breif 이미지 확장자 검사

        if ( /\.(jpe?g|png|gif)$/i.test( fileList.name ) ) {

            let reader = new FileReader();

            reader.addEventListener( "load", function() {
                let image = new Image();
                
                image.style = "border-radius:3px; margin-left: 4px;";
                image.height = "60";

                image.title = fileList.name;
                image.src = this.result;       
                
                

                // @details 이미지 확장자 검사
                document.getElementById( "thumbnailImgs" ).appendChild( image );

            },false );
           
                    // @details readAsDataURL( )을 통해 파일의 URL을 읽어온다.
            if( fileList ) {

                reader.readAsDataURL( fileList );

            }


        }
    }

        

    if( fileList ) {
            // @details readAndPreview() 함수를 forEach문을통한 반복 수행
    [].forEach.call( fileList, readAndPreview );

    }
}


/**감정 이모티콘*/
$(document).ready(function(){
    /*웹페이지 열었을 때*/
      $("#기쁨").show();
      $("#기쁨이").hide();

      /*img1을 클릭했을 때 img2를 보여줌*/
      $("#기쁨").click(function(){
          $("#기쁨").hide();
          $("#기쁨이").show();
      });

      /*img2를 클릭했을 때 img1을 보여줌*/
      $("#기쁨이").click(function(){
          $("#기쁨").show();
          $("#기쁨이").hide();
      });
  });

  $(document).ready(function(){
    /*웹페이지 열었을 때*/
      $("#행복").show();
      $("#행복이").hide();

      /*img1을 클릭했을 때 img2를 보여줌*/
      $("#행복").click(function(){
          $("#행복").hide();
          $("#행복이").show();
      });

      /*img2를 클릭했을 때 img1을 보여줌*/
      $("#행복이").click(function(){
          $("#행복").show();
          $("#행복이").hide();
      });
  });

  $(document).ready(function(){
    /*웹페이지 열었을 때*/
      $("#편안").show();
      $("#편안이").hide();

      /*img1을 클릭했을 때 img2를 보여줌*/
      $("#편안").click(function(){
          $("#편안").hide();
          $("#편안이").show();
      });

      /*img2를 클릭했을 때 img1을 보여줌*/
      $("#편안이").click(function(){
          $("#편안").show();
          $("#편안이").hide();
      });
  });

  $(document).ready(function(){
    /*웹페이지 열었을 때*/
      $("#슬픔").show();
      $("#슬픔이").hide();

      /*img1을 클릭했을 때 img2를 보여줌*/
      $("#슬픔").click(function(){
          $("#슬픔").hide();
          $("#슬픔이").show();
      });

      /*img2를 클릭했을 때 img1을 보여줌*/
      $("#슬픔이").click(function(){
          $("#슬픔").show();
          $("#슬픔이").hide();
      });
  });


  $(document).ready(function(){
    /*웹페이지 열었을 때*/
      $("#불안").show();
      $("#불안이").hide();

      /*img1을 클릭했을 때 img2를 보여줌*/
    $("#불안").click(function(){
          $("#불안").hide();
          $("#불안이").show();
      });

      /*img2를 클릭했을 때 img1을 보여줌*/
      $("#불안이").click(function(){
          $("#불안").show();
          $("#불안이").hide();
      });
  });


  /** 자동저장 */
  (function () {
    var autoSave = new Object();
    (function (obj) {
      obj.configuration = {
        interval: 60 // second(s)
      };
      obj.bindTimer = function() {
        var textEle = document.querySelector('#text');
        var textVal = textEle.value;
        var ref1, ref2, ref3; // Newer -&gt; Older
  
        // Save to localStorage
        var encodedTextVal = btoa(textVal);
        ref1 = window.localStorage.getItem('textval-01');
        ref2 = window.localStorage.getItem('textval-02');
  
        if ((window.localStorage) && (encodedTextVal != ref1)){
          window.localStorage.setItem('textval-01', encodedTextVal);
          window.localStorage.setItem('textval-02', ref1);
          window.localStorage.setItem('textval-03', ref2);
        }
        else if (!window.localStorage) {
          console.log('Error' + ': Your browser not support')
          return false;
        }
      };
  
      obj.start = function() {
        obj.bindTimer();
        setTimeout(function() {
          obj.start();
        }, obj.configuration.interval * 1000);
      };
      obj.start();
    })(autoSave);
  })();

/**투두리스트 */
let inputBox = document.getElementById('inputBox');
let addButton = document.getElementById('addButton');
let ToDoList = document.getElementById('ToDoList');
 
addButton.addEventListener('click', function(){
    var list = document.createElement('li')
    ToDoList.style.fontSize="13px";
    ToDoList.style.textAlign="left";
    ToDoList.style.marginLeft = "10%";
    ToDoList.style.fontWeight = "900";
    list.innerText = inputBox.value;
    ToDoList.appendChild(list);
    inputBox.value = "";
    list.addEventListener('click', function(){
        list.style.textDecoration = "line-through";
    })
    list.addEventListener('dblclick', function(){
        ToDoList.removeChild(list);
    })
})

/**알림 */
function revise(sample){ alert(sample); } 
function save(sample){ 
//	let c = $('#diarycontent').val();
//	console.log(c);
	let x = confirm(sample); 
	if(x==true){
		let form = document.reviseSaveButton;
		form.submit();
	}
} 
  
