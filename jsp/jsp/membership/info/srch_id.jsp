<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<main id="container">
	<header id="page-title">
		<h2>
			<span>아이디/비밀번호 찾기</span>
            <small>ID/Password Search</small>
		</h2>
	</header>

	<div id="page-content">


		<div  class="search_form login_integrate">
			<ul class="member-tabs is-equal nav">
				<li><a href="#tab-search1" id="tab-header-id" data-bs-toggle="pill" data-bs-target="#tab-search1" class="active">아이디 찾기</a></li>
				<li><a href="#tab-search2" id="tab-header-pw" data-bs-toggle="pill" data-bs-target="#tab-search2">비밀번호 찾기</a></li>
			</ul>
			<div class="tab-content">

				<div class="h58"></div>


				<fieldset class="tab-pane show active" id="tab-search1">


					<div class="id_search_area">

						<!-- 본인인증 -->
						<div class="form-check">
							<input class="form-check-input" type="radio" id="check-item1" name="idpw_s" checked>
							<label class="form-check-label" for="check-item1">본인인증으로 찾기</label>
						</div>
						<!-- 본인인증 end -->

						<div class="chk_area check-item1">
							
							<div class="ctn_area">

								<div class="txt_fs16_01">휴대폰 인증을 통해 본인 명의 아이디를 찾을 수 있습니다.</div>
								
								<button class="btn_2 btn_primary_total w100p" title="evt_search_cert">찾기</button>

							</div>  

						</div>
						<!-- check-item1 -->
						



						<!-- 등록한 휴대폰 번호 -->
						<div class="form-check">
							<input class="form-check-input" type="radio" id="check-item2" name="idpw_s" >
							<label class="form-check-label" for="check-item2">등록한 휴대폰 번호로 찾기</label>
						</div>
						<!-- 등록한 휴대폰 번호 end-->

						<div class="chk_area check-item2">
							
							<div class="ctn_area">

								<div class="txt_fs16_01">가입 시 등록한 이름과 휴대폰 번호를 입력해 주세요.</div>

								<div class="form-group">
									<form method="post" action="=" id="findIdPhoneFrm" name="findIdPhoneFrm">
										<input class="form-control" type="text"  id="findIdPhoneMbrNm" name="findIdPhoneMbrNm" maxlength="50" placeholder="이름">
										<!--div id="mbrNm-error" class="error text-danger">! 이름을 입력해 주세요.</div-->
										<input class="form-control keycontrol phonenumber" type="tel" id="findIdPhoneMbrTel" name="findIdPhoneMbrTel" maxlength="20" placeholder="010-1234-5678">
										<!--div id="mbrInfo-error" class="error text-danger">! 휴대폰번호를 입력해 주세요.</div-->
									</form>
									
								</div>
								
								<button class="btn_2 btn_primary_total w100p" title="evt_search_hp">찾기</button>

								<div class="txt_fs14_01 text-gray5">
									개인정보 보호를 위해 아이디 일부만 제공됩니다.<br>
									전체를 확인하시려면 ‘본인인증으로 찾기’ 로 진행해 주세요.
								</div>

							</div> 

						</div>
						<!-- check-item2 -->





						<!-- 등록한 이메일 -->
						<div class="form-check">
							<input class="form-check-input" type="radio" id="check-item3" name="idpw_s" >
							<label class="form-check-label" for="check-item3">등록한 이메일로 찾기</label>
						</div>
						<!-- 등록한 이메일 end-->

						<div class="chk_area check-item3">

							<div class="ctn_area">

								<div class="txt_fs16_01">가입 시 등록한 이름과 이메일을 입력해 주세요.</div>

								<div class="form-group">
									<form method="post" action="=" id="findIdEmailFrm" name="findIdEmailFrm">
										<input class="form-control" type="text" id="findIdEmailMbrNm" name="findIdEmailMbrNm" maxlength="50" placeholder="이름">
										<!--div id="mbrNm-error" class="error text-danger">! 이름을 입력해 주세요.</div-->
										<input class="form-control" type="text" id="findIdEmailEmail" name="findIdEmailEmail" placeholder="eroum@thkc.co.kr">
										<!--div id="mbrInfo-error" class="error text-danger">! 이메일은 필수 입력 항목입니다.</div-->
									</form>
								</div>
								
								<button class="btn_2 btn_primary_total w100p" title="evt_search_email">찾기</button>

								<div class="txt_fs14_01 text-gray5">
									개인정보 보호를 위해 아이디 일부만 제공됩니다.<br>
									전체를 확인하시려면 ‘본인인증으로 찾기’ 로 진행해 주세요.
								</div>

							</div>   

						</div>
						<!-- check-item3 -->

					</div>
					<!-- id_search_area -->




					<!-- 2단계 : 등록된 휴대폰번로 찾기 evt_search_hp -->
					<div class="hidden evt_search_hp">

						<div class="ctn_area_2">

							<div class="py-4 txt_fs18_01 title-txt">
								<strong>개인정보 보호를 위해 아이디 일부만 제공됩니다.
									<br>SNS 간편가입의 경우 가입 채널만 제공됩니다.</strong>
							</div>

							<div class="h24"></div>

							
							<div class="box_x20y32 bder_top bder_bottom itemlist">

								<dl class="dl_list">
									<dt class="txt_fs16_01"><strong>gye***</strong></dt>
									<dd class="txt_fs16_01">2023.12.24 가입</dd>
								</dl>
								<dl class="dl_list">
									<dt class="txt_fs16_01"><strong>카카오톡</strong></dt>
									<dd class="txt_fs16_01">1993.01.24 가입</dd>
								</dl>
								<dl class="dl_list">
									<dt class="txt_fs16_01"><strong>네이버</strong></dt>
									<dd class="txt_fs16_01">1993.01.24 가입</dd>
								</dl>
							</div>

							<div class="h32"></div>

							<div class="btn_area">
								<button class="btn_2 btn_secondary_total w100p btn pw">비밀번호 찾기</button>
								<button class="btn_2 btn_primary_total w100p btn login">로그인하기</button>
							</div>

						</div>

					</div>
					<!-- evt_search_hp -->

					
				</fieldset>
				<!-- tab-search1 -->

				<!-- 비밀번호 찾기 -->
				<fieldset class="tab-pane" id="tab-search2">

					<div class="pw_search_area">

						<div class="ctn_area_2">

							<div class="py-4 txt_fs16_01">
							
								<strong>이로움ON 아이디를 입력 후 본인인증을 진행해 주세요.</strong>
							
							</div>

							<div class="h24"></div>

							<div class="form-group block">

								
								<form method="post" action="=" id="findPwFromIdFrm" name="findPwFromIdFrm">
									<input class="form-control w100p" type="text" id="findPwFromIdMbrId" name="findPwFromIdMbrId" maxlength="50" placeholder="아이디">
									
								</form>
								
								
							</div>

							<div class="h24"></div>
							
							<button class="btn_2 btn_primary_total w100p" title="evt_search_cert2">본인인증</button>

							<div class="h24"></div>

							<div class="txt_fs14_01 text-gray5">
								간편가입 회원은 비밀번호 찾기가 제공되지 않습니다.<br>
								각 소셜 서비스를 통해 확인 부탁드립니다.
							</div>

						</div>  



					</div>
					<!-- pw_search_area -->



					<!-- 2단계 : 본인인증 evt_search_cert2 -->
					<div class="hidden evt_search_cert2">

						<div class="ctn_area_2">

							<div class="py-4 txt_fs18_01">
								<strong class="idnm">홍길동(gyeom2da)님</strong> 본인 인증이 완료되었습니다.<br>
								사용하실 새 비밀번호를 입력해 주세요.
							</div>

							<div class="h24"></div>

							
							<div class="form-group">
								<form method="post" action="=" id="findPwConfirmFrm" name="findPwConfirmFrm">
									<input class="form-control w100p" type="password" id="findPwConfirmPw1" name="findPwConfirmPw1" placeholder="새 비밀번호">
									<input class="form-control w100p" type="password" id="findPwConfirmPw2" name="findPwConfirmPw2" placeholder="새 비밀번호 확인" style="margin-top: 12px;">
									<input type="hidden" id="findPwConfirmMbrId" name="findPwConfirmMbrId">
									<input type="hidden" id="findPwConfirmAuthNo" name="findPwConfirmAuthNo">
									<input type="hidden" id="publicKeyExponent" name="publicKeyExponent">
									<input type="hidden" id="publicKeyModulus" name="publicKeyModulus">
								</form>
								
								
							</div>

							<div class="h24"></div>

							<div class="btn_area">
								<button class="btn_2 btn_primary_total w100p" title="evt_confirm_pw">확인</button>
							</div>

							<div class="h24"></div>

							<div class="txt_fs14_01 text-gray5">
								띄어쓰기 없이 8~16자 영문, 숫자, 특수문자를 조합하여 입력해 주세요.<br>
								특수문자는 ! @ # $ % ^ &amp; * ( ) , . ? " : { } | &lt; &gt; 만 사용할 수 있습니다.
							</div>

						</div>
						

					</div>
					<!-- evt_search_cert -->
					


				</fieldset>
			</div>
		</div>


	</div>
