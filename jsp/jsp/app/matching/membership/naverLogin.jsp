<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
	
		<main>
	      <section class="intro">
	
			<h2 class="title">
				<span class="fw400">지금 로그인하시고 </span><br>
				연 160만원 복지 지원금 <br>
				<span class="fw400">상담 받으세요</span>
			</h2>
			
			<div class="marT8 color_tp_p font_shx">
				이로움돌봄
			</div>
	
	
	
	      </section>
	    </main>
	    
	    <footer class="page-footer">

	      <div class="btn_area d-flex f-column">
	        <div class="relative">
	          <span id="spanNaverRecentLogin" class="tool_tip disNone">최근로그인</span>
	          <a href="/matching/naver/get" class="waves-effect btn-large btn_naver w100p align_center">
	            <img class="icon_img" src="/html/page/app/matching/assets/src/images/08etc/icon_naver.svg">
	            <span><span class="fw700">네이버</span><span class="fw400">로 계속하기</span></span>
	          </a>
	        </div>
	        
	        <div class="relative">
	          <span id="spanOtherRecentLogin" class="tool_tip disNone">최근로그인</span>
	          <a href="/matching/membership/login" class="waves-effect btn-large btn_cancel w100p">통합회원으로 계속하기</a>
	        </div>
	      </div>
	
	
	    </footer>
	    
	</div>
	<!-- wrapper -->
	
	
	<script>
		function showNaverRecentLogin() {
			$('#spanNaverRecentLogin').removeClass('disNone');
		}
		function showEroumRecentLogin() {
			$('#spanOtherRecentLogin').removeClass('disNone');
		}
	
		$(function() {
			//최근로그인 가져오기 요청
			sendDataToMobileApp({ actionName: 'getRecentLgnTy' });
		})
	</script>