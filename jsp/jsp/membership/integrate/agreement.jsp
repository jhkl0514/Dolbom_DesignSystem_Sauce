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
		<form action="./verify" method="post" class="login_form">
			<fieldset>
				<legend class="pt-12 lg:pt-0 fs32 fw700">약관동의</legend>
				<div class="h24"></div>
				<div class="fs18" style="font-size: 17px;">이제 하나의 아이디로 모든 이로움ON 통합 서비스를 이용하세요!</div>
				<div class="h24"></div>
				<div class="fs18"><strong>2024.05.16</strong> 이전 회원의 경우, 통합회원 전환을 위해 신규 약관 동의 및 본인인증(최초1회)이 필요합니다.</div>

				<hr class="mt-8 mb-8 border-gray-300">


				<div class="member-join-content mdfy02">

					<div class="my-4 font-bold form-check">
						<input class="form-check-input" type="checkbox" id="check-all">
						<label class="form-check-label fw700" for="check-all">아래 약관에 모두 동의합니다.</label>
					</div>

					<%@ include file="/WEB-INF/jsp/membership/cntnts/accordionAgree.jsp" %>


				</div>

				<div class="h24"></div>

				<button type="button" class="btn_2 btn_primary_total w100p" onclick="formSubmit();">확인</button>

			</fieldset>
		</form>
	</div>

</main>

	
<script>
	function formSubmit() {
		const form = document.querySelector('form');
		
		//필수약관 동의 여부 검사
		if ($('#termsYn').is(':checked') === false) {
			alert('필수 약관에 동의 해주세요.');
			return;
		}
		if ($('#privacyYn').is(':checked') === false) {
			alert('필수 약관에 동의 해주세요.');
			return;
		}
		
		form.submit();
	}
</script>