</main>

<script src="/html/core/vendor/rsa/RSA.min.js" /></script>
<script src="/html/core/script/matchingAjaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
<script>
	const f_rsa_enc = function(v, rpkm, rpke) {
		let rsa = new RSAKey();
		rsa.setPublic(rpkm,rpke);
		return rsa.encrypt(v);
	}
	let timerId;
	
var validMbrInfo = {};

//회원정보 입력 초기화
function initInputMbrInfo() {
	var inputMbrNm = $('#mbrNm');
	var inputMbrInfo = $('#mbrInfo');
	inputMbrNm.val('');
	inputMbrNm.removeClass('is-invalid');
	inputMbrInfo.val('');
	inputMbrInfo.removeClass('is-invalid');
	
	//유효성 이펙트 끄기
	$('#mbrNm-error').css('display', 'none');
	$('#mbrInfo-error').css('display', 'none');
}

//유효성 검사
const emailchk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const telchk = /^([0-9]{2,3})?-([0-9]{3,4})?-([0-9]{3,4})$/;
function validateInputMbrInput() {
	validMbrInfo = {};
	var isValid = true;
	
	var inputMbrNm = $('#mbrNm');
	var inputMbrInfo = $('#mbrInfo');
	var mbrNm = inputMbrNm.val();
	var srchTy = $('input[name=srchTy]:checked').val();
	var mbrInfo = inputMbrInfo.val();  //이메일 or 번호
	
	var mbrNmErrorDiv = $('#mbrNm-error');
	var mbrInfoErrorDiv = $('#mbrInfo-error');
	
	//이름 검증
	if (mbrNm.length < 1) {
		inputMbrNm.addClass('is-invalid');
		
		mbrNmErrorDiv.text('! 이름을 입력해 주세요.');
		mbrNmErrorDiv.css('display', 'block');
		isValid = false;
	} else {
		inputMbrNm.removeClass('is-invalid');
		mbrNmErrorDiv.css('display', 'none');
		
		validMbrInfo.mbrNm = mbrNm;
	}
	
	//회원 정보 검증
	if (mbrInfo.length < 1) {
		inputMbrInfo.addClass('is-invalid');
		
		var srchTyText = srchTy === 'eml' ? '이메일은' : '휴대폰번호는';
		mbrInfoErrorDiv.text('! ' + srchTyText + ' 필수 입력 항목입니다.');
		mbrInfoErrorDiv.css('display', 'block');
		isValid = false;
	}
	else {
		inputMbrInfo.removeClass('is-invalid');
		mbrInfoErrorDiv.css('display', 'none');
	}
	
	if (mbrInfo.length > 0 && srchTy === 'eml') {
		if (emailchk.test(mbrInfo)) {
			inputMbrInfo.removeClass('is-invalid');
			mbrInfoErrorDiv.css('display', 'none');
			
			validMbrInfo.eml = mbrInfo;
		}
		else {
			inputMbrInfo.addClass('is-invalid');
			mbrInfoErrorDiv.text('! 이메일 형식이 잘못되었습니다.(abc@def.com)');
			mbrInfoErrorDiv.css('display', 'block');
			isValid = false;
		}
	}
	else if (mbrInfo.length > 0 && srchTy === 'tel') {
		if (telchk.test(mbrInfo)) {
			inputMbrInfo.removeClass('is-invalid');
			mbrInfoErrorDiv.css('display', 'none');
			
			validMbrInfo.mblTelno = mbrInfo;
		}
		else {
			inputMbrInfo.addClass('is-invalid');
			mbrInfoErrorDiv.text('! 휴대폰번호 형식이 잘못되었습니다.(000-0000-0000)');
			mbrInfoErrorDiv.css('display', 'block');
			isValid = false;
		}
	}
	
	return isValid;
}


