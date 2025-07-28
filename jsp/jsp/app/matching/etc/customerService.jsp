<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="고객센터" name="addTitle" />
    </jsp:include>

    
    <main>
        <section class="default bottom_0 noPad">

            <div class="box_normal pad20">

                <h5 class="title">어떤 도움이 필요하세요?</h5>

                <div class="h20"></div>

                <div class="waves-effect box_custom_service back_FFF5E6">
                    <div class="ctn_area">
                        <a onclick="moveToConslt();">
                            <div class="font_sbsr color_t_s">상담 관련 문의</div>
                            <div class="font_sbmb">어르신의 장기요양기관</div>
                        </a>
                    </div>
                    <div class="img_area">
                        <object data="/html/page/app/matching/assets/src/images/08etc/bp_40.svg" style="width:80px;height:80px;"></object>
                        <!-- <img src="/html/page/app/matching/assets/src/images/08etc/bp_40.svg" style="width:80px;height:80px;" alt="혜택"> -->
                    </div>
                </div>

                <div class="waves-effect box_custom_service back_F5F5F5">
                    <div class="ctn_area">
                        <a href="channelTalk">
                            <div class="font_sbsr color_t_s">상담 외 기타 문의</div>
                            <div class="font_sbmb">이로움ON 고객센터</div>
                        </a>
                    </div>
                    <div class="img_area">
                        <img src="/html/page/app/matching/assets/src/images/08etc/erounon_40.svg" alt="혜택">
                    </div>
                </div>

            </div> 

            <div class="h12"></div>

            <div class="box_normal pad20">
                <div class="waves-effect list_link font_sbms" bbsKind="faq">자주 묻는 질문</div>
                <div class="waves-effect list_link font_sbms marT4" bbsKind="ntce">공지사항</div>
            </div>



        </section>
    </main>



</div>

<script>
	var isLoginCheck = ${_matMbrSession.loginCheck};
	var consltNo = '${consltNo}';
	

	//대표수급자의 상담내역 > 사업소 정보 바텀시트로 이동
	function moveToConslt() {
		if (!isLoginCheck) {
			showAlertPopup('로그인이 필요합니다');
			return;
		}
		if (!consltNo) {
			showAlertPopup('대표 어르신의 상담내역이 없어요. 상담을 신청해주세요.');
			return;
		}
		location.href = '/matching/membership/conslt/detail?consltNo=' + consltNo + '&bplcInfoOpen=Y';
	}

    $(function () {
    	$("body").addClass("back_gray");
    	
        $('.list_link').on('click', function () {
            var bbsKind = $(this).attr("bbsKind");
            location.href = "/matching/bbs/" + bbsKind + "/list";
        });
    });
</script>