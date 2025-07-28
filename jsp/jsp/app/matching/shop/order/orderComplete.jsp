<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문요청완료</title>
    
    <style>
    </style>
    <script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>
    <script type="text/javascript">
    
    $(function() {
    	//백버튼 클릭 시 어르신 페이지로 이동
        backBtnEvent = function() {
        	location.href = '/matching/membership/recipients/subMain';
        }
    });
    </script>
</head>
<body>
	<!-- 상단 뒤로가기 버튼 추가 -->
	<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
	
    <div class="wrapper align_center">
        <header>
            <nav class="top">
                <a class="btn_back waves-effect" href="#">
                    <span class="txt">주문요청완료</span>
                </a>
                <div class="d-flex">
                    <div class="icon_area waves-effect">
                        <div class="icon_btn i_home" onclick="location.href='/matching/main/service';"></div>
                    </div>
                </div>
            </nav>
        </header>
        <div class="center">
            <dotlottie-player src="https://lottie.host/fff4dbed-b0e4-4097-9854-02246a1e40f8/HMaoyCXoc7.json" background="transparent" speed="1" style="width: 100%; height: 120px;" autoplay></dotlottie-player>
            <div class="h12"></div>
            <p class="color_t_p font_shm">주문요청 되었어요</p>
            <div class="h08"></div>
            <div class="color_t_s funt_sbsr">장기요양기관에서 검토 후 주문이 진행돼요</div>
            <div class="color_t_t funt_sbsr">주문서번호 ${ordMCd}</div>
          </div>
        <footer class="page-footer">
            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p" onclick="location.href='/matching/shop/order/detail?ordMCd=${ordMCd}';">주문요청상세 보기</a>
            </div>
        </footer>
    </div>
</body>