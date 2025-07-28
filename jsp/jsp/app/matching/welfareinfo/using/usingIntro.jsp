<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/html/page/app/matching/assets/src/js/swiper/swiper-bundle.min.css" />

<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">

<style>
    .swipe_long_care{
        position: relative; background-color: #f5f5f5; border-radius: 12px;width: 320px;

        &::before{
            display: block;
            position: absolute;
            content: '';
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 10;
        }
    }
    .swipe_long_care .swiper-slide{padding-top: 22px;}
    .swipe_long_care .swiper-slide img{width: 240px;display: block;margin: 0 auto;}
</style>

<div class="wrapper">
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="놓친 복지용구 받기" name="addTitle" />
        <jsp:param value="true" name="addShare" /> 
    </jsp:include>

    <main>
        <section class="intro">
            <h2 class="title02">
                숨은 지원금으로 주문요청!
            </h2>

            <h2 class="title color_tp_pp marT4">
                놓친 복지용구 받기
            </h2>

            <div class="h52"></div>

            <dotlottie-player src="/html/page/app/matching/assets/lottie/welfare/om_res.json" background="transparent" speed="1" style="width: 100%; height: 300px;" loop autoplay></dotlottie-player>

            <div class="h24"></div>

            <div class="color_t_t font_sbsr">※ 요양인정번호를 등록해야 이용할 수 있어요.</div>

            <div class="h56"></div>

            <div class="h12 back_F7F7F7 marW-20"></div>

            <div class="h56"></div>

            <h2 class="title02" data-aos="fade-up">
                이용할 수 있는 장기요양급여<br>
                확인해보세요
            </h2>

            <div class="h24"></div>

            <div class="color_t_s font_sbmr" data-aos="fade-up">연간 160만 원 한도의 장기요양급여으로 85%~100% 지원받아 구매할 수 있어요.</div>

            <div class="h52"></div>

            <div class="radius12 back_FFF5E6" data-aos="fade-up">
                <div class="pad_20_16_16 align_between_center">
                    <div class="font_sblr">
                        <span class="font_sblb">대상자별 본인부담금</span> 예시
                    </div>
                </div>

                <div class="pad012">
                    <hr class="color_gray">
                </div>

                <div class="h12"></div>

                <div class="pad016 l_right color_t_s font_sbssr">*10만원 복지용구 구매 시</div>

                <div class="wrap_coin_area">
                    <div class="coinLine">
                        <div class="coin_toolTip">15,000원</div>
                        <div class="coin_sort">
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>

                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>

                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>

                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>

                            <span class="coin"></span>
                        </div>
                        <div class="txt">일반(15%)<br>대상자</div>
                    </div>
                    <div class="coinLine">
                        <div class="coin_toolTip">6,000원</div>
                        <div class="coin_sort">
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>

                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                        </div>
                        <div class="txt">감경(6%)<br>대상자</div>
                    </div>
                    <div class="coinLine">
                        <div class="coin_toolTip">9,000원</div>
                        <div class="coin_sort">
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>

                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>
                            <span class="coin"></span>

                            <span class="coin"></span>
                        </div>
                        <div class="txt">감경(9%)<br>대상자</div>
                    </div>
                    <div class="coinLine">
                        <div class="coin_toolTip">0원</div>
                        <div class="coin_sort"></div>
                        <div class="txt">기초생활<br>수급자</div>
                    </div>
                </div>
            </div>

            <div class="h20"></div>

            <div class="color_t_t font_sbsr">※ 데이터 조회 시점에 따라 이용하는 복지용구 정보와 상이할 수 있어요.</div>

            <div class="h56"></div>

            <div class="h12 back_F7F7F7 marW-20"></div>

            <div class="h56"></div>

            <h2 class="title02" data-aos="fade-up">
                놓친 복지용구<br>
                어떻게 이용하나요??
            </h2>

            <div class="h52"></div>

            <div data-aos="fade-up">
                <div class="welfase_step_num num1" data-aos="fade-up">어르신 요양정보 조회</div>

                <div class="h12"></div>

                <div class="color_t_s font_sbmr" data-aos="fade-up">
                    요양인정번호를 등록해야 이용할 수 있어요.
                    <div class="color_t_danger">(보호자 신청 시 위임 동의 필요)</div>
                </div>

                <div class="h20"></div>

                <div class="swiper swipe_long_care" data-aos="fade-up">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide ">
                            <img src="/html/page/app/matching/assets/src/images/11easy/swipe_long_care_01.png" alt="wel01">
                        </div>

                        <div class="swiper-slide">
                            <img src="/html/page/app/matching/assets/src/images/11easy/swipe_long_care_02.png" alt="wel01">
                        </div>

                        <div class="swiper-slide">
                            <img src="/html/page/app/matching/assets/src/images/11easy/swipe_long_care_03.png" alt="wel01">
                        </div>
                    </div>
                </div>

                <div class="h80"></div>
            </div>

            <div data-aos="fade-up">
                <div class="welfase_step_num num2" data-aos="fade-up">남은 급여 및 복지용구 확인</div>

                <div class="h12"></div>

                <div class="color_t_s font_sbmr" data-aos="fade-up">
                    남은 장기요양급여와 받을 수 있는 복지용구를 확인하세요.
                </div>

                <div class="h20"></div>

                <div class="center fs_zero" data-aos="fade-up">
                    <img src="/html/page/app/matching/assets/src/images/11easy/welfare_02.png" alt="wel02" class="w320">
                </div>

                <div class="h80"></div>
            </div>

            <div data-aos="fade-up">
                <div class="welfase_step_num num3" data-aos="fade-up">복지용구 주문</div>

                <div class="h12"></div>

                <div data-aos="fade-up">
                    <div class="color_t_s font_sbmr">원하는 복지용구를 선택해 주문요청하세요.</div>
                    <div class="color_t_danger font_sbmr">(장기요양기관에서 검토 후 주문이 진행돼요)</div>
                </div>

                <div class="h20"></div>

                <div class="center fs_zero" data-aos="fade-up">
                    <img src="/html/page/app/matching/assets/src/images/11easy/welfare_03.png" alt="wel03" class="w320">
                </div>

                <div class="h80"></div>
            </div>

            <div data-aos="fade-up">
                <div class="welfase_step_num num4" data-aos="fade-up">복지용구 수령 및 사용</div>

                <div class="h12"></div>

                <div class="color_t_s font_sbmr" data-aos="fade-up">
                    주문한 복지용구를 받아서 편하게 사용하세요.
                </div>

                <div class="h20"></div>

                <div class="welfare_ani_04" data-aos="fade-up">
                    <div class="sbtool_01"></div>
                    <div class="sbtool_02"></div>
                    <div class="sbtool_03"></div>
                </div>

                <div class="h56"></div>
            </div>

            <div class="h12 back_F7F7F7 marW-20"></div>

            <div class="h40"></div>

            <div class="font_sblb">더 자세히 알아보세요</div>

            <div class="h08"></div>

            <div class="marW-20">

                <ul class="collapsible default">
                    <li class="bder_bottom active">
                        <div class="collapsible-header pad20">
                            <span class="font_sbms">요양인정번호가 없으신가요?</span>
                            <span class="arrow"></span>
                        </div>
                        
                        <div class="collapsible-body noPad">
                            <div class="pad20 back_FAFAFA">
                                <div class="color_t_s font_sbmr">
                                    인정등급 테스트 후 상담을 신청하면 발급을 도와드려요.
                                </div>

                                <div class="h12"></div>

                                <span class="waves-effect link_text font_sbms" onclick="location.href='/matching/simpletest/simple/intro'"><u>인정등급 간편 테스트 바로가기</u></span>
                            </div>
                        </div>
                    </li>
                    <li class="bder_bottom">
                        <div class="collapsible-header pad20">
                            <span class="font_sbms">복지용구를 어떻게 받을 수 있나요?</span>
                            <span class="arrow"></span>
                        </div>
                        
                        <div class="collapsible-body noPad">
                            <div class="pad20 back_FAFAFA">
                                <div class="color_t_s font_sbmr">
                                    요양정보를 조회하고 원하는 복지용구를 주문 요청하세요. 전문가가 복지용구를 받으실 수 있도록 도와드려요.
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="h40"></div>
        </section>
    </main>

    <footer class="page-footer">
        <div class="relative">
            <a class="waves-effect btn-large btn_primary w100p btn next" onclick="handleNextBtnClick()">남은 급여 사용하기</a>
        </div>
    </footer>
