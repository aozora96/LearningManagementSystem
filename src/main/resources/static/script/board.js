// 게시글 조회
$.ajax({
    url: "/boardList",
    type: "POST",
    success: function(result) {
        console.log("result type : " + typeof result);
        console.log(result);
        for(let i = 0; i<result.length; i++) {
        let tr = document.createElement("tr");
        let no = document.createElement("td");
        let title = document.createElement("td");
        let user = document.createElement("td");
        let cA = document.createElement("td");
        let mA = document.createElement("td");

        // no, title, user, cA, mA , +viewCnt
            no.innerText = i+1;
            title.innerText = result[i].title;
            user.innerText = result[i].usercode;
            let subCA = result[i].createdAt.substring(0,10);
            cA.innerText = subCA;
            let subMA = result[i].modifiedAt.substring(0,10);
            mA.innerText = subMA;

            tr.append(no);
            tr.append(title);
            tr.append(user);
            tr.append(cA);
            tr.append(mA);
            $("#here").append(tr);
        }
        }
    ,error: function(result){
        alert("시스템 에러 발생\n관리자에게 문의 바랍니다.")
    }
})


// 게시글 작성
function boardW(){
    let requestData = {
        "title" : $("#title").val(),
        "contents" : $("#content").val(),
        "usercode" : $("#usercode").val(),
        "grade" : "S"
    }
    console.log("title: "+ $("#title").val());
    console.log("content: "+ $("#content").val());

    if($("#title").val() == "" || $("#content").val()=="") alert("게시글을 작성해주세요.")
    else{
    $.ajax({
        url:"/boardWrite",
        type:"POST",
        data: JSON.stringify(requestData),
        contentType: "application/json",
        success: function(result){
            alert("게시글이 작성되었습니다.")
            location.href="/board";
        },
        error: function(result){

        }
    })
}
}




// 게시글 수정

// 게시글 삭제



