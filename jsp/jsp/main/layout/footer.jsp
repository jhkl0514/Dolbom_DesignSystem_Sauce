<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- quick -->
<div id="quick" class="global-quick">
	<button type="button" class="moveTop">위로 이동</button>
	<button type="button" class="channelTalk">위로 이동</button>
</div>
<!-- //quick -->

<!-- footer -->
<footer id="footer" class="global-footer">
	<div class="footer-link">
		<!-- 회사 메뉴 -->
		<nav class="footer-menu">
			<ul>
	            <li><a href="${_mainPath}/cntnts/company">회사소개</a></li>
	            <li><a href="${_membershipPath}/cntnts/terms" target="_blank">이용약관</a></li>
	            <li><a href="${_membershipPath}/cntnts/privacy" target="_blank"><strong>개인정보처리방침</strong></a></li>
	            <li><a href="${_mainPath}/inqry/list" target="_blank"><strong>제휴/입점 문의</strong></a></li>
			</ul>
		</nav>
		<!-- //회사 메뉴 -->

		<!-- 패밀리 사이트 -->
		<div class="footer-family">
			<dl>
				<dt class="sr-only">패밀리 사이트</dt>
				<dd>
					<ul class="global-link align_items_center">
                        <!-- li>
                            <a href="${_membersPath}" class="link-item2" target="_blank" title="새창열림">
                                <div class="bubble">
                                    <strong>이로움ON 멤버스</strong>
                                    <small>전국 1,600개 업체와 함께합니다</small>
                                </div>
                            </a>
                        </li> -->

						<li><a href="https://blog.naver.com/eroum_on" target="_blank" class="link-item5"><span class="sr-only">이로움ON</span></a></li>
						<li><a href="//www.youtube.com/@eroumon" target="_blank" class="link-item4"><span class="sr-only">이로움ON</span></a></li>
                        <!-- <li>
                            <a href="${_marketPath}" class="link-item3" target="_blank" title="새창열림">
                                <div class="bubble">
                                    <strong><img src="/html/core/images/txt-brand-link3.png" alt="이로움ON 마켓"></strong>
                                    <small>복지용구부터 시니어 생활용품까지 한번에!</small>
                                </div>
                            </a>
                        </li> -->


						<!-- 20240220 leemw -->
						<li>
							<!-- iphone z-index 오류로 버튼 클릭시 .btn_menu_dropdown_area에 .relative 클래스 토글 -->
							<!-- div.grade-floating 내용을 footer.jsp안에 넣으면 해결가능한데 이 부분은 따로 협의가 필요 -->
							<!-- 현재(240509) 메인(인덱스)만 적용 -->
							<div class="btn_menu_dropdown_area">
								<div class="btn_menu_dropdown">
									<div class="title">패밀리 사이트 바로가기</div>
									
									<div class="arrow">
										<svg xmlns="http://www.w3.org/2000/svg" width="10" height="6" viewBox="0 0 10 6" fill="none">
											<path d="M0.220355 0.229122C0.361712 0.0823892 0.553132 -4.12936e-07 0.752686 -4.04213e-07C0.95224 -3.9549e-07 1.14366 0.0823892 1.28502 0.229122L5.00783 4.10732L8.73064 0.229122C8.87322 0.0893285 9.06246 0.0128741 9.25824 0.0159656C9.45402 0.0190571 9.64095 0.101452 9.7794 0.245683C9.91785 0.389915 9.99695 0.584645 9.99991 0.788596C10.0029 0.992547 9.92949 1.18968 9.7953 1.33822L5.53966 5.77045C5.39843 5.91743 5.20696 6 5.00733 6C4.80769 6 4.61622 5.91743 4.47499 5.77045L0.220355 1.33822C0.079257 1.1911 -4.33459e-08 0.991639 -3.42554e-08 0.783672C-2.51649e-08 0.575704 0.079257 0.376244 0.220355 0.229122Z" fill="#333333"/>
										</svg>
									</div>
								</div>
								<div class="menu_dropdown">
									<ul>
										<li><a href="/" >이로움ON</a></li>
										<li><a href="/market/" target="_blank">이로움ON 마켓</a></li>
										<li><a href="https://eroumcare.com/" target="_blank">이로움CARE</a></li>
										<li><a href="https://www.seniortalktalk.com/" target="_blank">시니어톡톡</a></li>
										<li><a href="https://pro.seniortalktalk.com/" target="_blank">시니어톡톡PRO</a></li>
										<li><a href="http://www.thkc.co.kr" target="_blank">티에이치케이컴퍼니 </a></li>
									</ul>
								</div>
							</div>
						</li>



					</ul>
				</dd>
			</dl>
		</div>
		<!-- //패밀리 사이트 -->
	</div>

	<hr>

	<div class="footer-center">



		<!-- 202409 수상 -->
		<dl class="prime_area">
			<dt><img class="img_prime" src="/html/core/images/img_prime_3year.png" alt="수상"></dt>
			<dd class="ctn_area">
				<span class="ctn01">2024 대한민국 굿컴퍼니</span>
				<span class="ctn02">시니어 토탈 케어 3년 연속 수상</span>
			</dd>
		</dl>

		
		<!-- 사이트 정보-->
		<dl class="footer-company">
			<dt>
				<a href="#footer-collapse" data-bs-toggle="collapse" aria-expanded="false">(주)티에이치케이컴퍼니</a>
			</dt>
			<dd id="footer-collapse" class="collapse">
				<p>대표 : 신종호</p>
				<p>
					사업자등록번호 : 617-86-14330 [<a href="javascript:;" onclick="window.open('https://www.ftc.go.kr/bizCommPop.do?wrkr_no=6178614330','communicationViewPopup','width=750,height=700,scrollbars=yes')">사업자정보확인</a>]
				</p>
				<p>통신판매신고번호 : 2016-부산금정-0114</p>
				<address>
					<p>주소 : 부산광역시 금정구 중앙대로 1815, 5층(구서동, 가루라빌딩)</p>
					<p>사무소 : 서울시 금천구 서부샛길 606 대성디폴리스 B동 1401호</p>
					<p>물류센터 : 경기도 김포시 양촌읍 황금로291번길 16</p>
				</address>
			</dd>
		</dl>
		<!-- //사이트 정보-->

		<!-- 고객센터 -->
		<dl class="footer-customer">
			<dt>이로움온 고객센터 <a href="mailto:help@thkc.co.kr">help@thkc.co.kr</a></dt>
			<!-- <dd>
				<p>
					<strong>주문안내 :</strong> <a href="tel:1588-1312">1588-1312</a>
				</p>
				<p>
					<strong>시스템안내 :</strong> <a href="tel:02-830-1312">02-830-1312</a>
				</p>
			</dd> -->
			<dd>
				<p>
					<strong>운영시간 :</strong> 월~금 오전 9:00 ~ 오후 16:30 점심시간 오후 12:00 ~ 오후 13:30 (주말 및 공휴일 휴무)
				</p>
			</dd>
		</dl>
		<!-- //고객센터 -->
	</div>

	<hr>

	<!-- 카피 라이트 -->
	<div class="footer-copyright">
		Copyright ⓒ<strong>THKCompany Inc.</strong> All rights reserved
	</div>
	<!-- //카피 라이트 -->
</footer>
<!-- //footer -->

<script>
// 사업자 정보 조회
function f_searchBrnoInfo(brno) {
	var url = "http://www.ftc.go.kr/bizCommPop.do?wrkr_no="+ brno;
	window.open(url, "bizCommPop","width=750, height=700;");
}

// SNS 정보 미등록 시
var requireResist = '${requireResist}';
if (requireResist) {
	location.href = "/membership/sns/regist";
}
//통합회원 진행
var requireAuth = '${requireAuth}';
if (requireAuth) {
	location.href = "/membership/integrate/agreement";
}
</script>
