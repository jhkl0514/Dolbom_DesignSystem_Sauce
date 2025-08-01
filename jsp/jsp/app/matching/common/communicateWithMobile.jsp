<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 전역적으로 APP과 통신 스크립트 처리 --%>
<script>
	//모바일로 데이터 전송
	function sendDataToMobileApp(data) {
		if (window.ReactNativeWebView) {
			window.ReactNativeWebView.postMessage(
				JSON.stringify(data)
			);
		} else {
			//location.href = "/";
		}
	}
	
	//모바일에서 데이터 받기
	function receiveDataFromMobileApp() {
		const listener = event => {
			var jsonStr = event.data;
			var jsonData = JSON.parse(jsonStr);
		
			sendDataToMobileApp({ actionName: 'setLog', 'from':'receiveDataFromMobileApp', 'jsonStr' : jsonStr});
			
			//리다이렉트 처리
			if (jsonData.actionName && (jsonData.actionName === 'webviewRedirect' || jsonData.actionName === 'redirect')) {
				location.href = jsonData.url;
			}
			//뒤로가기 버튼 이벤트 호출
			else if (jsonData.actionName && jsonData.actionName === 'backBtnEvent') {
				try {
					if (backBtnEvent) {
						backBtnEvent();
					} else {
						history.back();
					}
				} catch (ex) {
					history.back();
				}
			}
			//App Location 정보 Cookie에 저장 (위치 기능 임시 사용 중단)
			//else if (jsonData.actionName && jsonData.actionName === 'location') {
			//	setCookie('location', jsonData.location.lat + 'AND' + jsonData.location.lot, 1);
			//}
			//앱 접근 권한 정보 가져와서 저장
			else if (jsonData.actionName === 'getPermissionsInfo') {
				// console.log(jsonData)
				callPostAjaxIfFailOnlyMsg(
					'/matching/membership/info/updatePermissionInfo', 
					{ permissionInfoJson: JSON.stringify(jsonData.permissions) },
					function(result) {
						
					}
				);
			}
			else if (jsonData.actionName === 'confirmPermissionsInfo') {
				showAlertPopup('푸시토큰 : ' + jsonData.permissions.pushPermission.pushToken);
			//App 로그인 토큰 정보 Cookie에 저장
			}else if (jsonData.actionName && jsonData.actionName === 'saveAppMatToken') {
				setCookie('appMatToken', jsonData.appMatToken, 365);
			}
			else if (jsonData.actionName && jsonData.actionName === 'confirmAppMatToken') {
				showAlertPopup('앱토큰 : ' + jsonData.appMatToken);
			}
			
			//최근로그인 표시 보여주기
			else if (jsonData.actionName && jsonData.actionName === 'getRecentLgnTy') {
				if (!jsonData.recentLgnTy) {
					return;
				}
				
				if (jsonData.recentLgnTy === 'K' && showKakaoRecentLogin) {
					showKakaoRecentLogin();
				} else if (jsonData.recentLgnTy === 'N' && showNaverRecentLogin) {
					showNaverRecentLogin();
				} else if (jsonData.recentLgnTy === 'E' && showEroumRecentLogin) {
					showEroumRecentLogin();
				}
			}
			//세션 초기화
			else if (jsonData.actionName && jsonData.actionName === 'sessionClear') {
				callPostAjaxIfFailOnlyMsg('/matching/membership/sessionClear', {}, function(result) {});
			}
			//앱 버전 받기
			else if (jsonData.actionName && jsonData.actionName === 'getAppVersion') {
				appVersion = jsonData.version;
			}
			//이벤트 받고 데이터 alert		
			else {
				alert(jsonStr);
			}
		}
		
		if (window.ReactNativeWebView) {
			// android
			document.addEventListener("message", listener);
			
			// ios
			window.addEventListener("message", listener);
		} else {
			//location.href = "/";
		}
	}
	
	$(function () {
		receiveDataFromMobileApp();
	});
</script>