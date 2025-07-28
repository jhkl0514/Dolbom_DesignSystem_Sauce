


document.querySelectorAll('.modal-trigger').forEach((button) => {
    button.addEventListener('click', function () {
        let slideIndex = parseInt(this.getAttribute('data-slide')) - 1; // 1부터 시작 → 0부터 시작하도록 변환
        let modal = document.querySelector('#modal_fullscreen01');

        // Swiper가 초기화되었는지 확인하고 슬라이드 이동
        if (swiper && swiper.initialized) {
            swiper.slideTo(slideIndex, 0, false);
        } else {
            console.warn("Swiper가 아직 초기화되지 않았습니다. 재시도...");
            setTimeout(() => swiper.slideTo(slideIndex, 0, false), 100);
        }

        // 모달을 연 뒤 슬라이드 이동 (애니메이션 없이)
        setTimeout(() => {
            swiper.slideTo(slideIndex, 0, false);
        }, 300);

        // 모달 열기
        let instance = M.Modal.getInstance(modal);
        instance.open();
    });
});

let players = {}; // 유튜브 플레이어 객체 저장
let iframes = document.querySelectorAll('.youtubeIframe'); // 모든 iframe 요소 가져오기

// ✅ YouTube API가 로드되면 실행될 함수 (버튼 이벤트 추가 포함)
function onYouTubeIframeAPIReady() {
    document.querySelectorAll('.youtubeIframe').forEach((iframe, index) => {
        if (!iframe.src.includes("enablejsapi=1")) {
            iframe.src += (iframe.src.includes("?") ? "&" : "?") + "enablejsapi=1";
        }

        let videoId = new URL(iframe.src).pathname.split('/')[2]; // 영상 ID 추출
        players[index] = new YT.Player(iframe, {
            videoId: videoId,
            playerVars: {
                'autoplay': 0,
                'rel': 0
            },
            events: {
                'onReady': (event) => {
                    console.log(`Player ${index} Ready`);
                    attachButtonEvents(); // ✅ 버튼 이벤트 추가
                }
            }
        });
    });
}

// ✅ 버튼 클릭 이벤트 (onYouTubeIframeAPIReady 실행 후 등록)
function attachButtonEvents() {
    document.querySelectorAll('.btn_playStop').forEach((btn, index) => {
        btn.addEventListener('click', () => {
            let player = players[index];
            if (player && player.getPlayerState) {
                if (player.getPlayerState() === 1) {
                    player.pauseVideo();
                } else {
                    player.playVideo();
                }
            }
        });
    });
}

// ✅ Swiper 설정 (슬라이드 이동 시 자동재생)
var swiper = new Swiper(".shortSwiper", {
    direction: "vertical",
    mousewheel: true,
    pagination: {
        clickable: true,
    },
    // hashNavigation: {
    //     watchState: true,
    // },
    touchEventsTarget: 'container',
    on: {
        init: function () {
            console.log("✅ Swiper가 초기화되었습니다.");
            this.initialized = true;
        },
        slideChange: function () {
            // 모든 비디오 정지
            Object.values(players).forEach(player => player.pauseVideo());

            // 현재 활성화된 슬라이드의 비디오 자동재생
            let activeSlide = this.slides[this.activeIndex];
            let iframe = activeSlide.querySelector('.youtubeIframe');
            let index = [...iframes].indexOf(iframe);

            if (players[index]) {
                players[index].playVideo();
            }
        },
    },
});

// ✅ 닫기 버튼 클릭 시 모든 유튜브 정지
document.querySelector('.youtubeShort .close_x').addEventListener('click', function () {
    Object.values(players).forEach(player => player.pauseVideo());
});



$(function(){

    $('.guide_ctn').click(function(){

        $(this).hide();

    });

});
