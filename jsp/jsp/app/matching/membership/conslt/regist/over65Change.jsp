<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div class="wrapper">
	
	    <!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
	
	
	    <main>
            <section class="intro">


                <h3 class="title">
                    어르신의 연세를 선택해주세요
                </h3>

                <div class="h40"></div>


                <div class="color_t_s font_sbsr">어르신 연세</div>

                <div class="h08"></div>
                
                <ul class="chip_area c02 noPad">

                    <li value="Y">65세 이상</li>
                    <li value="N">65세 미만</li>
                </ul>

                <div class="vaild_txt">{${over65Seperate}} 이전에 태어나신 어르신 기준</div> 


            </section>
        </main>
	
	
	    <footer class="page-footer">
	
	      <div class="btn_area d-flex f-column">
	
			<a class="waves-effect btn-large btn_disable w100p evt_btn">변경하기</a>

	      </div>
	
	    </footer>
        
	</div>
	<!-- wrapper -->
	
	  
    <script>
      	
    	
    	
      	$(function() {
      		//시도 지역선택 chip
			$('.chip_area.c02 li').each(function(){

				$(this).click(function () {
					//버튼 활성화 클래스변경
					$(this).parent('.chip_area.c02').find('li').removeClass('active');
					$(this).addClass('active');
					$('.evt_btn').removeClass('btn_disable');
				});
			});

			$('.evt_btn').click(function(){
				var qsMap = (new JsCommon()).fn_queryString_toMap();
				qsMap["over65Yn"] = $('.chip_area.c02 li.active').attr("value");

                removeHistoryStackFrom('infoConfirm');
				location.href='/matching/membership/conslt/infoConfirm?' + (new JsCommon()).fn_queryString_fromMap(qsMap);
			});


			var qsMap = (new JsCommon()).fn_queryString_toMap();
			if (qsMap["over65Yn"] != undefined && qsMap["over65Yn"].length > 0){
				$('.chip_area.c02 li[value='+qsMap["over65Yn"]+']').click();
			}
      	});
    </script>