//회원정보로 찾기에서 확인 버튼 클릭
function clickSearchByMbrInfo() {
	//유효성 검사
	if (!validateInputMbrInput()) {
		return;
	}
	
	
}

//아이디 찾기 ajax 호출
function postAjaxSearchId(receiptId, mbrNm, eml, mblTelno) {
	var requestJson = {};
	if (receiptId) {
		requestJson.kind = "receiptId";
		requestJson.receiptId = receiptId;
	}
	if (mbrNm) {
		requestJson.mbrNm = mbrNm;
	}
	if (eml) {
		requestJson.kind = "eml";
		requestJson.eml = eml;
	}
	if (mblTelno) {
		requestJson.kind = "mblTelno";
		requestJson.mblTelno = mblTelno;
	}
	
	requestJson.mustCallbackJs = true;
	
	callPostAjaxIfFailOnlyMsg(
		'/membership/srchId.json',
		requestJson,
		function(result) {
			postAjaxSearchedIdResult('postAjaxSearchId', requestJson, result);
			// location.href = '/membership/srchIdConfirm';					
		}
	);
}

function postAjaxSearchedIdResult(callerKind, requestJson, result){
	if (result == undefined || result.success == undefined || result.success != true || result.authList == undefined){
		$('.id_search_area').fadeIn(10);
		return;
	}

	$('.evt_search_hp').fadeIn(100); 
	$(".id_search_area").fadeOut(10);

	if (requestJson.kind == "receiptId"){
		$('.evt_search_hp .title-txt strong').html('고객님의 정보와 일치하는 아이디입니다.<br>SNS 간편가입 계정의 경우 가입 채널만 제공됩니다.')
	} else{/*requestJson.kind == "eml" "mblTelno" */
		$('.evt_search_hp .title-txt strong').html('개인정보 보호를 위해 아이디 일부만 제공됩니다.<br>SNS 간편가입의 경우 가입 채널만 제공됩니다.')
	}
	
	
	var itemone;
	var ifor, ilen = result.authList.length;
	var existsEroumId = false;
	var arrTemp = []
	var sTemp;
	for(ifor=0 ; ifor<ilen ; ifor++){
		itemone = result.authList[ifor];
		if (itemone.joinTy=='E'){
			itemone.view_order = 100;
		} else if (itemone.joinTy=='K'){
			itemone.view_order = 200;
		} else if (itemone.joinTy=='N'){
			itemone.view_order = 300;
		}
	}

	result.authList.sort(function(a, b) {
		return a.view_order - b.view_order;
	  });

	for(ifor=0 ; ifor<ilen ; ifor++){
		itemone = result.authList[ifor];
		sTemp = '<dl class="dl_list">'+
			'<dt class="txt_fs16_01"><strong>'+(itemone.joinTy=='E'?itemone.mbrId:itemone.joinTyNm)+'</strong></dt>'+
			'<dd class="txt_fs16_01">'+itemone.regDt10 +' 가입</dd>'+
		'</dl>';
		
		arrTemp.push(sTemp);

		if (itemone.joinTy=='E'){
			existsEroumId = true;
		}
	}

	if (existsEroumId){ 
		$('.evt_search_hp .btn.pw').removeClass('hidden');
	}else{
		$('.evt_search_hp .btn.pw').addClass('hidden');
	}
	
	
	if (result.publicKeyModulus != undefined && requestJson.kind == "receiptId"){//
		postAjaxSearchedPwResult(callerKind, requestJson, result)
	}


	$('.evt_search_hp .itemlist').html(arrTemp.join(''));
}

