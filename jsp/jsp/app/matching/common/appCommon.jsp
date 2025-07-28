<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 전역적으로 APP 관련 처리 스크립트 --%>
<script>
	var popAlert, popConfirm;
	async function showAlertPopup2(title, msg, btn) {
		if (popAlert == undefined) popAlert = new JsMvpPopupAlerts(window, '.modal.static.alert');
		
		//바텀시트가 있다면 닫기
		$('.modal.bottom-sheet').modal('close');
		
		//줄바꿈 문자 처리
		msg = msg.replaceAll('\\n', '<br>');
		msg = msg.replaceAll('\n', '<br>');
		
		return popAlert.fn_show_popup({title_txt: title, message_txt: msg, confirm_txt: btn});
	}
	async function showAlertPopup(msg) {
		
		return showAlertPopup2(undefined, msg, undefined);
	}

	/*
	async function fn_test_confirm(){
		const asyncConfirm = await showAlertPopup('제목', '내용', '확인');
		if (asyncConfirm != 'confirm'){
			return;
		}
	}
	
	*/
	async function showConfirmPopup(title, msg, btn, cancelBtn) {
		if (popConfirm == undefined) popConfirm = new JsHouse2309PopupConfirm(window, '.modal.static.confirm');
		
		//바텀시트가 있다면 닫기
		$('.modal.bottom-sheet').modal('close');
		return popConfirm.fn_show_popup({title_txt: title, message_txt: msg, confirm_txt: btn, cancel_txt: cancelBtn});
	}
	
	function showToastMsg(msg, callback) {
        $('.toast').remove();
		//토스트 시간은 기본 2초(2000)로 설정
		var toastOption = { html: msg, displayLength: 2000 };
		if (callback) {
			toastOption.completeCallback = callback;
		}
		
		M.toast(toastOption);
	}
	

	//App 토큰 처리
	function checkAppToken() {
		var appMatToken = '${appMatToken}';
		
		if (appMatToken) {
			sendDataToMobileApp({actionName: 'saveToken', token: appMatToken});
		}
	}
	
	//현재 페이지 저장하는 공통 함수
	function saveCurrentPageHistory() {
  		pushHistoryStack(location.pathname + location.search);
  	}

    //뒤로가기 이벤트
    function backBtnEvent() {
        const getBrowserPrevHistory = function() {
            if (!document.referrer) return '';
            const prevUrl = new URL(document.referrer);
            return prevUrl.pathname + prevUrl.search;
        }

        const prevHistory = popHistoryStack(-1);
        const browserPrevHistory = getBrowserPrevHistory();
        if (prevHistory === browserPrevHistory) {
            history.back();
        } else {
            location.href = prevHistory || '/matching';
        }
    }
	
	//로그아웃
	function clickLogoutBtn() {
		callPostAjaxIfFailOnlyMsg('/matching/membership/logoutAction', {}, function() {
			var airbrigeParam = {};
			var lgnTy = getInLocalStorage('lgnTy');
			if (lgnTy) {
				airbrigeParam.label = lgnTy;
			}
			
			//에어브릿지 로그아웃 이벤트
			airbridge.events.send('airbridge.user.signout', airbrigeParam);

			var param = {"eventName":"airbridge.user.signout", ...airbrigeParam};
        	callPostAjaxIfFailOnlyMsg("/advertising/events/send.json", param, function(result) {});

			airbridge.clearUser();
			
			//앱에 로그인 토큰 정보 삭제
			sendDataToMobileApp({actionName: 'removeToken'});
			deleteCookie('appMatToken');
			//뒤로가기 이력 삭제
			clearHistoryStack();
			location.href = '/matching/kakao/login';
		});
	}
	
	//에어브릿지 테스트 이벤트 (테스트완료시 1회만 발송하도록 구현)
    function sendAirbridgeForTest(labelValue, locationHref) {
    	var testComplete = getInLocalStorage('testComplete');
        if (testComplete && testComplete === 'Y') {
            airbridge.events.send('view_testresult', {label: labelValue, "locationHref":locationHref});
            removeInLocalStorage('testComplete');

			var param = {"eventName":"view_testresult", "label":labelValue, "locationHref":locationHref};
        	callPostAjaxIfFailOnlyMsg("/advertising/events/send.json", param, function(result) {});
        }
	}
	
	$(function() {
		//다른 페이지에서 메시지 보낸경우 토스트 처리
		var msg = getInLocalStorage('msg');
		if (msg) {
			showToastMsg(msg);
			removeInLocalStorage('msg');
		}

        saveCurrentPageHistory();
	})
</script>

<div class="modal2-con">
  <!-- popAlert -->
  <div id="popAlert" class="modal static alert">

    <div class="modal_header">
        <h4 class="modal_title"><!--title제목--></h4>
    </div>
    <div class="modal-content">
      
      <!--p>
        Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
        when an unknown printer took a galley of type and scrambled it to make a type specimen book.
      </p>
      <p class="fs16">내용넣는곳</p-->

    </div>
    <div class="modal-footer">
        <div class="btn_area d-flex">
            <a class="modal-close waves-effect btn btn-large w100p btn_primary">확인</a>
        </div>
    </div>
  </div>

  <!-- popConfirm -->
  <div id="popConfirm" class="modal static confirm">

    <div class="modal_header">
        <h4 class="modal_title"><!--title제목--></h4>
    </div>
    <div class="modal-content">
      
      <!--p>내용넣는곳</p>
      <p class="fs16">내용넣는곳</p-->

    </div>
    <div class="modal-footer">
        <div class="btn_area d-flex">
            <a class="modal-close waves-effect btn btn-large w100p btn_cancel">취소</a>
            <a class="modal-close waves-effect btn btn-large w100p btn_primary">확인</a>
        </div>
    </div>
  </div>
</div>
