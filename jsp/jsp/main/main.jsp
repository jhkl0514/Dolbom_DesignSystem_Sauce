<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- OEOS-839 202505 script -->
    <script>
        $(function() {
            function updateConsultLink() {
                const isMobile = $(window).width() <= 768;
                const $link = $('.respArea');

                if (isMobile) {
                    $link.attr('target', '_blank')
                        .attr('href', 'https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom&pli=1')
                        .removeAttr('data-bs-toggle')
                        .removeAttr('data-bs-target');
                } else {
                    $link.attr('target', '_self')
                        .removeAttr('href') // href가 있으면 modal 대신 링크 이동하므로 제거
                        .attr('data-bs-toggle', 'modal')
                        .attr('data-bs-target', '#dbapp_modal');
                }
            }

            updateConsultLink();

            // 창 크기 바뀔 때도 업데이트
            $(window).resize(function () {
                updateConsultLink();
            });
        });
    </script>



<style>
:root {
    <c:if test="${!empty bannerList && bannerList.size() > 0}">
        /* 모바일 높이 */
    --height_mo: ${bannerList.get(0).getBannerMobileHeight()}px;

    /* pc 높이 */
    --height_pc: ${bannerList.get(0).getBannerPcHeight()}px;

    --banner_backColor : ${bannerList.get(0).getBannerBgColor()};
    </c:if>
    <c:if test="${empty bannerList || bannerList.size() < 1}">
            /* 모바일 높이 */
        --height_mo: 60px;

        /* pc 높이 */
        --height_pc: 180px;
        
        /* 배경컬러 */
        --banner_backColor : #7896b4;
    </c:if>
}


/* 배너 */

.main-visual:has(> .banner_card_area) .banner_card_area{position: absolute;bottom:0;z-index: 30;}

.main-visual:has(> .banner_card_area) .banner_symponia{
    cursor: pointer;
    width:100%;
    height:92px;
    background-image: url('/html/page/index/assets/images/banner/banner_symponia_mo.png');
    background-color: #eee;
    background-position: center center;
    background-repeat: no-repeat;
    background-size: contain;
    
}

.main-visual:has(> .banner_card_area) .swiper-wrapper{height: calc(100% - 92px);}

.main-visual:has(> .banner_card_area) .object.is-init{top:38%;}

.main-visual:has(> .banner_card_area) .text-scroll{bottom: 6.625rem;}



@media (min-width: 1280px){

    .main-visual:has(> .banner_card_area) .swiper-wrapper{height: calc(100% - 120px);}
    
}

@media (min-width: 1040px){

    .main-visual:has(> .banner_card_area) .banner_symponia{
        height: 120px;
        background-image: url('/html/page/index/assets/images/banner/banner_symponia_pc.png');
        background-color: #EDE7E7;
    }
    
}

@media (min-width: 768px) {

    .main-visual:has(> .banner_card_area) .object.is-init{top:46%;}

    /* 그라에디션 */
    .main-visual:has(> .banner_card_area) .swiper-slide:after{bottom: calc(var(--height_pc) - var(--height_mo));}

    .main-visual:has(> .banner_card_area) .swiper-slide .content{padding:1.75rem 1.75rem;}
    .main-visual:has(> .banner_card_area) .text-scroll{bottom: calc(var(--height_pc) + 32px);}

    .main-visual:has(> .banner_card_area) .banner_card_area .banner_card.pc{display: flex;}
    .main-visual:has(> .banner_card_area) .banner_card_area .banner_card.mo{display: none;}

    /* pc 높이값 */
    .main-visual:has(> .banner_card_area) .banner_card_area .banner_card{
        height:var(--height_pc);
    }
    .main-visual:has(> .banner_card_area) .banner_card_area .banner_card img{height: auto /*var(--height_pc)*/;}
}


