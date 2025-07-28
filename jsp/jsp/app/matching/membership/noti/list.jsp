<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	
	<!-- 알림이 없을 때 -->
	<c:if test="${fn:length(notiMap) == 0}">
		<div class="wrapper align_center">
		
			<!-- 상단 뒤로가기 버튼 추가 -->
			<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
		        <jsp:param value="알림" name="addTitle" />
		    </jsp:include>
	
	        <div class="center">
	            <img src="/html/page/app/matching/assets/src/images/08etc/alarm_default.svg"
	                class="w150" alt="받은 알림이 없습니다">
	            <div class="h12"></div>
	            <p class="color_t_s font_sbmr">받은 알림이 없습니다</p>
	        </div>
	    </div>
	</c:if>


	<!-- 알림 있을 때 -->
	<c:if test="${fn:length(notiMap) > 0}">
	<div class="wrapper">
	
		<!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="알림" name="addTitle" />
	    </jsp:include>
	
	
        <main>
            <section class="default padH12W20 bottom_0">

			<c:forEach var="logPushList" items="${notiMap}" varStatus="status">
				<c:choose>
					<c:when test="${status.index eq 0}">
						<div class="align_between_center">
		                    <h5 class="title">${logPushList.key}</h5>
		                    <a class="waves-effect color_t_s font_sbss padH08 modal-trigger" onclick="removeAllNoti();">전체삭제</a>
		                </div>
		
		                <div class="h12"></div>
					</c:when>
					<c:otherwise>
						<h5 class="title">${logPushList.key}</h5>

                		<div class="h18"></div>
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="logPushInfo" items="${logPushList.value}" varStatus="status">
					<!-- list_link noti -->
	                <div class="waves-effect card box_normal list_link noti <c:if test="${logPushInfo.readYn eq 'N'}">back_today noti_dot</c:if>" onclick="location.href='${logPushInfo.url}';">
	                    <div>
	                        <div class="font_sbsb">${logPushInfo.title}</div>
	
	                        <div class="marT8 font_sbmr line_clamp_2">${logPushInfo.body}</div>
	
	                        <div class="marT8 color_t_t font_ssr">
	                        	<fmt:formatDate value="${logPushInfo.regDt}" pattern="a HH:mm" />
	                        </div>
	                    </div>
	                </div>
				</c:forEach>
				
				<div class="h40"></div>
			</c:forEach>

			
                <div class="center color_t_s font_sbsr">최대 3달 전까지의 알림을 확인할 수 있어요</div>

                <div class="h12"></div>
                <div class="h40"></div>

            </section>
        </main>
		
		
	</div>
	<!-- wrapper -->
	</c:if>
	
	
	<script>
		async function removeAllNoti() {
			var answer = await showConfirmPopup('알림 메시지를 모두 삭제하시겠어요?', null, '삭제하기');
			if (answer === 'confirm') {
				callPostAjaxIfFailOnlyMsg(
	        		'/matching/noti/removeAllNoti.json',
	        		{},
	        		function(result) {
	        			location.reload();
	        		}
	     		);
			}
		}
	
	
		$(function() {
			//body에 css class 추가
			$('body').addClass('back_gray');
			
			//알림 뱃지 모두 끄기
			sendDataToMobileApp({ actionName: 'removeNotiBadge' });
		})
	</script>