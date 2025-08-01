<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    
    <script src="/html/core/vendor/jquery/jquery-3.6.0.min.js"></script>
    <script src="/html/core/script/matching/ajaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="/html/core/script/matching/cookie.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="/html/core/script/matching/localStorage.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="https://js.bootpay.co.kr/bootpay-4.2.5.min.js" type="application/javascript"></script>
    <!-- materialize -->
 	<script type="text/javascript" src="/html/page/app/matching/assets/src/js/materialize.min.js"></script>

	<script type="text/javascript" src="/html/page/app/matching/assets/src/js/custom/guide.js?v=<spring:eval expression="@version['assets.version']"/>"></script>

    <!-- materialize CSS -->
    <link rel="stylesheet" href="/html/page/app/matching/assets/src/css/materialize.min.css" />
    <!-- style.css -->
    <link rel="stylesheet" href="/html/page/app/matching/assets/src/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/app/matching/common/appCommon.jsp" />
	<div class="wrapper align_center">


        <header>
            <nav class="top">
                <a class="btn_back waves-effect" onclick="backBtnEvent()">
                    <span class="icon"></span>
                    <!-- <span class="txt">상담 신청 완료</span> -->
                </a>
            </nav>
        </header>



        <div class="center">
            <img src="/html/page/app/matching/assets/src/images/08etc/page_default.svg"
                class="w150" alt="화면을 불러오지 못했어요">
            <div class="h12"></div>
            <p class="color_t_s font_sblr">화면을 불러오지 못했어요</p>
            <div class="h20"></div>
            <a class="modal-close waves-effect btn btn-middle btn_primary w120"
                onclick="retry();">다시 시도</a>
        </div>


    </div>
    <!-- wrapper -->
	
	<script>
		function retry() {
			location.reload();
			
			setTimeout(function() {
				showToastMsg('네트워크를 확인해주세요');
			}, 1000);
		}
	</script>
</body>
</html>