</style>


    <!-- 이벤트팝업 css/js OEOS-730 202412 -->
    <style>

        /* body 스크롤금지 */
        body.oveflowHidden{overflow: hidden;}
        body.oveflowHidden:has( .popupEvtAreaWrap:not(.active)){overflow: initial;}

        .popupEvtAreaWrap.hidden{
            display: none;
        }

        .popupEvtAreaWrap{
            display: none;
            position: fixed;
            z-index: 1100;
            top:0;
            left:0;
            width:100%;
            height: 100%;
            background-color: rgba(0,0,0,0.3);

            display: flex;
            justify-content: center;
            align-items: center;

            .popup_01 {
                background-color: #eee;

                .today_close{
                    padding: 10px;
                }

                .close_x{
                    cursor: pointer;
                    padding: 10px 34px 10px 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap:4px;
                    line-height: 1;
                    
                    
                    background-image: url('/html/page/index/assets/images/icon/close_x.svg');
                    background-repeat: no-repeat;
                    background-position: calc(100% - 10px) center;
                    background-size: 20px;
                    
                }

            }

        }

        .popup_imgPC{display: none;}
        .popup_imgMO{display: block;width: 300px;}

        /* 768px 이상 pc */
        @media (min-width: 768px) {

            .popup_imgPC{display: block;}
            .popup_imgMO{display: none;}

        }
    </style>
    
    <script>
        $(function () {

            // 오늘 날짜를 YYYY-MM-DD 형식으로 가져오는 함수
            const getToday = () => {
                const today = new Date();
                return today.toISOString().split('T')[0]; // YYYY-MM-DD 형식
            };

            if (getToday() > '2025-01-09'){
                $('.popupEvtAreaWrap').addClass("hidden")
                return;
            }else{
                $('.popupEvtAreaWrap').removeClass("hidden")
                $('.popupEvtAreaWrap').addClass("active")
            }

            const popupKey = 'popupClosedToday'; // 팝업 상태 저장 키
            const popupDateKey = 'popupClosedDate'; // 팝업을 닫은 날짜 저장 키
    
            // 페이지 로드 시 팝업 상태 확인
            const savedDate = localStorage.getItem(popupDateKey);
            if (savedDate === getToday()) {
                $('.popupEvtAreaWrap').hide(); // 저장된 날짜가 오늘이라면 팝업 숨김
                $('.popupEvtAreaWrap').removeClass("active")
            } else {
                //body에 스크롤금지
                $('body').addClass('oveflowHidden');

                $('.popupEvtAreaWrap').show(); // 오늘이 아니면 팝업 표시
            }
    
            // 팝업 영역 클릭 시 닫기
            $('.popupEvtAreaWrap').click(function (e) {
                e.preventDefault();
                $(this).removeClass('active').fadeOut(150);
            });
    
            // 자식 요소 클릭 이벤트 전파 차단
            $('.popup_01, .popup_01 *').click(function (e) {
                e.stopPropagation();
            });
    
            // 닫기 버튼 클릭 시 팝업 닫기
            $('.popup_01 .close_x').click(function () {
                $('.popupEvtAreaWrap').removeClass('active').fadeOut(150);
            });
    
            // "오늘 하루 보지 않기" 체크박스 클릭 시 처리
            $('.form-check-input').change(function () {
                if ($(this).is(':checked')) {
                    localStorage.setItem(popupDateKey, getToday()); // 오늘 날짜 저장
                } else {
                    localStorage.removeItem(popupDateKey); // 체크 해제 시 저장된 날짜 삭제
                }
            });
        });
    </script>
    <!-- 이벤트팝업 css/js OEOS-730 202412 end -->

    


    
    <!-- 이벤트팝업 OEOS-730 202412 -->
    <div class="popupEvtAreaWrap hidden">
        <div class="popup_01">
            <a href="/main/event/202412event">
                <img class="popup_imgPC" src="/html/page/index/assets/images/event/2024winter_event_popup_pc.png" alt="pc_고객감동사연이벤트">
                <img class="popup_imgMO" src="/html/page/index/assets/images/event/2024winter_event_popup_mo.png" alt="mo_고객감동사연이벤트">
            </a>
            <div class="flex justify-between">
                <div class="form-check today_close">
                    <input class="form-check-input" type="checkbox" id="check-item1" name="today_close1">
                    <label class="form-check-label" for="check-item1">오늘하루 보지 않기</label>
                </div>
                <div class="close_x">닫기</div>
            </div>
                
        </div>
    </div>
    <!-- 이벤트팝업 OEOS-730 202412 end -->



