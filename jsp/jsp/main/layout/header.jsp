<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header -->
<header id="header">
	<h1 id="logo" class="global-logo">
		<a href="${_mainPath}/index">
			<em>이로움ON</em>
		</a>
	</h1>
    <nav id="navigation">
        <ul class="nav-items">
            <li class="nav-item">
                <a href="${_mainPath}/dolbom/sub">이로움 서비스</a>
                <div class="nav-sub-items">
                    <ul>
						<li class="nav-sub-item"><a href="${_mainPath}/dolbom/sub">이로움돌봄</a></li>
						<li class="nav-sub-item"><a href="${_mainPath}/cntnts/test">인정등급 예상 테스트</a></li>
                        <li class="nav-sub-item"><a href="${_mainPath}/welfare/equip/sub">관심 복지용구 상담</a></li>
                        <li class="nav-sub-item"><a href="${_mainPath}/searchBokji">어르신 복지 서비스</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a href="${_mainPath}/cntnts/page1">시니어 길잡이</a>
                <div class="nav-sub-items">
                    <ul>
                        <li class="nav-sub-item"><a href="${_mainPath}/cntnts/page1">노인장기요양보험제도</a></li>
                        <li class="nav-sub-item"><a href="${_mainPath}/cntnts/page2">복지용구 알아보기</a></li>
                        <li class="nav-sub-item"><a href="${_mainPath}/cntnts/page3">복지용구 선택하기</a></li>
                    </ul>
                </div>
            </li>
			<li class="nav-item">
				<a href="http://cms.eroum.co.kr">이로움 정보</a>
				<div class="nav-sub-items">
					<ul>
						<li class="nav-sub-item"><a href="http://cms.eroum.co.kr/?page_id=6246">오늘의 복지</a></li>
						<li class="nav-sub-item"><a href="http://cms.eroum.co.kr/?page_id=6374">오늘의 건강</a></li>
						<li class="nav-sub-item"><a href="http://cms.eroum.co.kr/?page_id=6378">오늘의 제품</a></li>
						<li class="nav-sub-item"><a href="http://cms.eroum.co.kr/?page_id=6382">오늘의 휴식</a></li>
						<li class="nav-sub-item"><a href="http://cms.eroum.co.kr/?page_id=6388">브랜드 이로움</a></li>
						<li class="nav-sub-item"><a href="http://cms.eroum.co.kr/?page_id=6406">이로움 뉴스</a></li>
					</ul>
				</div>
			</li>
		</ul>
    </nav>
	<div id="utility">
		<ul>
			<c:choose>
				<c:when test="${!_mbrSession.loginCheck}">
					<li><a href="${_membershipPath}/login?returnUrl=/main">로그인</a></li>
					<li><a href="${_membershipPath}/regist" class="join">회원가입</a></li>

				</c:when>
				<c:otherwise>
					<li><a href="${_membershipPath}/index">마이페이지</a></li>
					<li><a href="${_membershipPath}/logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>

			<li>
				<!-- <a href="${_mainPath}/welfare/equip/sub" class="cost">혜택 상담하기​</a> -->
				<a href="/market/index" class="onmarket">이로움ON마켓</a>
			</li>
		</ul>
	</div>
	<button type="button" id="allmenu-toggle" data-bs-toggle="offcanvas" data-bs-target="#allmenu">전체 메뉴 열기/닫기</button>
</header>

<div id="allmenu" tabindex="-1" class="offcanvas offcanvas-end">
	<c:if test="${!_mbrSession.loginCheck}">
	    <div class="offcanvas-header">
	        <ul>
	            <li><a href="${_membershipPath}/login?returnUrl=/main">로그인</a></li>
	            <li><a href="${_membershipPath}/regist">회원가입</a></li>
	        </ul>
	        <button class="closed" type="button" data-bs-toggle="offcanvas" data-bs-target="#allmenu">레이어 닫기</button>
	    </div>
    </c:if>
    <div class="offcanvas-body">
    	<c:if test="${_mbrSession.loginCheck}">
	        <div class="user-info">
	            <div class="thumb"></div>
	            <div class="name">
	                ${_mbrSession.mbrNm}
	                <small>님</small>
	                <c:choose>
	                	<c:when test="${_mbrSession.joinTy eq 'K'}">
	                		<img src="/html/core/images/ico-kakao.png" alt="">
	                	</c:when>
	                	<c:when test="${_mbrSession.joinTy eq 'N' }">
	                		<img src="/html/core/images/ico-naver.png" alt="">
	                	</c:when>
	                	<c:otherwise>

	                	</c:otherwise>
	                </c:choose>
	            </div>
	            <a href="${_membershipPath}/logout" class="logout">로그아웃</a>
	            <div class="offcanvas-header">
		    		<button class="closed" type="button" data-bs-toggle="offcanvas" data-bs-target="#allmenu">레이어 닫기</button>
		    	</div>
	        </div>
        </c:if>

        <dl class="menu-item1">
            <dt><a href="${_mainPath}/dolbom/sub"><img src="/html/page/index/assets/images/ico-allmenu1.png" alt=""> 이로움 서비스</a></dt>
            <dd>
                <ul>
					<li><a href="${_mainPath}/dolbom/sub">이로움돌봄</a></li>
					<li><a href="${_mainPath}/cntnts/test">인정등급 예상 테스트</a></li>
                    <li><a href="${_mainPath}/welfare/equip/sub">관심 복지용구 상담</a></li>
                    <li><a href="${_mainPath}/searchBokji">어르신 복지 서비스</a></li>
                </ul>
            </dd>
        </dl>
        <dl class="menu-item2">
            <dt><a href="${_mainPath}/cntnts/page1"><img src="/html/page/index/assets/images/ico-allmenu1.png" alt=""> 시니어 길잡이</a></dt>
            <dd>
                <ul>
                    <li><a href="${_mainPath}/cntnts/page1">노인장기요양보험제도</a></li>
                    <li><a href="${_mainPath}/cntnts/page2">복지용구 알아보기</a></li>
                    <li><a href="${_mainPath}/cntnts/page3">복지용구 선택하기</a></li>
                </ul>
            </dd>
        </dl>
		<dl class="menu-item3">
			<dt><a href="http://cms.eroum.co.kr"><img src="/html/page/index/assets/images/ico-allmenu1.png" alt=""> 이로움 정보</a></dt>
			<dd>
				<ul>

					<li><a href="http://cms.eroum.co.kr/?page_id=6246">오늘의 복지</a></li>
					<li><a href="http://cms.eroum.co.kr/?page_id=6374">오늘의 건강</a></li>
					<li><a href="http://cms.eroum.co.kr/?page_id=6378">오늘의 제품</a></li>
					<li><a href="http://cms.eroum.co.kr/?page_id=6382">오늘의 휴식</a></li>
					<li><a href="http://cms.eroum.co.kr/?page_id=6388">브랜드 이로움</a></li>
					<li><a href="http://cms.eroum.co.kr/?page_id=6406">이로움 뉴스</a></li>

				</ul>
			</dd>
		</dl>
    </div>
</div>
<!-- //header -->