<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="" name="addButton" />
	    </jsp:include>
	    
		<!--http://local-on.eroum.co.kr/html/page/app/matching/assets/src/pages/F_SNR_002_om_deleg_info.html-->

        <main>
            <section class="intro">

                <h3 class="title">
                    서비스 이용을 위해<br>
                    어르신의 동의가 필요해요
                </h3>

                <div class="marT8 d-flex gap04">
                    <div class="icon_btn i_sert"></div>
                    <div class="color_t_s font_sbsr">입력한 정보는 어르신이 맞는 지 확인하는데만 사용하니 안심하세요.</div>
                </div>

                <div class="h40"></div>


                <div class="om_deleg_area">

                    <div class="family_area">

                        <div class="family_sel dept1">
                            <div class="item me active">
                                <span class="txt font_sbss">본인</span>
                            </div>
                        </div>

                        <div class="family_sel dept1">
                            <div class="item grandpa active">
                                <span class="txt font_sbss">어르신</span>
                            </div>
                        </div>

                    </div>

                    <div class="flow_area">

                        <div class="flow_01">
                            <div class="box_flow01">1. 동의요청</div>
                            <div class="box_flow02"><span class="back">문자전송</span></div>

                        </div>
                        <div class="flow_02">
                            <div class="dummy"></div>
                            <div class="box_flow01">2. 동의 절차 진행</div>
                        </div>
                        <div class="flow_03">
                            <div class="box_flow01">3. 위임 완료</div>
                            <div class="box_flow02"><span class="back">문자전송</span></div>
                        </div>


                    </div>


                </div>



            </section>
        </main>

        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary modal-trigger" href="#modal_memConsent">위임 동의받기</a>
            </div>

        </footer>



        <!-- Modal modal_broad -->
        <div id="modal_memConsent" class="modal bottom-sheet">

            <div class="modal_header">
                <h4 class="modal_title">어르신 위임을 진행해요</h4>
                <div class="close_x modal-close waves-effect"></div>
            </div>

            <div class="modal-content">

                <div class="color_t_s font_sbmr">
                    어르신의 휴대폰으로 동의를 요청합니다.<br>
                    유효시간 안에 동의할 수 있도록 미리 알려주세요.
                </div>

                <div class="h20"></div>

                <input type="checkbox" name="" id="chk_join_t" class="chk02 large border_gray total_evt">
                <label for="chk_join_t">전체 동의하기</label>

                <div class="h20"></div>


                <div class="group_chk_area">
                    <span class="icon_btn i_right waves-effect modal-trigger" data-target="modal_termskind_view" terms_kind="recipientprivacy"></span>
                    <div>
                        <input type="checkbox" name="" id="chk_j01" class="chk01_2 large total_evt_sub">
                        <label for="chk_j01">[필수] 개인정보 처리에 관한 위임</label>
                    </div>
                </div>
                <div class="group_chk_area">
                    <span class="icon_btn i_right waves-effect modal-trigger" data-target="modal_termskind_view" terms_kind="recipientsensitive"></span>
                    <div>
                        <input type="checkbox" name="" id="chk_j02" class="chk01_2 large total_evt_sub">
                        <label for="chk_j02">[필수] 개인정보 및 민감정보 수집 및 이용(어르신 위임) </label>
                    </div>
                </div>

                <div class="h20"></div>


            </div>
            <!-- modal-content -->
            <div class="modal-footer">
                <div class="btn_area d-flex">
                    <a class="modal-close waves-effect btn btn-large w100p btn_primary" disabled="disabled">동의하고 신청하기</a>
                </div>
            </div>

        </div>
        <!-- modal_broad -->

		<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/termskindModal.jsp" />
		


    </div>
    <!-- wrapper -->

	
	<script>
		function clickNextBtn() {
			location.href = '/matching/membership/info/identityVerification' + location.search;
		}

		function clickCheckValidate() {
			
			if ($('.group_chk_area :checkbox').length > 0 && $('.group_chk_area :checkbox:checked').length == $('.group_chk_area :checkbox').length){
				$('#modal_memConsent .modal-footer .btn_primary').removeAttr("disabled");
			}else{
				$('#modal_memConsent .modal-footer .btn_primary').attr("disabled", "disabled");
			}
		}
		
		$(function() {
			$('#modal_memConsent .modal-footer .btn_primary').click(clickNextBtn);

			$('.total_evt').click(clickCheckValidate);

			$(".group_chk_area :checkbox").click(clickCheckValidate);

			$(".icon_btn ").click(function() {
				fn_terms_view_modal_call($(this).attr("terms_kind"));
			});
		})
        
        $(window).on('pageshow', clickCheckValidate);
	</script>