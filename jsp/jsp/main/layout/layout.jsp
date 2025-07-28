<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

	<!-- open graph -->
    <meta property="og:url" content="https://eroum.co.kr${_curPath}" >
    <meta property="og:type" content="website" >
    <meta property="og:image" content="https://eroum.co.kr/html/page/market/assets/images/og_img.png" >
    <meta property="og:title" content="이로움ON : 시니어 정보 플랫폼" >
    <meta property="og:description" content="장기요양인정 등급 테스트부터 우리 동네 복지혜택, 복지용구 구매까지. 소중한 부모님과 나를 위한 서비스를 이로움온이 제공합니다." >

    <title>이로움ON : 시니어 정보 플랫폼</title>
    <meta name="description" content="장기요양인정 등급 테스트부터 우리 동네 복지혜택, 복지용구 구매까지. 소중한 부모님과 나를 위한 서비스를 이로움온이 제공합니다.">

    <!-- [마케팅] 네이버 서치어드바이저 사이트 소유 확인 -->
	<meta name="naver-site-verification" content="d94504c5096258a47ea55b99f98a207e54188968" />

    <!-- Google tag (gtag.js) -->
    <c:set var="googleAnalyticsId"><spring:eval expression="@props['Google.Analytics.Id']"/></c:set>
    <c:set var="googleAnalyticsGTM"><spring:eval expression="@props['Google.Analytics.GTM']"/></c:set>
    
    <script async src="https://www.googletagmanager.com/gtag/js?id=${googleAnalyticsId}"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', '${googleAnalyticsId}');
    </script>
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','${googleAnalyticsGTM}');</script>
    <!-- End Google Tag Manager -->

    <link id="favicon" rel="shortcut icon" href="/html/core/images/favicon.ico" sizes="16x16">

    <!-- plugin -->
    <link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.css">
    <script src="/html/core/vendor/jquery/jquery-3.6.0.min.js"></script>
    <script src="/html/core/vendor/jquery.validate/jquery.validate.min.js"></script>

    <script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>
    <script src="/html/core/vendor/masonry/masonry.pkgd.min.js"></script>

    <link rel="stylesheet" href="/html/page/index/assets/style/style.min.css">
    <!-- <link rel="stylesheet" href="/html/page/index/assets/style/style_add.css"> -->
    
    <script src="/html/core/script/hangjungdong.js"></script>
    <script src="/html/page/index/assets/script/index.js"></script>
    <script src="/html/core/script/JsCommon.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="/html/core/script/JsCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    
    <!-- 마켓팅팀 요청 head 태그안 삽입 코드 -->
    <jsp:include page="/WEB-INF/jsp/common/common_marketing_head_tag.jsp" />
    
</head>

<body>
	<!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=${googleAnalyticsGTM}" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->

	<tiles:insertAttribute name="aside"/>

	<tiles:insertAttribute name="header"/>

	<main id="container">

		<tiles:insertAttribute name="breadcrumb"/>

		<tiles:insertAttribute name="content"/>

	</main>

	<tiles:insertAttribute name="footer"/>

	<div id="modalSrvcDtl"></div>

	<script src="/html/core/vendor/twelements/index.min.js"></script>
    <script src="/html/core/vendor/twelements/popper.min.js"></script>

	<!-- 채널톡 연동처리 -->
	<jsp:include page="/WEB-INF/jsp/common/channel_talk.jsp" />
	
	<!-- GA 이벤트 -->
	<jsp:include page="/WEB-INF/jsp/common/ga4_event.jsp" />
	
    <script type="text/javascript">
        var jsCommon = null;
        $(document).ready(function() {
            jsCommon = new JsCommon();
    
            jsCommon.fn_keycontrol();
        });
    </script>

	<!-- 마켓팅팀 요청 body 태그안 삽입 코드 -->
    <jsp:include page="/WEB-INF/jsp/common/common_marketing_body_tag.jsp" />
    
    <!--돌봄앱 모달-->
    <jsp:include page="/WEB-INF/jsp/common/modal/dolbom_app_modal.jsp" />
    
    <!-- 예상치 못한 오류 팝업 -->
    <div class="modal modal-default fade" id="modalError" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content">
                <div class="modal-header">
                </div>
                <div class="modal-body md:min-w-[26rem]">
                    <!-- 예상치 못한 오류로 결과를 확인할 수 없는 상황에 호출되는 모달(팝업) -->
                    <div class="flex flex-col items-center text-xl">
                        <i class="mb-8 ico-alert orange"></i>
                        <p>죄송합니다</p>
                        <p><strong>일시적 오류</strong>가 발생했습니다</p>
                        <p>잠시후 다시 시도해 주세요</p>
                    </div>
                    <!--// 예상치 못한 오류로 결과를 확인할 수 없는 상황에 호출되는 모달(팝업) -->
                </div>
                <div class="modal-footer">
                    <a href="/main/cntnts/test" class="btn btn-primary">테스트 시작하기</a>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
