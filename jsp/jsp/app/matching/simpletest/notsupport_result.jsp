<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="true" name="noBackButtion" />
        <jsp:param value="" name="addButton" />
        <jsp:param value="${addTitle}" name="addTitle" />
        <jsp:param value="true" name="addHome" />
        <jsp:param value="true" name="addShare" /> 
    </jsp:include>

    <main>
        <section class="intro bottom_0">

            <h2 class="title02">
                ${mbrRecipientsVO.recipientsNm}님,<br>
                돌봄 혜택을 받지 못할 것으로 예상돼요
            </h2>

            <div class="h12"></div>

            <div class="color_t_s font_sbmr">다른 혜택을 받을 수 있는 지 확인해보세요</div>

            <div class="h48"></div>

            <div class="center">
                <img src="/html/page/app/matching/assets/src/images/11easy/easy_11.svg" al t="테스트 결과">
            </div>

            <div class="h12"></div>

            <p class="color_t_s font_scx">
                ※ 보건복지부에서 고시한 장기 요양 등급 판정 기준을 근거로 만들어진 테스트로, 실제 판정 결과와 상이할 수 있어요
            </p>
            <div class="h40"></div>

            <div class="box_normal marW-20">

                <div class="card">

                    <div class="card-content"> 
                        <c:if test="${failList.getListObject().size() > 0}">
                            <div class="box noPad w56">
                                <div class="img_area w56">
                                <img src="/html/page/app/matching/assets/src/images/08etc/money01_40.svg" alt="혜택">
                                </div>
                                <div class="ctn_area">
                                <div class="font_sbmb">어르신 상황에 따라 이러한 혜택을 받을 수 있어요</div>
                                </div>
                            </div>
                            
                            <div class="h20"></div>

                            <div class="padL8">
                                <c:forEach var="item" items="${failList.getListObject()}" varStatus="status">
                                    <div class="waves-effect list_link ntt_no bder_bottom font_sbmr" ntt_no="${item.getNttNo()}">${item.getTtl()}</div>
                                </c:forEach>
                                
                                <!--div class="waves-effect list_link bbs_link bder_bottom font_sbmr" bbs_link="">임플란트 이용 지원</div>
                                <div class="waves-effect list_link bbs_link bder_bottom font_sbmr" bbs_link="">틀니 비용 지원</div>
                                <div class="waves-effect list_link bbs_link bder_bottom font_sbmr" bbs_link="">인공관절 수술비 지원</div>
                                <div class="waves-effect list_link bbs_link bder_bottom font_sbmr" bbs_link="">노인개안 수술비 지원</div>
                                <div class="waves-effect list_link bbs_link bder_bottom font_sbmr" bbs_link="">치매 검사비 지원</div>
                                <div class="waves-effect list_link bbs_link font_sbmr" bbs_link="">치매 치료비 지원</div-->
                            </div>
                        </c:if>

                    </div>
                </div>

                <div class="h100"></div>
                
            </div>
            <!-- box -->


        </section>
    </main>

    <footer class="page-footer">

        <div class="relative">
            <a class="waves-effect btn-large btn_primary w100p" onclick="fn_next_click()">다른 혜택 알아보기</a>
        </div>

    </footer>

</div>
<script>
    $(function () {
    	//뒤로가기 재정의
    	backBtnEvent = function() {
    		location.href = '/matching/main/service';
    	}
    	
    	//에어브릿지 테스트 결과 이벤트 발송 (matching/common/appCommon)
    	sendAirbridgeForTest('비대상', location.href);
    	
    	
        $("body").addClass("back_gray02");

        $(".card-content .ntt_no").off('click').on('click', function(){
            location.href = "/matching/bbs/socialwelfare/view?nttNo=" + $(this).attr('ntt_no');
        });
    });

    async function fn_next_click(){
        const asyncConfirm2 = await showConfirmPopup('대상자가 아니에요.', '받을 수 있는 다른 혜택을 알아보시겠어요?', '알아보기');
        if (asyncConfirm2 != 'confirm'){
            return;
        }

        location.href = "/matching/bbs/socialwelfare/list";
    }
</script>     