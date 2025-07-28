<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
	
		<main>
	      <section class="intro">
	
			<h3 class="title">
	            통합회원 전환
	        </h3>
	
			<div class="marT8 color_t_s font_sbsr">
				이제 하나의 아이디로 모든 이로움ON 통합 서비스를 이용하세요!
			</div>
			<div class="marT8 color_t_s font_sbsr">
				2024.05.13 이전 회원의 경우, 통합회원 전환을 위해 신규 약관 동의 및 본인인증(최초 1회)이 필요합니다.
			</div>
	
	        <div class="h32"></div>
	
	
	        <input type="checkbox" id="checkAgreeAll" class="chk02 large border_gray total_evt">
	        <label for="checkAgreeAll">전체 동의하기</label>
	
	        <div class="h20"></div>
	
	        <div class="">
	
	            <div class="group_chk_area">
	                <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('terms')"></span>
	                <div>
	                    <input type="checkbox" name="check-agree" id="checkAgree06" class="chk01_2 large total_evt_sub">
	                    <label for="checkAgree06">[필수] 이로움ON 통합이용약관</label>
	                </div>
	            </div>
	            <div class="group_chk_area">
	                <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('privacyuse')"></span>
	                <div>
	                    <input type="checkbox" name="check-agree" id="checkAgree07" class="chk01_2 large total_evt_sub">
	                    <label for="checkAgree07">[필수] 이로움ON 통합개인정보수집이용동의</label>
	                </div>
	            </div>
	            <div class="group_chk_area">
	                <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('marketing')"></span>
	                <div>
	                    <input type="checkbox" name="check-agree" id="checkAgree09" class="chk01_2 large total_evt_sub">
	                    <label for="checkAgree09">[선택] 이벤트 및 마케팅 정보 수신 동의</label>
	                </div>
	            </div>
	            <div class="group_chk_area">
	                <span class="icon_btn i_right waves-effect modal-trigger" onclick="showAgreementDetailModal('night')"></span>
	                <div>
	                    <input type="checkbox" name="check-agree" id="checkAgree10" class="chk01_2 large total_evt_sub">
	                    <label for="checkAgree10">[선택] 야간 혜택 수신 동의</label>
	                </div>
	            </div>
	    
	            <div class="h20"></div>
	
	        </div>
	
	      </section>
	    </main>
	    
	    <footer class="page-footer">

	      <div class="btn_area d-flex f-column">

	        <div class="relative">
	          <a id="agreeBtn" class="waves-effect btn-large btn_primary w100p disabled" onclick="clickAgreeBtn();">신규 약관 동의하기</a>
	        </div>
	      </div>
	    </footer>
	</div>
	<!-- wrapper -->
	
	
	<!-- 약간동의 상세 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/modal/agreementDetailModal.jsp" />
	
	
	<script>
		var returnUrl = '${returnUrl}';
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
			}
		}
		
		//약관동의 유효성 검사
		function vaildation() {
			var checkedAgreeList = $('input[name=check-agree]:checked');
			
			var isCheck06 = false; //이용약관 체크 여부 확인
			var isCheck07 = false; //개인정보처리방침 체크 여부 확인
			for (var i = 0; i < checkedAgreeList.length; i++) {
				if (checkedAgreeList[i].id === 'checkAgree06') {
					isCheck06 = true;
				}
				if (checkedAgreeList[i].id === 'checkAgree07') {
					isCheck07 = true;
				}
			}
			return isCheck06 && isCheck07;
		}
		
		//신규 약관 동의하기 클릭
		function clickAgreeBtn() {
			var isValid = vaildation();
			if (!isValid) {
				showAlertPopup('필수 약관을 동의해주세요');
				return;
			}
			
			var parameter = ""
			parameter += "&termsYn=" + ($('#checkAgree06').is(':checked') ? "Y" : "N");
			parameter += "&privacyYn=" + ($('#checkAgree07').is(':checked') ? "Y" : "N");
			parameter += "&marketingReceptionYn=" + ($('#checkAgree09').is(':checked') ? "Y" : "N");
			parameter += "&nightReceptionYn=" + ($('#checkAgree10').is(':checked') ? "Y" : "N");
			location.href = "/matching/membership/info/identityIntro?type=integrated" + parameter;
		}
		
		
		$(function() {
			//백버튼 오버라이딩
			backBtnEvent = function() { clickLogoutBtn() };
			
			//약관동의 체크 이벤트
			$('#checkAgreeAll,input[name=check-agree]').on('change', function() {
				var isValid = vaildation();
				
				if(isValid) {
					$('#agreeBtn').removeClass('disabled');
				} else {
					$('#agreeBtn').addClass('disabled');
				}
			})
		});
		
	</script>