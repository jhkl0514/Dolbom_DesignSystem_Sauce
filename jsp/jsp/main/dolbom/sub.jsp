<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.disNone {
		display:none;
	}

    #container {
        padding-bottom: 0 !important;
    }

    [data-aos="animate_up_1"] {
        opacity: 0;
        transform: translateY(50px);

            &.aos-animate {
                opacity: 1;
                transform: translateY(0);
            }

        }

        @media (max-width: 768px) {

            .btn_area_down{width:100%;display: block;}
            .dbapp_bottom_banner .btn-primary{min-width: 100%;}

        }
</style>

<header id="subject">
    <nav class="breadcrumb">
        <ul>
			<li class="home"><a href="${_mainPath}">홈</a></li>
			<li>이로움 서비스</li>
            <li>이로움돌봄</li>
        </ul>
    </nav>

</header>


<!-- 이로움돌봄앱 소개페이지 -->
<div class="dbapp_intro_area">
    

    <div class="txt_area">
        <div class="title">
            
            <div data-aos="animate_up_1" data-aos-duration="1000">보호자 <strong>맘</strong>에 <strong>안심,</strong></div>
            <div data-aos="animate_up_1"  data-aos-duration="1000" data-aos-delay="300">부모님 <strong>몸</strong>에 <strong>휴식</strong></div>
            <div class="inline-block color_dbapp" data-aos="animate_up_1" data-aos-duration="1000" data-aos-delay="600"><strong>이로움돌봄</strong></div>
        </div>



        <div class="txt01" data-aos="animate_up_1" data-aos-easing="ease" data-aos-duration="1000" data-aos-delay="1000">
            당신의 돌봄에 쉼표를 달아요.<br>
            돌봄 고민은 전문가에게,<br>
            보호자들의 부모님 건강관리를 위한 앱
        </div>

        <div data-aos="fade-zoom-in" data-aos-duration="1000" data-aos-delay="800" data-aos-offset="0">
            <a class="btn btn-arrow btn-large2 btn-primary2 web" data-bs-toggle="modal" data-bs-target="#dbapp_modal">
                <strong>앱 다운로드하기</strong>
            </a>
        </div>
        
    </div>



    <div class="animate_area">
        <div class="object1"></div>
        <div class="object2"></div>
        <div class="object3"></div>
    </div>

</div>

<div>

    <div class="dbapp_ctn g01">

        <div class="dbapp_ctn_wrap">

            <div class="img_area" data-aos="fade-right" data-aos-duration="1200" data-aos-delay="400"></div>

            <div class="txt_area">
                <div class="title" data-aos="animate_up_1" data-aos-duration="600">인정등급 간편 테스트</div>
                <div class="txt01" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="200">장기요양보험 대상인지<br>30초 확인</div>
                <div class="txt02" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="300">
                    간단한 테스트로 더 빠르게 확인하세요.<br>
                    신청 후 진행상황도 빠르게 알려드려요.
                </div>
            </div>

        </div>

    </div>
    
    <div class="dbapp_ctn g02">

        <div class="dbapp_ctn_wrap">

            <div class="txt_area">
                <div class="title text-primary2" data-aos="animate_up_1" data-aos-duration="600">관심 복지용구</div>
                <div class="txt01" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="200">간편한 복지용구 신청</div>
                <div class="txt02" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="400">
                    모든 복지용구 정보를 한눈에!<br> 
                    어르신에게 필요한 복지용구를 신청하세요.
                </div>
            </div>

            <div class="img_area" data-aos="fade-left" data-aos-duration="1200" data-aos-delay="400"></div>

        </div>

    </div>
    
    <div class="dbapp_ctn g03">

        <div class="dbapp_ctn_wrap">

            <div class="img_area" data-aos="fade-right" data-aos-duration="1200" data-aos-delay="400"></div>

            <div class="txt_area">
                <div class="title text-primary2" data-aos="animate_up_1" data-aos-duration="600">어르신 돌봄</div>
                <div class="txt01" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="200">혼자 계시지 않도록<br>돌봄 신청</div>
                <div class="txt02" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="400">
                    집에 혼자 계신 어르신이 걱정되세요?<br> 
                    돌봄 서비스로 걱정을 덜어드릴게요.
                </div>
            </div>

        </div>

    </div>
    
    <div class="dbapp_ctn g04">

        <div class="dbapp_ctn_wrap">

            <div class="txt_area">
                <div class="title text-primary2" data-aos="animate_up_1" data-aos-duration="600">어르신 길잡이</div>
                <div class="txt01" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="200">어르신에게 유용한 정보</div>
                <div class="txt02" data-aos="animate_up_1" data-aos-duration="600" data-aos-delay="400">
                    어르신이 놓치고 있는 복지 정보와 <br> 
                    알면 도움이되는 건강 정보를 알려드려요.
                </div>
            </div>

            <div class="img_area" data-aos="fade-left" data-aos-duration="1200" data-aos-delay="400"></div>

        </div>

    </div>

    <div class="dbapp_bottom_banner">

        <div class="txt01" data-aos="animate_up_1" data-aos-delay="200">보호자 <strong>맘</strong>에 <strong>안심,</strong></div>
        <div class="txt02" data-aos="animate_up_1" data-aos-delay="400">보호자 <strong>몸</strong>에 <strong>휴식</strong></div>

        <div class="txt_link_arrow" data-aos="animate_up_1" data-aos-delay="600">이로움돌봄 앱으로 더 쉽고 편리하게 확인하세요</div>

        <div class="btn_area_down" data-aos="fade-zoom-in" data-aos-duration="1000" data-aos-delay="800" data-aos-offset="0">
            <a href="#" class="btn-primary" data-bs-toggle="modal" data-bs-target="#dbapp_modal">
                앱 다운로드하기
            </a>
        </div>

    </div>
    

    <!-- <div class="grade-floating dbapp">
        <a href="" id="search-recipients" data-bs-toggle="modal" data-bs-target="#dbapp_modal">
            <strong>이로움돌봄 앱 다운로드하기</strong>
        </a>
    </div> -->


    <div class="floating_dbapp">
        <a href="" id="search-recipients" data-bs-toggle="modal" data-bs-target="#dbapp_modal">
            <strong>이로움돌봄 앱 다운로드하기</strong>
        </a>
    </div>


</div>
	
		<div id="downloadBubble" class="disNone">
			<!-- 따라다니는 스크롤 -->
		    <div class="quickmenu">
		        <a href="" class="dbapp_link" data-bs-toggle="modal" data-bs-target="#dbapp_modal">
		            <img src="/html/page/index/assets/images/dbapp/btn_scroll_quick.svg" alt="">
		        </a>
		    </div>
	    </div>

        
        <script>
            //modal open
            //new Modal($("#dbapp_modal")).show();
            
            //따라다니는 스크롤
            $(document).ready(function () {
            	$('body').append($('#downloadBubble').html());

                $(window).on('resize scroll',function () {
                    
                    var currentPosition = parseInt($(".quickmenu").css("top"));

                    var screenHeight = $(window).height() / 2;

                    var position = $(window).scrollTop();
                    
                    if(position > 700) { 

                        $(".quickmenu").stop().animate({ "top": position + screenHeight + "px" }, 500);

                    } else {

                    }


                   

                });




            });
        </script>

        <link href="/html/page/index/assets/style/aos.css" rel="stylesheet">
        <script src="/html/page/index/assets/script/aos.js"></script>


        <script>
            AOS.init();
        </script>
