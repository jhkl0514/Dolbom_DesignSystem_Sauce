<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
	
		<main>
	      <section class="intro">

	        <h3 class="title">
	            로그인
	        </h3>
			<div class="marT8 color_t_s font_sbsr">
				하나의 아이디로 이로움ON 통합서비스를<br>
				이용할 수 있습니다
			</div>
	
	        <div class="h40"></div>
	        <form action="">
	
	            <label for="mbrId" class="input_label">아이디</label>
	            <input id="mbrId" type="text" class="input_basic bder_danger" >
				<div id="idErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
	
	            <div class="h20"></div>
	
	            <label for="mbrPw" class="input_label">비밀번호</label>
	            <input id="mbrPw" type="password" class="input_basic bder_danger" >
	            <div id="pwErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
	
	            <div class="h32"></div>

				<!-- 
            	<a class="align_center waves-effect color_t_s font_sbsr" onclick="$('#modal_srch_fullsreen').modal('open');">아이디와 비밀번호를 잊으셨나요?</a>
				-->
	
	        </form>
	
	
	
	      </section>
	    </main>
	    
	    <footer class="page-footer">

	      <div class="btn_area d-flex f-column">

	        <div class="relative">
	          <a class="waves-effect btn-large btn_primary w100p" onclick="clickLoginBtn();">로그인하기</a>
	        </div>
	      </div>
	
	
	    </footer>
	    
	</div>
	<!-- wrapper -->
	
	<!-- 아이디 및 비밀번호 찾기 팝업 -->
    <div id="modal_srch_fullsreen" class="modal fullscreen">

      <div class="modal_header">
        <h4 class="modal_title"></h4>
        <div class="close_x modal-close waves-effect"></div>
      </div>

      <div class="modal-content">
		
      </div>
      <!-- modal-content -->

      <div class="modal-footer">
        <div class="btn_area d-flex">
          <a class="modal-close waves-effect btn btn-large w100p btn_primary">확인</a>
        </div>
      </div>

    </div>
    <!-- 약간동의 상세 팝업 -->
	
	
	
	<script src="/html/core/vendor/rsa/RSA.min.js" /></script>
	<script>
		var actionType = '${_type}';
	
		function initailize() {
			var inputMbrId = $('#mbrId');
			var inputMbrPw = $('#mbrPw');
			inputMbrId.val('');
			inputMbrPw.val('');
			inputMbrId.removeClass('bder_danger');
			inputMbrPw.removeClass('bder_danger');
			
			$('#idErrorMsg').addClass('disNone');
			$('#pwErrorMsg').addClass('disNone');
		}
		
		function validate() {
			var valid = true;
			var inputMbrId = $('#mbrId');
			var inputMbrPw = $('#mbrPw');
			var mbrId = inputMbrId.val();
			var mbrPw = inputMbrPw.val();
			
			var idErrorMsg = $('#idErrorMsg');
			var pwErrorMsg = $('#pwErrorMsg');
			
			if (!mbrId) {
				inputMbrId.addClass('bder_danger');
				idErrorMsg.removeClass('disNone');
				idErrorMsg.text('아이디를 입력해주세요');
				valid = false;
			} else {
				inputMbrId.removeClass('bder_danger');
				idErrorMsg.addClass('disNone');
			}
			
			if (!mbrPw) {
				inputMbrPw.addClass('bder_danger');
				pwErrorMsg.removeClass('disNone');
				pwErrorMsg.text('비밀번호를 입력해주세요');
				valid = false;
			} else {
				inputMbrPw.removeClass('bder_danger');
				pwErrorMsg.addClass('disNone');
			}
			
			return valid;
		}
	
		function clickLoginBtn() {
			var valid = validate();
			if (!valid) {
				return;
			}
			
			var rsaPublicKeyModulus = '${publicKeyModulus}';
			var rsaPublicKeyExponent = '${publicKeyExponent}';
			
			var mbrId = $('#mbrId').val();
			var mbrPw = $('#mbrPw').val();
			var encPw = f_rsa_enc(mbrPw, rsaPublicKeyModulus, rsaPublicKeyExponent);
			
			var actionUrl;
			var afterAction;
			if (actionType === 'whdwl') {
				actionUrl = '/matching/membership/loginWhdwlAction';
				afterAction = function(result) {
					location.href = '/matching/membership/info/whdwlAction';
				}
			} else {
				actionUrl = '/matching/membership/loginAction';
				afterAction = function(result) {
					location.href = '/matching/membership/loginAfterAction?loginType=E';
				}
			}
			
			callPostAjaxIfFailOnlyMsg(actionUrl, {mbrId, encPw}, afterAction);
		}
	
		function f_rsa_enc(v, rpkm, rpke) {
			let rsa = new RSAKey();
			rsa.setPublic(rpkm,rpke);
			return rsa.encrypt(v);
		}
		
		$(function() {
			initailize();
		})
	</script>