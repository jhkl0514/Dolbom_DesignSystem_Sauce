<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- swiper -->
  	<link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />
  	
  	<style>
 	    dotlottie-player{width:100%;height:auto;}
 	
	    /* lottie 결합 */
	    /* .lottie_comb_img{width: 100%; height: auto; justify-content: flex-end; align-items: flex-start; display: inline-flex;}
	    .lottie_comb_img .clock{top:30px; left:90px; position: relative; z-index:10;}
	    .lottie_comb_img .people{position: relative} */
	
	    .touch_lock {
	      position: absolute;
	      width: 100%;
	      display: block;
	      z-index: 10;
	      background: #ff000000;
	    }
  	</style>
  	

    <div class="wrapper">

	    <header>
	      <nav class="top">
	        <div></div>
	        <a class="waves-effect top_txt" href="#" onclick="skipEvt()">건너뛰기</a>
	      </nav>
	    </header>
	
	    <main>
	      <section class="noPad">
	
	        <div class="h40"></div>
	
	        <div class="swiper swiper_onboard">
	
	          <!-- 1 -->
	          <div class="swiper-wrapper">
	
	            <div class="swiper-slide">
	
	              <h3 class="title">
	                장기요양보험 대상인지 30초 확인
	              </h3>
	
	              <div class="h12"></div>
	
	              <div class="color_t_s font_sbmr">간단한 테스트를 통해 장기요양보험 혜택을 받을 수 있는지 빠르게 확인하세요</div>
	
	              <div class="slide_img lt_01">
                  	<dotlottie-player src="/html/page/app/matching/assets/lottie/onboarding_1.lottie" background="transparent" speed="1" loop autoplay></dotlottie-player>
	              </div>
	
	            </div>
	            <!-- swiper-slide -->
	
	            <!-- 2 -->
	            <div class="swiper-slide">
	
	              <h3 class="title">
	                간편한 복지용구 구매 신청
	              </h3>
	
	              <div class="h12"></div>
	
	              <div class="color_t_s font_sbmr">관심있는 복지용구를 장기요양금액으로 85%~100% 지원받아 이용하세요</div>
	
	              <div class="slide_img lt_02">
                  	<dotlottie-player src="/html/page/app/matching/assets/lottie/onboarding_2.lottie" background="transparent" speed="1" loop autoplay></dotlottie-player>
	              </div>
	
	            </div>
	            <!-- swiper-slide -->
	
	            <!-- 3 -->
	            <div class="swiper-slide">
	
	              <h3 class="title">
	                혼자 계시지 않도록 돌봄 신청
	              </h3>
	
	              <div class="h12"></div>
	
	              <div class="color_t_s font_sbmr">어르신에게 맞는 돌봄 서비스를 장기요양금액을 지원받고 이용하세요</div>
	
                  <div class="slide_img lt_03">
                  	<dotlottie-player src="/html/page/app/matching/assets/lottie/onboarding_3.lottie" background="transparent" speed="1" loop autoplay></dotlottie-player>
                  </div>
	
	            </div>
	            <!-- swiper-slide -->
	
	
	            <!-- 4 -->
	            <div class="swiper-slide">
	
	              <h3 class="title">
	                어르신에게 유용한 복지 콘텐츠
	              </h3>
	
	              <div class="h12"></div>
	
	              <div class="color_t_s font_sbmr">
	                다양한 복지용구 정보와 어르신이 받을 수 있는 복지 혜택을 확인하세요
	              </div>
	
	              <div class="slide_img lt_04">
                  	<dotlottie-player src="/html/page/app/matching/assets/lottie/onboarding_4.lottie" background="transparent" speed="1" loop autoplay></dotlottie-player>
                  </div>
	
	            </div>
	            <!-- swiper-slide -->
	
	          </div>
	          <div class="swiper-pagination"></div>
	
	        </div>
	
	      </section>
	    </main>
	
	
	    <footer class="page-footer">
	
	      <div class="btn_area d-flex f-column">
	
	        <a class="waves-effect btn-large btn_primary w100p evt_nextBtn" onclick="clickNextBtn();">다음</a>
	
	      </div>
	
	    </footer>

    </div>
    <!-- wrapper -->


	<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>
	<script>
	
    	var swiper = new Swiper(".swiper_onboard", {
	        navigation: {
	          nextEl: ".evt_nextBtn",
	        },
	        pagination: {
	          el: ".swiper-pagination",
	        },
	
	        //마지막 슬라이드일때 버튼 텍스트 변경
	        on: {
	          activeIndexChange: function () {
	            if(this.realIndex == 3){
	              $('.evt_nextBtn').text('시작하기');
	            }
	            else{
	              $('.evt_nextBtn').text('다음');
	            }
		      }
	        }
        });

        //건너뛰기 버튼 마지막 슬라이드
        function skipEvt() {
        	swiper.slideTo(3, 500, false);
        	location.href = '${redirectUrl}';
        }
        
        //시작하기 버튼 클릭
        function clickNextBtn() {
        	if ($('.evt_nextBtn').text() === '시작하기') {
        		skipEvt();
        	}
        }
        
        
        $(function () {

            //슬라이드 제스쳐 방지
            var swiper_onboard = $('.swiper_onboard').height();

            $('.touch_lock').height(swiper_onboard);
            
        });
	</script>