//패스워드 찾기 ajax 호출
function postAjaxSearchPw(receiptId) {
	var requestJson = {};
	
	requestJson.receiptId = receiptId;
	requestJson.mbrId = $("#findPwFromIdMbrId").val();
	
	callPostAjaxIfFailOnlyMsg(
		'/membership/srchPswd.json',
		requestJson,
		function(result) {
			postAjaxSearchedPwResult('postAjaxSearchPw', requestJson, result);
		}
	);
}

function postAjaxSearchedPwResult(callerKind, requestJson, result){
	if (result == undefined || result.success == undefined || result.success != true || result.publicKeyModulus == undefined){
		$('.pw_search_area').fadeIn(10);
		return;
	}
	
	$('.pw_search_area').fadeOut(100);
	$('.evt_search_cert2').fadeIn(100);
	
	$('.evt_search_cert2 .idnm').html(result.mbrNm + "("+result.mbrId+")" + "님");
	
	$('.evt_search_cert2 input[name="publicKeyExponent"]').val(result.publicKeyExponent);
	$('.evt_search_cert2 input[name="publicKeyModulus"]').val(result.publicKeyModulus);
	$('.evt_search_cert2 input[name="findPwConfirmMbrId"]').val(result.mbrId);
	$('.evt_search_cert2 input[name="findPwConfirmAuthNo"]').val(result.authNo);
	
	
	$('.evt_search_cert2 input[type="password"]').val('')
}

