<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/html/core/vendor/rsa/RSA.min.js" /></script>

<main id="container">
	<header id="page-title">
		<h2>
			<span>회원가입</span> <small>Member Join</small>
		</h2>
	</header>

	<div id="page-content">
		<div class="member-join">
			<div class="member-join-sidebar">
				<p class="text">
					<span>STEP 1</span>
				</p>
			</div>

			<div class="member-join-step2">
				<img src="/html/page/members/assets/images/txt-join-number2.svg" alt="STEP 2">
			</div>

			<form:form action="./registAction${locationSearch}" class="member-join-content" id="frmReg" name="frmReg" method="post" modelAttribute="mbrVO" enctype="multipart/form-data">
				<form:hidden path="crud" />
				<input type="hidden" id="termsYn" name="termsYn" value="${mbrAgreementVO.termsYn}" />
				<input type="hidden" id="termsDt" name="termsDt" value="<fmt:formatDate value="${mbrAgreementVO.termsDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" id="privacyYn" name="privacyYn" value="${mbrAgreementVO.privacyYn}" />
				<input type="hidden" id="privacyDt" name="privacyDt" value="<fmt:formatDate value="${mbrAgreementVO.privacyDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" id="marketingReceptionYn" name="marketingReceptionYn" value="${mbrAgreementVO.marketingReceptionYn}" />
				<input type="hidden" id="marketingReceptionDt" name="marketingReceptionDt" value="<fmt:formatDate value="${mbrAgreementVO.marketingReceptionDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" id="nightReceptionYn" name="nightReceptionYn" value="${mbrAgreementVO.nightReceptionYn}" />
				<input type="hidden" id="nightReceptionDt" name="nightReceptionDt" value="<fmt:formatDate value="${mbrAgreementVO.nightReceptionDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" name="certificatedString" value="${certificatedString}" />
				<input type="hidden" name="returnUrl" value="${param.returnUrl}" />
				<input type="hidden" name="brdt10" value='<fmt:formatDate value="${noMbrVO.brdt}" pattern="yyyy-MM-dd" />' />
				<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}">
				<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}">
				<input type="hidden" id="encPw" name="encPw" value="">
				
				<double-submit:preventer tokenKey="preventTokenKey" />

				<ul class="member-tabs mb-5.5 xs:mb-11">
					<li><span>약관동의 및 본인인증</span></li>
					<li><a href="#" class="active">정보입력</a></li>
					<li><span>가입완료</span></li>
				</ul>

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
							<th scope="row"><p>이름</p></th>
							<td><p class="text-base font-bold md:text-lg" id="mbrNm">${noMbrVO.mbrNm}</p></td>
						</tr>
						<tr>
							<th scope="row"><p>생년월일</p></th>
							<td><p class="text-base font-bold md:text-lg" id="brdt">
									<fmt:formatDate value="${noMbrVO.brdt}" pattern="yyyy년 MM월 dd일" />
								</p></td>
						</tr>
						<tr>
							<th scope="row"><p>성별</p></th>
							<td><p class="text-base font-bold md:text-lg" id="gender">${genderCode[noMbrVO.gender]}</p></td>
						</tr>
						<tr>
							<th scope="row"><p>휴대폰 번호</p></th>
							<td><p class="text-base font-bold md:text-lg" id="mblTelno">${noMbrVO.mblTelno}</p></td>
						</tr>
						<tr>
							<th scope="row">
								<p>
									<label for="join-item1">아이디<sup class="text-danger text-base md:text-lg">*</sup></label>
								</p>
							</th>
							<td><form:input class="form-control w-full" path="mbrId" maxlength="15" /></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>
								<p class="text-sm">
									6~15자 영문,숫자를 조합하여 입력해 주세요
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<p>
									<label for="join-item1-2">비밀번호<sup class="text-danger text-base md:text-lg">*</sup></label>
								</p>
							</th>
							<td><form:input type="password" class="form-control w-full" path="pswd" maxlength="16"/></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>
								<p class="text-sm">
									띄어쓰기 없이 8~16자 영문, 숫자, 특수문자를 조합하여 입력해주세요 (특수문자는 !,@,#,$,%,^,&,*만 사용 가능)
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<p>
									<label for="join-item1-3">비밀번호 확인<sup class="text-danger text-base md:text-lg">*</sup></label>
								</p>
							</th>
							<td><input type="password" class="form-control w-full" id="pswdConfirm" name="pswdConfirm" maxlength="16"></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>
								<p class="text-sm">
									비밀번호 확인을 위해 다시 한번 입력해주세요
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				</br>
				

				<div class="content-button mt-25">
					<button type="submit" class="btn btn-primary btn-large flex-1">가입하기</button>
					<a href="membership/login" class="btn btn-outline-primary btn-large w-[37.5%]">취소</a>
				</div>
			</form:form>

			<div class="member-join-sidebar is-step2">
				<p class="text">
					<span>STEP 3</span>
				</p>
			</div>
		</div>
	</div>


</main>

<script>
var recipientMaxCount = 4;
var createdForm = 1;
var currentRecipientNo = '';

//사진 실시간 변경
function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	    $(expression).attr('src', e.target.result);
	  }
	  reader.readAsDataURL(input.files[0]);
	  }

}

