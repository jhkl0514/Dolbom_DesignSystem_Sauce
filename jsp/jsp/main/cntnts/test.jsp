<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
    body {
        padding-bottom: 4.75rem;
    }

    #container {
        padding-bottom: 0 !important;
    }
</style>

<header id="subject">
    <nav class="breadcrumb">
        <ul>
			<li class="home"><a href="${_mainPath}">홈</a></li>
			<li>이로움 서비스</li>
			<li>인정등급 예상 테스트</li>
        </ul>
    </nav>
</header>


<!-- 상단배너추가 -->
<div class="top_banner_area dbapp">
    <div class="width_area">
        <div class="icon_area">
            <img src="/html/page/index/assets/images/banner/store_dbapp.png" alt="돌봄앱 아이콘">
            <div class="txt">
            	<strong>이로움돌봄 앱에서</strong><br>
            	장기요양 <strong>인정등급 신청</strong>하세요!
            </div>
        </div>

        <div class="rest_btn">
            <a href="" class="btn-dbapp01 web" data-bs-toggle="modal" data-bs-target="#dbapp_modal">앱 다운로드</a>
            <a target="_blank" class="btn-dbapp01 mobile" href="https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom">앱 다운로드</a>
        </div>
    </div>
</div>

<div class="h60"></div>
<!-- top_banner_area -->


