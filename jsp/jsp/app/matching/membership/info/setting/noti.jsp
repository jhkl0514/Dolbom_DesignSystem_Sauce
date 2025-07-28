<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="" name="addButton" />
	        <jsp:param value="알림 설정" name="addTitle" />
	    </jsp:include>
	    
	    
        <main>

            <section class="default noPad">

                <div class="h12 back_gray"></div>

                <div class="padH12W20">

                    <div class="list_normal">

                        <div class="font_sbms">혜택 정보 알림</div>
                        <div class="switch">
                            <label>
                                <input type="checkbox" class="allChk" <c:if test="${mbrAgreementVO.marketingReceptionYn eq 'Y'}">checked</c:if> onchange="updateMbrNoti('marketingReceptionYn', this);">
                                <span class="lever"></span>
                            </label>
                        </div>
                   
                    </div>

                    <div class="color_t_t font_sbsr">이벤트 및 마케팅 정보 등</div>
    
                    <div class="h16"></div>
                    <hr>
                    <div class="h16"></div>
   

                    <div class="noti_chk">


                        <div class="list_normal">
    
                            <div class="font_sbmr">앱푸시</div>
    
                            <div class="switch">
                                <label>
                                    <input type="checkbox" <c:if test="${mbrVO.pushRecptnYn eq 'Y'}">checked</c:if> onchange="updateMbrNoti('pushRecptnYn', this);">
                                    <span class="lever"></span>
                                </label>
                            </div>
                        
                        </div>
        
                        <div class="list_normal">
        
                            <div class="font_sbmr">문자</div>
    
                            <div class="switch">
                                <label>
                                    <input type="checkbox" <c:if test="${mbrVO.smsRcptnYn eq 'Y'}">checked</c:if> onchange="updateMbrNoti('smsRcptnYn', this);">
                                    <span class="lever"></span>
                                </label>
                            </div>
                        
                        </div>
        
                        <div class="list_normal">
        
                            <div class="font_sbmr">메일</div>
    
                            <div class="switch">
                                <label>
                                    <input type="checkbox" <c:if test="${mbrVO.emlRcptnYn eq 'Y'}">checked</c:if> onchange="updateMbrNoti('emlRcptnYn', this);">
                                    <span class="lever"></span>
                                </label>
                            </div>
                        
                        </div>
        
                        <div class="list_normal">
        
                            <div class="font_sbmr">전화</div>
    
                            <div class="switch">
                                <label>
                                    <input type="checkbox" <c:if test="${mbrVO.telRecptnYn eq 'Y'}">checked</c:if> onchange="updateMbrNoti('telRecptnYn', this);">
                                    <span class="lever"></span>
                                </label>
                            </div>
                        
                        </div>
    
                        <div class="h12"></div>
    
                        <div class="list_normal">
    
                            <div class="font_sbms">야간 혜택 동의</div>
                            <div class="switch">
                                <label>
                                    <input type="checkbox" <c:if test="${mbrAgreementVO.nightReceptionYn eq 'Y'}">checked</c:if> onchange="updateMbrNoti('nightReceptionYn', this);">
                                    <span class="lever"></span>
                                </label>
                            </div>
                       
                        </div>
    
                        <div class="color_t_t font_sbsr">오후 9:00~오전 8:00 알림 발송</div>


                    </div>
                    <!-- noti_chk -->

                </div>
            </section>
        </main>

        	    
	</div>
	<!-- wrapper -->
	
	
	<script>
		var now = new Date();
		var todayStr = now.getFullYear() + '.' + (now.getMonth() + 1).toString().padStart(2, '0') + '.' + now.getDate().toString().padStart(2, '0');
	
		
		function updateMbrNoti(target, event) {
			var requestJson = {};
			var checked = event.checked ? 'Y' : 'N';
			var msg = '';
			
			if (target === 'marketingReceptionYn') {
				requestJson.marketingReceptionYn = checked;
				
				var checkboxArr = $('input[type=checkbox]');
				checkboxArr[1].checked = event.checked;
				checkboxArr[2].checked = event.checked;
				checkboxArr[3].checked = event.checked;
				checkboxArr[4].checked = event.checked;
				
				msg = checked === 'Y' ? '마케팅 수신을 동의했어요 ' : '마케팅 수신을 거부했어요 ';
			} else if (target === 'pushRecptnYn') {
				requestJson.pushRecptnYn = checked;
				msg = checked === 'Y' ? '마케팅 푸시 수신을 동의했어요 ' : '마케팅 푸시 수신을 거부했어요 ';
			} else if (target === 'smsRcptnYn') {
				requestJson.smsRcptnYn = checked;
				msg = checked === 'Y' ? '마케팅 문자 수신을 동의했어요 ' : '마케팅 문자 수신을 거부했어요 ';
			} else if (target === 'emlRcptnYn') {
				requestJson.emlRcptnYn = checked;
				msg = checked === 'Y' ? '마케팅 메일 수신을 동의했어요 ' : '마케팅 메일 수신을 거부했어요 ';
			} else if (target === 'telRecptnYn') {
				requestJson.telRecptnYn = checked;
				msg = checked === 'Y' ? '마케팅 전화 수신을 동의했어요 ' : '마케팅 전화 수신을 거부했어요 ';
			} else if (target === 'nightReceptionYn') {
				requestJson.nightReceptionYn = checked;
				msg = checked === 'Y' ? '야간 혜택 수신을 동의했어요 ' : '야간 혜택 수신을 거부했어요 ';
			}
			
			//안내메시지 뒤에 날짜 붙이기
			msg += todayStr;
			
			if (target === 'nightReceptionYn' && checked === 'Y') {
				msg += '<br>앱푸시도 함께 동의됐어요'
			}
			
			
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/info/updateMbrNoti.json',
				requestJson,
				function(result) {
					saveInLocalStorage('msg', msg);
					location.reload();
				}
			);
		}
	</script>