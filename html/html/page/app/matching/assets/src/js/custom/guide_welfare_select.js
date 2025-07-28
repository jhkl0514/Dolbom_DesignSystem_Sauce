//guide_welfare_select.js


$(function(){

    var scroll_orderFlxNav = function(){

        //스크롤시 orderFlxNav 표시유무
        var winTop = $(window).scrollTop();
        
        //orderListArea 위치
        var orderListArea_scroll_T = $('.orderListArea').position().top - 60;

        if(winTop >= orderListArea_scroll_T){
            $('.orderFlxNav').addClass('active');
        }
        else{
            $('.orderFlxNav').removeClass('active');
        }

    };

    scroll_orderFlxNav();



        //스크롤시
        $(window).scroll(function () {


            scroll_orderFlxNav();

            // $('.orderFlxNav .tabs_wd a.active').each(function(){

            //     var thisPosition = $(this).position().left;
            //     var thisSl = $('.orderFlxNav .tabs_wd').scrollLeft();
            //     $('.orderFlxNav .tabs_wd').scrollLeft(thisPosition + thisSl - 30);
            // });

        });  


});

//페이지 로드방지
$(document).ready(function() {
    setTimeout(function() {
        $('.tableWD_Evt').addClass('active'); // 0.5초 후 테이블을 페이드 인
    }, 500); // 0.5초 후
});


//youtube 섬네일 이미지 클릭시 재생
document.addEventListener("DOMContentLoaded", function () {
    const youtubeWraps = document.querySelectorAll(".youtube_size_wrap");

    youtubeWraps.forEach((wrap) => {
        const thumbnail = wrap.querySelector(".youtube_size_wrap .thumb_img");
        const youtubeContainer = wrap.querySelector(".youtube_size_wrap .youtube_area");
        const youtubeSrc = youtubeContainer.getAttribute("data-youtube-src");

        thumbnail.addEventListener("click", function () {
            // 유튜브 iframe 삽입
            youtubeContainer.innerHTML = `<iframe width="100%" height="100%" 
                                            src="${youtubeSrc}" 
                                            frameborder="0" 
                                            allow="autoplay; encrypted-media" 
                                            allowfullscreen>
                                          </iframe>`;
            // 이미지 숨기고 유튜브 영상 보이게 변경
            thumbnail.style.display = "none";
            youtubeContainer.classList.remove("disNone");
        });
    });
});


//swiper 페이지 로드시 해당메뉴 왼쪽배치
document.addEventListener("DOMContentLoaded", function () {
    var activeIndex = 0; // 기본값 (첫 번째 슬라이드)
    var slides = document.querySelectorAll(".welfare_swiper .swiper-slide");

    // 현재 선택된 메뉴(active 클래스가 있는 슬라이드) 찾기
    slides.forEach((slide, index) => {
        if (slide.querySelector(".welfare_swiper .wd_btn.active")) {
            activeIndex = index;
        }
    });

    var swiper = new Swiper(".welfare_swiper", {
        slidesPerView: "auto",
        centeredSlides: false, // 선택된 슬라이드를 중앙 정렬
        initialSlide: activeIndex, // 활성화된 슬라이드로 이동
    });

    // Swiper가 초기화된 후 강제로 이동 (필요할 경우)
    swiper.slideTo(activeIndex, 0);
});


//기존 이로움온에서 동착
function openInParent(event, url) {
    event.preventDefault(); // 기본 링크 동작 방지
    if (window.opener) {
        window.opener.location.href = url; // A 창(A)에서 링크 열기
        window.opener.focus(); // A 창으로 포커스 이동
    } else {
        window.location.href = url; // A 창이 없으면 현재 창에서 열기
    }
}


// $(document).ready(function () {
//     let lastScrollTop = $(window).scrollTop(); // 이전 스크롤 위치 저장

//     $(window).on("scroll", function () {
//         let currentScrollTop = $(window).scrollTop(); // 현재 스크롤 위치

//         if (currentScrollTop < lastScrollTop) {
//             // 스크롤을 위로 올릴 때
//             $(".table_bordered.table_showEvt").addClass("active");
//         } else {
//             // 스크롤을 아래로 내릴 때
//             $(".table_bordered.table_showEvt").removeClass("active");
//         }

//         lastScrollTop = currentScrollTop; // 현재 스크롤 위치 저장
//     });
// });