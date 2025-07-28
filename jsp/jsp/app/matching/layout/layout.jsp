<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, minimum-scale=1, user-scalable=0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    
    <script src="/html/core/vendor/jquery/jquery-3.6.0.min.js"></script>

	<c:set var="googleAnalyticsMatchingId"><spring:eval expression="@props['Google.Analytics.Matching.Id']"/></c:set>
	<c:set var="googleAnalyticsMatchingGTM"><spring:eval expression="@props['Google.Analytics.Matching.GTM']"/></c:set>
	

	
	<script async src="https://www.googletagmanager.com/gtag/js?id=${googleAnalyticsMatchingId}"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', '${googleAnalyticsMatchingId}');
	</script>

		<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
	new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer',"${googleAnalyticsMatchingGTM}");</script>
	<!-- End Google Tag Manager -->
	

    <script src="/html/core/script/matching/airbridgeEvent.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="/html/core/script/matching/ajaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="/html/core/script/matching/cookie.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="/html/core/script/matching/localStorage.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="https://js.bootpay.co.kr/bootpay-4.2.5.min.js" type="application/javascript"></script>
    <!-- materialize -->
 	<script type="text/javascript" src="/html/page/app/matching/assets/src/js/materialize.min.js?v=<spring:eval expression="@version['assets.version']"/>"></script>

	<script type="text/javascript" src="/html/page/app/matching/assets/src/js/custom/guide.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script type="text/javascript" src="/html/core/script/JsCommon.js?v=<spring:eval expression="@version['assets.version']"/>"></script>

    <!-- materialize CSS -->
    <link rel="stylesheet" href="/html/page/app/matching/assets/src/css/materialize.min.css?v=<spring:eval expression="@version['assets.version']"/>" />
    <!-- style.css -->
    <link rel="stylesheet" href="/html/page/app/matching/assets/src/css/style.css?v=<spring:eval expression="@version['assets.version']"/>">
    <!-- favicon -->
    <link id="favicon" rel="shortcut icon" href="/html/core/images/favicon.ico" sizes="16x16">
    
    <!-- lottie -->
  	<script src="/html/page/app/matching/assets/lottie/lib/dotlottie-player.js" ></script>

 	<script type="text/javascript" src="/html/core/script/JsHouse2309PopupBase.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
 	
	<!-- Airbridge(에어브릿지) --> 	
 	<script>
	(function(a_,i_,r_,_b,_r,_i,_d,_g,_e){if(!a_[_b]){var n=function(){var c=i_.createElement(r_);c.onerror=function(){g.queue.filter(function(a){return 0<=_d.indexOf(a[0])}).forEach(function(a){a=a[1];a=a[a.length-1];"function"===typeof a&&a("error occur when load airbridge")})};c.async=1;c.src=_r;"complete"===i_.readyState?i_.head.appendChild(c):a_.addEventListener("load",function h(){a_.removeEventListener("load",h);i_.head.appendChild(c)})},g={queue:[],get isSDKEnabled(){return!1}};_i.concat(_d).forEach(function(c){var a=c.split("."),h=a.pop();a.reduce(function(p,q){return p[q]=p[q]||{}},g)[h]=function(){g.queue.push([c,arguments])}});a_[_b]=g;0<_g?(_b=new (a_.XDomainRequest||a_.XMLHttpRequest),_i=function(){},_b.open("GET",_r),_b.timeout=_g,_b.onload=function(){n()},_b.onerror=_i,_b.onprogress=_i,_b.ontimeout=_i,_b.send()):n()}})(window,document,"script","airbridge","//static.airbridge.io/sdk/latest/airbridge.min.js","init startTracking fetchResource setBanner setDownload setDownloads openDeeplink setDeeplinks sendWeb setUserAgent setUserAlias addUserAlias setMobileAppData setUserId setUserEmail setUserPhone setUserAttributes clearUser setDeviceAlias removeDeviceAlias clearDeviceAlias setDeviceIFV setDeviceIFA setDeviceGAID events.send events.signIn events.signUp events.signOut events.purchased events.addedToCart events.productDetailsViewEvent events.homeViewEvent events.productListViewEvent events.searchResultViewEvent".split(" "),["events.wait","createTouchpoint"],0);
	
	airbridge.init({
	    app: '${_airbridgeAppName}',
	    webToken: '${_airbridgeWebToken}'
	});
	
	//모바일에서는 웹 alert를 사용하지 않음
	window.alert = function() {};
	</script>
 	
 	
 	<style>
 		a {
			-webkit-user-drag: none;
    		-khtml-user-drag: none;
    		-moz-user-drag: none;
    		-o-user-drag: none;
    		user-drag: none;
		}
 	</style>
</head>
<body>
	
	<!-- Google Tag Manager (noscript) -->
	<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=${googleAnalyticsMatchingGTM}"
	height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<!-- End Google Tag Manager (noscript) -->

	

	<!-- 로딩 처리 -->
	<jsp:include page="/WEB-INF/jsp/app/matching/common/pageLoading.jsp" />
	
	<tiles:insertAttribute name="content"/>
	
	<!-- 네트워크 오류 모달 -->
	<div id="modal_net_error" class="modal no_network">	
		<div class="h24"></div>
	
		<div class="modal-content">
	
			<p class="color_tp_s font_sbmr">
				네트워크가 연결되지 않았어요<br />
				Wi-Fi 또는 데이터를 확인해주세요
			</p>
	
		</div>
		<div class="modal-footer">
			<div class="btn_area d-flex">
				<a class="modal-close waves-effect btn btn-large w100p btn_primary">다시 시도</a>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/app/matching/common/appCommon.jsp" />
	<jsp:include page="/WEB-INF/jsp/app/matching/common/communicateWithMobile.jsp" />
</body>
</html>