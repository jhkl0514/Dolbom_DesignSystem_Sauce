

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <c:set var="naverSiteVerification"><spring:eval expression="@props['Naver.Site.Verification']"/></c:set>
    <c:if test="${!empty naverSiteVerification}">
	<meta name="naver-site-verification" content="${naverSiteVerification}" />
	</c:if>

    <title>통합회원</title>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

    <link rel="stylesheet" href="/html/page/members/assets/style/style.min.css">

    <script src="/html/core/vendor/rsa/RSA.min.js" /></script>
    <script src="/html/page/members/assets/script/common.js"></script>
    
    <script src="/html/core/script/JsCommon.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script src="/html/core/script/JsCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    

	<!-- 네이버 연관채널 SEO -->
    <span itemscope="" itemtype="http://schema.org/Organization">
	<link itemprop="url" href="https://eroum.co.kr">
	<a itemprop="sameAs" href="https://play.google.com/store/apps/details?id=kr.co.eroum"></a>
	</span>
</head>
<body>
	<%-- 로그인 --%>
    <main id="container">
        <header id="page-title">
            <h2>
                <span>로그인</span>
                <small>Login</small>
            </h2>
        </header>

        <div id="page-content">
            <form action="/membership/loginAction" method="post" id="loginFrm" name="loginFrm" class="login-form">
	            <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}">
				<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}">
				<input type="hidden" id="encPw" name="encPw" value="">
                <fieldset>
                    <legend>이로움ON 계정 로그인</legend>
                    <div class="form-group">
                        <label class="form-label" for="login-item1">아이디</label>
                        <input class="form-control" type="text" id="mbrId" name="mbrId">
                        <!-- <div id="loginId-error" class="error text-danger">! 아이디를 입력해 주세요.</div> -->

                        <label class="form-label" for="login-item2">비밀번호</label>
                        <input class="form-control" type="password" id="mbrPw" name="mbrPw">

                        <button class="btn btn-primary form-submit" type="submit">로그인</button>
                    </div>
                    <!--div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="saveId" name="saveId" value="Y">
                        <label class="form-check-label" for="saveId">아이디 저장</label>
                    </div-->
                    <!--div class="form-link">
                        <a href="${_membershipPath}/srchId" class="link">아이디 찾기</a>
                        <a href="${_membershipPath}/srchPswd" class="link">비밀번호 찾기</a>
                        <a href="${_membershipPath}/regist" class="btn btn-small">회원가입</a>
                    </div-->
                </fieldset>
            </form>

        </div>
    </main>
</body>
<script>
    $(function(){
        const f_rsa_enc = function(v) {
            var rpkm = document.getElementById("rsaPublicKeyModulus").value;
			var rpke = document.getElementById("rsaPublicKeyExponent").value;
            let rsa = new RSAKey();
            rsa.setPublic(rpkm,rpke);
            return rsa.encrypt(v);
        }

        $('#loginFrm')
	    	.submit(function(e){e.preventDefault();})
			.validate({
				onkeyup: false,
	            rules: {
	            	mbrId: { required: true }
	                , mbrPw: { required: true }
	            },
	            messages : {
	            	mbrId : {required : "! 아이디를 입력해 주세요."}
	            	, mbrPw : {required : "! 비밀번호를 입력해 주세요."}
				},
		  	    onfocusout: function(el) { // 추가
	                if (!this.checkable(el)){this.element(el); }
	            },
	    	    errorPlacement: function(error, element) {
	    		    var group = element.closest('.search-group');
	    		    if (group.length) {
	    		        group.after(error.addClass('text-danger'));
	    		    } else {
	    		        element.after(error.addClass('text-danger'));
	    		    }
	    		},
			    submitHandler: function (frm) {
				    var encPassword = f_rsa_enc(document.getElementById("mbrPw").value);
                    var action = 'login.json' + ((location.search == undefined || location.search.length < 1)?"":location.search);
					$('<form>', {
						'action': action,
						'method': 'post'
					}).append($('<input>',{
						'name': 'mbrId',
						'value': frm.mbrId.value,
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'encPw',
						'value': encPassword,
						'type': 'hidden'
					})).appendTo('body').submit();
					return false;
			    }
	        });
    });
    
</script>