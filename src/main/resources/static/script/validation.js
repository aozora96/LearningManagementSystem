const form = document.body.querySelector("form");
// 랜덤 유저 코드 생성기
function userCodeMaker() {
    const upper = 9999;
    const lower = 1000;
    let myRandom = Math.floor(Math.random() * (upper - lower + 1)) + lower;
    return myRandom;
}


//아이디 중복검사
// $("#id").keyup(checkId());
let id = document.body.querySelector("#joinId");
id.addEventListener("keyup", e =>{
    checkId();
})
function checkId(){
    if($("#joinId").val().length >= 2){
        let requestData = {
            "id" : $("#joinId").val(),
        }
        $.ajax({
            url:"/checkId",
            type:"post",
            data: JSON.stringify(requestData),
            contentType: "application/json",
            success: function (result){
                if(result === true){
                    $("#inuse").hide()
                    $("#use").show()
                    $("#chId").attr("value","check")
                }else{
                    $("#inuse").show()
                    $("#use").hide()
                    $("#chId").attr("value","")
                }
            },
            error: function (result){
                alert("시스템 에러 발생\n관리자에게 문의 바랍니다.")
            }

        })
    }
}


//restapi 사용전 검증
function joinCheck(){
    if($("#name").val() == ""){
        alert("이름을 입력해주세요.")
    }
    else if($("#id").val() == ""){
        alert("아이디를 입력해주세요.")
    }
    else if($("#chId").val() == ""){
        alert("사용가능한 아이디인지 확인해주세요.")
    }
    else if($("#pw").val() == ""){
        alert("비밀번호를 입력해주세요.")
    }
    else if($("#address").val() == ""){
        alert("주소를 입력해주세요.")
    }
    else if($("#gender").val() == "성별"){
        alert("성별을 선택해주세요.")
    }
    else if($("#major").val() == "none"){
        alert("전공을 선택해주세요.")
    }
    else if($("#mobile").val().length < 13){
        alert("휴대전화를 입력해주세요.")
    }
    else if($("#birth").val() == ""){
        alert("생년월일을 선택해주세요.")
    }
    else {
        join();
    }
}

// join 기능
function join(){
    let requestData = {
        "usercode" : userCodeMaker(),
        "grade" :$("#grade").val(),
        "name" : $("#name").val(),
        "id" : $("#id").val(),
        "pw" : $("#pw").val(),
        "address" : $("#address").val(),
        "mobile" :$("#mobile").val(),
        "gender" :$("#gender").val(),
        "birth" :$("#birth").val(),
        "major" :$("#major").val()
    }
    $.ajax({
        url:"/join",
        type:"post",
        data: JSON.stringify(requestData),
        contentType: "application/json",
        success: function (result){
            if(result == ""){
                alert("이미 사용중인 ID 입니다.")
            }else{
                alert("회원가입 성공!")
                location.href = "/login";
            }
        },
        error: function (result){
            //alert("시스템 에러 발생\n관리자에게 문의 바랍니다.")
            alert("입력한 정보를 다시한번 확인해주세요.")
        }

    })

}

function leaveAction(){
    console.log("userCode: "+$("#code").val());
    console.log("pw: "+ $("#pw").val());
    const  requestData = {
        "usercode" : $("#code").val(),
        "pw" : $("#pw").val()
    }
    console.log("validation code: "+requestData.usercode);
    console.log("validation pw: "+requestData.pw);

    $.ajax({
        url :"/delete",
        type :"DELETE",
        data : JSON.stringify(requestData),
        contentType : "application/json"
    }).done(result =>{
        if(result == true){
            alert("탈퇴완료");
            //  $("form").submit();
            location.href='/';
        }else{
            alert("비밀번호가 일치하지 않습니다.");
        }
    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}

function login(){
    console.log("id: "+$("#id").val());
    console.log("pw: "+$("#pw").val());
    const requestData = {
        "id": $("#id").val(),
        "pw": $("#pw").val()
    }
    $.ajax({
        url: "/login",
        type: "post",
        data: JSON.stringify(requestData),
        contentType: "application/json",
        success: function (result) {
            if(result === "/") {
                alert("로그인 성공!")
                location.href='/';
            }
            else{
                alert("아이디와 비밀번호를 다시 확인하고 입력해주세요.")
                    location.href='/login';
            }
        },
        error: function (result) {
            alert("시스템 에러 발생. 관리자 문의 요망.")
        }
    })
}

// 여기서 부터 넣음
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function execDaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

            }


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}

// TODO
function todoList(){
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
                    let br = document.createElement('br');
                    let content = document.createElement('span');
                    let checkbox = document.createElement('input');
                    checkbox.setAttribute("type","checkbox");
                    //console.log(result[i].todoCode);
                    let stringi = String(result[i].todoCode);
                    checkbox.setAttribute("value",`${stringi}`);
                    checkbox.setAttribute("id","done");
                    checkbox.setAttribute("name","done");
                    content.innerText = `${i+1}. ` + result[i].contents;
                    $("#todoList").append(content,checkbox,br);
                }
            }
            let br = document.createElement('br');
            let addContents = document.createElement('input');
            addContents.setAttribute("type","text");
            addContents.setAttribute("id","contents");
            addContents.setAttribute("name","contents");
            let addButton = document.createElement('input');
            addButton.setAttribute("value","+");
            addButton.setAttribute("type","button");
            addButton.setAttribute("onclick","addTodo()");
            // let delButton = document.createElement('input');
            // delButton.setAttribute("value","완료된 일 삭제하기");
            // delButton.setAttribute("type","button");
            // delButton.setAttribute("onclick","delTodo()");

            $("#todoList").append(addContents,addButton,br);
        },
        error: function (result) {
            alert("error");
        }
    })
}

function addTodo(){
    console.log($("#code").val());
    console.log($("#contents").val());
    const requestData = {
        "userCode" : $("#code").val(),
        "contents" : $("#contents").val()
    }
    $.ajax({
        url: "/addTodo",
        type: "post",
        data: JSON.stringify(requestData),
        contentType: "application/json",
        success: function (result) {
            todoList();
            alert("success");
        },
        error: function (result) {
            alert("error");
        }
    })
}