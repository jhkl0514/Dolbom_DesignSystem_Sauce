<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<main class="mainContainer">
		
	</main>
	
	
	<script>

		gtag('event', 'login_complete', {
			'userid': '${sha256UniqueId}',
			'login_type': '${loginType}'
		  });

		function fn_notAutoLogin(){
			//앱에 토큰 정보 저장
			var appMatToken = '${appMatToken}';
			if (appMatToken) {
				sendDataToMobileApp({actionName: 'saveToken', token: appMatToken});	
			}
					
			//최근 로그인값 앱에 저장
			sendDataToMobileApp({actionName: 'saveRecentLgnTy', lgnTy: '${_matMbrSession.lgnTy}'});
		};

		function fn_getPermissionsInfo(){
			//앱에서 접근 권한 정보 가져오기 
			sendDataToMobileApp({actionName: 'getPermissionsInfo'});
		}

		$(function() {
			var lgnTy = '${loginType}';
			
			//에어브릿지 로그인 이벤트
			airbridge.setUserId('${uniqueId}');
			
			setTimeout(function() {
				airbridge.events.send('airbridge.user.signin', {label: lgnTy});

				var param = {"eventName":"airbridge.user.signin", "label":lgnTy};
        		callPostAjaxIfFailOnlyMsg("/advertising/events/send.json", param, function(result) {});

			}, 100);
			saveInLocalStorage('lgnTy', lgnTy);
			
			//에어브릿지 이벤트 인식 문제로 delay
			setTimeout(function() {
				var notAutoLogin = '${notAutoLogin}';

				if (notAutoLogin == 'true'){
					fn_notAutoLogin();
				}

				if ('true' == '${requireMbrAppSetting}'){
					fn_getPermissionsInfo();
				}
				
				//뒤로가기 이력 삭제
				clearHistoryStack();
				
				var redirectUrl = '${returnUrl}';
				var nextUrl = '/matching/main/service';
				if (redirectUrl) {
					nextUrl = redirectUrl;
				}
				
				//통합회원 여부에 따라 동의 페이지로 이동
				var integratedYn = '${integratedYn}';
				if (integratedYn && integratedYn === 'Y') {
					location.href = nextUrl;
				} else {
					location.href = '/matching/membership/integratedAgree?returnUrl=' + nextUrl;
				}
			}, 300);
		})
	</script>