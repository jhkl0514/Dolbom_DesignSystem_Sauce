<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% System.out.println("identityIntro 010"); %> 
	<div class="wrapper">
	
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="" name="addButton" />
	    </jsp:include>
	    <% System.out.println("identityIntro 020"); %> 
	    
	    <main>
            <section class="intro bottom_0">

                <h3 class="title">
                	정확한 서비스 제공을 위해<br>
                    본인인증이 필요해요
                </h3>

                <div class="marT8 d-flex gap04">
                    <div class="icon_btn i_sert"></div>    
                    <div class="color_t_s font_sbsr">
                    	본인인증 시 수집된 개인정보는 서비스 이외<br>
                    	다른 용도로 사용되지 않습니다.
                    </div>
                </div>


                <div class="align_center" style="height: calc(100vh - 96px - 68px - 80px);">
                    <img class="eld_reg_woman"  src="/html/page/app/matching/assets/src/images/09people/pp_07.svg" alt="">
                </div>
                
            </section>
        </main>


        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary" onclick="clickNextBtn();">다음</a>
            </div>

        </footer>
	    
	</div>
	<!-- wrapper -->
	
	<% System.out.println("identityIntro 030"); %> 
	<script>
		function clickNextBtn() {
			location.href = '/matching/membership/info/identityVerification' + location.search;
		}
		
		$(function() {
			if (location.search === '?type=integrated') {
				//통합회원 전환 인증 문구 설정
	            $('h3.title').html('통합회원 전환 시<br>본인인증이 필요해요');
			}
			
		})
	</script>