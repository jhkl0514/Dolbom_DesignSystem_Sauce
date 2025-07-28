<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="" name="addButton" />
	        <jsp:param value="설정" name="addTitle" />
	    </jsp:include>
	    
	    
	    <main>
            <section class="default noPad">

                <div class="back_gray h12"></div>

                <div class="box_normal padH12W20">
                    <div class="waves-effect list_link " onclick="location.href='/matching/membership/info/setting/mypage';">
                        <span class="font_sbms">내 정보</span>
                        <span class="font_sbmr">${mbrVO.mbrNm}</span>
                    </div>
                    <div class="waves-effect list_link font_sbms" onclick="location.href='/matching/membership/info/setting/sns';">SNS 연결</div>
                </div>

                <div class="back_gray h12"></div>

                <div class="box_normal padH8W20">
                    <div class="waves-effect list_link font_sbms" onclick="location.href='/matching/membership/info/setting/noti';">알림 설정</div>
                </div>

                <div class="back_gray h12"></div>

                <div class="box_normal padH8W20">
                    <div class="waves-effect list_link font_sbms" onclick="clickLogoutBtn();">로그아웃</div>
                </div>
                
            </section>
        </main>
	    
	</div>
	<!-- wrapper -->