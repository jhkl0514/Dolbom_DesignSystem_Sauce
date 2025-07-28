<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="" name="addButton" />
	        <jsp:param value="내정보" name="addTitle" />
	    </jsp:include>
	    
	    
	    <main>
            <section class="default bottom_0">

                <label class="input_label">이름</label>
                <div class="flex_input_btn">
                    <input type="text" class="input_basic" value="${mbrVO.mbrNm}" readonly>
                    <a class="waves-effect btn-large btn_cancel" onclick="$('#modal_request').modal('open');">수정</a>
                </div>

                <div class="h32"></div>

                <label class="input_label">휴대폰번호</label>
                <div class="flex_input_btn">
                    <input type="tel" class="input_basic" value="${mbrVO.mblTelno}" readonly>
                    <a class="waves-effect btn-large btn_cancel" onclick="$('#modal_request').modal('open');">수정</a>
                </div>           

                <div class="h32"></div>

                <label class="input_label">이메일</label>
                <div class="flex_input_btn">
                    <input type="email" class="input_basic" value="${mbrVO.eml}" readonly>
                    <a class="waves-effect btn-large btn_cancel" onclick="clickUpdateEmailBtn();">수정</a>
                </div>           

            </section>
        </main>


        <div class="padH12W20">
            <div class="waves-effect padH16 w100p color_t_s font_sbmr" onclick="location.href='/matching/membership/info/confirmWithdrawal';">회원탈퇴</div>

            <div class="h40"></div>
        </div>
	    	    
	</div>
	<!-- wrapper -->
	
	<!-- 본인인증 요청 모달 -->
	<div id="modal_request" class="modal bottom-sheet">

        <div class="modal_header">
            <h4 class="modal_title">본인인증을 해주세요</h4>
            <div class="close_x modal-close waves-effect"></div>
        </div>

        <div class="modal-content">

			이름이나 휴대폰번호 변경 시 본인인증이 필요해요

            <div class="h32"></div>

        </div>
        <!-- modal-content -->
        <div class="modal-footer">
            <div class="btn_area d-flex">
                <a class="waves-effect btn btn-large w100p btn_primary" onclick="clickUpdateNameAndPhone();">확인</a>
            </div>
        </div>

    </div>
	
	
	<script>
		var lgnTy = '${mbrVO.lgnTy}';
	
		//본인인증 확인 클릭
		function clickUpdateNameAndPhone() {
			location.href = '/matching/membership/info/identityVerification?type=mypage';
		}
	
		//이메일 변경 클릭
		async function clickUpdateEmailBtn() {
			var answer = await showConfirmPopup('정말 수정하시겠어요?', '정확한 정보를 입력하셔야 필요한 정보를 받을 수 있어요', '수정하기');
			if (answer === 'confirm') {
				location.href='/matching/membership/info/setting/email';
			}
		}
	</script>