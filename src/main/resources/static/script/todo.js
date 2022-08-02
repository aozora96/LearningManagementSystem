let logCode = String($("#code").val());
const requestData = {
    "userCode" : $("#code").val() // user_code아님
}
$.ajax({
    url: "/getTodo",
    type: "post",
    data: JSON.stringify(requestData),
    contentType: "application/json",
    success: function (result) {
        const todoList = document.querySelector('#todoList');
        todoList.innerHTML = "";
        //<input type ="hidden" id ="code" value ="<%=log%>">
        let hidden = document.createElement('input');
        hidden.setAttribute("type","hidden");
        hidden.setAttribute("id","code");
        hidden.setAttribute("value",`${logCode}`);
        $("#todoList").append(hidden);
        console.log(result); //
        console.log(typeof result); //
        if(result.length === 0){
            $("#list").innerText = "todo 리스트를 추가해보세요.";
        }
        else{
            for(let i = 0; i<result.length; i++){

                let label = document.createElement('label');
                let br = document.createElement('br');
                let content = document.createElement('span');
                let checkbox = document.createElement('input');
                checkbox.setAttribute("type","checkbox");
                content.setAttribute("id", i+1);
                checkbox.setAttribute("onclick","checkClick(event)");
                if(result[i].checked == 'Y'){
                    checkbox.setAttribute("checked","checked");
                    content.setAttribute("style","text-decoration:line-through; color:gray;");
                }
                //console.log(result[i].todoCode);
                let stringi = String(result[i].todoCode);
                checkbox.setAttribute("value",`${stringi}`);
                checkbox.setAttribute("id","checkbox"+i);
                checkbox.setAttribute("name","done");
                content.innerText = `${i+1}. ` + result[i].contents;
                label.appendChild(content);
                label.appendChild(checkbox);
                label.appendChild(br);

                $("#todoList").append(label);
            }
        }
    },
    error: function (result) {
        alert("error");
    }
})

function checkClick(event)  {
    let todoCode = '';
    if(event.target.checked)  {
        todoCode = event.target.value;
    }else {
        todoCode = '';
    }

    const requestData = {
        "userCode" : $("#code").val(),
        "todoCode" : todoCode
    }
    $.ajax({
        url: "/checkTodo",
        type: "post",
        data: JSON.stringify(requestData),
        contentType: "application/json",
    }).done(result =>{
        console.log("홍성현이 todo 권위자 등극 ");

    })



}

let bc = ["#6E85B7","#f1f0c0","#b7e4dd","#c2ded0","orange",
    "pink","#ceac93","#d1d1d1","#8fc8ab","skyblue","#F5F0BB",
    "#9a85a4","rgb(241, 215, 216)","#b0bbe6","#c4dfaa",
    "#e7fbbe","#f4d19b","#D57E7E","#C6DCE4"];
let cc = 0;



 const  timeData = {
     "usercode" :$("#code").val()
 }
$.ajax({
    url : "/showTime",
    type : "POST",
    data : JSON.stringify(timeData),
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
        cc++;
        // let sche = document.createElement("p");
        // sche.setAttribute("class",sel);
        // sche.setAttribute( "id", result.subcode); //과목코드
        // sche.innerText = result.title;//과목명
        // $("#schedule").append(sche);
    }
    if(cc >= bc.length){
        cc = 0;
    }
}