</div>

<script src="https://unpkg.com/@dotlottie/player-component@latest/dist/dotlottie-player.mjs" type="module"></script>

<script src="/html/page/app/matching/assets/src/js/swiper/swiper-bundle.min.js"></script>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    async function handleNextBtnClick() {
        const isNotLogin = "${_matMbrSession.loginCheck}" === "false";
        if (isNotLogin) return handleNotLogin();
        
        const isNotRecipientExist = !"${recipient.recipientsNo}";
        if (isNotRecipientExist) return handleNotExistRecipient();

        const isNotVerified = '${recipient.verificationYn != null && recipient.verificationYn.equals("Y")}' !== 'true';
        if (isNotVerified) return handleNotVerified();

        const isNotLongtermConfirmed = '${recipient.longtermConfirmYn != null && recipient.longtermConfirmYn.equals("Y")}' !== 'true';
        if (isNotLongtermConfirmed) return handleNotLongtermConfirmed();

        location.href = '/matching/welfareinfo/using/view?recipientsNo=' + "${recipient.recipientsNo}";
    }

    async function handleNotLogin() {
        const confirm = await showConfirmPopup('로그인해주세요', '놓친 복지용구 받기를 이용하시려면 로그인이 필요해요.', '로그인하기');
        if (confirm !== 'confirm') return;

        location.href = "/matching/loginRedirect?loginReturnUrl=" + location.pathname + location.search;
    }

    async function handleNotExistRecipient() {
        const confirm = await showConfirmPopup('어르신을 등록해 주세요', '혜택을 받으려면 정확한 어르신 정보가 필요해요.', '등록하기');
        if (confirm !== 'confirm') return;

        location.href = '/matching/membership/recipients/regist/relation?redirectUrl=' + encodeURIComponent(location.pathname + location.search);
    }

    async function handleNotVerified() {
        const confirm = await showConfirmPopup('어르신 동의가 필요해요', '정확한 서비스 이용을 위해 어르신의 동의가 필요해요. 어르신 위임을 진행해 주세요', '위임하기');
        if (confirm !== 'confirm') return;
            
        const qsMap = {"type" :  "rcperRcognNoRegist"
                    , "recipientsNo":"${recipient.recipientsNo}"
                    , "recipientsGender":"${recipient.gender}"
                    , "recipientsRelationCd":"${recipient.relationCd}"
                };
        location.href = '/matching/membership/info/identityRecipientMandate?'+ new JsCommon().fn_queryString_fromMap(qsMap);
    }

    async function handleNotLongtermConfirmed() {
        const confirm = await showConfirmPopup('요양인정번호를 등록해 주세요', '정확한 서비스 이용을 위해 요양인정번호가 필요해요. 요양인정번호를 등록 또는 인증해 주세요', '등록하기');
        if (confirm !== 'confirm') return;
        
        location.href = '/matching/membership/recipients/rcperRcognNoRegist?recipientsNo=${recipient.recipientsNo}'
    }

    
    $(function() {
        setupAnimateOnScroll();
        setupCoinsStyle();
        handleScrollTriggerAnimation();
        setupLongtermInfoSwiper();
        $('.collapsible.default').collapsible({});
    })
    
    function setupAnimateOnScroll() {
        AOS.init({
            duration: 800,
            once: true,
            offset: 150,
        });
    }
    
    function setupCoinsStyle() {
        $('.coinLine').each(function () {
            const $this = $(this);                     // 현재 coinLine 컨테이너
            const $coinSort = $this.find('.coin_sort'); // .coin_sort 컨테이너
            const $coins = $coinSort.find('.coin');    // .coin 요소들
            const totalCoins = $coins.length;          // .coin의 총 개수
            const $coinToolTip = $this.find('.coin_toolTip'); // .coin_toolTip 요소

            // 각 .coin의 top과 z-index 설정
            $coins.each(function (index) {
                const calculatedIndex = totalCoins - index - 1; // 역순 계산
                $(this).css({
                    'top': calculatedIndex * 2 + 'px',        // top 값 설정
                    'z-index': totalCoins - index            // z-index 값 설정
                });
            });

            // coin_toolTip의 top 값 설정
            const firstCoinTop = parseInt($coins.first().css('top')) || 0; // 첫 번째 코인의 top 값
            $coinToolTip.css('top', firstCoinTop + 'px');               // toolTip의 top 값 설정

            // coinLine의 height 강제 설정 (필요 시)
            $this.height($this.height());
        });
    }

    function handleScrollTriggerAnimation() {
        $(window).scroll(function () {
            const $wrapCoinArea = $('.wrap_coin_area'); // 전체 coin_area
            const wCoinAreaTop = $wrapCoinArea.offset().top;
            const windowScrollTop = $(window).scrollTop();
            const windowHeight = $(window).height();

            // 스크롤 상단에 표시되면 동전 애니메이션 실행
            if (wCoinAreaTop > windowScrollTop + windowHeight - 300) return;
            
            const $coinLines = $wrapCoinArea.find('.coinLine'); // coinLine 리스트
            let completedLines = 0; // 완료된 coinLine 개수 (변화가 필요하므로 let 사용)

            $coinLines.each(function () {
                const $coinLine = $(this);
                const $coins = $coinLine.find('.coin').toArray().reverse(); // 동전을 역순으로 가져오기
                const $tooltip = $coinLine.find('.coin_toolTip');

                // 동전 애니메이션 처리
                $coins.forEach(function (coin, index) {
                    $(coin).css({
                        transform: 'translateY(0)',
                        opacity: 1,
                        transition: 'transform 0.3s ease-out ' + (index * 0.1) + 's, opacity 0.6s ease-out',
                    });
                });

                // 개별 coinLine 애니메이션 완료 후 처리
                const totalAnimationTime = $coins.length * 0.2; // 마지막 동전의 애니메이션 종료 시간
                setTimeout(function () {
                    // ① tooltip 말풍선 개별 출력
                    $tooltip.css({
                        opacity: 1,
                        transform: 'translateY(0)',
                        transition: 'opacity 0.2s ease-out, transform 0.2s ease-out',
                        animation: 'coin_tooltipAni 2s ease-in-out infinite',
                    });

                    // 완료된 coinLine 개수 증가
                    completedLines++;
                    if (completedLines === $coinLines.length) {
                        // 모든 coinLine 완료 시 추가 처리 (필요 시)
                        // console.log('모든 동전 애니메이션 완료');
                    }
                }, totalAnimationTime * 580); // 500
            });
        });
    }

    function setupLongtermInfoSwiper() {
        let swiperInitialized = false; // 플래그 변수 추가

        $(window).scroll(function() {
            const swipeTop01 = $('.swipe_long_care').offset().top;
            const windowScrollTop = $(window).scrollTop();
            const windowHeight = $(window).height();

            // 스크롤 상단 표시되면 Swiper 초기화
            if (swipeTop01 <= windowScrollTop + windowHeight && !swiperInitialized) {
                swiperInitialized = true; // 플래그를 true로 설정하여 초기화 방지
                const swiper = new Swiper('.swipe_long_care', {
                    speed: 800,
                    spaceBetween: 16,
                    loop: true,
                    autoplay: {
                        delay: 1500,
                    },
                });
            }
        });
    }
</script>