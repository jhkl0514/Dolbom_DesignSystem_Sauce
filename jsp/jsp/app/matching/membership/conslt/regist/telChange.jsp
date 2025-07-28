<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
	    <!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
	
	
	    <main>
	      <section class="intro">
	
	        <h3 class="title">
	            상담받을 연락처를<br>
	            수정해주세요
	        </h3>
	
	        <div class="h40"></div>
	        <form>
	
	            <label for="inputTel" class="input_label">상담받을 연락처</label>
	            <input id="inputTel" type="text" inputmode="numeric" class="input_basic keycontrol phonenumber bder_danger filled_enabled" targetFilledEnabled="#updateBtn" placeholder="010-1234-5678" value="" onkeypress="return inputKeypressEvent(event);">
	            <div id="mobileErrorMsg" class="vaild_txt error">번호를 확인해주세요</div>
	
	            <div class="h24"></div>
	
	            <div id="divGuideText" class="card-panel default">
	                이번에 신청하는 상담의 연락처만 수정돼요
	            </div>
	
	        </form>
	
	      </section>
	    </main>
	
	
	    <footer class="page-footer">
	
	      <div class="btn_area d-flex f-column">
	
	          <a id="updateBtn" class="waves-effect btn-large btn_primary w100p modal-trigger btn_disable" onclick="clickChangeBtn();">변경하기</a>
	
	      </div>
	
	    </footer>
        
	</div>
	<!-- wrapper -->
	
	  
      <script>
      	//정규식
      	var phonechk = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
      
      
    	//UI 초기화
		function initialize() {
    		$('#inputTel').removeClass('bder_danger');
			$('#mobileErrorMsg').addClass('disNone');
    	}
      
    	//변경하기 버튼 클릭
    	async function clickChangeBtn() {
    		//유효성 검사
    		var isValid = true;
			var inputTel = $('#inputTel');
			var mobile = inputTel.val();
			var mobileErrorMsg = $('#mobileErrorMsg');
			var divGuideText = $('#divGuideText');
			
			if (!mobile) {
				mobileErrorMsg.text('번호를 확인해주세요');
				isValid = false;
			}
			//번호 형식 검사
			else if (!phonechk.test(mobile)) {
				mobileErrorMsg.text('번호를 확인해주세요');
				isValid = false;
			}
			
			if (isValid) {
				inputTel.removeClass('bder_danger');
				mobileErrorMsg.addClass('disNone');
				divGuideText.removeClass('disNone');
			} else {
				inputTel.addClass('bder_danger');
				mobileErrorMsg.removeClass('disNone');
				divGuideText.addClass('disNone');
				return;
			}
			
			
			var answer = await showConfirmPopup('정말 수정하시겠어요?', '정확한 정보를 입력하셔야 필요한 정보를 받을 수 있어요');
			if (answer === 'confirm') {
				var qsMap = (new JsCommon()).fn_queryString_toMap();
				qsMap["tel"] = $('#inputTel').val();
				
				removeHistoryStackFrom('infoConfirm');
				location.href='/matching/membership/conslt/infoConfirm?' + (new JsCommon()).fn_queryString_fromMap(qsMap);
			}
    	}
    	
    	//키입력 이벤트
		function inputKeypressEvent(e, inputType) {
			if (e.keyCode == 13) {
				clickChangeBtn();
				return false;
			} else {
				return true;
			}
		}
    	
    	
      	$(function() {
      		(new JsCommon()).fn_keycontrol();
      		var qsMap = (new JsCommon()).fn_queryString_toMap();
			  if (qsMap["tel"] != undefined && qsMap["tel"].length > 0 && phonechk.test(qsMap["tel"])){
				$('#inputTel').val(qsMap["tel"]);

				$("#updateBtn").removeClass("btn_disable");
			  }
      		//초기화
			initialize();
      	});
      </script>