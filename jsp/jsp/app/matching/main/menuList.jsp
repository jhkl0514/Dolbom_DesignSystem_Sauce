<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <!-- swiper -->
  <link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />

  <style>

    /* 배너 swipe */
    .banner_swiper .swiper-slide {
        background-color: #fff;
        padding: 12px 20px;
    }

    .banner_swiper .swiper-pagination {
        width: auto;
        top: 24px;
        right: 32px;
        left: initial;
        font-size: 0;
        line-height: 0;
    }

    iframe#termsView{
        border: 0;
    }

    
    /* 대상 어워드 <!-- DEDS-235 202411 --> */
    .award_swiper .swiper-slide{padding:24px 24px 24px 44px;}
    .award_swiper .swiper-slide .iconImg{height: 48px;}
    .award_swiper .swiper-prev, .swiper-next{
        position: absolute;
        display: flex;
        z-index: 10;
        top:calc(50% - 16px);

        img{width: 32px;height: 32px;}
    }
    .award_swiper .swiper-prev{left:10px;transform: rotate(180deg);}
    .award_swiper .swiper-next{right:10px;}

  </style>


  <div class="wrapper">

        <!-- 상단 뒤로가기 버튼 추가 -->
        <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        	<jsp:param value="true" name="noBackButtion" />
            <jsp:param value="" name="addButton" />
            <jsp:param value="전체메뉴" name="addTitle" />
            <jsp:param value="true" name="addSetting" />
        </jsp:include>
    


        <main>
            <section class="default noPad">

				<%-- 신규배너 추가 --%>
				<div class="swiper banner_swiper">
					<div class="swiper-wrapper">
						<c:forEach var="item" items="${dBannerList}" varStatus="status">
						<div class="swiper-slide">
							<a id="clickUrl" onclick="clickOpenUrl('${item.linkTy}','${item.linkUrl}');">
								<c:forEach var="file" items="${item.mobileFileList}" varStatus="fileStatus">
									<div class="card waves-effect banner_card" style="background-image: url('/comm/getFile?srvcId=${file.srvcId}&upNo=${file.upNo}&fileTy=${file.fileTy}&fileNo=${file.fileNo}')">
										<div class="card-content">
											<div class="txt_area">
												<div class="font_sbms_2">${item.bannerNm}</div>
												<p class="color_t_s font_ssr marT4 line_clamp_1">
					                                    ${file.fileDc}
												</p>
											</div>
										</div>
									</div>
				                </c:forEach>
							</a>
						</div>
						</c:forEach>
					</div>
					<div class="swiper-pagination"></div>
				</div>


                <div class="h12"></div>

                <div class="box_normal padH12W20">

                    <div class="h16"></div>
                    <div class="font_sbss color_t_t marB4">서비스</div>
                    <c:if test="${showAppTestMenu eq 'show'}">
                        <div class="waves-effect list_link href font_sbms" href="/matching/main/app/test">앱 테스트</div>
                    </c:if>
                    <div class="waves-effect list_link href font_sbms" href="/matching/simpletest/simple/intro">인정등급 간편 테스트</div>
                    <div class="waves-effect list_link href font_sbms" href="/matching/welfareinfo/interest/intro">관심 복지용구</div>
                    <div class="waves-effect list_link href font_sbms" href="/matching/simpletest/care/intro">어르신 돌봄</div>
                </div>

                <div class="h12"></div>

                <div class="box_normal padH8W20">

                    <div class="h16"></div>
                    <div class="font_sbss color_t_t marB4">어르신</div>

                    <div class="waves-effect list_link href font_sbms" href="/matching/membership/recipients/subMain">어르신 관리</div>
                </div>

                <div class="h12"></div>

                <div class="box_normal padH12W20">

                    <div class="h16"></div>
                    <div class="font_sbss color_t_t marB4">콘텐츠</div>

                    <div class="waves-effect list_link href font_sbms" href="/matching/bbs/guide/list">어르신 길잡이</div>
                    <div class="waves-effect list_link href font_sbms" href="/matching/welfareinfo/list">복지용구 알아보기</div>
                    <div class="waves-effect list_link href font_sbms" href="/matching/bbs/socialwelfare/list">어르신 복지</div>
                </div>

                <div class="h12"></div>

                <div class="box_normal padH12W20">

                    <div class="h16"></div>
                    <div class="font_sbss color_t_t marB4">고객센터</div>

                    <div class="waves-effect list_link href font_sbms" href="/matching/etc/customerService">고객센터</div>
                    <div class="waves-effect list_link href font_sbms" href="/matching/bbs/faq/list">자주 묻는 질문</div>
                    <div class="waves-effect list_link href font_sbms" href="/matching/bbs/ntce/list">공지사항</div>
                </div>

                <div class="h12"></div>

                <div class="box_normal padH12W20">
                
                    <div class="h16"></div>
                    <div class="font_sbss color_t_t marB4">약관</div>
                    
                    <div class="waves-effect list_link termsKind eroum font_sbms" termsKind="TERMS" termsNo='<c:if test="${ termTERMS != null }">${termTERMS.getTermsNo()}</c:if>' >이용약관</div>
                    <div class="waves-effect list_link termsKind eroum font_sbms" termsKind="PRIVACY" termsNo='<c:if test="${ termPRIVACY != null }">${termPRIVACY.getTermsNo()}</c:if>'>개인정보 처리방침</div>
                    <!--div class="waves-effect list_link termsKind eroum font_sbms" termsKind="MARKETING" termsNo='<c:if test="${ termMARKETING != null }">${termMARKETING.getTermsNo()}</c:if>'>마케팅</div>
                    <div class="waves-effect list_link termsKind eroum font_sbms" termsKind="NIGHT" termsNo='<c:if test="${ termNIGHT != null }">${termNIGHT.getTermsNo()}</c:if>'>야간</div-->
                    <div class="waves-effect list_link font_sbms" onclick="location.href='/matching/license/list';">오픈소스 라이선스</div>
                    
                </div>

                <div class="h12"></div>

                <div class="box_normal padH16W20">
                    <div class="align_between_center">
                        <div class="align_center gap04">
                            <div class="font_sbms">현재 버전</div>
                            <span id="spanAppVersion" class="color_t_s font_sbmr"></span>
                        </div>
                        <a id="updateATag" class="rounded waves-effect btn btn_cancel align_center inline_flex" onclick="clickUpdateApp();">업데이트</a>
                        <!-- 최신버전일때  -->
                        <div id="latestDiv" class="color_t_t font_sbmr disNone">최신버전</div>
                    </div>
                </div>

                <div class="padH24W20">
                    <div class="waves-effect tg_menu_list">
                        (주)티에이치케이컴퍼니 사업자 정보
                        <span class="icon_arrow"></span>
                    </div>
                    <div class="tg_menu_list_ctn">

                        <p class="color_t_t font_scx marT8">
                            대표 : 신종호<br>
                            사업자등록번호 : 617-86-14330<br>
                            통신판매신고번호 : 2016-부산금정-0114<br>
                            주소 : 부산광역시 금정구 중앙대로 1815, 5층(구서동, 가루라빌딩)<br>
                            사무소 : 서울시 금천구 서부샛길 606 대성디폴리스 B동 1401호<br>
                            물류센터  : 경기도 김포시 양촌읍 황금로291번길 16<br>
                            <br>  
                            고객센터 help@thkc.co.kr<br>
                            문의전화 : 070-7776-7663<br>
                            운영시간 : 월~금 오전 9:00 ~ 오후 16:30 (점심시간 오후 12:00 ~ 오후 13:30, 주말 및 공휴일 휴무)
                        </p>

                    </div>

                    <div class="h20"></div>
                    <hr>
                    <div class="h20"></div>

                    <ul class="bread_link"> 
                        <li><a class="waves-effect" onclick="clickOpenUrl('S', 'https://www.ftc.go.kr/bizCommPop.do?wrkr_no=6178614330','communicationViewPopup','width=750,height=700,scrollbars=yes');">사업자정보확인</a></li>
                        <li><a class="waves-effect footer_terms" termsKind="TERMS" termsNo='<c:if test="${ termTERMS != null }">${termTERMS.getTermsNo()}</c:if>'>이용약관</a></li>
                        <li><a class="waves-effect footer_terms fw700" termsKind="PRIVACY" termsNo='<c:if test="${ termPRIVACY != null }">${termPRIVACY.getTermsNo()}</c:if>'>개인정보처리방침</a></li>
                    </ul>

                    <div class="h20"></div>

                    <div class="color_t_t font_scx">Copyright ⓒTHKCompany Inc. All rights reserved</div>



                </div>

                
                <%-- 신규배너 추가 --%>
                <c:if test="${bannerMainBottomList != null && bannerMainBottomList.size() > 0}">

                        <div class="swiper award_swiper">
                            <div class="swiper-wrapper" linkTy="${item.linkTy}" linkUrl="${item.linkUrl}">
                                <c:forEach var="item" items="${bannerMainBottomList}" varStatus="status">
                                    <div class="swiper-slide">
                                        <div class="d-flex align-items-center gap12">
                                            <c:forEach var="file" items="${item.mobileFileList}" varStatus="fileStatus">
                                                <img class="iconImg" src="/comm/getFile?srvcId=${file.srvcId}&upNo=${file.upNo}&fileTy=${file.fileTy}&fileNo=${file.fileNo}" alt="${item.bannerNm}">
                                            </c:forEach>
                                            
                                        </div>
                                    </div>
                                </c:forEach>
                            
                            </div>
                            <!-- swiper-wrapper -->
                            <div class="swiper-prev">
                                <img src="/html/page/app/matching/assets/src/images/18icon/chevron-right02_thin.svg" alt="arrow-prev">
                            </div>
                            <div class="swiper-next">
                                <img src="/html/page/app/matching/assets/src/images/18icon/chevron-right02_thin.svg" alt="arrow-next">
                            </div>
                        </div>
                        <!-- swiper -->


                        <div class="h100"></div>
                            

                </c:if>
                
            </section>
        </main>
	
	<!-- 하단 네이비게이션 -->
	<jsp:include page="/WEB-INF/jsp/app/matching/common/bottomNavigation.jsp">
		<jsp:param value="entire" name="menuName" />
	</jsp:include>

  </div>
  <!-- wrapper -->
  
  
		<!-- 약간동의 상세 팝업 -->
	    <div id="modal_fullscreen" class="modal fullscreen custom allocate">

          <div class="modal_header">
            <h4 class="modal_title">이용약관</h4>
            <div class="close_x modal-close waves-effect"></div>
          </div>
    
          <div class="modal-content no_footer">
            <iframe id="termsView" src="" width="100%" height="98%"></iframe>
          </div>
          <!-- modal-content -->
          
        </div>
        <!-- 약간동의 상세 팝업 -->
        
        
        <!-- 공정거래위원회 사업자정보확인 팝업 -->
	    <div id="biz_fullscreen" class="modal fullscreen">

          <div class="modal_header">
            <h4 class="modal_title">사업자정보확인</h4>
            <div class="close_x modal-close waves-effect"></div>
          </div>
    
          <div class="modal-content no_footer back_gray">
            <iframe src="https://www.ftc.go.kr/bizCommPop.do?wrkr_no=6178614330" width="100%" height="98%" style="border:none;"></iframe>
          </div>
          <!-- modal-content -->
          
        </div>
        <!-- 약간동의 상세 팝업 -->

    <%-- 풀스크린 모달 안에 iframe으로 페이지를 보여주기 위해 추가 --%>
    <jsp:include page="/WEB-INF/jsp/app/matching/common/modal/staticResourceModal.jsp" />

	<script>
		//앱 버전을 전달받은 변수
		var appVersion;
		//현재 배포된 앱의 최신버전
		var latestVersion = '${latestVersion}';
		
		var versionInterval;
		var checkCount = 0;     //버전 체크 횟수
		var maxCheckCount = 10;  //최대 버전 체크 횟수
	
		
		//실제앱의 버전정보를 앱에 요청
		function getAppVersion() {
			sendDataToMobileApp({ actionName: 'getAppVersion' });
		}
		
		//앱 버전을 받아오면 span에 표시
		function pollingAppVersion() {
			getAppVersion();
			
			versionInterval = setInterval(function() {
				if (checkCount === maxCheckCount) {
					clearInterval(versionInterval);
					return;
				}
				
				if (appVersion) {
					//앱 버전이 최신인 경우
					if (appVersion === latestVersion) {
						$('#latestDiv').removeClass('disNone');
						$('#updateATag').addClass('disNone');
					} else {
						$('#latestDiv').addClass('disNone');
						$('#updateATag').removeClass('disNone');
					}
					
					//앱 버전 표시
					$('#spanAppVersion').text("V" + appVersion);
					clearInterval(versionInterval);
					return;
				}
				
				checkCount++;
			}, 1000);
		}
		
		//앱 업데이트 버튼 클릭 이벤트
		function clickUpdateApp() {
			const mobileOs = detectMobileOS();
			if (appVersion === latestVersion) {
				showAlertPopup('이미 최신버전입니다');
			} else {
				sendDataToMobileApp({ actionName: 'callOpenUrl', url: 'market://details?id=kr.co.eroum.dolbom' });	
			}
		}
		
		function clickOpenUrl(linkTy, url){
			if(linkTy === 'S'){
				sendDataToMobileApp({ actionName: 'callOpenUrl', url: url });
			} else if(linkTy === 'P'){
				window.location.href = url;
			}
		}
		
		$(function() {
			$("body").addClass("back_gray");

			//백버튼 클릭 시 서비스메인으로 이동
			backBtnEvent = function() {
				location.href='/matching/main/service';
			}
			
    		//앱 버전 처리
    		pollingAppVersion();
			
			
            $('.list_link.href').click(function(){
                location.href = $(this).attr('href');
            });

            var elems = document.querySelectorAll("#modal_fullscreen");
            var popTermsView = M.Modal.init(elems, {
                endingTop:'0%',
                dismissible:false, 
            });
            popTermsView = popTermsView[0];

            
            var showTermsView = function() {
                $("#termsView").attr("src", "about:blank");

                var termsKind = $(this).attr('termsKind');
                var termsNo = $(this).attr('termsNo');

                var title = $(this).html();

                $("#modal_fullscreen .modal_title").html(title);

                $("#termsView").attr("src", "/matching/terms/" + termsNo);

                popTermsView.open();
            };
            
            $('.list_link.termsKind.eroum').click(showTermsView);
            $('.footer_terms').click(showTermsView);

            <c:if test="${bannerMainBottomList != null && bannerMainBottomList.size() > 0}">
            fn_banner_init_MainBottomList();
            </c:if>
		});

        function fn_banner_init_MainBottomList(){

			//어워드 배너 DEDS-235 202411
			var swiper = new Swiper(".award_swiper", {
				autoHeight: true,
				spaceBetween: 20,
				loop: true,
				autoplay: {
					delay: 5000,
					disableOnInteraction: false,
				},

				navigation: {
					nextEl: ".swiper-next",
					prevEl: ".swiper-prev",
				},
			});

			$(".award_swiper div.swiper-wrapper").click(function(){
				var jTarget = $(this);

				if (jTarget.attr("linkUrl")){
					clickOpenUrl(jTarget.attr("linkTy"), jTarget.attr("linkUrl"))
				}

			});

		}
	
	
	</script>


<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper(".banner_swiper", {
        autoHeight: true,
        spaceBetween: 0,
        loop: true,
        autoplay: {
          delay: 5000,
          disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",

        },
    });
</script>

