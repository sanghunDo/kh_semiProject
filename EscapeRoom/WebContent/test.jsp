<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

<button id="payTest" onclick="payTest();">결제 테스트</button>

<script>
function payTest() {
	IMP.init("imp55268951");
    // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
        pg: "kakao.TC0ONETIME",
        pay_method: "card",
        merchant_uid: "coin",
        name: "코인",
        amount: 1000,

        buyer_name: "홍길동",
        buyer_tel: "010-1234-5678",

    }, function (rsp) { // callback
        if (rsp.success) {
            alert("성공");
        } else {
        	var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            console.log(msg);
        }
    });
}
</script>
</body>
</html>