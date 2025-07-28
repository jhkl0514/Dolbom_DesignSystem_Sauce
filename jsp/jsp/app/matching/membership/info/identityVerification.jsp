<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
		
	    <!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
	
		<main>
	      <section id="mbrInfoSection" class="intro">
	
	        <h3 id="verificationTitle" class="title">
	            휴대폰 번호를<br>입력해주세요
	        </h3>
	
	        <div class="h32"></div>
	        <form>
	
				<div id="mobileDiv">
		            <label class="input_label">휴대폰 번호</label>
		            <input id="inputMobile" type="text" inputmode="numeric" class="input_basic keycontrol phonenumber bder_danger" placeholder="010-1234-5678" onkeydown="return inputKeydown(event, 'mobile');" oninput="inputEvent('mobile');">
		            <div id="mobileErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
		
		            <div class="h20"></div>
	            </div>
	
				<div id="carrierDiv">
		            <label class="input_label">통신사</label>
		            <a id="atagCarrier" class="input_basic fake_select modal-trigger broad_evt bder_danger" href="#modal_broad">SKT</a>
					<div id="carrierErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
		
		            <div class="h20"></div>
	            </div>
	
				<div id="residentNumDiv">
		            <label class="input_label">주민등록번호</label>
		            <div class="d-flex gap08">
		              <input id="inputResidentNumFront" type="text" inputmode="numeric" class="input_basic keycontrol numberonly bder_danger" placeholder="900101" maxlength="6" onkeydown="return inputKeydown(event, 'residentNum');" oninput="inputEvent('residentNumFront');">
		              <div class="align_center">-</div>
		              <div class="input_basic input_password bder_danger">
		               	<input id="inputResidentNumBack" type="text" inputmode="numeric" class="input_noClass keycontrol numberonly" maxlength="1" onkeydown="return inputKeydown(event, 'residentNum');" oninput="inputEvent('residentNumBack');">
		               	<div class="img_password"></div>
		              </div>
		              
		            </div>
		            <div id="residentNumErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
		
		            <div class="h20"></div>
	            </div>
	
				<div>
		            <label class="input_label">이름</label>
		            <input id="inputName" type="text" class="input_basic bder_danger" onkeydown="return inputKeydown(event, 'name');" oninput="inputEvent('name');">
		            <div id="nameErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
				</div>
	
	        </form>
	
	
	      </section>
	      
	      <section id="smsCheckSection" class="intro">
	      	  <h3 class="title">
		      	문자로 받은<br>인증번호 6자리를 입력해주세요
		      </h3>
		      
		      <div class="h32"></div>
		      <form>
		      	<label class="input_label">인증번호</label>
	          	<div class="relative">
	            
	            	<div class="input_basic bder_primary">
		              	<input id="inputOtp" type="text" inputmode="numeric" class="input_noClass keycontrol numberonly" maxlength="6" onkeydown="return inputKeydownSms(event);" oninput="inputEventSms();">
		              	<span id="timeTextSpan" class="cert_time">02:59</span>
	            	</div>
	          	</div>
	
	          	<div id="smsErrorMsg" class="vaild_txt error">인증번호를 다시 확인해주세요</div>
	
	          	<div class="h08"></div>
	          	<div id="smsResendDiv" class="l_right disNone">
		            <a class="waves-effect btn btn_cancel" onclick="clickSmsResendBtn();">인증번호 재전송</a>
	          	</div>
		       </form>

	      </section>
	    </main>
	
	    <footer class="page-footer">
	
	      <div class="btn_area d-flex f-column">
	
	        <div class="relative">
				<div class="tool_tip t_center disNone identityVerification">
					<div class="center">
						어르신에게 문자를 발송합니다<br>
						<span class="font_sbsr">(동의 유효시간 10분)</span>
					</div>
				</div>

	        	<a id="nextBtn" class="waves-effect btn-large btn_primary w100p modal-trigger" onclick="clickNextBtn();" disabled>다음</a>
	        	<a id="verifyBtn" class="waves-effect btn-large btn_primary w100p modal-trigger" onclick="clickVerifyBtn();">본인인증하기</a>
	        </div>
	      </div>
	
	
	    </footer>
	    
	    
	    <!-- 통신사 선택 바텀 시트 -->
	    <div id="modal_broad" class="modal bottom-sheet">
	
	      <div class="modal_header">
	        <h4 class="modal_title">통신사를 선택해주세요</h4>
	        <div class="close_x modal-close waves-effect"></div>
	      </div>
	
	      <div class="modal-content">
	
	
	        <ul class="broad_area">
	        	<c:forEach var="carrierMap" items="${carrierCd}" varStatus="status">
	        		<li class="modal-close <c:if test="${ status.index == 0 }">active</c:if>" code="${ carrierMap.value }">${ carrierMap.key }</li>
		   		</c:forEach>
	        </ul>
	
	      </div>
	
	    </div>
	
	
		<!-- 약관 동의 바텀 시트 -->
		<div id="modal_memConsent" class="modal bottom-sheet">

	      <div class="modal_header">
	        <h4 id="modal_memConsent_title" class="modal_title"></h4>
	        <div class="close_x modal-close waves-effect"></div>
	      </div>
	
	      <div class="modal-content">
	
	        <input type="checkbox" name="" id="chk_join_t" class="chk02 large border_gray total_evt">
	        <label for="chk_join_t" class="fw600">전체 동의하기</label>
	
	        <div class="h12"></div>
	
	        <div class="scrollBox">
	
	          <div id="div_danal1" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('danal1')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree01" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree01">[필수] 휴대폰본인인증서비스 개인정보이용동의</label>
	            </div>
	          </div>
	          <div id="div_danal2" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('danal2')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree02" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree02">[필수] 휴대폰본인인증서비스 고유식별정보처리동의</label>
	            </div>
	          </div>
	          <div id="div_danal3" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('danal3')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree03" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree03">[필수] 휴대폰본인인증서비스 서비스이용약관동의</label>
	            </div>
	          </div>
	          <div id="div_danal4" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('danal4')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree04" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree04">[필수] 휴대폰본인인증서비스 통신사이용약관동의</label>
	            </div>
	          </div>
	          <div id="div_danal5" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('danal5')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree05" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree05">[필수] 휴대폰본인인증서비스 제3자정보제공약관동의</label>
	            </div>
	          </div>
	          
	          <!-- 회원가입이 아닐 때는 노출되지 않음 -->
	          <c:if test="${type eq 'regist'}">
	          <div id="div_terms" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('terms')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree06" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree06">[필수] 통합 서비스 이용약관</label>
	            </div>
	          </div>
	          <div id="div_privacy" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('privacyuse')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree07" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree07">[필수] 개인정보 수집 이용 동의</label>
	            </div>
	          </div>
	          <div id="div_age" class="group_chk_area">
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree08" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree08">[필수] 만 14세 이상입니다</label>
	            </div>
	          </div>
	          <div id="div_marketing" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('marketing')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree09" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree09">[선택] 이벤트 및 마케팅 정보 수신 동의</label>
	            </div>
	          </div>
	          <div id="div_night" class="group_chk_area">
	            <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('night')"></span>
	            <div>
	              <input type="checkbox" name="check-agree" id="checkAgree10" class="chk01_2 large total_evt_sub">
	              <label for="checkAgree10">[선택] 야간 혜택 수신 동의</label>
	            </div>
	          </div>
			  </c:if>
	
	          <div class="h20"></div>
	
	
	        </div>
	        <!-- scrollBox -->
	
	      </div>
	      <!-- modal-content -->
	      <div class="modal-footer">
	        <div class="btn_area d-flex">
	          <a id="agreementConfirmBtn" class="waves-effect btn btn-large w100p btn_primary" onclick="clickAgreementConfirm();">확인</a>
	        </div>
	      </div>
	
	    </div>
	    <!-- 약간동의 바텀 시트 끝 -->
	    
	    
	    <!-- 약간동의 상세 -->
	    <jsp:include page="/WEB-INF/jsp/app/matching/common/modal/agreementDetailModal.jsp" />
	    
	</div>
	
	
	<script>
		var afterWorkType = '${type}';   //본인인증 후 다음 작업
		var termsHisList = [   //이용약관 버전 리스트
			<c:forEach var="termsInfo" items="${termsHisList}" varStatus="status">
			{
	   			'termsNo': '${termsInfo.termsNo}',
	   			'termsDt': '${termsInfo.termsDt}',
			},
	   		</c:forEach>
		];
		var privacyHisList = [   //개인정보 버전 리스트
			<c:forEach var="privacyInfo" items="${privacyHisList}" varStatus="status">
	   		{
	   			'termsNo': '${privacyInfo.termsNo}',
	   			'termsDt': '${privacyInfo.termsDt}',
	   		},
	   		</c:forEach>
		];
		var marketingHisList = [   //마켓팅 정보 버전 리스트
			<c:forEach var="marketingInfo" items="${marketingHisList}" varStatus="status">
	   		{
	   			'termsNo': '${marketingInfo.termsNo}',
	   			'termsDt': '${marketingInfo.termsDt}',
	   		},
	   		</c:forEach>
		];
		var nightHisList = [   //야간 혜택 정보 버전 리스트
			<c:forEach var="nightInfo" items="${nightHisList}" varStatus="status">
	   		{
	   			'termsNo': '${nightInfo.termsNo}',
	   			'termsDt': '${nightInfo.termsDt}',
	   		},
	   		</c:forEach>
		];
		
		//약관 필수체크 대상 정의용
		var checkAgreeArr = []; 
		
		var receiptId = '';
		var phase = '';  //현재 어디 입력중인지 체크용
		var verificationInfo = {};
		var mbrAgreementInfo = {};
		var maxSmsSec = 180;  //문자인증 시간
		var remainingSec = 0; //문자인증 남은 시간
		var timer;
		
		//정규식
		var namechk = /^[ㄱ-ㅎ|가-힣]+$/;
		var phonechk = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			
		
		//UI 초기화
		function initialize() {
			phase = 'name';
			
			initializeAgreementModalTitle();
			
			if (isDelegatingToElderly()){
				maxSmsSec = 10 * 60;
				$(".tool_tip.identityVerification").removeClass("disNone");
				$("#verifyBtn").html("어르신 위임 동의 요청")
			}else{
				maxSmsSec = 3 * 60;
				$(".tool_tip.identityVerification").addClass("disNone");
				$("#verifyBtn").html("본인인증하기");
			}
			
			
			//사용자정보 입력 UI 표출
			$('#mbrInfoSection').removeClass("disNone");
			$('.page-footer').removeClass("disNone");
			$('#smsCheckSection').addClass("disNone");
			
			var inputName = $('#inputName');
			var inputResidentNumFront = $('#inputResidentNumFront');
			var inputResidentNumBack = $('#inputResidentNumBack');
			//주민번호 뒷자리는 부모의 테두리를 변경해야 한다(유효성 검사 시)
			var inputResidentBackParent = inputResidentNumBack.parent();
			var atagCarrier = $('#atagCarrier');
			var inputMobile = $('#inputMobile');
			
			var stemp1, stemp2, stemp3;
			stemp1 = "${recipientsNm}";
			if (stemp1.length > 0 && stemp1.length < 20 && namechk.test(stemp1)){
				inputName.val(stemp1);
				inputName.attr("disabled", "true");
				phase = 'residentNum';
			}else{
				inputName.val('');
			}

			var verifyResidentNum = false;
			stemp1 = '${recipientsBrDt}';
			stemp3 = '${recipientsGender}';
			if (phase != 'name' && stemp1.length > 0 && stemp3.length > 0 && (stemp3=='M' || stemp3=='W')){
				phase = 'carrier';
				if (stemp1.length == 8) {
					stemp2 = stemp1.substring(0, 2);
					stemp1 = stemp1.substring(2, 8);
				}
				
				if (this.validateResidentNum6Check(stemp1)){
					inputResidentNumFront.val(stemp1);

					if (stemp2 < '20'){
						inputResidentNumBack.val(stemp3=='M'?"1":"2");
					}else{
						inputResidentNumBack.val(stemp3=='M'?"3":"4");
					}
					
					verifyResidentNum = true;
				}
				
			}

			if (verifyResidentNum){
				inputResidentNumFront.attr("disabled", "true");
				inputResidentNumBack.attr("disabled", "true");
				$('#residentNumDiv').removeClass('disNone');
				$('#carrierDiv').removeClass('disNone');
			}else{
				inputResidentNumFront.val('');
				inputResidentNumBack.val('');
				$('#residentNumDiv').addClass('disNone');
				$('#carrierDiv').addClass('disNone');
			}
			
			atagCarrier.text('통신사');
			inputMobile.val('');

			showUiForPhase(phase, false);
			
			//유효성 효과 끄기
			inputName.removeClass('bder_danger');
			inputResidentNumFront.removeClass('bder_danger');
			inputResidentBackParent.removeClass('bder_danger');
			atagCarrier.removeClass('bder_danger');
			inputMobile.removeClass('bder_danger');
			
			
			$('#mobileErrorMsg').addClass('disNone');
			$('#carrierErrorMsg').addClass('disNone');
			$('#residentNumErrorMsg').addClass('disNone');
			$('#nameErrorMsg').addClass('disNone');
			
			$('#mobileDiv').addClass('disNone');
			
			$('#nextBtn').removeClass('disNone');
			$('#verifyBtn').addClass('disNone');
			
			if (phase == 'carrier'){
				atagCarrier.focus();
			}else{
				inputName.focus();
			}
		}
		
		function initializeAgreementModalTitle() {
			if (isDelegatingToElderly()) {
				$('#modal_memConsent_title').text('어르신 위임을 위해 동의가 필요해요');
			} else {
				$('#modal_memConsent_title').text('인증을 위해 동의가 필요해요');
			}
		}
		
		//다음버튼 클릭
		function clickNextBtn() {
			validateByPhase(phase);
		}
		
		//본인인증 요청
		function requestVerification() {
			var today = new Date();
            var myYear = Number(verificationInfo.identityNo.substr(0, 2));
            var div = Number(verificationInfo.identityNo.substr(6));  //3과 4는 2000년대 생
            var calBirth = div >= 3 ? 2000 + myYear : 1900 + myYear;
            var age = today.getFullYear() - calBirth;
            if (age < 14) {
                showAlertPopup('14세 이상만 가입 가능합니다.');    
                return;
            }
			
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/info/requestVerification',
				verificationInfo,
				function(result) {
					receiptId = result.receiptId;
					showSmsCheckUi(false);
				}
			);
		}
		
		//본인인증 OTP 재전송
		function realarmVerification() {
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/info/realarmVerification',
				{receiptId},
				function(result) {
					//재전송 완료 시 재전송 버튼 다시 숨김
					$('#smsResendDiv').addClass('disNone');
				}
			);
		}
		
		//본인인증 확인(유효성검사까지 추가)
		function confirmVerification() {
			const otpNum = $('#inputOtp').val();
			const smsErrorMsg = $('#smsErrorMsg');
			
			if (remainingSec <= 0) {
				smsErrorMsg.removeClass("disNone");
				smsErrorMsg.text('인증문자가 만료되었어요');
				return;
			}
			else if (!otpNum || otpNum.length !== 6) {
				smsErrorMsg.removeClass("disNone");
				smsErrorMsg.text('인증번호를 확인해주세요');
				return;
			}
			else {
				smsErrorMsg.addClass("disNone");
			}
			
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/info/confirmVerification',
				{receiptId, otpNum},
				function(result) {
					if (!result.confirm) {
						$('#smsErrorMsg').removeClass('disNone');
						$('#smsErrorMsg').text('인증번호를 확인해주세요');
						$('#inputOtp').parent().addClass('bder_danger');
						return;
					}
					
					//인증후 후처리
					if (afterWorkType === 'regist') {
						//회원가입
						registMbr();
					} else if (afterWorkType === 'mypage') {
						//내정보 이름, 번호 수정
						updateMbrInfo();
					} else if (afterWorkType === 'integrated') {
						//통합회원 전환
						integratedMbr();
					} else if (afterWorkType === 'recipientVerification') {
						//어르신 등록
						updateRecipientVerification(receiptId);
					} else if (afterWorkType === 'rcperRcognNoRegist') {
						updateVerificationForResistLNumber(receiptId);
					}
				}
			);
		}

		//어르신 인증완료
		function updateRecipientVerification(receiptId){

			var data = {  "receiptId" : receiptId
						, "recipientsNo" : "${recipientsNo}"
						, "recipientsNm" :  "${recipientsNm}"
						, "recipientsBrDt" : "${recipientsBrDt}"
						, "recipientsGender" : "${recipientsGender}"
						, "recipientsRelationCd" : "${recipientsRelationCd}"
					};


			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/recipients/updateMbrRecipientVerification.json', 
				data,
				function(result) {
					clearHistoryStack();
					location.href = "/matching/common/complete?msg=서비스 이용에 대한<br>어르신 동의를 받았어요.&redirectUrl=/matching/membership/recipients/detail?recipientsNo=${recipientsNo}";
				}
			);
		}
		
		function updateVerificationForResistLNumber(receiptId) {
			const numFront = $('#inputResidentNumFront').val();
			const numBack = $('#inputResidentNumBack').val();
			const residentNum = (numBack == "1" || numBack == "2") ? "19" + numFront : "20" + numFront;

			var data = {  "receiptId" : receiptId
						, "recipientsNo" : "${recipientsNo}"
						, "recipientsNm" : $('#inputName').val()
						, "recipientsBrDt" : residentNum
						, "recipientsGender" : "${recipientsGender}"
						, "recipientsRelationCd" : "${recipientsRelationCd}"
					};

			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/recipients/updateMbrRecipientVerification.json', 
				data,
				function(result) {
					clearHistoryStack();
					location.href = "/matching/common/complete?msg=서비스 이용에 대한<br>어르신 동의를 받았어요.&redirectUrl=/matching/membership/recipients/rcperRcognNoRegist?recipientsNo=${recipientsNo}";
				}
			);
		}
	
		//회원가입
		function registMbr() {
			nextLocationAfterFail = '/matching/kakao/login';

			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/regist.json', 
				{
					termsYn : "Y",
					privacyYn : "Y",
					marketingReceptionYn : (checkedIds.findIndex(f => f === 'checkAgree09') === -1) ? 'N' : 'Y',
					nightReceptionYn : (checkedIds.findIndex(f => f === 'checkAgree10') === -1) ? 'N' : 'Y',
					mbrJoinTempNo : "${param.mbrJoinTempNo}"
				},
				function(result) {
					//에어브릿지 회원가입 이벤트
					if (result.customMap.uniqueId) {
						airbridge.setUserId(result.customMap.uniqueId);
						airbridge.events.send('airbridge.user.signup', {label: result.customMap.joinTy});

						var param = {"eventName":"airbridge.user.signup", "label": result.customMap.joinTy};
        				callPostAjaxIfFailOnlyMsg("/advertising/events/send.json", param, function(result) {});
					}
					
		            //에어브릿지 이벤트 인식 문제로 delay
					setTimeout(function() {
						location.href = result.customMap.location; 
					}, 300);
				},
				// {
				// 	contentType: "application/json",
				// }
			);
		}
		
		//내정보 이름, 번호 수정
		function updateMbrInfo() {
			nextLocationAfterFail = '/matching/membership/info/setting/mypage';
			
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/info/setting/updateMbrInfo.json', 
				{},
				function(result) {
					location.href = '/matching/membership/info/setting/mypage';
				}
			);
		}
		
		
		//통합회원 전환
		function integratedMbr() {
			nextLocationAfterFail = '/matching/kakao/login';
			
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/integrated.json', 
				{},
				function(result) {
					location.href = "/matching/common/complete?msg=통합회원 전환이<br>완료되었어요&redirectUrl=/matching/main/service";
				}
			);
		}
		
		
		
		//키입력 이벤트
		function inputKeydown(e, inputType) {
			if (e.key === 'Enter') {
				validateByPhase(inputType);
				return false;
			} else if (e.key === 'Tab') {
				validateByPhase(inputType);
				return true;
			} else {
				return true;
			}
		}
		
		
		//단계에 따른 유효성 검사
		function validateByPhase(inputPhase) {
			//이름 인풋창 엔터
			if (inputPhase === 'name') {
				validateName();
			}
			//주민번호 인풋창 엔터
			if (inputPhase === 'residentNum') {
				validateResidentNum();
			}
			//휴대폰 번호 인풋창 엔터
			if (inputPhase === 'mobile') {
				var mobileVaild = validateMobile();
				if (mobileVaild) {
					clickVerifyBtn();
				}
			}
		}
		
		
		//이름 유효성 검사
		function validateName(noShowPhase) {
			var isValid = true;
			var inputName = $('#inputName');
			var name = inputName.val();
			
			if (!name) {
				$('#nameErrorMsg').text('이름을 입력해주세요');
				isValid = false;
			}
			else if (!namechk.test(name)) {
				$('#nameErrorMsg').text('한글만 입력해주세요');
				isValid = false;
			} else if (isDelegatingToElderly() && "${recipientsRelationCd}" != '007' && name == "${mbrNm}") {
				showAlertPopup('어르신 정보가 본인의 정보와 동일합니다. 어르신의 정보를 입력해주세요.');
				$('#nameErrorMsg').text('이름을 확인해주세요');
				isValid = false;
			}
			
			if (isValid) {
				inputName.removeClass('bder_danger');
				$('#nameErrorMsg').addClass('disNone');
				phase = 'residentNum';
			} else {
				inputName.addClass('bder_danger');
				$('#nameErrorMsg').removeClass('disNone');
				phase = 'name';
			}
			
			var showMsg = !isValid;
			if (!noShowPhase) {
				showUiForPhase(phase, showMsg);	
			}
			return isValid;
		}
		
		//생년월일 유효성 검사
		function validateResidentNum6Check(yyMMdd) {
			var numFront = yyMMdd;

			if (numFront == undefined || numFront.length != 6) {
				return false;
			}

			var birthMonth = Number(numFront.substr(2, 2));
			var birthDate = Number(numFront.substr(4, 2));
			if (birthMonth < 1 || birthMonth > 12){
				return false;
			}

			if (birthDate < 1 || birthDate > 31){
				return false;
			}

			if (birthMonth == 2 && birthDate > 29){
				return false;
			}

			return true;
		}
		//주민번호 유효성 검사
		function validateResidentNum(noShowPhase) {
			var isValid = true;
			var inputResidentNumFront = $('#inputResidentNumFront');
			var inputResidentNumBack = $('#inputResidentNumBack');
			//주민번호 뒷자리는 부모의 테두리를 변경해야 한다(유효성 검사 시)
			var inputResidentBackParent = inputResidentNumBack.parent();
			var numFront = inputResidentNumFront.val();
			var numBack = inputResidentNumBack.val();
			var birthMonth = Number(numFront.substr(2, 2));
			var birthDate = Number(numFront.substr(4, 2));
			
			if (!this.validateResidentNum6Check(numFront)) {
				inputResidentNumFront.addClass('bder_danger');
				isValid = false;
			}
			else {
				inputResidentNumFront.removeClass('bder_danger');
			}
			
			//뒷자리 체크
			if (!numBack) {
				inputResidentBackParent.addClass('bder_danger');
				isValid = false;
			}
			else {
				inputResidentBackParent.removeClass('bder_danger');
			}
			
			if (isValid) {
				phase = 'carrier';
				$('#residentNumErrorMsg').addClass('disNone');
			} else {
				$('#residentNumErrorMsg').text('번호를 확인해주세요');
				$('#residentNumErrorMsg').removeClass('disNone');
				phase = 'residentNum';
			}
			
			var showMsg = !isValid;
			if (!noShowPhase) {
				showUiForPhase(phase, showMsg);
			}
			return isValid;
		}
		
		//핸드폰 번호 유효성 검사
		function validateMobile() {
			var isValid = true;
			var inputMobile = $('#inputMobile');
			var mobile = inputMobile.val();
			
			if (!mobile) {
				$('#mobileErrorMsg').text('번호를 확인해주세요');
				isValid = false;
			}
			//번호 형식 검사
			else if (!phonechk.test(mobile)) {
				$('#mobileErrorMsg').text('번호를 확인해주세요');
				isValid = false;
			}
			
			phase = 'mobile';
			if (isValid) {
				inputMobile.removeClass('bder_danger');
				$('#mobileErrorMsg').addClass('disNone');
				showUiForPhase('mobile', false);
			} else {
				inputMobile.addClass('bder_danger');
				$('#mobileErrorMsg').removeClass('disNone');
				showUiForPhase('mobile', true);
			}
			return isValid;
		}
		
		//단계에 따른 UI노출
		function showUiForPhase(inputPhase, showMsg) {
			$('#mobileDiv').addClass('disNone');
			$('#carrierDiv').addClass('disNone');
			$('#residentNumDiv').addClass('disNone');
			
			//input 노출
			switch (inputPhase) {
				case "mobile" : 
					$('#mobileDiv').removeClass('disNone');
				case "carrier" :
					$('#carrierDiv').removeClass('disNone');
				case "residentNum" :
					$('#residentNumDiv').removeClass('disNone');
			}
			
			//타이틀 및 버튼 설정
			$('#nextBtn').removeClass('disNone');
			switch (inputPhase) {
				case "mobile" : 
					$('#verificationTitle').html((isDelegatingToElderly() ? '어르신 ' : '') + '휴대폰 번호를<br>입력해주세요');
					$('#nextBtn').addClass('disNone');
					$('#verifyBtn').removeClass('disNone');
					if (showMsg) {
						$('#verifyBtn').attr('disabled', true);
					}
					setTimeout(function() {
						$('#inputMobile').focus();
					}, 200);
					break;
				case "carrier" : 
					$('#verificationTitle').html('지금 쓰는 휴대폰은<br>통신사가 어디인가요?');
					$('#nextBtn').addClass('disNone');
					$('#modal_broad').modal('open');
					break;
				case "residentNum" : 
					$('#verificationTitle').html((isDelegatingToElderly() ? '어르신 ' : '') + '주민등록번호를<br>입력해주세요');
                    $('#nextBtn').attr('disabled', true);
                    $('#inputResidentNumFront').focus();
					break;
				case "name" : 
					$('#verificationTitle').html((isDelegatingToElderly() ? '어르신 ' : '') + '이름을<br>입력해주세요');
					$('#inputName').focus();
					break;
			}
		}
		
		//본인인증하기 버튼 클릭
		function clickVerifyBtn() {
			var nameVaild = validateName(true);
			var residentVaild = validateResidentNum(true);
			var mobileVaild = validateMobile();
			if (!nameVaild || !residentVaild || !mobileVaild) {
				return;
			}
			
			
			var carrierCode = $('.broad_area .modal-close.active').attr('code');
			//회원가입인 경우만 체크할 약관이 더 있음
			if (afterWorkType === 'regist') {
				checkAgreeArr = [
					'checkAgree01',
					'checkAgree02',
					'checkAgree03',
					'checkAgree04',
					'checkAgree06',
					'checkAgree07',
					'checkAgree08',
				];
			} else {
				checkAgreeArr = [
					'checkAgree01',
					'checkAgree02',
					'checkAgree03',
					'checkAgree04',
				];
			}
			
			//알뜰폰이면 다날 제3자정보제공약관동의 추가
			if (carrierCode === 'SKT_MVNO'
				|| carrierCode === 'KT_MVNO'
				|| carrierCode === 'LGT_MVNO') {
				$('#div_danal5').removeClass('disNone');
				checkAgreeArr.push('checkAgree05');
			} else {
				$('#div_danal5').addClass('disNone');
			}

			checkEvent();
			$('#modal_memConsent').modal('open');
		}
		
		//약관동의 상세보기 모달보기
		function showAgreementDetailModal(type) {
			if (type === 'terms') {
				setAgreementModalForEroum('TERMS', Number(termsHisList[0].termsNo));
			} else if (type === 'privacyuse') {
				setAgreementModalForEroum('PRIVACYUSE', Number(privacyHisList[0].termsNo));
			} else if (type === 'marketing') {
				setAgreementModalForEroum('MARKETING', Number(marketingHisList[0].termsNo));
			} else if (type === 'night') {
				setAgreementModalForEroum('NIGHT', Number(nightHisList[0].termsNo));
			} else if (type === 'danal1'
				|| type === 'danal2'
				|| type === 'danal3'
				|| type === 'danal4'
				|| type === 'danal5') {
				var carrierCode = $('.broad_area .modal-close.active').attr('code');
				setAgreementModalForDanal(type, carrierCode);
			}
		}
		
		//약관동의 확인 이벤트
		var checkedIds;
		function checkRequireAgreement() {
			var checkedAgreeInputs = $('input[name=check-agree]:checked');
			checkedIds = [];
			for (var i = 0; i < checkedAgreeInputs.length; i++) {
				checkedIds.push(checkedAgreeInputs[i].id);
			}
			
			//필수 체크
			for (var i = 0; i < checkAgreeArr.length; i++) {
				if (checkedIds.findIndex(f => f === checkAgreeArr[i]) === -1) {
					return false;
				}
			}
			return true;
		}
		function clickAgreementConfirm() {
			var checkRequire = checkRequireAgreement();
			if (!checkRequire) {
				return;
			}
			
			//사용자 입력값 저장
			var inputName = $('#inputName');
			var inputResidentNumFront = $('#inputResidentNumFront');
			var inputResidentNumBack = $('#inputResidentNumBack');
			var atagCarrier = $('#atagCarrier');
			var inputMobile = $('#inputMobile');
			
			var carrierCode = $('.broad_area .modal-close.active').attr('code');
			verificationInfo = {
				name : inputName.val(),
				identityNo : (inputResidentNumFront.val() + inputResidentNumBack.val()),
				carrier : carrierCode,
				phone : inputMobile.val(),
			};
			mbrAgreementInfo = {
				termsYn : 'Y',
				privacyYn : 'Y',
				marketingReceptionYn : (checkedIds.findIndex(f => f === 'checkAgree09') === -1) ? 'N' : 'Y',
				nightReceptionYn : (checkedIds.findIndex(f => f === 'checkAgree10') === -1) ? 'N' : 'Y',
			}
			
			requestVerification();
		}
		
		
		//인증정보 저장 후 문자 인증창 표출
		function showSmsCheckUi(retry) {
			//최초 발송
			if (!retry) {
				//동의창 닫기
				$('#modal_memConsent').modal('close');
				
				//문자 인증창 띄우기
				$('#mbrInfoSection').addClass("disNone");
				$('.page-footer').addClass("disNone");
				$('#smsCheckSection').removeClass("disNone");
				$('#smsErrorMsg').addClass("disNone");
			}
			//재발송
			else {
				realarmVerification();
			}
			
			//인증창 초기화
			remainingSec = maxSmsSec;
			var smsTimeText = this.smsTimeTextCalc(remainingSec);
			$('#timeTextSpan').text(smsTimeText);
			if (timer) {
				clearInterval(timer);	
			}
			timer = setInterval(showRemaining, 1000);
		}
		
		//인증번호 재전송
		function clickSmsResendBtn() {
			showSmsCheckUi(true);
		}
		
		function showRemaining () {
			remainingSec -= 1;
			
			var smsTimeText = '';
			if (remainingSec < 0) {
				//시간이 다된경우
				clearInterval(timer);
				smsTimeText = '00:00';
				
				//인증번호 재전송 버튼 노출
				$('#smsResendDiv').removeClass('disNone');
			} else {
				smsTimeText = this.smsTimeTextCalc(remainingSec);
			}
			$('#timeTextSpan').text(smsTimeText);
		}

		function smsTimeTextCalc(remainingSec){
			var minutes = Math.floor(remainingSec / 60);
			var seconds = Math.floor(remainingSec % 60);
			if (minutes < 10) {
				minutes = '0' + minutes;
			}
			if (seconds < 10) {
				seconds = '0' + seconds;
			}
			return minutes + ':' + seconds;
		}
		
		//SMS번호 인증 이벤트(enter 입력)
		function inputKeydownSms(e) {
			if (e.key === 'Enter') {
				confirmVerification();
				return false;
			} else if (e.key === 'Tab') {
				confirmVerification();
				return true;
			} else {
				return true;
			}
		}
		
		//SNS번호 oninput 이벤트
		function inputEventSms() {
			const otpNum = $('#inputOtp').val();
			if (otpNum.length === 6) {
				confirmVerification();
			}
		}
		
		
		//인풋 변경에 따른 다음버튼 활성화 처리
		function inputEvent(type) {
			if (phase === 'name') {
				var name = $('#inputName').val();
				if (!name) {
					$('#nextBtn').attr('disabled', true);
				} else {
					$('#nextBtn').attr('disabled', false);
				}
			} else if (phase === 'residentNum') {
				var name = $('#inputName').val();
				var residentNumFront = $('#inputResidentNumFront').val();
				var residentNumBack = $('#inputResidentNumBack').val();
				
				if (!name || !residentNumFront || !residentNumBack) {
					$('#nextBtn').attr('disabled', true);
				} else {
					$('#nextBtn').attr('disabled', false);
				}
			} else if (phase === 'mobile') {
				var name = $('#inputName').val();
				var residentNumFront = $('#inputResidentNumFront').val();
				var residentNumBack = $('#inputResidentNumBack').val();
				var mobile = $('#inputMobile').val();
				
				if (!name || !residentNumFront || !residentNumBack || !mobile) {
					$('#verifyBtn').attr('disabled', true);
				} else {
					$('#verifyBtn').attr('disabled', false);
				}
			}
			
			
			//생년월일 6자리 입력 후 뒷자리 이동 처리
			if (type === 'residentNumFront') {
				var residentNumFront = $('#inputResidentNumFront').val();
				if (residentNumFront.length === 6) {
					$('#inputResidentNumBack').focus();
				}
			}
		}
		
		function isDelegatingToElderly() {
			return "${type}" == "recipientVerification" || "${type}" == "rcperRcognNoRegist";
		}
		
		$(function() {
			(new JsCommon()).fn_keycontrol();
			
			//초기화
			initialize();
			
			//통신사 클릭 시 바로 다음단계 처리
			$('.broad_area li').click(function() {
				phase = 'mobile';
				showUiForPhase(phase);
			});
			
			//약관전체 동의 이벤트
			$('#chk_join_t').on('change', checkEvent);
			
			//약관체크 이벤트
			$('input[name=check-agree]').on('change', checkEvent);
		})
		
		function checkEvent() {
			const $agreementConfirmBtn = $('#agreementConfirmBtn');
			checkRequireAgreement()
				? $agreementConfirmBtn.attr('disabled', false)
				: $agreementConfirmBtn.attr('disabled', true);
		}

		$(window).on('pageshow', checkEvent);
	</script>