<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="wrapper">


        <main>
            <section>

                <h3 class="title">
                    앱 테스트 버튼
                </h3>

                <button type="button" class="btn btn-primary2 large w-50" onclick="fn_save_app_permissions();">앱 접근 권한 저장</button>
                <br>
                <button type="button" class="btn btn-primary2 large w-50" onclick="fn_get_app_permissions();">앱 접근 권한 불러오기</button>
                <br>
                <button type="button" class="btn btn-primary2 large w-50" onclick="fn_get_push_token_confirm();">앱 접근 푸시토큰 확인</button>
                <br>
                <button type="button" class="btn btn-primary2 large w-50" onclick="fn_set_app_reset_localstorage();">로컬 스토지리 초기화</button>
                <br>
                <button type="button" class="btn btn-primary2 large w-50" onclick="fn_get_app_token_confirm();">앱토큰 확인</button>
                <br>
                
                <button type="button" class="btn btn-primary2 large w-50" onclick="fn_set_app_log_send();">로그 전송</button>
                <br>
                
                <button type="button" class="btn btn-primary2 large w-50" onclick="fn_set_fullscreenUrl();">전체화면</button>
                <br>
            </section>
        </main>


        
    </div>
    <!-- wrapper -->


	<script>
        
        function fn_set_fullscreenUrl() {
            sendDataToMobileApp({ actionName: 'fullscreenUrl', url: 'https://www.youtube.com/embed/2JM7sBva6JE?si=69NFJ3mK4u9olw7H&controls=1&autoplay=1&mute=1' });
		}
		function fn_save_app_permissions() {
            sendDataToMobileApp({ actionName: 'requestPermissions', type: 'push', redirectUrl: '/matching/onboarding' });
		}

        function fn_get_app_permissions() {
            sendDataToMobileApp({ actionName: 'getPermissionsInfo'});
		}
        
        function fn_set_app_reset_localstorage() {
            sendDataToMobileApp({ actionName: 'resetLocalstorage'});
		}

        function fn_set_app_log_send() {
            sendDataToMobileApp({ actionName: 'appLogSend'});
		}
        function fn_get_app_token_confirm() {
            sendDataToMobileApp({ actionName: 'confirmAppMatToken'});
		}
        function fn_get_push_token_confirm() {
            sendDataToMobileApp({ actionName: 'confirmPermissionsInfo'});
		}
	</script>