<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>dashboard</title>

    <link id="favicon" rel="shortcut icon" href="/html/core/images/favicon.ico" sizes="16x16">

    <!-- plugin -->
    <link rel="stylesheet" href="/html/core/vendor/jstree/dist/themes/default/style.min.css">
    <link rel="stylesheet" href="/html/core/vendor/jquery/jquery-ui.min.css">

    <script src="/html/core/vendor/jquery/jquery-3.6.0.min.js"></script>
    <script src="/html/core/vendor/jquery/jquery-ui.min.js"></script>
    <script src="/html/core/vendor/jquery.validate/jquery.validate.min.js"></script>

	<!-- common -->
    <script src="/html/core/script/utility.js"></script>

    <!-- admin -->
    <link rel="stylesheet" href="/html/page/admin/assets/style/style.min.css">
    <script src="/html/page/admin/assets/script/common.js"></script>
    <script src="/html/core/script/matching/cookie.js"></script>
    
    <script>
        
        <c:set var="ProfilesActive"><spring:eval expression="@props['Profiles.Active']"/></c:set>
        <c:if test="${ProfilesActive == 'local'}">
            setCookie("${cookieName}", "${cookieValue}", 7);
        </c:if>
    </script>
    
</head>
<body style="background-color:#111">
    <div class="introduce-wrapper">
        <div class="market-title">eroum market</div>

        <div class="dashboard-account">
            <a href="/_mng/logout" class="btn-logout">로그아웃</a>
        </div>

        <div class="system-title">
            Management System
            <a href="/_mng/sysmng/mngr/mypage">
	            <div class="user-info">
	                <span class="thum"><c:if test="${_mngrSession.proflImg ne null && _mngrSession.proflImg ne '' }"><img src="/comm/proflImg?fileName=${_mngrSession.proflImg}" alt="manager"></c:if></span>
	                <span class="name">
	                    <strong>${_mngrSession.mngrId}</strong>
	                    <small>마지막 접속 <fmt:formatDate value="${_mngrSession.recentLgnDt }" pattern="yyyy-MM-dd HH:mm:ss" /></small>
	                </span>
	            </div>
            </a>
        </div>

		<%-- DB로 관리 --%>
        <ul class="dashboard-items my-auto">
        <%--
       	<c:forEach items="${_mngMenuList }" var="mngMenu" varStatus="status">
        	<c:if test="${mngMenu.levelNo eq '2'}">
            <li><a href="${mngMenu.menuUrl}" class="dashboard-${mngMenu.icon}">${mngMenu.menuNm}</a></li>
            </c:if>
        </c:forEach>
        --%>
			<c:if test="${menuAuthMap['대시보드']}">
            	<li><a href="/_mng/dashboard?menuNo=2" class="dashboard-item1">대시보드</a></li>
            </c:if>
            <c:if test="${menuAuthMap['회원']}">
	            <li><a href="/_mng/mbr/list?menuNo=12" class="dashboard-item2">회원관리</a></li>
	        </c:if>
	        <c:if test="${menuAuthMap['상품']}">
	            <li><a href="/_mng/gds/gds/list?menuNo=18" class="dashboard-item3">상품관리</a></li>
	        </c:if>
            <c:if test="${menuAuthMap['주문']}">
            	<li><a href="/_mng/dolbom/shop/order/list.form?menuNo=96" class="dashboard-item4">주문관리</a></li>
            </c:if>
            <c:if test="${menuAuthMap['전시']}">
	            <li><a href="/_mng/exhibit/banner/list?menuNo=34" class="dashboard-item5">전시관리</a></li>
	        </c:if>
	        <c:if test="${menuAuthMap['프로모션']}">
	            <li><a href="/_mng/promotion/dspy/list?menuNo=35" class="dashboard-item11">프로모션관리</a></li>
	        </c:if>
	        <c:if test="${menuAuthMap['고객상담']}">
	            <li><a href="/_mng/consult/recipter/list?menuNo=74" class="dashboard-item7">고객상담관리</a></li>
	        </c:if>
	        <c:if test="${menuAuthMap['시스템']}">
	            <li><a href="/_mng/sysmng/mngr/list?menuNo=42" class="dashboard-item8">시스템관리</a></li>
	        </c:if>
	        <c:if test="${menuAuthMap['통계']}">
	            <li><a href="/_mng/stats/sales/prfmnc?menuNo=62" class="dashboard-item10">통계관리</a></li>
	        </c:if>
	        <c:if test="${menuAuthMap['멤버스']}">
	            <li><a href="/_mng/members/bplc/list?menuNo=60" class="dashboard-item12">멤버스관리</a></li>
	        </c:if>
	        <c:if test="${menuAuthMap['정산']}">
	            <li><a href="/_mng/clcln/market/list?menuNo=48" class="dashboard-item9">정산관리</a></li>
	        </c:if>
        </ul>

        <p class="text-copyright">Copyright ⓒTHKCompany Inc. All rights reserved.</p>
    </div>

    <script src="/html/core/vendor/twelements/index.min.js"></script>
</body>
</html>