<div class="main-inner">
    <div class="main-visual">

        <div class="swiper">
            <div class="swiper-wrapper">


                <div class="swiper-slide slide-item_jega" data-slide-number="1">
                    <div class="content">
                        <p class="title">
                            <span class="ani-text">
                                장기요양등급 신청부터 돌봄 준비까지,<br>
                                <strong>믿을 수 있는 재가기관</strong>과 함께하세요
                            </span>

                        </p>
                        <p class="desc">
                            <span class="ani-text">
                                부모님 상황에 꼭 맞는 돌봄 방법이 궁금하신가요?<br> 
                                국가 지원금을 알차게 활용 하실 수 있어요.
                            </span>
                        </p>
                        <a class="respArea btn btn-primary3 btn-arrow" target="_blank" href="https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom&pli=1">
                            <strong>재가기관 상담받기</strong>
                        </a>
                    </div>
                </div>

                <div class="swiper-slide slide-item_dbapp" data-slide-number="2">
                    <div class="content">
                        <p class="title">
                            <span class="ani-text">
                                보호자 <strong>맘</strong>에 <strong>안심</strong>,<br>
                                보호자 <strong>몸</strong>에 <strong>휴식</strong>,
                            </span>
                            
                            
                            <strong class="ani-text">이로움돌봄</strong>
                        </p>
                        <p class="desc">
                            <span class="ani-text">
                                돌봄 고민은 전문가에게,<br> 
                                보호자들의 부모님 건강관리를 위한 앱
                            </span>
                        </p>
                        <a href="${_mainPath}/dolbom/sub" target="_self" class="btn btn-primary3 btn-arrow">
                            <strong>자세히 보기</strong>
                        </a>
                    </div>
                </div>


                <div class="swiper-slide slide-item1" data-slide-number="3">
                    <div class="content">
                        <p class="title">
                            <span class="ani-text">최대 2,500만원 복지혜택,</span>
                            <strong class="ani-text"><span class="ani-obj"></span>65세 이상이라면 바로 신청하세요</strong>
                        </p>
                        <p class="desc"><span class="ani-text">등급별 지원 혜택이 달라요!</span></p>
                        <a href="${_mainPath}/cntnts/test" target="_self" class="btn btn-primary3 btn-arrow"><strong>내 인정등급 확인하기</strong></a>
                    </div>
                </div>

                
                <div class="swiper-slide slide-item2" data-slide-number="4">
                    <div class="content">
                        <p class="title">
                            <span class="ani-text">65세 미만이라도,</span>
                            <strong class="ani-text">등급 인정 확률이 높아요<span class="ani-obj"></span></strong>
                        </p>
                        <p class="desc">
                            <span class="ani-text"><span class="ani-obj"></span>타인 도움 없이 생활이 불가능한 어르신</span>
                            <span class="ani-text"><span class="ani-obj"></span>노인성 질환을 앓고 있는 어르신</span>
                            <span class="ani-text"><span class="ani-obj"></span>치매 증상으로 불편한 어르신</span>
                        </p>
                        <a href="${_mainPath}/cntnts/test" target="_self" class="btn btn-primary3 btn-arrow"><strong>지금 등급 확인하기</strong></a>
                    </div>
                </div>


                <div class="swiper-slide slide-item3" data-slide-number="5">
                    <div class="content">
                        <p class="title">
                            <span class="ani-text">어르신을 위한 복지,<span class="ani-obj"></span></span>
                            <strong class="ani-text">놓치지 말고 누리세요</strong>
                        </p>
                        <p class="desc"><span class="ani-text">등급을 받으시면 다양한 요양 용품, 서비스가 제공돼요</span></p>
                        <a href="${_mainPath}/cntnts/test" target="_self" class="btn btn-primary3 btn-arrow"><strong>지금 등급 확인하기</strong></a>
                    </div>
                </div>


            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination"></div>
            <div class="object">
                <div class="object-content">
                    <div class="wrapper">
                        <img src="/html/page/index/assets/images/visual/img-main-visual-phone2.jpg" alt="">

                        <div class="objects">
                            <div class="objects-1"></div>
                            <div class="objects-2"></div>
                            <div class="objects-3"></div>
                            <div class="objects-4"></div>
                        </div>
                    </div>
                </div>
                <div class="object-group">
                    <div class="object1"></div>
                    <div class="object2"></div>
                    <div class="object3"></div>
                    <div class="object4"></div>
                </div>
            </div>
        </div>

        
        
        
        
        
        <!-- 202409 banner -->
         <c:if test="${!empty bannerList && bannerList.size() > 0}">
            <div class="banner_card_area">
                <c:forEach var="item" items="${bannerList}" varStatus="status">
                    
                    <a id="clickUrl" onclick="fn_banner_clickOpenUrl('${item.linkTy}','${item.linkUrl}');">
                        <c:forEach var="file" items="${item.mobileFileList}" varStatus="fileStatus">
                            <div class="banner_card mo ${item.getBannerNo()}" style='<c:if test="${!empty item.bannerBgColor}">background-color:${item.bannerBgColor};</c:if><c:if test="${!empty item.bannerMobileHeight}"> height:${item.bannerMobileHeight}px;</c:if>' >
                                <img src="/comm/getFile?srvcId=${file.srvcId}&upNo=${file.upNo}&fileTy=${file.fileTy}&fileNo=${file.fileNo}" alt="${file.fileDc}" style='<c:if test="${!empty item.bannerMobileHeight}">height:${item.bannerMobileHeight}px</c:if>'>
                            </div>
                        </c:forEach>
                    </a>
                    <a id="clickUrl" onclick="fn_banner_clickOpenUrl('${item.linkTy}','${item.linkUrl}');">
                        <c:forEach var="file" items="${item.pcFileList}" varStatus="fileStatus">
                            <div class="banner_card pc ${item.getBannerNo()}" style='<c:if test="${!empty item.bannerBgColor}">background-color:${item.bannerBgColor};</c:if><c:if test="${!empty item.bannerPcHeight}"> height:${item.bannerPcHeight}px;</c:if>' >
                                <img src="/comm/getFile?srvcId=${file.srvcId}&upNo=${file.upNo}&fileTy=${file.fileTy}&fileNo=${file.fileNo}" alt="${file.fileDc}" style='<c:if test="${!empty item.bannerPcHeight}">height:${item.bannerPcHeight}px</c:if>'>
                            </div>
                        </c:forEach>
                    </a>
                </c:forEach>
    
            </div>
         </c:if>
        

        <a href="#scroll_anchor" class="text-scroll is-white">
            <i></i>
            <strong class="txt fw500">아래로</strong>
        </a>
    </div>

   

    <!-- <div id="notice-mobile" class="main-notice">
        <div class="notice-banner1">
            <dl>
                <dt><em>장기요양 인정등급</em>을 이미 받으셨나요?</dt>
                <dd>올해 남은 복지 혜택을 <em>여기에서 확인</em>하세요</dd>
            </dl>
            <a href="${_mainPath}/welfare/equip/sub">혜택 상담하기</a>

        </div>
        <div class="notice-banner2">
            <dl>
                <dt>부모님 맞춤 상품이 필요하세요?</dt>
                <dd>복지용구부터 시니어 생활용품까지 한 번에</dd>
            </dl>
            <a href="${_marketPath}/index" target="_blank">지금 둘러보기</a>
        </div>
    </div> -->


    <!-- 202409 banner -->
    <!-- <div class="banner_card_area">


        <div class="banner_card">

            <div class="card slide_01_bg" 
                <c:if test="${DateUtil.getCurrentDttm() > '2024-09-19'}">style="display:none"</c:if>
                
              onclick="window.open('https://smartstore.naver.com/eroumon/category/25acbfe830184656889b94d74f1e4915?cp=1', '_blank')">

                <div class="txt_area">
                    <div class="flex items-center">
                        <div class="title">독일 건강식품 최대 60% 할인</div>
                        <i class="icon-arrow-right size-md"></i>
                    </div>
            
                    <p class="ctn marT4">
                      한발 빠른 추석 이로움돌봄 스토어
                    </p>
                </div>

            </div>
        </div>


        <div class="banner_card">

            <div class="card slide_02_bg"
                <c:if test="${DateUtil.getCurrentDttm() < '2024-09-19'}">style="display:none"</c:if>
             onclick="window.open('https://smartstore.naver.com/eroumon/category/25acbfe830184656889b94d74f1e4915?cp=1', '_blank')">

                <div class="txt_area">
                    <div class="flex items-center">
                        <div class="title">유럽 건강식품 할인전 상시 오픈</div>
                        <i class="icon-arrow-right size-md"></i>
                    </div>

                    <p class="ctn marT4 line_clamp_1">
                        시니어를 위한 이로움돌봄 스토어
                    </p>
                </div>


            </div>
        </div>

    </div> -->
    <!-- banner_card_area -->


    <div class="main-content-wrapper">

        <a name="scroll_anchor" class="disInBlock"></a>

        <div class="main-content4">
            <div class="box">
                <h2>
                    <small>100만명이 받은 복지혜택  저도 받았어요</small>
                    <p>부모님과 나를 위한,</p>
                    <em class="text-primary3">복지서비스</em>
                </h2>
                <p>65세부터 꼭 혜택 받으세요!</p>
                <p>복지혜택 확인하기 이로움돌봄에서 5분이면 가능해요</p> 
                <p>신청부터 상담까지 한번에!</p>
                <a href="${_mainPath}/cntnts/test" class="btn btn-large2 btn-outline-primary3 btn-arrow"><strong>인정등급 테스트하기</strong></a>
            </div>
            <button class="image-youtube" data-bs-toggle="modal" data-bs-target="#watching-youtube">
                <img src="/html/page/index/assets/images/img-promotion-youtube.png" alt="부모님과 나를 위한 복지서비스"/>
            </button>

            <div class="modal modal-media fade" id="watching-youtube" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button data-bs-dismiss="modal" class="btn-close">
                                닫기
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="embed-container">
                                <iframe src="https://www.youtube.com/embed/YpfWKyDGPB4" frameborder="0" allowfullscreen title="시니어 정보 플랫폼 이로움돌봄 - 수급자 보호자 편"></iframe>
                            </div>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>

        <div class="main-content1">
            <div class="image">
                <div class="object1"></div>
                <div class="object2"></div>
            </div>
            <div class="box">
                <h2>
                    <small>신청방법부터 등급별 혜택까지</small>
                    <em class="text-primary2">노인장기요양보험,</em><br>
                    차근 차근 배워보세요
                </h2>
                <p>우리 부모님은<br> 지원대상일까요?</p>
                <p>어떤 요양 서비스와 용품이<br> 제공될까요?</p>
                <a href="${_mainPath}/cntnts/page1" class="btn btn-large2 btn-outline-primary2 btn-arrow"><strong>쉽게 알아보기</strong></a>
            </div>
        </div>
        
        <div class="main-content2">
            <div class="image">
                <div class="object1"></div>
            </div>
            <div class="box">
                <h2>
                    <small>부모님 생활을 한층 편하게</small>
                    삶의 질을 높여주는<br>
                    <em class="text-primary3">복지용구, 소개해 드릴게요</em>
                </h2>
                <p>불편한 거동, 낙상 사고 등의 걱정을</p>
                <p>복지용구로 더실 수 있어요.</p>
                <a href="${_mainPath}/cntnts/page2" class="btn btn-large2 btn-outline-primary3 btn-arrow"><strong>복지용구 알아보기</strong></a>
            </div>
        </div>
        
        <div class="main-content3">
            <div class="image">
                <div class="object1"></div>
                <div class="object2"></div>
            </div>
            <div class="box">
                <h2>
                    <small>똑똑하게 복지용구 선택하기</small>
                    <em class="text-primary2">부모님을 위한 복지용구,</em><br>
                    아무거나 고를 순 없어요
                </h2>
                <p>높은 금액의 복지용구,</p>
                <p>혜택받는 방법과<br> 고르는 법을 알려드릴게요.</p>
                <a href="${_mainPath}/cntnts/page3" class="btn btn-large2 btn-outline-primary2 btn-arrow"><strong>복지용구 선택하기</strong></a>
            </div>
        </div>
    </div>

	<!-- 복지24 긴급 제거 -->
    <div class="main-welfare-search">
    	<%--
        <div class="container">
            <p class="desc">어르신 맞춤 <strong>복지서비스,</strong><br> <strong>한 곳에서 편하게!</strong></p>
            <p class="count"><strong class="totalCount"><fmt:formatNumber value="${total}" pattern="###,###" /></strong>건 </p>
            
            <c:set var="addr" value="" />
            <c:if test="${_mbrAddr1 eq '충남'}"><c:set var="addr" value="충청남도" /></c:if>
            <c:if test="${_mbrAddr1 eq '충북'}"><c:set var="addr" value="충청북도" /></c:if>
            <c:if test="${_mbrAddr1 eq '경남'}"><c:set var="addr" value="경상남도" /></c:if>
            <c:if test="${_mbrAddr1 eq '경북'}"><c:set var="addr" value="경상북도" /></c:if>
            <c:if test="${_mbrAddr1 eq '전남'}"><c:set var="addr" value="전라남도" /></c:if>
            <c:if test="${_mbrAddr1 eq '전북'}"><c:set var="addr" value="전라북도" /></c:if>
            <c:if test="${_mbrAddr1 eq '서울'}"><c:set var="addr" value="서울특별시" /></c:if>
            <c:if test="${_mbrAddr1 eq '강원' || _mbrAddr1 eq '경기' }"><c:set var="addr" value="${_mbrAddr1}도" /></c:if>
            <c:if test="${_mbrAddr1 eq '광주'}"><c:set var="addr" value="광주광역시" /></c:if>
            <c:if test="${_mbrAddr1 eq '대구' || _mbrAddr1 eq '대전' || _mbrAddr1 eq '부산' || _mbrAddr1 eq '울산' || _mbrAddr1 eq '인천'}"><c:set var="addr" value="${_mbrAddr1}+광역시" /></c:if>
                    
                    
            <form class="form" action="${_mainPath}/searchBokji" id="bokjiFrm" name="bokjiFrm" method="get">
                <label for="select-sido" class="sr-only">시</label>
                <select id="select-sido" name="select-sido" class="form-control">
                    <c:forEach var="stdg" items="${stdgCdList}">
                        <option value="${stdg.stdgCd}" 
                            <c:if test="${!_mbrSession.loginCheck && stdg.ctpvNm eq '서울특별시'}">selected="selected"</c:if>
                            <c:if test="${_mbrSession.loginCheck && stdg.ctpvNm eq addr}">selected="selected"</c:if>
                        >${stdg.ctpvNm}</option>
                    </c:forEach>
                </select>
                <label for="select-gugun" class="sr-only">군</label>
                <select id="select-gugun" name="select-gugun" class="form-control">
                    <!--<c:if test="${!_mbrSession.loginCheck}"><option value="">금천구</option></c:if>
                    <c:if test="${_mbrSession.loginCheck}"><option value="">${_mbrAddr2}</option></c:if>-->
                </select>
                <button type="submit" class="btn">바로 확인</button>
            </form>
        </div>
        --%>
    </div>
	

    <div class="main-banner">
        <div class="market-banner">
            <strong>
                부모님 맞춤 상품이 필요하세요?
                <small>복지용구부터 시니어 생활용품까지 한 번에</small>
            </strong>
            <a href="${_marketPath}/index" target="_blank">지금 둘러보기</a>
        </div>
    </div>

    <!--구글플레이, QR-->
    <hr class="mt-8 divide-x-1"/>
    <div class="main-store">
        <div class="main-store-inner">
            <div class="main-store-text">
                <p>이로움돌봄 앱 다운로드하고</p>
                <strong>다양한 혜택을 누려보세요</strong>
            </div>
            <div class="main-store-link rest_btn">
                <a class="btn btn-arrow btn-large2 btn-primary2 web" data-bs-toggle="modal" data-bs-target="#dbapp_modal"><strong>앱 다운로드하기</strong></a>
                <a target="_blank" class="btn btn-arrow btn-large2 btn-primary2 mobile" href="https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom"><strong>앱 다운로드하기</strong></a>
            </div>
        </div>
    </div>
    <!--//구글플레이, QR-->
