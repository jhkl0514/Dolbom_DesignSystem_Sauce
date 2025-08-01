<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<main id="container">
	<header id="page-title">
		<h2>
			<span>간편 회원가입</span>
			<small>Member Join</small>
		</h2>
	</header>

	<div id="page-content">
		<div class="member-join">

			<form:form id="frmRegist" name="frmRegist" action="./action" class="member-join-content" method="post" modelAttribute="mbrVO" enctype="multipart/form-data">
				<form:input type="hidden" path="uniqueId" />

				<double-submit:preventer tokenKey="preventTokenKey" />

				<div class="flex flex-col items-center">
					<h3 class="flex items-center gap-2">
						<c:choose>
							<c:when test="${mbrVO.joinTy == 'K'}">
								<i class="icon-kakao">카카오</i><!--kakao 일 경우-->
							</c:when>
							<c:otherwise>
								<i class="icon-naver">네이버</i><!--naver 일 경우-->
							</c:otherwise>
						</c:choose>
						<span class="text-xl font-semibold">계정으로 인증되었어요</span>
					</h3>
          			<p class="text-sm font-normal">SNS회원은 만14세 이상만 가입 가능해요</p>
        		</div>

				<p class="mt-13 text-title2">기본 정보</p>
				<table class="table-detail">
					<colgroup>
						<col class="w-29 xs:w-32">
						<col>
					</colgroup>
					<tbody>
						<tr class="top-border">
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row">
								<p>
									<label for="join-item1-4">이메일<sup class="text-base text-danger md:text-lg">*</sup></label>
								</p>
							</th>
							<td><form:input class="w-full form-control" path="eml" maxlength="50"/></td>
						</tr>
						<%-- 2024-01-22 회원정책 변경으로 개인정보 유효기간 삭제 --%>
						<%--
						<tr>
							<th scope="row">
								<p class="flex">
									<label for="join-item3-3">개인정보<br>유효기간</label><sup class="text-base text-danger md:text-lg">*</sup>
								</p>
							</th>
							<td>
								<div class="form-radio-group">
									<c:forEach var="expr" items="${expirationCode}" varStatus="status">
										<div class="form-check">
											<form:radiobutton class="form-check-input" path="prvcVldPd" id="prvcVldPd${status.index}" value="${expr.key}" />
											<label class="form-check-label" for="prvcVldPd${status.index}">${expr.value}</label>
										</div>
									</c:forEach>
								</div>
							</td>
						</tr>
						--%>
					</tbody>
				</table>
				</br>

				<p class="mt-13 text-title2">약관동의</p>
				<table class="table-detail">
					<colgroup>
						<col class="w-29 xs:w-32">
						<col>
					</colgroup>
					<tbody>
						<tr class="top-border">
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="form-check font-bold my-3.5">
					<input class="form-check-input" type="checkbox" id="check-all">
					<label class="form-check-label" for="check-all">전체 약관에 동의합니다</label>
				</div>

				<%@ include file="/WEB-INF/jsp/membership/cntnts/accordionAgree.jsp" %>


				<p class="mt-17 text-title2">정보수신 동의</p>
				<table class="table-detail">
					<colgroup>
						<col class="w-29 xs:w-32">
						<col>
					</colgroup>
					<tbody>
						<tr class="top-border">
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th scope="row"><p>
									<label for="join-item3-4">정보수신</label>
								</p></th>
							<td>
								<input type="hidden" id="smsRcptnDt" name="smsRcptnDt" value="<fmt:formatDate value="${mbrVO.smsRcptnDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
								<input type="hidden" id="emlRcptnDt" name="emlRcptnDt" value="<fmt:formatDate value="${mbrVO.emlRcptnDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
								<input type="hidden" id="telRecptnDt" name="telRecptnDt" value="<fmt:formatDate value="${mbrVO.telRecptnDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
								
								<div class="py-1.5 md:py-2">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="allChk"> <label class="form-check-label" for="allChk"><strong>전체 수신</strong></label>
									</div>
								</div>
								<div class="mt-1.5 flex flex-wrap md:mt-2">
									<div class="mr-3 form-check xs:mr-auto">
										<form:checkbox class="form-check-input agree" path="smsRcptnYn" value="Y" />
										<label class="form-check-label" for="smsRcptnYn1">문자</label>
									</div>
									<div class="mr-3 form-check xs:mr-auto">
										<form:checkbox class="form-check-input agree" path="emlRcptnYn" value="Y" />
										<label class="form-check-label" for="emlRcptnYn1">이메일</label>
									</div>
									<div class="mr-3 form-check xs:mr-auto">
										<form:checkbox class="form-check-input agree" path="telRecptnYn" value="Y" />
										<label class="form-check-label" for="telRecptnYn1">전화</label>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				

				<dl class="content-auth mt-15">
					<dt>본인인증</dt>
				</dl>
				<table class="table-detail">
					<colgroup>
						<col class="w-29 xs:w-32">
						<col>
					</colgroup>
					<tbody>
						<tr class="top-border">
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<div class="content-auth-phone mt-9">
					<img src="/html/page/members/assets/images/img-join-auth.svg" alt="">
					<dl>
						<dd>안전한 이용을 위해 본인인증이 필요합니다<br>본인 명의의 휴대폰 번호로만 인증이 가능합니다.<br>14세 이상만 가입 가능합니다.</dd>
					</dl>
				</div>

				<div class="mt-5 content-button">
					<button type="button" class="flex-1 btn btn-primary btn-large selfBtn">본인 인증하기</button>
					<a href="/membership/cancel/sns/regist" class="btn btn-outline-primary btn-large w-[37.5%]">취소</a>
				</div>

				<input type="hidden" id="receiptId" name="receiptId" value="">
			</form:form>
		</div>
	</div>
</main>

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
	            $("#receiptId").val(response.data.receipt_id);
		        $("#frmRegist").submit();
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

$(function(){
	function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
	}
	
	// 완료 요청인 경우 홈 화면으로 이동
	var isComplete = '${isComplete}'
	if (isComplete && isComplete === 'Y') {
		window.location.href = '/';
	}

	//약관 동의 확인
	$(".selfBtn").on("click",function(){
		if(!$("#termsYn").is(":checked") || !$("#privacyYn").is(":checked") ){
			alert("필수 약관에 동의 해주세요.");
			return false;
		} else{
			f_cert();
		}
	});

	$(".agree").on("click",function(){
		if($(".agree:checked").length == 3){
			$("#allChk").prop("checked",true);
		}else{
			$("#allChk").prop("checked",false);
		}
		
		var inputName = $(this).attr('name');
		$('#' + inputName.replace('Yn', '') + 'Dt').attr('value', dateFormat(new Date()));
	});
});
</script>