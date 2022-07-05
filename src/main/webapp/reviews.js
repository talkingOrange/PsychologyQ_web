/**페이지네이트 */
    let options = {
        numberPerPage:5, //Cantidad de datos por pagina
        goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
        pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
    };

    let filterOptions = {
        el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
    };

    paginate.init('.myTable',options,filterOptions);

    /**말줄임표 마우스 오버하면 다 나타냄 */

    $('.showEllipsis').each(function () {
        if (this.offsetWidth < this.scrollWidth)
            $(this).attr('title', $(this).text());
    });


    /**행 클릭시 테이블 데이터 이동 */

    $("#collection tr").click(function(){ 	

        $(".cell").show();
        $(".con").show();
        $(".line").show();
        
        var str = ""
        var tdArr = new Array();	// 배열 선언
        
        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();
        
        // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        console.log("클릭한 Row의 모든 데이터 : "+tr.text());
        
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });
        
        console.log("배열에 담긴 값 : "+tdArr);
        
        // td.eq(index)를 통해 값을 가져올 수도 있다.
        var no = td.eq(0).text();
        var name = td.eq(2).text();
        var keyword = td.eq(3).text();
        
        $("#ex1_Result1").html(no+" / " + name);		
        $("#ex1_Result2").html(keyword);
    });



