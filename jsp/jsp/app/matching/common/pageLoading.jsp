<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- 로딩화면 -->
    <div class=""> <!-- 숨김 disNone -->
        <div class="loading_screen">
            <dotlottie-player src="/html/page/app/matching/assets/lottie/Loading.lottie" background="transparent" speed="1" style="width: 58px; height: 58px;" loop autoplay></dotlottie-player>
        </div>
    </div>
    
    
    <script>
	    window.onload = function() {
	        $('.loading_screen').addClass('disNone');
	    }
    </script>
    