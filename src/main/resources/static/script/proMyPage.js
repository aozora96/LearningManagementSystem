//교수코드랑 일치하는 수강생 정보 불러오기
function getClassInfo(){
    const proData = {
        /*"usercode" : $("#hidden).val()*/
        "usercode" : "25"
    }
    $.ajax({
        url : "/proClassInfo",
        type : "POST",
        data : JSON.stringify(proData),
        contentType : "application/json"
    }).done(result =>{
        console.log(result);
        $("#pagedefault").hide();
        $("#classinfo").show();
        //stucode/name/lever/score/s_grade
        for(let i=0; i<result.length; i++){
            const stuData = {
                "usercode" : result[i].usercode
            }
            getStudent(stuData,result[i].score);
        }
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}

let stucnt = 0;
function getStudent(stuData,score){
    $.ajax({
        url : "/findUser",
        type : "POST",
        data : JSON.stringify(stuData),
        contentType : "application/json"
    }).done(result =>{
        console.log(result);
        let klass = "stu"+stucnt;
        let tr = document.createElement("tr");
        let td = document.createElement("td");
        td.innerText = result.usercode;
        tr.append(td);
        td = document.createElement("td");
        td.innerText = result.name;
        tr.append(td);
        td = document.createElement("td");
        let schoolYear;
        if(result.createdAt.substring(2,4)=="22" ){
            schoolYear ="1학년"
        }
        else if(result.createdAt.substring(2,4) =="21" ){
            schoolYear ="2학년"
        }
        else if(result.createdAt.substring(2,4) =="20" ){
            schoolYear ="3학년"
        }
        else if(result.createdAt.substring(2,4) == "19" ){
            schoolYear ="4학년"
        }
        td.innerText = schoolYear;
        tr.append(td);
        td = document.createElement("td");
        let text = document.createElement("input");
        text.setAttribute("id",klass);
        text.setAttribute("type","text");
        text.setAttribute("value", score);
        text.setAttribute("data-code",result.usercode);
        td.append(text);
        tr.append(td);
        td = document.createElement("td");
        td.setAttribute("class",klass);
        td.innerText = "A";
        tr.append(td);
        $("tbody").append(tr);
        //console.log(text.getAttribute("data-code"));

        grade(klass,score)
        stucnt++;
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}

function setScore(){
    for(let i=0; i<stucnt; i++){
        console.log($("#stu"+i));
        console.log($("#stu"+i).val());
        console.log($("#stu"+i).data("code"));
        const stuSet ={
            /*"p_code" : $("#hidden).val()*/
            "p_code" : "25",
            "usercode" : $("#stu"+i).data("code"),
            "score" : $("#stu"+i).val()
        }
        scoreAdd(stuSet);
    }
    alert("저장완료");
    location.href = "/professorMain";
}

function scoreAdd(stuSet){
    $.ajax({
        url : "/setScore",
        type : "POST",
        data : JSON.stringify(stuSet),
        contentType : "application/json"
    }).done(result =>{
        console.log(result);
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}

let score = document.body.querySelector("form");
score.addEventListener("change",e =>{
    console.log(e.target);
    // console.log(e.target.id);
    let klass = e.target.id;
    //console.log(e.target.value);
    let score = e.target.value;
    grade(klass,score);
    // if(score > 100){
    //     alert("점수는 100점을 넘을 수 없습니다.")
    //     $("#"+klass).val(100);
    //     $("."+klass).text("A");
    // }
    // else if(score >= 90 && score <= 100){
    //     $("."+klass).text("A");
    // }
    // else if(score >= 80 && score <= 90){
    //     $("."+klass).text("B");
    // }
    // else if(score >= 70 && score <= 80){
    //     $("."+klass).text("C");
    // }
    // else if(score >=60 && score <= 70){
    //     $("."+klass).text("D");
    // }
    // else{
    //     $("."+klass).text("F");
    // }

})

function grade(klass,score){
    if(score > 100){
        alert("점수는 100점을 넘을 수 없습니다.")
        $("#"+klass).val(100);
        $("."+klass).text("A");
    }
    else if(score >= 90 && score <= 100){
        $("."+klass).text("A");
    }
    else if(score >= 80 && score <= 90){
        $("."+klass).text("B");
    }
    else if(score >= 70 && score <= 80){
        $("."+klass).text("C");
    }
    else if(score >=60 && score <= 70){
        $("."+klass).text("D");
    }
    else{
        $("."+klass).text("F");
    }

    if(score > 60 && score%10 >= 7 || score == 100){
        let text = $("."+klass).text() + "+";
        $("."+klass).text(text);
    }
}