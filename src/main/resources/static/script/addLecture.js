// const nowtime = new Date();
// //console.log(nowtime);
// //console.log(nowtime.getHours());
// //console.log(nowtime.getMinutes());
// const MM = nowtime.getMinutes();
// if(MM >=0 && MM < 10 || MM >= 20 && MM < 30 || MM >= 40 && MM < 50){
//     alert("수강신청 시간이 아닙니다.");
//     location.href = "/";
// }
//  else{
//전공학과 리스트 불러오기
    $.ajax({
        url : "/majorList",
        type : "POST",
        data : JSON.stringify(),
        contentType : "application/json"
    }).done(result =>{
        // console.log("result");
        // console.log(result.length);
        for(let i=0; i<result.length; i++){
            let option = document.createElement("option");
            option.setAttribute("value", result[i]);
            option.innerText = result[i];
            $('#major').append(option);
        }
    }).fail(erorr =>{
        console.log(erorr.responseText);
     })

//기존에 수강신청한게 있으면 불러오기
    const  requestData = {
        "usercode" : $("#hide").val()
    }
    $.ajax({
        url : "/showTime0",
        type : "POST",
        data : JSON.stringify(requestData),
        contentType : "application/json"
    }).done(result =>{
        //console.log(result);
        // console.log(result.length);
        if(result.length > 0){
            for(let i=0; i<result.length; i++){
                colors2(result[i]);
                //console.log(result[i].sub_schedule)
            }
        }
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
 //}

//과목명 불러오기
function callSub(){
    const  requestData = {
        "major" : $("#major").val()
    }
    console.log($("#major").val());
    $.ajax({
        url : "/getSub",
        type : "POST",
        data : JSON.stringify(requestData),
        contentType : "application/json"
    }).done(result =>{
        // console.log("result");
        // console.log(result);

        //옵션지우기
        $("#subject").find("option").remove();
        //맨위에 빈 옵션하나 추가
        let option = document.createElement("option");
        $("#subject").append(option);

        for(let i=0; i<result.length; i++){
            let option = document.createElement("option");
            let head = result[i].sub_schedule.substring(0,2);
            switch(head) {
                case "MO":
                    head = "월";
                    break;
                case "TU":
                    head = "화";
                    break;
                case "WE":
                    head = "수";
                    break;
                case "TH":
                    head = "목";
                    break;
                default:
                    head = "금";
            }
            let sche = "["+head + result[i].sub_schedule.substring(2,4)+"~"+result[i].sub_schedule.substring(4,6)+"]";
            //console.log(head);
            //console.log(sche);
            console.log(result[i].p_code);
            //console.log(result[i]);
            let subName = result[i].title + sche;
            option.setAttribute("value", result[i].sub_schedule);
            option.setAttribute("data-runtime", result[i].runtime);
            option.setAttribute("data-sc", result[i].subcode);
            option.setAttribute("data-p", result[i].p_name);
            option.setAttribute("data-pcode", result[i].p_code);
            //console.log(result[i].subcode);
            //console.log(result[i].sub_schedule);
            option.innerText = subName;
            $("#subject").append(option);
        }
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}



// background 임의로 색 넣어놓음.
let bc = ["#6E85B7","#f1f0c0","#b7e4dd","#c2ded0","orange",
    "pink","#ceac93","#d1d1d1","#8fc8ab","skyblue","#F5F0BB",
    "#9a85a4","rgb(241, 215, 216)","#b0bbe6","#c4dfaa",
    "#e7fbbe","#f4d19b","#D57E7E","#C6DCE4"];
let cc = 0;

function colors(){
    let check = true;

    let sel = document.body.querySelector("#subject");
    //console.log(sel.value);
    // console.log($("#subject option:checked").data("runtime"));
    let start = sel.value.substring(0,2);
    let add = sel.value.substring(2,4);
    let cnt = parseInt($("#subject option:checked").data("runtime"));
    //console.log(cnt);
    //과목명만 분리
    let tempText = $("#subject option:checked").text().split('[');
    let title_ = tempText[0];

    // console.log(title_);

    if(!overCnt(cnt)){
        alert("신청가능한 최대학점은 20학점 입니다.");
        return;
    }
    for(let i =0; i<cnt; i++){
        let temp = start + add;
        let tt = $("#"+temp).attr("class");
        //console.log(tt);
        if($("#"+temp).attr("class") == undefined || tt.length < 1){
            if(i == 0){
                // console.log($("#subject option:checked").data("sc"));
                // console.log( $("#hide").val());
                // console.log($("#subject option:checked").text());
                // console.log(sel.value);
                // console.log($("#subject option:checked").data("p"));
                const  timeData = {
                    "p_code" : $("#subject option:checked").data("pcode"),
                    "subcode" : $("#subject option:checked").data("sc"),
                    "usercode" : $("#hide").val(),
                    "title" : title_,
                    "sub_schedule" : sel.value,
                }
                timeSave(timeData);
            }
            document.getElementById(temp).setAttribute("class",sel.value);
            document.getElementById(temp).innerText = title_;
            document.getElementById(temp).style.background = bc[cc];
            add ++;
        }
        else if(title_ ===  $("#"+temp).text()){
            alert($("#"+temp).text() + " 은/는 이미 수강신청한 과목입니다");
            check = false;
            break;
        }
        else{
            alert( $("#"+temp).text() + "  과목의 시간과 동일합니다.");
            console.log(sel.value);
            // $("."+sel.value).css('background','none');
            // $("."+sel.value).empty();
            // $("."+sel.value).removeClass(sel.value);
            check = false;
            break;
        }
    }
    //수강신청된 시간에 동일 class명 부여
    if(check){
        //학점계산
        hakjumCnt(cnt);
        cc++;
        let sche = document.createElement("p");
        sche.setAttribute("class",sel.value);
        sche.setAttribute( "id", $("#subject option:checked").data("sc"));
        //console.log($("#subject option:checked").text());

        sche.innerText = title_;
        $("#schedule").append(sche);
        //console.log($("#subject option:checked").data("pcode"));
    }
    if(cc >= bc.length){
        cc = 0;
    }

}

//이미 신청된 강의목록
function colors2(result){
    let check = true;

    let sel = result.sub_schedule;

    let start = sel.substring(0,2);
    let add = sel.substring(2,4);
    let cnt = sel.substring(4) - sel.substring(2,4);
    for(let i =0; i<cnt; i++){
        let temp = start + add;
        document.getElementById(temp).setAttribute("class",sel);
        document.getElementById(temp).innerText = result.title;//과목명
        document.getElementById(temp).style.background = bc[cc];
        add ++;
    }
    //수강신청된 시간에 동일 class명 부여
    if(check){
        //학점계산
        hakjumCnt(cnt);
        cc++;
        let sche = document.createElement("p");
        sche.setAttribute("class",sel);
        sche.setAttribute( "id", result.subcode); //과목코드
        sche.innerText = result.title;//과목명
        $("#schedule").append(sche);
    }
    if(cc >= bc.length){
        cc = 0;
    }
}

$("#schedule").click(function (e){ // 밑에 추가된 강의명 선택하면 삭제
    console.log(e.target);
    let del = e.target.getAttribute("class");
    let delSc = e.target.getAttribute("id");
    let cnt = del.substring(4) -del.substring(2,4);
    minusCnt(cnt);
   // console.log(del);//요일/시간
   // console.log("cnt"+cnt);//cnt(runtime)
    //console.log(delSc);//subcode
   // console.log($("#hide").val());//usercode
   // console.log($("#"+delSc).text());
    //console.log(del !== null);
    if(del !== null){
        $("."+del).css('background','none');
        document.querySelector('.modal_wrap').style.display='block';
        document.querySelector('.black_bg').style.display='block';
        $("#subcode").val(delSc);
        $("#times").val(del);
        $("#modal_text").text($("#"+delSc).text() + "  과목을 삭제하시겠습니까?");
    }
})

function delOk(){
    console.log($("#times").val());
    console.log($("#subcode").val());
    let del = $("#times").val();
    const  timeData = {
        "subcode" :  $("#subcode").val(),
        "usercode" : $("#hide").val()
    }
    $("."+del).empty();
    $("."+del).removeClass(del);
    $("#"+$("#subcode").val()).remove();
    timeDel(timeData);
    document.querySelector('.modal_wrap').style.display='none';
    document.querySelector('.black_bg').style.display='none';
}

function delNo(){
    document.querySelector('.modal_wrap').style.display='none';
    document.querySelector('.black_bg').style.display='none';
}

// 선택한 강의목록 시간표에 추가
function timeSave(timeData){
    $.ajax({
        url : "/saveTime0",
        type : "POST",
        data : JSON.stringify(timeData),
        contentType : "application/json"
    }).done(result =>{
       // console.log(result);
        // console.log(result.length);
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}

// 시간표 삭제
function timeDel(timeData){
    console.log("!!!!!!!!!!!!!!!");
    console.log(timeData);
    $.ajax({
        url : "/delTime0",
        type : "DELETE",
        data : JSON.stringify(timeData),
        contentType : "application/json"
    }).done(result =>{
       // console.log(result);
        // console.log(result.length);
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}

//현재까지 신청학점 계산
function hakjumCnt(cnt){
    let temp = $("#hakjum").text();
    // console.log(temp);
    temp = (parseInt(temp)+parseInt(cnt))
    // console.log(temp);
    $("#hakjum").text(temp)
}

//현재까지 신청학점 빼기
function minusCnt(cnt){
    let temp = $("#hakjum").text();
    // console.log(temp);
    temp = (parseInt(temp)-parseInt(cnt))
    // console.log(temp);
    $("#hakjum").text(temp)
}

//신청학점 초과체크
function overCnt(cnt){
    let temp = $("#hakjum").text();
    let add = (parseInt(temp)+parseInt(cnt))
    if(temp >= 20 || add >= 22){
        return false;
    }
    else{
        return true;
    }
}