<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<main id="container">
	<header id="page-title">
		<h2>
			<span>
				통합회원 전환
			</span>
			<small>Integrated Member</small>
		</h2>
	</header>

	<div id="page-content">
		<form class="login_form">
			<fieldset>
				<legend class="pt-12 lg:pt-0 fs32 fw700">본인인증</legend>
				<div class="h24"></div>
				<div class="fs18">
					변경된 약관에 따라 통합회원 전환 시,<br>
					본인인증(최초 1회)이 필요합니다.
				</div>

				<div class="h32"></div>

				<button type="button" class="btn_2 btn_primary_total w100p" onclick="f_cert();">본인 인증</button>
			</fieldset>
		</form>
	</div>
	



</main>


<script src="/html/core/script/matchingAjaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
<script>
	async function f_cert(){
		try {
		    const response = await Bootpay.requestAuthentication({
		        application_id: "${_bootpayScriptKey}",
		        pg: '다날',
		        order_name: '본인인증',
		        authentication_id: 'CERT00000000001',
		        extra: { show_close_button: true }
		    })
		    switch (response.event) {
		        case 'done':
		            console.log("response.data", response.data);
		            var receiptId = response.data.receipt_id;
		            integratedAction(receiptId);
		            break;
		    }
		} catch (e) {
		    switch (e.event) {
		        case 'cancel':
		            console.log(e.message);	// 사용자가 결제창을 닫을때 호출
		            break
		        case 'error':
		            console.log(e.error_code); // 결제 승인 중 오류 발생시 호출
		            break
		    }
		}
	}
	
	//통합회원 전환 요청
	function integratedAction(receiptId) {
		callPostAjaxIfFailOnlyMsg(
			'/membership/integrated.json',
			{receiptId},
			function(result) {
				location.href = '/';					
			}
		);
	}
</script>