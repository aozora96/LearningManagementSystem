let logCode = String($("#code").val());
console.log("sjsw: "+$("#code").val())
const requestData = {
    "usercode" : $("#code").val()
}
$.ajax({
    url: "/getScores",
    type: "post",
    data: JSON.stringify(requestData),
    contentType: "application/json",
    success: function (result) {
        const title = document.querySelector('h2');
        // scoreList.innerHTML = "";
        //<input type ="hidden" id ="code" value ="<%=log%>">
        let hidden = document.createElement('input');
        hidden.setAttribute("type","hidden");
        hidden.setAttribute("id","code");
        hidden.setAttribute("value",`${logCode}`);
        $("#scoreList").append(hidden);
        console.log("js19: "+result.length);
        if(result.length === 0){
            title.innerText = "수강내역이 없습니다.";
        }
        else{
            console.log("결과리스트 길이: "+result.length);
            for(let i = 0; i<result.length; i++){
                let sub = document.createElement('div');
                sub.setAttribute("id","sub");
                let subtitle = document.createElement('span');
                subtitle = result[i].title;
                let subScore = document.createElement('span');
                subScore.innerText = result[i].score;
                console.log(result[i].score);
                sub.append(subtitle,": ",subScore,"점");
                $("#scoreList").append(sub);
            }
        }
    },
    error: function (result) {
        alert("error");
    }
})