//수급자 검사 폼 띄우기 버튼 클릭
function showRecipientModal(target) {
	var relationCd = $(target).parent().parent().find('#relationCds option:selected').val();
	var relationText = $(target).parent().parent().find('#relationCds option:selected').text();
	var recipientsNm = $(target).parent().parent().find('#recipientsNms').val();
	var lnoYn = $(target).parent().parent().find('input[type=radio]:checked').val();
	var rcperRcognNo = $(target).parent().parent().find('#rcperRcognNos').val();
	
	if (!relationCd || !recipientsNm) {
		alert('수급자 정보를 작성하세요')
		return false;
	}
	if (lnoYn === 'Y' && !rcperRcognNo) {
		alert('요양인정번호를 작성하세요')
		return false;
	}
	
	//수급자 관계가 본인인 경우 회원이름과 동일해야 한다.
	var mbrNm = $('#mbrNm').text();
	if (relationCd === '007' && mbrNm !== recipientsNm) {
		alert('수급자와의 관계를 확인해주세요')
		return false;
	}
	
	//배우자와 본인은 1명만 존재해야한다.
	var me = 0;
	var spouse = 0;
	var relationCdSelectList = $('.relationCds option:selected');
	for (var i = 0; i < relationCdSelectList.length; i++) {
		var checkRelationCd = relationCdSelectList[i].value;
		
		switch(checkRelationCd) {
			case '007': me++; break;
			case '001': spouse++; break;
		}
		
		if (me > 1) {
			alert('본인은 한명만 등록이 가능합니다.');
			return false;
		} else if (spouse > 1) {
			alert('배우자는 한명만 등록이 가능합니다.');
			return false;
		}
	}
	
	
	$('#modal-recipient-relation').text(relationText);
	$('#modal-recipient-nm').text(recipientsNm);
	$('#modal-recipient-lno').text('L' + rcperRcognNo);
	
	if (lnoYn === 'Y') {
		$('#modal-lno-field').css('display', 'flex');
		$('#modal-info-field').css('display', 'none');
	} else {
		$('#modal-lno-field').css('display', 'none');
		$('#modal-info-field').css('display', 'flex');
	}
	
	$('.modal').modal('show');
	
	recipientNumber = $(target).parent().parent().find('.recipient-num').text();
	currentRecipientNo = recipientNumber;
}

//요양인정번호 있음, 없음으로 L번호 입력 막기 처리
function ChangeRecipientLnoRadioBtn(target) {
	var lnoYn = target.value;
	
	if (lnoYn === 'Y') {
		$(target).closest('td').find('.form-group').css('display', 'inline-flex');
	} else {
		$(target).closest('td').find('.form-group').css('display', 'none');
	}
}



