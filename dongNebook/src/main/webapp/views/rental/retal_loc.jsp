<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {
        position: relative;
        width: 1200px;
        height: 1000px;
        left: 120px;
        top: 0px;

        background: #FFFFFF;
    }

    .admin-contents-frame {

        width: 1200px;
    }

    .admin-contents-main {
        position: absolute;
        width: 200px;
        height: 100px;
        left: 0px;
        top: 202px;

        background: #3B8686;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    }

    .admin-contents-menu {
        position: absolute;
        width: 200px;
        height: 50px;

    }

    #sub1 {

        left: 0px;
        top: 302px;
        background: #79BD9A;
    }

    #sub2 {
        left: 0px;
        top: 352px;

    }

    #sub3 {
        left: 0px;
        top: 402px;
    }

    .admin-contents-maintext {
        position: absolute;
        width: 164.31px;
        height: 32px;
        left: 1012px;
        top: 186px;
        margin: 0px;
        font-family: Roboto;
        font-style: normal;
        font-weight: normal;
        font-size: 24px;
        line-height: 28px;
        display: flex;
        align-items: center;
        text-align: center;

        color: #000000;
    }

    .admin-line {
        position: absolute;
        width: 969px;
        height: 0px;
        left: 231px;
        top: 251px;

        border: 1px solid #000000;

    }

    .loc-inform {
        position: absolute;
        width: 615px;
        height: 48px;
        left: 231px;
        top: 887px;

        background: #EDEFF2;
        border-radius: 12px;

    }

    .loc-inform-submit {
        position: absolute;
        width: 265px;
        height: 53px;
        left: 900px;
        top: 887px;

        font-family: Lato;
        font-style: normal;
        font-weight: bold;
        font-size: 24px;
        line-height: 29px;
        text-align: center;
        letter-spacing: 0.01em;

        color: #000000;

    }

    .admin-map {


        position: absolute;
        width: 450px;
        height: 555px;
        left: 231px;
        top: 274px;

        background: #FFFFFF;

    }
    .admin-explain{
        position: absolute;
        width: 450px;
        height: 555px;
        left: 716px;
        top: 274px;

        background: #FFFFFF;
    }

</style>
<body>
	<div class="admin-contents-frame">
        <div class="admin-contents-main">
            도서검색
        </div>
        <div class="admin-contents-menu" id="sub1">상세 검색+</div>
        <div class="admin-contents-menu" id="sub2">상호 대차+</div>
        <div class="admin-contents-menu" id="sub3">도서 신청+</div>
        <div class="admin-contents">
            <p class="admin-contents-maintext">수령 위치 검색</p>
            <div class="admin-line"></div>
            <div class="admin-map"></div>
            <div class="admin-explain"></div>
            <input type="text" class="loc-inform" readonly>
            <button class="loc-inform-submit">확인</button>
        </div>
    </div>
</body>
</html>