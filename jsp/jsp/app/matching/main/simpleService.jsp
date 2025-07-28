<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="wrapper">

    <main>
      <section class="back_service_info">

        <div class="h40"></div>

        <div class="center">
          <img src="/html/page/app/matching/assets/src/images/08etc/img_help.png" class="w80" alt="">
        </div>

        <h4 class="title color_white center">어떤 도움을 받고 싶으세요?</h4>

        <div class="h24"></div>

        <div class="card waves-effect w100p">

          <div class="card-content d-flex justify-content-between align-items-center btn-click shop">

            <div>
              <span class="badge_order back_danger_subtle">요양인정번호 필요</span>
              <div class="font_sblb marT4 marB4">놓친 복지용구 받기</div>
              <span class="color_t_s font_sbsr">복지용구 주문요청하기</span>
            </div>
            <img src="/html/page/app/matching/assets/src/images/08etc/img_ SimpleTest.svg" class="w80" alt="놓친 복지용구 받기">

          </div>
        </div>
        <!-- card -->

        <div class="h16"></div>

        <div class="card waves-effect w100p">

          <div class="card-content d-flex justify-content-between align-items-center btn-click simple test">

            <div>
              <div class="font_sblb marB4">간편 테스트</div>
              <span class="color_t_s font_sbsr">장기요양 대상자 확인하기 </span>
            </div>
            <img src="/html/page/app/matching/assets/src/images/08etc/test_80.svg" class="w80" alt="간편 테스트">

          </div>
        </div>
        <!-- card -->

        <div class="h16"></div>

        <div class="card waves-effect w100p">

          <div class="card-content d-flex justify-content-between align-items-center btn-click interest ">

            <div>
              <div class="font_sblb marB4">관심 복지용구</div>
              <span class="color_t_s font_sbsr">복지용구 지원받기</span>
            </div>
            <img src="/html/page/app/matching/assets/src/images/08etc/tool_40.svg" class="w80" alt="관심 복지용구">
            
          </div>
        </div>
        <!-- card -->

        <div class="h16"></div>

        
        <div class="card waves-effect w100p">

          <div class="card-content d-flex justify-content-between align-items-center btn-click care">

            <div>
              <div class="font_sblb marB4">어르신 돌봄</div>
              <span class="color_b_ib font_sbsr">재가센터 지원받기</span>
            </div>
            <img src="/html/page/app/matching/assets/src/images/08etc/time03_80.svg" class="w80" alt="어르신 돌봄">

          </div>
        </div>
        <!-- card -->



      </section>
    </main>



  </div>
  <!-- wrapper -->
   
   
  <script>
	$(function() {
		//body에 css class 추가
		$('body').addClass('back_gray02');

    $('.btn-click.shop').click(function(){
        location.href = '/matching/welfareinfo/using/intro';
    });
    $('.btn-click.simple.test').click(function(){
        location.href = '/matching/simpletest/simple/intro';
    });
    $('.btn-click.interest').click(function(){
        location.href = '/matching/welfareinfo/interest/intro';
    });
    $('.btn-click.care').click(function(){
        location.href = '/matching/simpletest/care/intro';
    });
	})
  </script>