function postAjaxConfirmPwReq() {
	if (!confirm("새로운 비밀번호로 수정하시겠습니까?")){
		return;
	}
	var data = {};
	data.publicKeyExponent = $('.evt_search_cert2 input[name="publicKeyExponent"]').val();
	data.publicKeyModulus = $('.evt_search_cert2 input[name="publicKeyModulus"]').val();
	

	var encPassword = f_rsa_enc($('.evt_search_cert2 #findPwConfirmPw1').val(), data.publicKeyModulus, data.publicKeyExponent)

	console.log(encPassword)

	var requestJson = {};
	requestJson.mbrId = $('.evt_search_cert2 input[name="findPwConfirmMbrId"]').val();
	requestJson.authNo = $('.evt_search_cert2 input[name="findPwConfirmAuthNo"]').val();
	requestJson.encPassword = encPassword;
	
	callPostAjaxIfFailOnlyMsg(
			'/membership/srchPswdConfirm.json',
			requestJson,
			function(result) {
				postAjaxConfirmPwRep('postAjaxConfirmPwReq', requestJson, result);
			}
		);
}
function postAjaxConfirmPwRep(callerKind, requestJson, result) {
	if (result == undefined || result.success == undefined || result.success != true){
		alert("비밀번호를 저장하는 중 오류가 발생하였습니다. 다시 시도해 주십시오.")
		location.reload()
		return;
	}
	
	alert("비밀번호 변경이 완료되었습니다.");
	
	location.href = '/membership/login';
}

$(function(){
	//탭 클릭 이벤트
	$("#menu-srchByTelno").on("click",function(){
		$('#tab-srchIdByTelno').css('display', 'block');
		$('#tab-srchByInfo').css('display', 'none');
	});
	$("#menu-srchByInfo").on("click",function(){
		$('#tab-srchIdByTelno').css('display', 'none');
		$('#tab-srchByInfo').css('display', 'block');
		
		initInputMbrInfo();
	});
	
	//회원정보 라디오버튼 선택 이벤트
	$("input[name=srchTy]").on("change",function() {
		var srchTy = $('input[name=srchTy]:checked').val();
		var inputMbrInfo = $('#mbrInfo');
		inputMbrInfo.val('');
		
		if (srchTy === 'eml') {
			inputMbrInfo.removeClass('keycontrol');
			inputMbrInfo.removeClass('phonenumber');
			inputMbrInfo.attr('placeholder', '가입 시 등록한 이메일을 입력해 주세요');
			
			var target = document.querySelector('#mbrInfo');
			var clone = target.cloneNode(true);
			clone.removeAttribute("maxlength");
			inputMbrInfo.remove();
			document.querySelector('#mbrInfo-error').insertAdjacentElement('beforebegin', clone);
		} else if (srchTy === 'tel') {
			inputMbrInfo.addClass('keycontrol');
			inputMbrInfo.addClass('phonenumber');
			inputMbrInfo.attr('placeholder', '가입 시 등록한 휴대폰번호를 입력해 주세요');
			
			jsCommon.fn_keycontrol();
		}
	});
});
</script>


