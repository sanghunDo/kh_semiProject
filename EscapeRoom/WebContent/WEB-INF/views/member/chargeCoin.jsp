<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
	String userId = request.getParameter("userId");
	System.out.println("userId@chargeCoin.jsp=" + userId);
/* 	int coin = (int)Integer.parseInt(request.getParameter("coin"));
	System.out.println("coin=" + coin); */
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<title>코인 충전</title>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<style>
#chargeCoin-Container {
	color: white;
}

td {
	color: white;
}
</style>
<body>

	<div id="chargeCoin-Container">
		<h2>&lt; 코인 충전 &gt;</h2>
		<form action="<%=request.getContextPath()%>/member/chargeCoinEnd"
			name="chargeCoinFrm" id="chargeCoinFrm" method="post">
			<input type="hidden" name="userId" id="userId" value=<%=userId%> />
			<table>
				<tr>
					<th></th>
					<td><input type="radio" name="coin_" id="1000" value=1000 productName="1000코인 충전"
						selected /> 1000코인 충전</td>
					<td><input type="radio" name="coin_" id="3000" value=3000 productName="3000코인 충전"/>
						3000코인 충전</td>
					<td><input type="radio" name="coin_" id="5000" value=5000 productName="5000코인 충전" />
						5000코인 충전</td>
				</tr>
			</table>
				<button id="check_module" type="button">결제하기</button>

		</form>
	</div>
	<script>
		$("#check_module").click(function() {
		   var radioVal = $('input[name="coin_"]:checked').val();
		   var productName = $('input[name="coin_"]:checked').attr("productName");
		   console.log(productName);

		   console.log(radioVal);
			var IMP = window.IMP; // 생략가능
			IMP.init('imp92461404');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg : 'html_5inicis', // version 1.1.0부터 지원.
				/* 
				    'kakaopay':카카오페이, 
				    html5_inicis':이니시스(웹표준결제)
				        'nice':나이스페이
				        'jtnet':제이티넷
				        'uplus':LG유플러스
				        'danal':다날
				        'payco':페이코
				        'syrup':시럽페이
				        'paypal':페이팔
				 */
				pay_method : 'card',
				/* 
				    'samsung':삼성페이, 
				    'card':신용카드, 
				    'trans':실시간계좌이체,
				    'vbank':가상계좌,
				    'phone':휴대폰소액결제 
				 */
				merchant_uid : 'EscapeRoom_' + new Date().getTime(),
				/* 
				    merchant_uid에 경우 
				    https://docs.iamport.kr/implementation/payment
				    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				    참고하세요. 
				    나중에 포스팅 해볼게요.
				 */
				name : productName,
				//결제창에서 보여질 이름
				amount : radioVal,
				//가격 
				buyer_email : '',
				buyer_name : '<%=userId%>',
				buyer_tel : '',
				buyer_addr : '',
			/* buyer_postcode : '123-456', */
			 	m_redirect_url : 'https://localhost:9090/payment/confirm'
			/*  
			    모바일 결제시,
			    결제가 끝나고 랜딩되는 URL을 지정 
			    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					jQuery.ajax({
						url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			    		type: 'POST',
			    		dataType: 'json',
			    		data: {
				    		imp_uid : rsp.imp_uid,
				    		//기타 필요한 데이터가 있으면 추가 전달
				    		coin : radioVal,
				    		userId : <%=userId%>
			    		}
					}).done(function(data){
						if(everythings_fine){
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						alert("성공", msg);
						} else{
							
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert("실패", msg);
			});
		});
	</script>
</body>
</html>

