<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="" name="addButton" />
	        <jsp:param value="SNS연결" name="addTitle" />
	    </jsp:include>
	    
	    
        <main>
            <section class="default">

                <div class="list_normal">
                    
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/08etc/social_kakao_40.svg" alt="카카오 연결">
                        <span class="font_sbms">카카오 연결</span>
                    </div>
                    <div class="switch">
                        <label>
                            <input id="inputKakao" type="checkbox" <c:if test="${!empty kakaoAuthInfo}">checked</c:if> onchange="updateSnsAuthInfo(this, 'K');">
                            <span class="lever"></span>
                        </label>
                    </div>
                
                </div>

                <div class="h16"></div>

                <div class="list_normal">

                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/08etc/icon_naver02.svg" alt="네이버 연결">
                        <span class="font_sbms">네이버 연결</span>
                    </div>
                    <div class="switch">
                        <label>
                            <input id="inputNaver" type="checkbox" <c:if test="${!empty naverAuthInfo}">checked</c:if> onchange="updateSnsAuthInfo(this, 'N');">
                            <span class="lever"></span>
                        </label>
                    </div>
                
                </div>

            </section>
        </main>
        	    
	</div>
	<!-- wrapper -->
	
	
	<script>
		var kakaoAuthNo = '${kakaoAuthInfo.authNo}';
		var naverAuthNo = '${naverAuthInfo.authNo}';


	
		$(function() {
			setTimeout(() => {/*checkbox 가 안 먹어서 이렇게 한다.*/
				fn_loading_checkbox_reset();
			}, 20);
			
		});
		
		function fn_loading_checkbox_reset(){
			var snsNo = kakaoAuthNo;
			var cssSnsInput = "#inputKakao";

			$(cssSnsInput)[0].checked = (snsNo && snsNo.length > 0);

			snsNo = naverAuthNo;
			cssSnsInput = "#inputNaver";
			$(cssSnsInput)[0].checked = (snsNo && snsNo.length > 0);
		}

		//sns 연결, 해제 처리
		function updateSnsAuthInfo(element, joinTy) {
			var checked;
			if (joinTy === 'K') {
				checked = $('#inputKakao')[0].checked;
			} else if (joinTy === 'N') {
				checked = $('#inputNaver')[0].checked;
			}
			
			
			if (checked) {
				addAuth(joinTy);
			} else {
				removeAuth(element, joinTy);
			}
		}
		
		//인증 수단 연결
		function addAuth(joinTy) {
			if (joinTy === 'K') {
				location.href = '/matching/kakao/auth?kind=connectKakao';
			} else if (joinTy === 'N') {
				location.href = '/matching/naver/get?kind=connectNaver';
			}
		}
		
		//인증 수단 삭제
		async function removeAuth(element, joinTy) {
			var authCtn = ${authCtn};
			if (authCtn <= 1) {
				showAlertPopup('소셜 로그인 연결을 해제할 수 없습니다\n최소 하나의 소셜 계정이 연동되어야 합니다');
				element.checked = element.defaultChecked;
				return;
			}
			
			var confirmMsg = null;
			var afterLogout = false;
			if (joinTy && joinTy === '${mbrVO.lgnTy}') {
				confirmMsg = '연결 해제 시 이로움ON에서 로그아웃됩니다';
				afterLogout = true;
			}
			
			var authNo = null;
			if (joinTy === 'K') {
				authNo = kakaoAuthNo;
			} else if (joinTy === 'N') {
				authNo = naverAuthNo;
			}
			
			var answer = await showConfirmPopup('연동을 해지하시겠어요?', confirmMsg, '해지하기');
			if (answer === 'confirm') {
				callPostAjaxIfFailOnlyMsg(
					'/matching/membership/info/removeMbrAuth.json',
					{ authNo },
					function(result) {
						if (afterLogout) {
							clickLogoutBtn();
						} else {
							location.reload();
						}
					}
				);
			} else {
				element.checked = element.defaultChecked;
			}
		}
	</script>