<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
	
	<style>
	  .page-footer.bottomNav .bottomNav_menu li a dotlottie-player {
		position: absolute;
		top: 8px;
        left: 50%;
        transform: translate(-50%, 0);
        z-index: -1; /* 배경으로 설정하지 않으면 물결 효과 발생 시 어색함 */
	  }
	</style>

    <footer class="page-footer bottomNav">

      <ul class="bottomNav_menu">

        <li class="btn_om">
          <a class="waves-effect" <c:if test="${ param.menuName ne 'recipients' }">onclick="clickRecipientsBtn();"</c:if>>
            <c:if test="${ param.menuName eq 'recipients' }">
              <dotlottie-player src="https://lottie.host/9e91c6e1-8eb1-4209-a238-98da540176e0/1RvnUCbYPw.json" background="transparent" speed="1" style="width: 24px; height: 24px" direction="1" playMode="normal" autoplay></dotlottie-player>
            </c:if>
            <span class="txt">어르신</span>
          </a>
        </li>
        <li class="btn_wel">
          <a class="waves-effect" <c:if test="${ param.menuName ne 'welfare' }">href="/matching/welfareinfo/list"</c:if>>
            <c:if test="${ param.menuName eq 'welfare' }">
              <dotlottie-player src="https://lottie.host/3f91acc7-0657-4406-a6ad-7d2de4601c02/c3fGA0ecM1.json" background="transparent" speed="1" style="width: 24px; height: 24px" direction="1" playMode="normal" autoplay></dotlottie-player>
            </c:if>
            <span class="txt">복지용구</span>
          </a>
        </li>
        <li class="btn_service">
          <a class="waves-effect" <c:if test="${ param.menuName ne 'service' }">href="/matching/main/service"</c:if>>
            <c:if test="${ param.menuName eq 'service' }">
              <dotlottie-player src="https://lottie.host/e0cbc081-14b3-4b38-98f3-5a7cf0220eba/vLbWZeRXy0.json" background="transparent" speed="1" style="width: 24px; height: 24px" direction="1" playMode="normal" autoplay></dotlottie-player>
            </c:if>
            <span class="txt">서비스</span>
          </a>
        </li>
        <li class="btn_guide">
          <a class="waves-effect" <c:if test="${ param.menuName ne 'guide' }">href="/matching/bbs/guide/list"</c:if>>
            <c:if test="${ param.menuName eq 'guide' }">
              <dotlottie-player src="https://lottie.host/20bd1841-9049-418d-a380-4efd32ea7ea0/A211g2qMuj.json" background="transparent" speed="1" style="width: 24px; height: 24px" direction="1" playMode="normal" autoplay></dotlottie-player>
            </c:if>
            <span class="txt">길잡이</span>
          </a>
        </li>
        <li class="btn_entier">
          <a class="waves-effect" <c:if test="${ param.menuName ne 'entire' }">href="/matching/main/menuList"</c:if>>
            <c:if test="${ param.menuName eq 'entire' }">
              <dotlottie-player src="https://lottie.host/3d783787-fbc2-4228-90ae-b375f518cd3f/N3UMj9jFOS.json" background="transparent" speed="1" style="width: 24px; height: 24px" direction="1" playMode="normal" autoplay></dotlottie-player>
            </c:if>
            <span class="txt">전체</span>
          </a>
        </li>

      </ul>

    </footer>
    
    <script>
    	function clickRecipientsBtn() {
    		var isLogin = '${_matMbrSession.loginCheck}';
    		//로그인이 안되어 있는 경우
    		if (!isLogin || isLogin === 'false') {
    			location.href = '/matching/kakao/login';
    			return;
    		}
    		
    		//로그인이 되어 있는 경우
    		if (isLogin === 'true') {
    			callPostAjaxIfFailOnlyMsg(
   					'/matching/membership/info/getMbrInfo.json', 
   					{},
   					async function(result) {
   						//등록된 수급자가 없을 때
   						if (!result.mbrRecipients || result.mbrRecipients.length < 1) {
   							var answer = await showConfirmPopup('어르신을 등록해주세요', '혜택을 받으려면 정확한 어르신 정보가 필요해요', '등록하기');
   							if (answer === 'confirm') {
   								location.href = '/matching/membership/recipients/regist/intro?redirecturl=/matching/membership/recipients/subMain';
   							}
   						}
   						else {
   							location.href = '/matching/membership/recipients/subMain';
   						}
   					}
   				);
    		}
    	}
    </script>