</div>







        <!--돌봄앱 모달-->
        <jsp:include page="/WEB-INF/jsp/common/modal/dolbom_app_modal.jsp" />










<script>

function f_srchInstList(){

	if(sido != "" && sido != "선택"){ //sido는 필수

		if(isAllow){	// GPS허용
			dist = 10000;
		}else{
			dist = 0;
		}
		var params = {
				srchMode:srchMode
				, sido:sido, gugun:gugun
				, isAllow:false, lot:lot, lat:lat, dist:dist };

		//console.log("params", params);

		$.ajax({
			type : "post",
			url  : "${_mainPath}/srchInstList.json",
			data : params,
			dataType : 'json'
		})
		.done(function(json) {
			var instCnt = "";
			if(srchMode == "LOCATION"){
				objData = json.bplcList;
				instCnt = Number(json.bplcCnt)
			}else{
				objData = json.instList;
				instCnt = Number(json.instCnt);
			}
			 
			$(".instListCnt").text(comma(instCnt));

			addListItem();
			kakaoMapDraw();

			//cntSum();
		})
		.fail(function(data, status, err) {
			console.log(data);
		});
	}
}

//콤마 찍기 : ###,###
function comma(num){
    var len, point, str;
    str = "0";
	if(num != ''){
	    num = num + "";
	    point = num.length % 3 ;
	    len = num.length;

	    str = num.substring(0, point);
	    while (point < len) {
	        if (str != "") str += ",";
	        str += num.substring(point, point + 3);
	        point += 3;
	    }
    }
    return str;
}

    //object visible check
    var observerCallback = (entries, observer, header) => {
        if(entries[0].isIntersecting) {
            entries[0].target.parentNode.classList.add('is-active');
        }
    };

    $(function() {
    	
        $(window).on('scroll, load', function() {
            //object visible
            [].slice.call(document.querySelectorAll('[class*="main-content"] .image')).forEach((e) => {
            var observer = new IntersectionObserver((entries) => {
                observerCallback(entries, observer);
            }, {
                threshold: 0.8
            });

            observer.observe(e);
        }, this);
        })
        
      	// 시/군/구 검색
    	$(document).on("change", "select[name='select-sido']", function(e){
    		e.preventDefault();
    		var stdgCd = $(this).val();
    		var stdgNm = $(this).text();

    	   	if(stdgCd != ""){
        		$.ajax({
    				type : "post",
    				url  : "${_membersPath}/stdgCd/stdgCdList.json",
    				data : {stdgCd:stdgCd},
    				dataType : 'json'
    			})
    			.done(function(data) {
    				if(data.result){
    					$("select[name='select-gugun']").empty();
       					$.each(data.result, function(index, item){ 
    							$("select[name='select-gugun']").append('<option value='+item.stdgCd+'>'+item.sggNm+'</option>');
       	                });
    				}
   			     	<c:if test="${empty _mbrSession.uniqueId}">
   			     		$("select[name='select-gugun'] option[value='1154500000']").prop("selected",true);
   			     	</c:if>
   			     	
   			     	<c:if test="${!empty _mbrSession.uniqueId}">
	   			       	if("${_mbrAddr2}" == ''){
	   			    		$("select[name='select-gugun'] option").each(function(){
	   			    			if($(this).val() == "1154500000"){
	   			    				$(this).prop("selected",true);
	   			    			}
	   			    		});
	   			       	}else{
		   			     	$("select[name='select-gugun'] option").each(function(){
	   			    			if($(this).text() == "${_mbrAddr2}"){
	   			    				$(this).prop("selected",true);
	   			    			}
	   			    		});
	   			       	}
   			     	</c:if>
    			})
    			.fail(function(data, status, err) {
    				console.log('지역호출 error forward : ' + data);
    			});
        	}

    	});
        if("${_mbrSession.uniqueId}" != '' && "${_mbrAddr1}" == ''){
        	$("select[name='select-sido'] option").each(function(){
    			if($(this).val() == "1100000000"){
    				$(this).prop("selected",true);
    			}
    		});
        }
       $("select[name='select-sido']").trigger("change");
       
	   	$("form[name='bokjiFrm']").validate({ 
		    ignore: "input[type='text']:hidden, [contenteditable='true']:not([name])",
		    submitHandler: function (frm) {
		    	$("select[name='select-sido']").attr("name","selectSido");
		    	$("select[name='select-gugun']").attr("name","selectGugun");
		    	frm.submit();
		    }
		});

    });

    //object visible check
    var observerCallback = (entries, observer, header) => {
        if(entries[0].isIntersecting) {
            entries[0].target.parentNode.classList.add('is-active');
        }
    };

    var visualAnimate = function(swiper) {
        $(swiper.slides).each(function(i) {
            if(i === swiper.activeIndex) {
                var numb = $(this).attr('data-slide-number');
                $(this).find('.content').addClass('is-active').find('.ani-text, .ani-obj').last().one('transitionend animationend',function() {
                    $('.main-visual .object-group').prop('class', 'object-group is-scene' + swiper.slides[swiper.activeIndex].dataset.slideNumber + ' is-active');
                });
            } else {
                $(this).find('.content').removeClass('is-active').find('.ani-text, .ani-obj').off('transitionend animationend');
            }
        });
	};

    var visualSetting = function(swiper) {
        pageBtn = $('.main-visual .swiper-slide-active .btn');
        slider  = [$('.main-visual .swiper-slide-active').outerWidth(), $('.main-visual .swiper-slide-active').outerHeight()];

        $(swiper.pagination.el).css({'bottom' : $('.main-visual').height() - (pageBtn.position().top + pageBtn.height() + ($(window).outerWidth() > 768 ? 48 : 23) + parseInt(pageBtn.css('margin-top').replace('px', '')))});

        //하단 배너삽입으로 인한 스마트폰 이미지 크기값 조정
        var val01 = 0.4983333; //0.5583333
        var val02 = 770; //670

        if($(window).outerWidth() > 768) {
            $('.swiper .object').css({
                '--tw-scale-x' : (slider[0] * val01 / val02 > 1.2) ? 1.2 : slider[0] * val01 / val02,
                '--tw-scale-y' : (slider[0] * val01 / val02 > 1.2) ? 1.2 : slider[0] * val01 / val02
            });
        } else {
            $('.swiper .object').css({
                '--tw-scale-x' : (slider[1] * 0.5 / val02 > 0.6) ? 0.6 : slider[1] * 0.5 / val02,
                '--tw-scale-y' : (slider[1] * 0.5 / val02 > 0.6) ? 0.6 : slider[1] * 0.5 / val02
            });
        }
    };
    
    $(function() {
        var swiper = new Swiper(".main-visual .swiper", {
            slidesPerView: 1,
            loop: true,
            effect: "fade",
            speed: 1000,
            pagination: {
                el: '.main-visual .swiper-pagination',
            },
			autoplay: {
                delay: 6000, //6000
                disableOnInteraction: false,
            },
            navigation: {
                nextEl: '.main-visual .swiper-button-next',
                prevEl: '.main-visual .swiper-button-prev',
            },
            fadeEffect: {
                crossFade: true
            },
            on: {
                beforeInit: function(swiper) {
                    $('.main-visual .object').addClass('is-init');
                },
                afterInit: function(swiper) {
                	visualAnimate(swiper);
                    visualSetting(swiper);
                },
                slideChange: function(swiper) {
                    $('.main-visual .object-group').removeClass('is-active');
                    $('.main-visual .object-content').prop('class', 'object-content is-scene' + swiper.slides[swiper.activeIndex].dataset.slideNumber);
                },
                slideChangeTransitionEnd: function(swiper) {
                	$('.object').on('transitionend', visualAnimate(swiper));
                }
            }
        });
        
        //object visible
        [].slice.call(document.querySelectorAll('[class*="main-content"] .image')).forEach((e) => {
            var observer = new IntersectionObserver((entries) => {
                observerCallback(entries, observer);
            }, {
                threshold: 0.8
            });

            observer.observe(e);
        }, this);

        $(window).on('load', function(e) {
        	visualSetting(swiper);
        });

        $(window).on('resize', function(e) {
            if(e.type === 'resize' && resize) {
            	visualSetting(swiper);
            }
        });

        //modal open
        $('#watching-youtube').on('show.bs.modal', function () {     
            var modal = $(this);
            modal.appendTo('body');
        });
        $('#watching-youtube').on('hidden.bs.modal', function () {
            $("#watching-youtube iframe").attr("src", $("#watching-youtube iframe").attr("src"))
        });
    })
</script>
