<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.common.util.StringUtil"%>
<div class="wrapper">
	
    <!-- swiper -->
    <link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />

    <style>
        .swiper-slide {
            padding: 20px;
        }

        .om_guide_Swiper .swiper-pagination {
            width: auto;
            top: 36px;
            right: 36px;
            left: initial;
            font-size: 0;
            line-height: 0;
        }

        .wel_scroll_area{position: relative;top:0;background-color: #fff;}
        .wel_scroll_area .btn_accord_area{background: linear-gradient(270deg, #ffffff 58.52%, rgba(255, 255, 255, 0.00) 99.11%);}
        .wel_scroll_area.active .wel_scroll{padding: 20px 50px 20px 16px;}

        .wel_scroll_area.fixed{position: fixed;top:56px;}

    </style>
    <script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>

    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
    	<jsp:param value="true" name="noBackButtion" />
        <jsp:param value="" name="addButton" />
        <jsp:param value="어르신 길잡이" name="addTitle" />
    </jsp:include>

    <main>
        <section class="default">

            <!-- Swiper -->
            <div class="swiper om_guide_Swiper marT-20W-20">
                <div class="swiper-wrapper">

                    <c:set var="statusIndex" value="-1" />
                    <c:forEach var="resultList" items="${listVO.listObject}" varStatus="status">
                        <c:if test="${resultList.addValueChk01 == 'Y'}">
                            <c:set var="pageParam" value="nttNo=${resultList.nttNo}&amp;curPage=${listVO.curPage}" />
                        
                            <div class="swiper-slide">
                                <a href="./view?${pageParam}" class="block">
                                    <c:set var="statusIndex" value="${statusIndex + 1}" />
                                    <div class="card waves-effect om_guide_card ${swiperBackcolor.get(statusIndex % 3)}" style="background-image:url(${resultList.addValueText03});">
            
                                        <div class="card-content">
            
                                            <div class="padR120">
                                                <div class="color_t_bs font_sbsr">${resultList.ctgryNm}</div>
            
                                                <h4 class="title marT2 line_clamp_2">${resultList.addValueText01}</h4>
            
                                                <p class="color_t_s font_sbsr marT4 line_clamp_2">
                                                    ${resultList.addValueText02}
                                                </p>
                                            </div>
            
                                            <div class="h46"></div>
            
                                        </div>
                                    </div>
                                    <!-- card -->
                                </a>
                            </div>
                        </c:if>
                        
                    </c:forEach>
                    
                </div>

                <div class="swiper-pagination"></div>
            </div>


            <!-- todo DEDS-102 -->
            <div class="marW-20 h80 scroll_point">
            <!-- todo DEDS-102 end -->       
                <div class="wel_scroll_area">

                    <div class="btn_accord_area">

                        <div class="btn_accord">
                            <span></span>
                        </div>

                    </div>

                    <div class="wel_scroll">

                        <div class="chip_area02">
                            <a class="totalAll active">전체</a>
                            
                            <c:forEach var="itemOne" items="${bbsSetupVO.ctgryList}" varStatus="status">
                            	<a class='om_cate_${StringUtil.lpad(itemOne.getCtgryNo().toString(), 2, "0")}'>${itemOne.getCtgryNm()}</a>
                			</c:forEach>

                        </div>
    
                    </div>

                </div>
                <!-- wel scroll area end -->

            </div>


            <div class="box_normal marW-20 pad020 om_categoryList">

                <c:forEach var="resultList" items="${listVO.listObject}" varStatus="status">
                    <c:set var="pageParam" value="nttNo=${resultList.nttNo}&amp;curPage=${listVO.curPage}" />
                    
                    <a href="./view?${pageParam}" class="block" title="om_cate_${StringUtil.lpad(resultList.getCtgryNo().toString(), 2, "0")}">

                        <div class="waves-effect list_link exp01 bder_bottom">
                            <div>
                                <div class="color_t_s font_ssr">${resultList.ctgryNm}</div>
                                <div class="font_sbms marT4">${resultList.ttl}</div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <!-- box -->

        </section>
    </main>
    
	<!-- 하단 네이비게이션 -->
	<jsp:include page="/WEB-INF/jsp/app/matching/common/bottomNavigation.jsp">
		<jsp:param value="guide" name="menuName" />
	</jsp:include>
</div>

<script>
    $(function () {
        $("body").addClass("back_gray");
        
      	//백버튼 클릭 시 서비스메인으로 이동
		backBtnEvent = function() {
			location.href='/matching/main/service';
		}
        
        var swiper = new Swiper(".om_guide_Swiper", {
            autoHeight: true,
            spaceBetween: 0,
            pagination: {
                el: ".swiper-pagination",

            },
        });

    });
</script>


<!-- 관련 js -->
<script>

    $(function () {


        //btn toggle
        $('.btn_accord').on('click', function () {

            if ($(this).parents('.wel_scroll_area').hasClass('active') == true) {

                $(this).parents('.wel_scroll_area').removeClass('active');

            }

            else {
                $(this).parents('.wel_scroll_area').addClass('active');
            }

        });


        //어르신 카테고리 필터
        //전체버튼
        $('.chip_area02 .totalAll').click(function(){

            $(this).addClass('active');

            $('.chip_area02 [class^="om_cate_"]').removeClass('active');

            $('.om_categoryList [title^="om_cate_"]').fadeIn(100);


        });

        //각 버튼            
        $('.chip_area02 [class^="om_cate_"]').click(function(){

            //클라스 추출
            var thisClass = $(this).attr('class').substr(0,10);

            $('.chip_area02 [class^="om_cate_"]').removeClass('active');

            $('.om_categoryList a').fadeOut(100);

            $(this).addClass('active');

            $('.om_categoryList [title='+ thisClass +']').fadeIn(100);

            
            $('.chip_area02 .totalAll').removeClass('active');


        });

        //전체버튼 포함한 모든 버튼
        $('.chip_area02 a').click(function(){


            if ($(this).hasClass('active') == true) {

                //chip영역 닫음
                $('.wel_scroll_area').removeClass('active');

            }

            else {

                $('.chip_area02 a').removeClass('active');
                $(this).addClass('active');

                //chip영역 닫음
                $('.wel_scroll_area').removeClass('active');


            }


            //버튼 클릭시 버튼영역 왼쪽으로 이동
            var thisPosition = $('.chip_area02 a.active').position().left;
            var thisSl = $('.wel_scroll').scrollLeft();
            $('.wel_scroll').animate({scrollLeft : thisPosition + thisSl - 30}, 300) ;

        });




            
        //태그필터가 한줄에 전부 표시되면 영역 버튼 숨기기 여부
        function resize_wel_scroll() {

            var windowWidth = $(window).width();
            var chip_Width = $('.chip_area02').width() + 30;

            if (chip_Width > windowWidth) {
                $('.btn_accord_area').show();
                $('.wel_scroll').removeClass('no_scroll_area');
            }
            else {
                $('.btn_accord_area').hide();
                $('.wel_scroll').addClass('no_scroll_area');
            }

        }

        resize_wel_scroll();

        //윈도우 사이즈에 따른 조정
        $(window).resize(function () {

            resize_wel_scroll();

        });
            


        $(window).scroll(function(){

            var winTop = $(window).scrollTop();

            //상단 div 위치
            var wel_scroll_T = $('.wel_scroll_area').closest('.scroll_point').position().top - 56;

            if(winTop >= wel_scroll_T){
                $('.wel_scroll_area').addClass('fixed');
            }
            else{
                $('.wel_scroll_area').removeClass('fixed');
            }

        });




    });



</script>