<script>
	function fn_bootpay_auth_request_cb(receiptId, kind){

		if (kind == 'id'){
			postAjaxSearchId(receiptId);
		}else if (kind == 'pw'){
			postAjaxSearchPw(receiptId);
		}
		
	}

	// 특수문자와 비밀번호 형식 체크 정규식
    const pswdChk = /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/; // 영문, 숫자, 특수문자 포함
    const specialCharChk = /^[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]+$/; // 허용된 특수문자만 사용

    // 비밀번호가 공백이 있는지와 비밀번호가 아이디와 같은지 체크
    $.validator.addMethod("pswdFrmChk", function(value, element) {
        if (value.search(/\s/) != -1) {
            return false; // 공백이 있을 경우 false
        }
        return true; // 공백이 없으면 true
    }, "! 공백은 사용하실 수 없습니다.");
    
 	// 허용된 특수문자만 사용 가능한지 체크
    $.validator.addMethod("specialCharCheck", function(value, element) {
        return specialCharChk.test(value); // 특수문자 정규식을 통과해야 true
    }, "! 특수문자는 ! @ # $ % ^ & * ( ) , . ? \" : { } | < > 만 사용 가능합니다.");

	$('#findPwConfirmFrm')
		.submit(function(e){e.preventDefault();})
		.validate({
			onkeyup: false,
			rules: {
				findPwConfirmPw1: { required: true 
									, minlength : 5 
									, pswdFrmChk: true             // 공백 체크
				                    , regex: pswdChk               // 영문, 숫자, 특수문자 조합 체크
				                    , specialCharCheck: true         // 허용된 특수문자 체크					
				}
				,findPwConfirmPw2: { equalTo : findPwConfirmPw1 }
			},
			messages : {
				findPwConfirmPw1 : {required : "!  패스워드는 필수 입력 항목입니다."
									, minlength : "! 최소 {0}글자이상이어야 합니다"
									, regex: "! 8~16자 영문, 숫자, 특수문자를 조합하여 입력해 주세요."}
				,findPwConfirmPw2 : {equalTo : "비밀번호가 일치하지 않습니다."}
			},
			onfocusout: function(el) { // 추가
				if (!this.checkable(el)){this.element(el); }
			},
			errorPlacement: function(error, element) {
				var group = element.closest('.search-group');
				if (group.length) {
					group.after(error.addClass('text-danger'));
				} else {
					element.after(error.addClass('text-danger'));
				}
			},
			submitHandler: function (frm) {
				
				postAjaxConfirmPwReq();

				return false;
			}
		});
		
	$('#findPwFromIdFrm')
	.submit(function(e){e.preventDefault();})
	.validate({
		onkeyup: false,
		rules: {
			findPwFromIdMbrId: { required: true
								, minlength : 5 
							}
		},
		messages : {
			findPwFromIdMbrId : {required : "!  아이디는 필수 입력 항목입니다."
								, minlength : "! 최소 {0}글자이상이어야 합니다"}
		},
		onfocusout: function(el) { // 추가
			if (!this.checkable(el)){this.element(el); }
		},
		errorPlacement: function(error, element) {
			var group = element.closest('.search-group');
			if (group.length) {
				group.after(error.addClass('text-danger'));
			} else {
				element.after(error.addClass('text-danger'));
			}
		},
		submitHandler: function (frm) {
			
			jsCommon.fn_bootpay_auth_request_call(owner, "${_bootpayScriptKey}", 'pw');

			return false;
		}
	});


	$('#findIdPhoneFrm')
		.submit(function(e){e.preventDefault();})
		.validate({
			onkeyup: false,
			rules: {
				findIdPhoneMbrNm: { required: true
									, rangelength: [2, 10]
								}
				, findIdPhoneMbrTel: { required: true
									, validRegexPhone: "^(010|011)[-\\s]?\\d{3,4}[-\\s]?\\d{4}$" 
								}
			},
			messages : {
				findIdPhoneMbrNm : {required : "! 이름을 입력해 주세요."
									, rangelength: "! 이름은 {0}자이상 {1}자이내로 입력해 주세요."
									}
				, findIdPhoneMbrTel : {required : "! 휴대폰번호를 입력해 주세요."
										,validRegexPhone: "! 010-1234-5678 형식으로 입력해 주세요."
									}
			},
			onfocusout: function(el) { // 추가
				if (!this.checkable(el)){this.element(el); }
			},
			errorPlacement: function(error, element) {
				var group = element.closest('.search-group');
				if (group.length) {
					group.after(error.addClass('text-danger'));
				} else {
					element.after(error.addClass('text-danger'));
				}
			},
			submitHandler: function (frm) {
				$('.id_search_area').fadeOut(100);
				postAjaxSearchId(null, $("#findIdPhoneMbrNm").val(), null, $("#findIdPhoneMbrTel").val());
				return false;
			}
		});
		
								
								
	$('#findIdEmailFrm')
		.submit(function(e){e.preventDefault();})
		.validate({
			onkeyup: false,
			rules: {
				findIdEmailMbrNm: { required: true 
									, rangelength: [2, 10]}
				, findIdEmailEmail: { required: true 
									, validRegexEmail : "^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
				}
			},
			messages : { 
				findIdEmailMbrNm : {required : "! 이름을 입력해 주세요."
									, rangelength: "! 이름은 {0}자이상 {1}자이내로 입력해 주세요."}
				, findIdEmailEmail : {
										required : "! 이메일을 입력해 주세요."
										, validRegexEmail : "! abc@email.com 형식으로 입력해 주세요."
									}
			},
			onfocusout: function(el) { // 추가
				if (!this.checkable(el)){this.element(el); }
			},
			errorPlacement: function(error, element) {
				var group = element.closest('.search-group');
				if (group.length) {
					group.after(error.addClass('text-danger'));
				} else {
					element.after(error.addClass('text-danger'));
				}
			},
			submitHandler: function (frm) {
				$('.id_search_area').fadeOut(100);
				postAjaxSearchId(null, $("#findIdEmailMbrNm").val(), $("#findIdEmailEmail").val(), null);
				return false;
			}
		});
	
