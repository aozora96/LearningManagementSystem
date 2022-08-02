<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        section{
            margin: 0;
            padding: 0;
            width: 480px;
            height: 880px;
            display: flex;
            flex-wrap: wrap;
            border-top: 1px solid ;
            border-left: 1px solid ;
        }
        section div{
            border-right: 1px solid ;
            border-bottom: 1px solid ;
            width: 79px;
            height: 79px;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

<body>
수강신청
<div>
    <div>
        <%--전공--%>
        <select id="major" onchange="callSub()">
            <option></option>
        </select>
        <%--과목명--%>
        <select id="subject" onchange="colors()">
            <option></option>
        </select>
        <button>수강신청 완료</button>
        <%--즉시 DB반영이라 버튼이 필요없을듯 하지만 있는게 나을것 같아서 일단 둠--%>
        <span id="hakjum">0</span>점
    </div>
<div id="subInfo">

</div>
<section>
    <div></div><div id="MO">월</div><div id="TU">화</div><div id="WE">수</div><div id="TH">목</div><div id="FR">금</div>
    <div>9</div><div id="MO09"></div><div id="TU09"></div><div id="WE09"></div><div id="TH09"></div><div id="FR09"></div>
    <div>10</div><div id="MO10"></div><div id="TU10"></div><div id="WE10"></div><div id="TH10"></div><div id="FR10"></div>
    <div>11</div><div id="MO11"></div><div id="TU11"></div><div id="WE11"></div><div id="TH11"></div><div id="FR11"></div>
    <div>12</div><div id="MO12"></div><div id="TU12"></div><div id="WE12"></div><div id="TH12"></div><div id="FR12"></div>
    <div>13</div><div id="MO13"></div><div id="TU13"></div><div id="WE13"></div><div id="TH13"></div><div id="FR13"></div>
    <div>14</div><div id="MO14"></div><div id="TU14"></div><div id="WE14"></div><div id="TH14"></div><div id="FR14"></div>
    <div>15</div><div id="MO15"></div><div id="TU15"></div><div id="WE15"></div><div id="TH15"></div><div id="FR15"></div>
    <div>16</div><div id="MO16"></div><div id="TU16"></div><div id="WE16"></div><div id="TH16"></div><div id="FR16"></div>
    <div>17</div><div id="MO17"></div><div id="TU17"></div><div id="WE17"></div><div id="TH17"></div><div id="FR17"></div>
    <div>18</div><div id="MO18"></div><div id="TU18"></div><div id="WE18"></div><div id="TH18"></div><div id="FR18"></div>
</section>

<div id="schedule">

</div>

<script src="script/addLecture.js"></script>
</body>
</html>