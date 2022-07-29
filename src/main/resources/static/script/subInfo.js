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
        $("#subject").find("section").remove();
        for(let i=0; i<result.length; i++){

            //섹션 만들기
            let section = document.createElement("section");
            section.setAttribute("value", result[i].title);

            let img = document.createElement("img");
            img.setAttribute("src",result[i].thumbnail);
            img.setAttribute("style","width:300px; height:300px;");
            //div (title명)
            let div_title = document.createElement("div");
            div_title.innerText = "강의명 : "+result[i].title;
            // 교수명
            let div_p_name = document.createElement("div");
            div_p_name.innerText = "담당 교수님 : "+result[i].p_name;
            // 강의시간
            let div_runtime = document.createElement("div");
            div_runtime.innerText = "강의 시간 : "+result[i].runtime +"시간 진행";
            // 강의소개
            let div_content = document.createElement("div");
            div_content.innerText = "강의 소개 : "+ result[i].content;

            // div.innerText += <img src="result[i].thumbnail">;

            section.appendChild(img);
            section.appendChild(div_title);
            section.appendChild(div_p_name);
            section.appendChild(div_runtime);
            section.appendChild(div_content);

            $("#subject").append(section);
        }

    }).fail(erorr =>{
        console.log(erorr.responseText);
    })
}