<div id="content">
	<!-- 
    <div class="flex flex-wrap justify-center gap-2 py-2">
        <button type="button" class="btn btn-small" data-bs-toggle="modal" data-bs-target="#non-login-user">비로그인시 사용자</button>
        <button type="button" class="btn btn-small" data-bs-toggle="modal" data-bs-target="#login-no-rcpt">로그인사용자 : 등록된 수급자 없는 경우</button>
        <button type="button" class="btn btn-small" data-bs-toggle="modal" data-bs-target="#login-rcpts">로그인사용자 : 등록 수급자 n명이상인 경우</button>
        <button type="button" class="btn btn-small" data-bs-toggle="modal" data-bs-target="#regist-rcpt">수급자 정보 등록</button>
        <button type="button" class="btn btn-small" data-bs-toggle="modal" data-bs-target="#notified-consulting">상담내역알림</button>
    </div>
	 -->

    <div class="grade-content1">
        <h2 class="grade-title2">
            <small>노인장기요양보험</small>
            인정등급 예상 테스트
        </h2>
        <p class="mt-10 grade-text2">
        	테스트로 받을 수 있는 혜택 확인하고<br>
        	<strong>이로움돌봄 앱에서</strong> 장기요양 <strong>인정등급 신청하세요</strong>
        </p>
        <div class="grade-start mt-11 md:mt-15">
            <div class="picture">
                <img src="/html/page/index/assets/images/img-grade-start.jpg" alt="">
                <div class="msg1" aria-hidden="true">
                    <div class="box">
                        장기요양 인정등급<br>
                        <strong>신청 절차가 너무 복잡해요.</strong>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="47" height="27" viewBox="0 0 47 27" fill="none">
                        <g filter="url(#filter0_d_2147_10177)">
                            <path d="M38.5 15C25.7 15.4 19.224 5.7309 15.724 2.2309C7.39066 0.397568 -6.49969 1.90735e-06 5.50031 10C17.5003 20 31.3333 18.1667 38.5 15Z" fill="white"/>
                            <path d="M38.5 15C25.7 15.4 19.224 5.7309 15.724 2.2309C7.39066 0.397568 -6.49969 1.90735e-06 5.50031 10C17.5003 20 31.3333 18.1667 38.5 15Z" stroke="#FD8106"/>
                        </g>
                        <defs>
                            <filter id="filter0_d_2147_10177" x="0.319336" y="0.705566" width="46.3828" height="25.3055" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                                <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                                <feOffset dx="4" dy="4"/>
                                <feGaussianBlur stdDeviation="2"/>
                                <feComposite in2="hardAlpha" operator="out"/>
                                <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"/>
                                <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_2147_10177"/>
                                <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_2147_10177" result="shape"/>
                            </filter>
                        </defs>
                    </svg>
                </div>
                <div class="msg2" aria-hidden="true">
                    <div class="box">
                        저희 아버지,<br>
                        장기요양보험 <strong>혜택 받을 수 있을까요?</strong>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="47" height="27" viewBox="0 0 47 27" fill="none">
                        <g filter="url(#filter0_d_2147_10230)">
                            <path d="M38.6807 15C25.8807 15.4 19.4047 5.7309 15.9047 2.2309C7.57133 0.397568 -6.31903 1.90735e-06 5.68097 10C17.681 20 31.514 18.1667 38.6807 15Z" fill="white"/>
                            <path d="M38.6807 15C25.8807 15.4 19.4047 5.7309 15.9047 2.2309C7.57133 0.397568 -6.31903 1.90735e-06 5.68097 10C17.681 20 31.514 18.1667 38.6807 15Z" stroke="#5DB0BF"/>
                        </g>
                        <defs>
                            <filter id="filter0_d_2147_10230" x="0.5" y="0.705566" width="46.3828" height="25.3055" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                <feFlood flood-opacity="0" result="BackgroundImageFix"/>
                                <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
                                <feOffset dx="4" dy="4"/>
                                <feGaussianBlur stdDeviation="2"/>
                                <feComposite in2="hardAlpha" operator="out"/>
                                <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.1 0"/>
                                <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_2147_10230"/>
                                <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_2147_10230" result="shape"/>
                            </filter>
                        </defs>
                    </svg>
                </div>
            </div>
            <a class="btn btn-large2 btn-primary2 btn-arrow" onclick="startTest();">
                <strong>테스트 시작하기</strong>
            </a>
        </div>
        <ul class="grade-taps mt-19 md:mt-24">
            <li class="taps-item is-active">
                <a href="#slide-item1">
                    <i><img src="/html/page/index/assets/images/ico-grade-info1.svg" alt=""></i>
                    <span>예상 인정등급 확인</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item2">
                    <i><img src="/html/page/index/assets/images/ico-grade-info2.svg" alt=""></i>
                    <span>등급별 지원 금액</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item3">
                    <i><img src="/html/page/index/assets/images/ico-grade-info3.svg" alt=""></i>
                    <span>예상 복지용구</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item4">
                    <i><img src="/html/page/index/assets/images/ico-grade-info4.svg" alt=""></i>
                    <span>전문가 상담과<br> 대리 등급 신청</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item5">
                    <i><img src="/html/page/index/assets/images/ico-grade-info5.svg" alt=""></i>
                    <span>결과지 제공</span>
                </a>
            </li>
        </ul>
        <div class="grade-text1 mt-6 md:mt-9.5">
            <p>보건복지부에서 고시한 장기 요양 등급 판정 기준을 근거로 만들어진 테스트로, <strong>실제 등급 판정 결과와 상이할 수 있어요.</strong></p>
        </div>
        <a href="/main/welfare/equip/sub" class="text-link">
            이미 인정등급을 알고 계세요?
        </a>
    </div>

    <div class="grade-content2">
        <h2 class="grade-title">
            <small>노인장기요양보험 인정등급 예상 테스트</small>
            간단 테스트로 <br class="md:hidden"> 쉽고 든든하게!
        </h2>
        <div class="grade-rolling mt-13 md:mt-23">
            <div class="container">
                <div class="rolling-item1 is-active">
                    <div class="item-thumb">
                        <img src="/html/page/index/assets/images/img-grade-rolling1.svg" alt="">
                    </div>
                    <div class="item-content">
                        저희 아버지,<br>
                        <strong class="whitespace-normal">장기요양 인정등급 몇 등급 일까요?</strong>
                    </div>
                </div>
                <div class="rolling-item2">
                    <div class="item-thumb">
                        <img src="/html/page/index/assets/images/img-grade-rolling2.svg" alt="">
                    </div>
                    <div class="item-content">
                        장기요양 인정등급별<br>
                        <p class="whitespace-normal"><strong>지원 금액과 혜택이</strong> 궁금해요.</p>
                    </div>
                </div>
                <div class="rolling-item3">
                    <div class="item-thumb">
                        <img src="/html/page/index/assets/images/img-grade-rolling3.svg" alt="">
                    </div>
                    <div class="item-content">
                        장기요양 인정등급<br>
                        <strong  class="whitespace-normal">신청 절차가 너무 복잡해요.</strong>
                    </div>
                </div>
                <div class="rolling-item4">
                    <div class="item-thumb">
                        <img src="/html/page/index/assets/images/img-grade-rolling4.svg" alt="">
                    </div>
                    <div class="item-content">
                        <strong>거동 불편</strong>하신 우리 할머니,<br>
                        <strong  class="whitespace-normal">어떤 용품이 필요한가요?</strong>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="grade-content3">
        <h2 class="grade-title">
            <small>노인장기요양보험 인정등급 예상 테스트</small>
            이렇게 제공받아요
        </h2>
        <ul class="grade-taps mt-16 md:mt-23 md-max:!hidden">
            <li class="taps-item is-active">
                <a href="#slide-item1">
                    <i><img src="/html/page/index/assets/images/ico-grade-info1.svg" alt=""></i>
                    <span>예상 인정등급 확인</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item2">
                    <i><img src="/html/page/index/assets/images/ico-grade-info2.svg" alt=""></i>
                    <span>등급별 지원 금액</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item3">
                    <i><img src="/html/page/index/assets/images/ico-grade-info3.svg" alt=""></i>
                    <span>예상 복지용구</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item4">
                    <i><img src="/html/page/index/assets/images/ico-grade-info4.svg" alt=""></i>
                    <span>전문가 상담과<br> 대리 등급 신청</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item5">
                    <i><img src="/html/page/index/assets/images/ico-grade-info5.svg" alt=""></i>
                    <span>결과지 제공</span>
                </a>
            </li>
        </ul>
        <div class="grade-slider mt-15 md:mt-20">
            <div class="container">
                <div class="swiper">
                    <div class="swiper-wrapper">
                        <div id="slide-item1" class="swiper-slide">
                            <p class="text-2xl font-bold tracking-normal">예상 인정등급 확인</p>
                            <p class="mt-2.5">어르신의 예상 인정등급을 알 수 있어요.</p>
                            <img src="/html/page/index/assets/images/img-grade-info1.svg" alt="" class="mt-11 w-36 md:mt-15 md:w-40">
                            <img src="/html/page/index/assets/images/img-grade-info1-2.svg" alt="" class="mt-13 md:mt-15">
                        </div>
                        <div id="slide-item2" class="swiper-slide">
                            <p class="text-2xl font-bold tracking-normal">등급별 지원 금액</p>
                            <p class="mt-2.5">해당 등급에 제공되는 혜택을 알려드려요.</p>
                            <img src="/html/page/index/assets/images/img-grade-info2.svg" alt="" class="mt-11 w-36 md:mt-15 md:w-40">
                            <p class="mt-9.5 font-medium md:mt-11">거동, 생활 보조 용품(복지용구)을 신청하세요.</p>
                            <p>*6~15%의 본인부담금이 발생해요.</p>
                        </div>
                        <div id="slide-item3" class="swiper-slide">
                            <p class="text-2xl font-bold tracking-normal">예상 복지용구</p>
                            <p class="mt-2.5">선택하신 답변에 맞춰 예상 복지용구를 알려드려요.</p>
                            <img src="/html/page/index/assets/images/img-grade-info3.svg" alt="" class="mt-6 w-38 md:mt-15 md:w-43">
                            <p class="mt-7.5 md:mt-9"><strong>복지용구란?</strong> 어르신의 일상생활과 신체활동을 보조하고, 인지 기능 유지와 향상에 도움이 되는 보건복지부 지정 품목이에요.</p>
                        </div>
                        <div id="slide-item4" class="swiper-slide">
                            <p class="text-2xl font-bold tracking-normal">전문가 상담과 대리 등급 신청</p>
                            <p class="mt-2.5">무료 전문가 상담으로 등급 신청까지 의뢰 가능해요.</p>
                            <img src="/html/page/index/assets/images/img-grade-info4.svg" alt="" class="mt-5 w-46 md:mt-17 md:w-64">
                        </div>
                        <div id="slide-item5" class="swiper-slide">
                            <p class="text-2xl font-bold tracking-normal">결과지 제공</p>
                            <p class="mt-2.5">분석된 결과를 저장, 출력하거나 가족에게 공유할 수 있어요.</p>
                            <img src="/html/page/index/assets/images/img-grade-info5.svg" alt="" class="mt-13 w-63 md:mt-15 md:w-75">
                        </div>
                    </div>
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>

    <div class="grade-content4">
        <h2 class="grade-title">
            <small>노인장기요양보험 인정등급 예상 테스트</small>
            이렇게 진행돼요
        </h2>
        <ul class="grade-taps mt-16 md:mt-23 md-max:!hidden">
            <li class="taps-item is-active">
                <a href="#slide-item6">
                    <i><img src="/html/page/index/assets/images/ico-grade-info6.svg" alt=""></i>
                    <span>신체기능(12)</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item7">
                    <i><img src="/html/page/index/assets/images/ico-grade-info7.svg" alt=""></i>
                    <span>인지기능(7)</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item8">
                    <i><img src="/html/page/index/assets/images/ico-grade-info8.svg" alt=""></i>
                    <span>행동변화(14)</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item9">
                    <i><img src="/html/page/index/assets/images/ico-grade-info9.svg" alt=""></i>
                    <span>간호처치(9)</span>
                </a>
            </li>
            <li class="taps-spacer"></li>
            <li class="taps-item">
                <a href="#slide-item10">
                    <i><img src="/html/page/index/assets/images/ico-grade-info10.svg" alt="" class="-mt-2.5"></i>
                    <span>재활(10)</span>
                </a>
            </li>
        </ul>
        <div class="grade-slider mt-15 md:mt-20">
            <div class="swiper">
                <div class="swiper-wrapper">
                    <div id="slide-item6" class="swiper-slide">
                        <img src="/html/page/index/assets/images/img-grade-info6.svg" alt="">
                    </div>
                    <div id="slide-item7" class="swiper-slide">
                        <img src="/html/page/index/assets/images/img-grade-info7.svg" alt="">
                    </div>
                    <div id="slide-item8" class="swiper-slide">
                        <img src="/html/page/index/assets/images/img-grade-info8.svg" alt="">
                    </div>
                    <div id="slide-item9" class="swiper-slide">
                        <img src="/html/page/index/assets/images/img-grade-info9.svg" alt="">
                    </div>
                    <div id="slide-item10" class="swiper-slide">
                        <img src="/html/page/index/assets/images/img-grade-info10.svg" alt="" class="!w-[301px]">
                    </div>
                </div>
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination"></div>
        </div>
        <div class="grade-info">
            <dl class="info-text1">
                <dt>5</dt>
                <dd>
                    약 <strong>5분</strong>의 시간이
                    소요돼요.
                </dd>
            </dl>
            <dl class="info-text2">
                <dt>5</dt>
                <dd>
                    질문은 <strong>5개 영역</strong>으로
                    구성되어 있어요.
                </dd>
            </dl>
            <dl class="info-text3">
                <dt>52</dt>
                <dd>
                    <strong>52개 문항</strong>으로 <strong>어르신의</strong>
                    <strong>심신상태</strong>를 조사해요
                </dd>
            </dl>
        </div>
        <div class="grade-text1 mt-9">
            <p>보건복지부에서 고시한 장기 요양 등급 판정 기준을 근거로 만들어진 테스트로, <strong class="underline">실제 등급 판정 결과와 상이할 수 있어요.</strong></p>
        </div>
        <p class="grade-text2 mt-21 md:!text-[1.875rem]">
        	테스트로 받을 수 있는 혜택 확인하고<br>
        	<strong>이로움돌봄 앱에서</strong> 장기요양 <strong>인정등급 신청하세요</strong>
        </p>
    </div>

	<div class="grade-floating">
	    <button onclick="startTest();">테스트 시작하기</button>
	</div>




    <!--비로그인시 사용자 팝업소스2-->
    <div class="modal modal-default fade" id="non-login-user" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="text-title">로그인</h2>
                    <button data-bs-dismiss="modal" class="btn-close">모달 닫기</button>
                </div>
                <div class="modal-body">
                    <div class="modal-bg-wrap2">
                        <div class="text-xl text-center">
                            로그인해주세요.<br>
                            테스트를 진행하고 이로움돌봄 앱에서 장기요양 인정등급을 신청하세요.
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="flex flex-col items-center w-full gap-4">

                        <button type="button" class="w-50 btn btn-primary2 large" onclick="location.href='/membership/login?returnUrl=/main/cntnts/test'">로그인하기</button>
                        <a href="/test/physical" class="text-sm underline text-black1">테스트만 진행하기</a>

                    </div>
                </div>
            </div>
        </div>
    </div>




	<!--비로그인시 사용자 팝업소스-->
	<!-- <div class="modal modal-index fade" id="non-login-user" tabindex="-1" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-lg">
	        <div class="modal-content">
	        <div class="modal-header">
	            <h2 class="text-title">로그인</h2>
	            <button data-bs-dismiss="modal" class="btn-close">모달 닫기</button>
	        </div>
	        <div class="modal-body">
	            <div class="modal-bg-wrap">
	                <div class="text-xl text-center">
	                    <p>
	                    	로그인하고 인정등급을 간편하게 신청해 보세요.<br>
	                    	테스트 결과를 바탕으로 전문가가 인정등급 신청<br>
	                    	을 도와드려요.
	                    </p>
	                </div>
	            </div>
	        </div>
	        <div class="modal-footer">
	            <div class="flex flex-col items-end w-full gap-2">
		            <button type="button" class="w-full btn btn-primary large" onclick="location.href='/membership/login?returnUrl=/main/cntnts/test'">로그인하기</button>
		            <a href="/test/physical"class="text-sm underline text-blue3">테스트만 진행하기</a>
	            </div>
	        </div>
	        </div>
	    </div>
	</div> -->

    <!-- 수급자 선택 모달 -->
    <jsp:include page="/WEB-INF/jsp/common/modal/select_recipient_modal.jsp" />

    <script>
        var rolling1 = null;
        var rolling2 = null;

        $('.grade-slider').each(function() {
            var slider = $(this);
            
            new Swiper(slider.find('.swiper').get(0), {
                loop: true,
                speed: 1000,
                autoplay: {
                    speed: 5000,
                    disableOnInteraction: false,
                },
                navigation: {
                    prevEl: slider.find('.swiper-button-prev').get(0),
                    nextEl: slider.find('.swiper-button-next').get(0)
                },
                pagination: {
                    el: slider.find('.swiper-pagination').get(0),
                },
                on: {
                    slideChange: function(swiper) {
                        var el = $(swiper.slides[swiper.activeIndex]);
                        el.closest('[class*="grade-content"]').find('.grade-taps a[href="#' + el.attr('id') + '"]').parent().addClass('is-active').siblings().removeClass('is-active');
                    }
                }
            });
        })
        
        $('.grade-taps a').on('click', function() {
            var target = $($(this).attr('href'));
            var slider = $(target).closest('.swiper').get(0).swiper;

            $(this).parent().addClass('is-active').siblings().removeClass('is-active');

            slider.slideTo(target.index())
            
            $(window).scrollTop(target.closest('[class*="grade-content"]').find('.grade-taps').offset().top - ($('#header').outerHeight() + 20))

            return false;
        });

        rolling1 = setInterval(function() {
            var taps   = $('.grade-content1 .taps-item');
            var active = $('.grade-content1 .taps-item.is-active');
            taps.each(function(index, element) {
                if(active.get(0) === element) {
                    if(taps[index+1] === undefined) {
                        $('.grade-content1 .taps-item:eq(0)').addClass('is-active').siblings().removeClass('is-active')
                    } else {
                        $(taps[index+1]).addClass('is-active').siblings().removeClass('is-active');
                    }
                    return false;
                }
            })
        }, 5000);

        rolling2 = setInterval(function() {
            var items  = $('[class*="rolling-item"]');
            var active = items.filter('.is-active');
            var margin = -active.next().outerHeight(true);
            
            active.clone().removeClass('is-active').appendTo(items.closest('.container'));

            active.removeClass('is-active').css({'margin-top' : margin}).next().addClass('is-active').one('transitionend animationend',function() {
                active.remove();
            });
        }, 6000);
    </script>
    
    <script>
	  	//테스트 시작하기 버튼 클릭
	    function startTest() {
            <c:choose>
	            <c:when test="${_mbrSession.loginCheck}">
	                window.location.href = "/test/physical";
	            </c:when>
	            <c:otherwise>
	            	$('#non-login-user').modal('show').appendTo('body');
	            </c:otherwise>
            </c:choose>
	    }
	  	
	  	//새롭게 진행하기
        // function createNewConslt() {
        // 	//등록된 수급자 선택값 가져오기
        // 	var radioRecipientsNo =  $('input[name=rcpts]:checked').val();
    	// 	if (!radioRecipientsNo) {
    	// 		alert('수급자를 선택하세요');
    	// 		return;
    	// 	}
    		
        	
        // 	if (confirm('새롭게 진행하실 경우 기존 상담은 취소됩니다. 진행하시겠습니까?')) {
        // 		//기존 상담취소 API 실행
    	// 		$.ajax({
    	// 			type : "post",
    	// 			url  : "/membership/info/myinfo/cancelRecipientConslt.json",
    	// 			data : {
    	// 				recipientsNo : radioRecipientsNo
    	// 				, prevPath : 'test'
    	// 			},
    	// 			dataType : 'json'
    	// 		})
    	// 		.done(function(data) {
    	// 			if(data.success) {
    	// 				location.href = '/test/physical?recipientsNo=' + radioRecipientsNo;
    	// 			}else{
    	// 				alert(data.msg);
    	// 			}
    	// 		})
    	// 		.fail(function(data, status, err) {
    	// 			alert('서버와 연결이 좋지 않습니다.');
    	// 		});
        // 	}
        // }
    </script>
</div>



        <!--돌봄앱 모달-->
        <jsp:include page="/WEB-INF/jsp/common/modal/dolbom_app_modal.jsp" />



        
        <script>
            //modal open
            //new Modal($("#dbapp_modal")).show();
        </script>