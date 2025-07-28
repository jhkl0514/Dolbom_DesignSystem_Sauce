<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="wrapper">

        <!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />

        <main>
            <section class="intro">

                <h3 class="title">
                    ${tempMbrVO.mbrNm}님 계정에<br />
                    ${mbrJoinTyMap[tempMbrVO.joinTy]}를 연결할까요?
                </h3>

                <div class="h32"></div>

				<!--
                <div class="color_t_s font_sbsr">이메일</div>
				-->

                <div class="h08"></div>

                <div class="waves-effect btn-large btn_primary_light justify-content-start h67 maxHeightNo">
                	<c:choose>
                		<c:when test="${tempMbrVO.joinTy eq 'K'}">
                			<img class="icon_img" src="/html/page/app/matching/assets/src/images/08etc/social_kakao_40.svg">
                    		<span>${tempMbrVO.eml}</span>
                		</c:when>
                		<c:when test="${tempMbrVO.joinTy eq 'N'}">
                			<img class="icon_img" src="/html/page/app/matching/assets/src/images/08etc/icon_naver02.svg">
                    		<span>${tempMbrVO.eml}</span>	
                		</c:when>
                	</c:choose>
                </div>

                <div class="h32"></div>

                <div class="color_t_s font_sbsr">현재 연결된 계정</div>

                <div class="h08"></div>
				
				<c:if test="${ !empty kakaoAuthInfo }">
	                <div class="waves-effect btn-large btn_white justify-content-start maxHeightNo">
	                    <img class="icon_img" src="/html/page/app/matching/assets/src/images/08etc/social_kakao_40.svg">
	                    <span class="font_sbmr">${kakaoAuthInfo.eml}</span>
	                </div>
                </c:if>
                
                <c:if test="${ !empty naverAuthInfo }">
                	<c:if test="${ !empty kakaoAuthInfo }">
                		<div class="h08"></div>
                	</c:if>
                	
	                <div class="waves-effect btn-large btn_white justify-content-start maxHeightNo">
	                    <img class="icon_img" src="/html/page/app/matching/assets/src/images/08etc/icon_naver02.svg">
	                    <span class="font_sbmr">${naverAuthInfo.eml}</span>
	                </div>
                </c:if>
                
                <c:if test="${ !empty eroumAuthInfo }">
                	<c:if test="${ !empty kakaoAuthInfo || !empty naverAuthInfo }">
                		<div class="h08"></div>
                	</c:if>
                
	                <div class="waves-effect btn-large btn_white justify-content-start maxHeightNo">
	                    <img class="icon_img" src="/html/page/app/matching/assets/src/images/08etc/login_on_40.svg">
	                    <span class="font_sbmr">${eroumAuthInfo.mbrId}</span>
	                </div>
                </c:if>

            </section>
        </main>

        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p" onclick="bindMbrSns();">연결하기</a>
            </div>

        </footer>

    </div>
    <!-- wrapper -->
	
	
	<script>
		function bindMbrSns() {
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/sns/binding.json',
				{},
				function(result) {
					showToastMsg('계정이 연결되었어요', function() {
						location.replace('/matching');
					});
				}
			);
		}
		
		$(function() {
			backBtnEvent = function() {
				location.href = "/matching/kakao/login";
			}
		});
	</script>