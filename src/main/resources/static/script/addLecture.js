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
        //console.log("result");
        // console.log(result);

        //옵션지우기
        $("#subject").find("option").remove();
        //맨위에 빈 옵션하나 추가
        let option = document.createElement("option");
        $("#subject").append(option);

        for(let i=0; i<result.length; i++){
            let option = document.createElement("option");
            option.setAttribute("value", result[i].sub_schedule);
            option.setAttribute("data-sc", result[i].subcode);
            option.setAttribute("data-p", result[i].p_name);
            console.log(result[i].subcode);
            //console.log(result[i].sub_schedule);
            option.innerText = result[i].title;
            $("#subject").append(option);
        }
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}



// background 임의로 색 넣어놓음.
let bc = ["#f1f0c0","#b7e4dd","green","orange","pink","#f5efbb","#d1d1d1","#8fc8ab","skyblue","#9a85a4","rgb(241, 215, 216)","#b0bbe6","#c4dfaa"];
let cc = 0;

function colors(){
    let check = true;

    let sel = document.body.querySelector("#subject");
    console.log(sel.value);
    let start = sel.value.substring(0,2);
    let add = sel.value.substring(2,4);
    let cnt = sel.value.substring(4) - sel.value.substring(2,4);
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
                    "subcode" : $("#subject option:checked").data("sc"),
                    "usercode" : $("#hide").val(),
                    "title" : $("#subject option:checked").text(),
                    "sub_schedule" : sel.value,
                    "p_name" : $("#subject option:checked").data("p")
                }
                timeSave(timeData);
            }
            document.getElementById(temp).setAttribute("class",sel.value);
            document.getElementById(temp).innerText = $("#subject option:checked").text();
            document.getElementById(temp).style.background = bc[cc];
            add ++;
        }
        else{
            alert("이미 수강신청된 시간입니다.");
            $("."+sel.value).css('background','none');
            $("."+sel.value).empty();
            $("."+sel.value).removeClass(sel.value);
            check = false;
            break;
        }
    }
    if(check){
        cc++;
        let sche = document.createElement("p");
        sche.setAttribute("class",sel.value);
        sche.setAttribute( "id", $("#subject option:checked").data("sc"));
        //console.log($("#subject option:checked").text());
        sche.innerText = $("#subject option:checked").text();
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

    console.log(del);
    console.log(delSc);
    console.log(del.value);
    //console.log(del !== null);
    if(del !== null){
        $("."+del).css('background','none');
        $("."+del).empty();
        $("."+del).removeClass(del);
        e.target.remove();
        const  timeData = {
            "subcode" : delSc
        }
        timeDel(timeData);
    }
})

function timeSave(timeData){
    $.ajax({
        url : "/saveTime",
        type : "POST",
        data : JSON.stringify(timeData),
        contentType : "application/json"
    }).done(result =>{
        console.log(result);
        // console.log(result.length);
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}

function timeDel(timeData){
    $.ajax({
        url : "/delTime",
        type : "DELETE",
        data : JSON.stringify(timeData),
        contentType : "application/json"
    }).done(result =>{
        console.log(result);
        // console.log(result.length);
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}