$(function(){
	
	const idchk = /^[a-zA-Z][A-Za-z0-9]{5,14}$/;
	const pswdChk = /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+*=*]).*$/;
	const emailchk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const telchk = /^([0-9]{2,3})?-([0-9]{3,4})?-([0-9]{3,4})$/;
	
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

	// 한글 변환
	$(".money").text(viewKorean("${mbrVO.recipterInfo.bnefBlce}"));

	//체크 박스 값
	$("#smsRcptnYn1,#emlRcptnYn1,#telRecptnYn1").on("click",function(){
		!$(this).is(":checked") ? $(this).val("N") : $(this).val("Y");
	})

	//전체 수신
	$("#allChk").on("click",function(){
		$("#allChk").is(":checked") ? $(".agree").prop("checked",true) : $(".agree").prop("checked",false)
				
		$('#smsRcptnDt').attr('value', dateFormat(new Date()));
		$('#emlRcptnDt').attr('value', dateFormat(new Date()));
		$('#telRecptnDt').attr('value', dateFormat(new Date()));
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


	// 동의 체크
	$.validator.addMethod("agreeChk", function(value, element, regexpr) {
		if($("#recipterYn1").is(":checked")){
			if($("#agree-item").is(":checked")){
				return true;
			}else{
				alert("장기요양등급 정보 사용에 동의해주세요");
				return false;
			}
		}else{
			return true;
		}
	}, "! 형식이 올바르지 않습니다.");

	$.validator.addMethod("notEqual", function(value, element, param) {
		  if($("#mbrId").val() === $("#rcmdtnId").val()){
			  return false;
		  }else{
			  return true;
		  }
	}, "! 본인 아이디는 추천 할 수 없습니다.");

	$.validator.addMethod("pswdFrmChk", function(value, element, param) {
		if(value.search(/\s/) != -1){
			return false;
		}else{
			if(value == $("#mbrId").val()){
				return false;
			}else{
				return true;
			}
		}
	}, "! 공백 및 아이디와 똑같은 비밀번호는 사용하실 수 없습니다.");

	const f_rsa_enc = function(v, rpkm, rpke) {
		let rsa = new RSAKey();
		rsa.setPublic(rpkm,rpke);
		return rsa.encrypt(v);
	}

	//회원가입 유효성
	$("form#frmReg").validate({
	    ignore: "input[type='text']:hidden",
	    rules : {
	    	mbrId : {required : true , regex : idchk, remote:"/market/mbr/mbrIdChk.json"}
	    	, pswd : {required : true, regex : pswdChk, minlength : 8, pswdFrmChk : true}
	    	, pswdConfirm : {required : true, equalTo : "#pswd", regex : pswdChk, minlength : 8}
			, rcmdtnId : {regex : idchk, notEqual : "#mbrId"}
			, telno : {regex : telchk}
			, agreeItem : {agreeChk : true}
			, recipter : {repChk : true}
			, rcperRcognNo : {repChk : true, searchChk : true}
			//, rcognGrad : {gradChk : true}
			//, selfBndRt : {selfChk : true}
	    },
	    messages : {
	    	mbrId : {required : "! 아이디를 입력해 주세요" , regex : "! 6~15자 영문,숫자를 조합하여 입력해 주세요", remote:"! 사용할수 없는 아이디 입니다"}
	    	, pswd : {required : "! 비밀번호는 필수 입력 항목입니다.", minlength : "! 비밀번호는 최소 8자리 입니다."}
	    	, pswdConfirm : {required : "! 비밀번호 확인은 필수 입력 항목입니다.", equalTo : "! 비밀번호가 같지 않습니다.", regex : "! 비밀번호는 영문자, 숫자, 특수문자 조합을 입력해야 합니다.", minlength : "! 비밀번호는 최소 8 자리입니다." }
			, rcmdtnId : {regex : "! 6~15자 영문, 숫자를 조합하여 입력해주세요"}
			, telno : {regex : "! 전화번호 형식이 잘못되었습니다.\n(000-0000-0000)"}
			, agreeItem : {agreeChk : ""}
			, recipter : {repChk : "! 수급자 성명은 필수 입력 항목입니다."}
			, rcperRcognNo : {repChk : "! 요양인정번호는 필수 입력 항목입니다.", searchChk : "! 수급자 조회는 필수 선택 항목입니다."}
	    },
	    onfocusout: function(el) { // 추가
            if (!this.checkable(el)){this.element(el); }
        },
	    errorPlacement: function(error, element) {
		    var group = element.closest('.form-group, .form-check');
		    if (group.length) {
		        group.after(error.addClass('text-danger'));
		    } else {
		        element.after(error.addClass('text-danger'));
		    }
		},
	    submitHandler: function (frm) {
	    	var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
			var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
			var encPassword = f_rsa_enc(document.getElementById("pswd").value, rsaPublicKeyModulus, rsaPublicKeyExponent);
	    	
			$("input[name='pswd']").val(encPassword)
			$("input[name='pswdConfirm']").val(encPassword)
			
   			frm.submit();
	    }
	});
});
</script>