</script>


<!--js추가-->

<script>
	var owner = this;
	$(function(){

		if (location.href.indexOf('#tab-search2')>=0){
			document.getElementById("tab-header-pw").click()
		}

		//아이디 찾기
		//초기화
		$('.id_search_area .form-check [type="radio"]:checked').parent('.form-check').next('.chk_area').addClass('active');

		//radio tab
		$('.id_search_area .form-check [type="radio"]').click(function(){
			var thisId = $(this).attr('id');
			$('.id_search_area .chk_area').removeClass('active');
			$('.id_search_area .chk_area.' + thisId).addClass('active');
		});

		$('.evt_search_hp .btn.pw').click(function(){
			var publicKeyModulus = $('.evt_search_cert2 input[name="publicKeyModulus"]').val();
			if (publicKeyModulus != undefined && publicKeyModulus.length > 10){
				$('.pw_search_area').fadeOut(100);
				$('.evt_search_cert2').fadeIn(100);

				timerId = setTimeout(timer_timeout, 5 * 60 * 1000);
			}
			
			document.getElementById("tab-header-pw").click()
		});

		$('.evt_search_hp .btn.login').click(function(){
			location.href = '/membership/login';
		});

		//아이디 찾기 - 등록한 휴대폰 번호로 찾기
		$('button[title="evt_search_hp"]').click(function(){

			// $('.id_search_area').fadeOut(100);
			// $('.evt_search_hp').fadeIn(100);
			$('#findIdPhoneFrm').submit();

		});
		$('button[title="evt_search_email"]').click(function(){
			$('#findIdEmailFrm').submit();
		});
		 

		//아이디 찾기 - 본인인증으로 찾기
		$('button[title="evt_search_cert"]').click(function(){
			jsCommon.fn_bootpay_auth_request_call(owner, "${_bootpayScriptKey}", 'id');
			// $('.id_search_area').fadeOut(100);
			// $('.evt_search_cert').fadeIn(100);

		});

		//비밀번호 찾기 - 본인인증
		$('button[title="evt_search_cert2"]').click(function(){
			$('#findPwFromIdFrm').submit();
			
		});
		
		$('button[title="evt_confirm_pw"]').click(function(){
			$('#findPwConfirmFrm').submit();
			
		});
		
		
		//뒤로 가기버튼(임시)
		$('.evt_back').each(function(){

			$(this).css({
				'background':'#f00',
				'font-weight':'900',
				'color':'#fff',
				'cursor':'pointer'
			});

			$(this).click(function(){
				$('[class*="evt_search_"]').hide();
				$('[class*="_search_area"]').show();
			});

			
		});

	});

	function timer_timeout(){
		clearTimeout(timerId);
		alert("인증 유효시간이 지났습니다.\n인증을 다시 진행해 주세요.");

		location.reload();
	}
</script>
