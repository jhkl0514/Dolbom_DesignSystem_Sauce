<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="" name="addButton" />
	    </jsp:include>
	    
	    
       <main>
            <section class="intro">

                <h3 class="title">
                    수정할 이메일을<br>입력해주세요 
                </h3>

                <div class="h40"></div>

                <label class="input_label">이메일</label>
                <input id="inputEmail" type="email" class="input_basic">
                <div id="emailErrorMsg" class="vaild_txt error disNone">이메일을 확인해주세요</div>

            </section>
        </main>
        

        <footer class="page-footer">
            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p" onclick="clickUpdateEmailBtn();">수정하기</a>
            </div>
        </footer>
	    	    
	</div>
	<!-- wrapper -->
	
	
	<script>
		var emailchk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		function validate() {
			var isValid = true;
			var inputEmail = $('#inputEmail');
			var email = inputEmail.val();
			
			if (!email || !emailchk.test(email)) {
				inputEmail.addClass('bder_danger');
				$('#emailErrorMsg').removeClass('disNone');
				isValid = false;
			}
			return isValid;
		}
		
		function clickUpdateEmailBtn() {
			var isValid = validate();
			if (!isValid) {
				return;
			}
			
			var inputEmail = $('#inputEmail');
			var email = inputEmail.val();
			
			callPostAjaxIfFailOnlyMsg('/matching/membership/info/setting/updateEmail.json', { email }, function() {
				backBtnEvent();
			});
		}
	</script>