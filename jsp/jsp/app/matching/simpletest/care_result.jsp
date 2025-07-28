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
                어떤 돌봄 서비스를 이용할 수 있을 지 확인해보세요
            </h2>

            <div class="h48"></div>

            <c:choose>
                <c:when test="${simpleTestVO.getCareTime() eq '3' }">
                    <!-- 3시간 이내 -->
                    <div class="center">
                        <img src="/html/page/app/matching/assets/src/images/08etc/time01_80.svg" style="width:200px" alt="테스트 결과">
                    </div>

                    <div class="h12"></div>

                    <div class="center font_sbms">3시간 이내</div> 
                </c:when>
                <c:when test="${simpleTestVO.getCareTime() eq '8' }">
                    <!-- 3~8시간 -->
                    <div class="center">
                        <img src="/html/page/app/matching/assets/src/images/08etc/time02_80.svg" style="width:200px" alt="테스트 결과">
                    </div>

                    <div class="h12"></div>

                    <div class="center font_sbms">3~8시간</div>
                </c:when>
                <c:when test="${simpleTestVO.getCareTime() eq '10' }">
                    <!-- 8~10시간 -->
                    <div class="center">
                        <img src="/html/page/app/matching/assets/src/images/08etc/time03_80.svg" style="width:200px" alt="테스트 결과">
                    </div>
                    <div class="h12"></div>
                    <div class="center font_sbms">8~10시간</div>
                </c:when>
                <c:otherwise>
                    ${simpleTestVO.getCareTime()}
                </c:otherwise>
            </c:choose>

            <div class="h40"></div>

            <div class="box_normal marW-20">

                <div class="card">

                    <div class="card-content">

                        <div class="box noPad w56">
                            <div class="img_area w56">
                              <img src="/html/page/app/matching/assets/src/images/08etc/inst_40.svg" alt="혜택">
                            </div>
                            <div class="ctn_area">
                              <div class="font_sbmb">어르신 상황에 따라 이러한 혜택을 받을 수 있어요</div>
                            </div>
                        </div>
                        
                        <div class="h20"></div>

                        <div class="padL8">
                            <div class="waves-effect list_link bder_bottom font_sbmr" link="cmc00001" onclick="fn_other_click('daycare')">주야간보호센터 알아보기</div>
                            <div class="waves-effect list_link font_sbmr" link="cmc00002" onclick="fn_other_click('visitcare')">방문요양 알아보기</div>
                        </div>
                    </div>
                </div>


                <div class="h100"></div>

            </div>
            <!-- box -->


        </section>
    </main>

    <footer class="page-footer">

        <div class="relative">
            <a class="waves-effect btn-large btn_primary w100p" onclick="handleNextBtnClick()">혜택 상담받기</a>
        </div>

    </footer>
    
</div>

<jsp:include page="/WEB-INF/jsp/app/matching/common/checkExistInProgressConslt.jsp" />

<script>
    function handleNextBtnClick() {
        checkInProgressConsltOrOrder(
            '${inProgressConsltOrOrder}' && JSON.parse('${inProgressConsltOrOrder}'),
            () => {
                location.href = '/matching/membership/conslt/infoConfirm?prevPath=care&recipientsNo=${mbrRecipientsVO.recipientsNo}'
            },
            Boolean('${mbrRecipientsVO.consultBplcUniqueId != null && !mbrRecipientsVO.consultBplcUniqueId.isEmpty()}'),
            'care'
        );
    }

    $(function () {
    	//뒤로가기 재정의
    	backBtnEvent = function() {
    		location.href = '/matching/main/service';
    	}
    	
    	//에어브릿지 테스트 결과 이벤트 발송 (matching/common/appCommon)
    	sendAirbridgeForTest('대상', location.href);
    	
    	
        $("body").addClass("back_gray02");

        
        $('.list_link').click(function(){
            location.href = '/matching/bbs/guide/linkview/' + $(this).attr('link')
        });
        
    });

    function fn_other_click(carekind){
        if (carekind == 'visitcare'){
            location.href = '/matching/bbs/guide/linkview/cmc00002'
        }else if (carekind == 'daycare'){
            location.href = '/matching/bbs/guide/linkview/cmc00001'
        }
        
    }
</script>    