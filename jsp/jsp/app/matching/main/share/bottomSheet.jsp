<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div id="modal_share" class="modal bottom-sheet modal_share">

        <div class="modal_header">
          <h4 class="modal_title">${param.title}</h4>
          <div class="close_x modal-close waves-effect"></div>
        </div>
        <div class="h04"></div>
  
        <div class="modal-content">
  
            <ul class="share_icon_area">

                <li class="waves-effect link_copy" onclick="shareBtnClick('link');">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/08etc/social__share_40.svg" alt="">
                    </div>
                    <span class="txt">링크 복사</span>
                </li>

                <li id="kakaotalk-sharing-btn" class="waves-effect kakao">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/08etc/social_kakao_40.svg" alt="">
                    </div>
                    <span class="txt">카카오톡</span>
                </li>

                <li class="waves-effect msg" onclick="shareBtnClick('msg');">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/08etc/social__message_40_2.svg" alt="">
                    </div>
                    <span class="txt">메시지</span>
                </li>

                <li class="waves-effect more" onclick="shareBtnClick('more');">
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/08etc/social__more_40.svg" alt="">
                    </div>
                    <span class="txt">더보기</span>
                </li>

            </ul>

        </div>

        <div class="h32"></div>
  
    </div>


	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.0/kakao.min.js" integrity="sha384-l+xbElFSnPZ2rOaPrU//2FF5B4LB8FiX5q4fXYTlfcG4PGpMkE1vcL7kNXI6Cci0" crossorigin="anonymous"></script>
	<script>
		Kakao.init('${_kakaoScriptKey}');
	
		var frontText = '이로움돌봄 - 보호자 맘에 안심, 부모님 몸에 휴식';
		//카카오 개발자 > 플랫폼에 web url로 등록이 되어야만 링크 변경 가능
		//var marketUrl = 'https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom';
		var marketUrl = window.location.origin + '/app/deeplink/nourl';
		
		
		function shareBtnClick(type) {
			if (type === 'link') {
				//웹뷰 브라우저인 경우
				if (window.ReactNativeWebView) { 
					sendDataToMobileApp({ actionName: 'saveInClipboard', msg: marketUrl });
					showToastMsg('복사되었어요');
				}
				else {
					window.navigator.clipboard.writeText(marketUrl).then(() => {
						showToastMsg('복사되었어요');
					});	
				}
			}
			else if (type === 'msg') {
				shareLink = 'sms:?body=' + encodeURI(frontText + ' ' + marketUrl);
				sendDataToMobileApp({ actionName: 'callOpenUrl', url: shareLink });
			}
			else if (type === 'more') {
				shareLink = frontText + ' ' + marketUrl;
				sendDataToMobileApp({ actionName: 'callShare', msg: shareLink });
			}
		}
		
		
		$(function() {
            Kakao.Share.createCustomButton({
                container: '#kakaotalk-sharing-btn',
                templateId: 107757,
                templateArgs: {
                	webDomain: window.location.origin
                }
            });
		})
	</script>