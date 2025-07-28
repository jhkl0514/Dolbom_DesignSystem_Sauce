<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<!-- 상단 뒤로가기 버튼 추가 -->
	    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	    	<jsp:param value="true" name="noBackButtion" />
	        <jsp:param value="상담 신청완료" name="addTitle" />
	        <jsp:param value="true" name="addHome" />
	        <jsp:param value="true" name="addShare" />
	    </jsp:include>
	

        <main>
            <section class="intro">

                <h3 class="title">신청이 완료되었어요</h3>

                <div class="h20"></div>

                <div class="align_center" style="padding-left: 32px;">
                    <dotlottie-player src="/html/page/app/matching/assets/lottie/membership_conslt_regist_complete.lottie" background="transparent" speed="1" style="width: 170px; height: 148px;" loop autoplay></dotlottie-player>
                </div>

                <div class="h16"></div>

                <div class="center font_sbmr">
                    장기요양기관에 연결 중이에요<br>
                    48시간 내 연락 드릴게요
                </div>

                <div class="h32"></div> 

                <div class="card">

                    <div class="card-content">

                      <span class="font_sbms">상담 신청 정보</span>
                      
                      <div class="h14"></div>

                      <table class="table_basic small">
                        <colgroup>
                            <col style="width:50%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="color_secondary font_sbmr">상담유형</th>
                                <td class="font_sbmr">
                                    ${prevPathMap[mbrConsltVO.prevPath]}
                                </td>
                            </tr>
                            <tr>
                                <th class="color_secondary font_sbmr">신청자 이름</th>
                                <td class="font_sbmr">${mbrConsltVO.rgtr}</td>
                            </tr>
                            <tr>
                                <th class="color_secondary font_sbmr">어르신 기본정보</th>
                                <td class="font_sbmr">
                                    ${relationNm}
                                    <c:if test="${relationNm ne mbrConsltVO.mbrNm}"> (${mbrConsltVO.mbrNm})</c:if>
                                </td>
                            </tr>
                            <tr>
                                <th class="color_secondary font_sbmr">상담받을 연락처</th>
                                <td class="font_sbmr">${mbrConsltVO.mbrTelno}</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="h16"></div>

                    <a class="waves-effect btn-large btn_default w100p" onclick="location.href='/matching/membership/conslt/detail?consltNo=${mbrConsltVO.consltNo}';">상담상세</a>
          
                    </div>
                  </div>
                  <!-- card -->

            </section>
        </main>


        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p" onclick="clickMoreInformation();">더 알아보기</a>
            </div>

        </footer>
        
	</div>
	<!-- wrapper -->
    <div id="modal_share_conslt" class="modal bottom-sheet">
        <div class="modal_header" style="padding: 32px 20px 0;">
            <h4 class="modal_title"> </h4>
            <div class="close_x modal-close waves-effect"></div>
        </div>
    
        <div class="img_system_ins" style="top:-50px;left: -10px;">
            <dotlottie-player src="/html/page/app/matching/assets/lottie/coun/coun_share.json" background="transparent" speed="1" style="width: 100%; height: 160px;" loop autoplay></dotlottie-player>
        </div>
    
        <div class="modal-content">
            <div class="color_tp_s font_sblb">주변에도 혜택을 공유해주세요</div>
            <div class="h12"></div>
            <p class="color_t_s font_sbmr">
                몸이 불편한 어르신이 장기요양 혜택을 받을 수 있도록 공유해주세요.
            </p>
        </div>
    
        <div class="modal-footer">
            <div class="btn_area d-flex">
                <a class="modal-close waves-effect btn btn-large w100p btn_primary sharebtn conslt complete" onclick="handleShareBtnClick()">공유하기</a>
            </div>
        </div>
    </div>
	
	
	<script>
        const KEY_IS_FIRST_CONSLT_HANDLED = 'KEY_IS_FIRST_CONSLT_HANDLED_';

		function clickMoreInformation() {
			location.href = '/matching/bbs/guide/list';
		}
        
        function handleShareBtnClick() {
            shareBtnClick('more');
            $('#modal_share_conslt').modal('close');
        }
	
		$(function() {
	        //뒤로가기 재정의
	        backBtnEvent = function() {
	            location.href = '/matching/main/service';
	        }
			
	
			//상담 정보 입력 페이지부터 최근 이력 삭제
			removeHistoryStackFrom('/matching/membership/conslt/infoConfirm');
			
			//body에 css class 추가
			$('body').addClass('back_gray');

            const firstConsltHandleKey = KEY_IS_FIRST_CONSLT_HANDLED + '${mbrConsltVO.consltNo}';
            if ('${isFirstConslt}' === 'true' && !getInLocalStorage(firstConsltHandleKey)) {
                showShareModal();
                saveInLocalStorage(firstConsltHandleKey, true);
            }
		});

        function showShareModal() {
            $('.modal').modal({
                inDuration: 500  // 모달 열릴 때의 속도
            });

            setTimeout(function () {
                $('#modal_share_conslt').modal('open');
            }, 1000);
        }
	</script>
