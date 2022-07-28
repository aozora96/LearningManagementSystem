const form = document.body.querySelector("form");
// 랜덤 유저 코드 생성기
function userCodeMaker() {
    const upper = 9999;
    const lower = 1000;
    let myRandom = Math.floor(Math.random() * (upper - lower + 1)) + lower;
    return myRandom;
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
            alert("시스템 에러 발생\n관리자에게 문의 바랍니다.")
        }

    })

}

function leaveAction(){
    const  requestData = {
        "id" : $("#log").val(),
        "pw" : $("#pw").val()
    }
    $.ajax({
        url : "/delete",
        type : "DELETE",
        data : JSON.stringify(requestData),
        contentType : "application/json"
    }).done(result =>{
        if(result == true){
            alert("탈퇴완료");
            $("form").submit();
        }else{
            console.log("\n\n\n하이\n\n\n");
            alert("비밀번호가 일치하지 않습니다.");
        }
    }).fail(erorr =>{
        console.log("\n\n\n하이\n\n\n");
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
            alert("로그인 성공!")
            form.submit();
        },
        error: function (result) {
            alert("아이디와 비밀번호를 다시 확인하고 입력해주세요.")
        }
    })
}