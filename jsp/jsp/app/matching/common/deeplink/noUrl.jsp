<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="wrapper">

    <main>
        <section class="intro bottom_0">
            <div class="align_center" style="height: calc(100vh - 300px);">
                <div class="center">
                    <img class=""  src="/html/page/app/matching/assets/src/images/08etc/logo_eroum_db.svg" alt="">
                    <div class="h40"></div>
                    <div class="color_t_ps font_sbls">이로움돌봄 앱으로 이동 중이에요</div>
                </div>
            </div>
      </section>
    </main>

    <footer class="page-footer">
      <div class="btn_area d-flex f-column">
            <a href="https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom" class="waves-effect btn-large btn_white w100p">앱 다운로드하기</a>
            <a id="deeplinkBtn" class="waves-effect btn-large btn_primary">앱으로 이동하기</a>
      </div>
    </footer>

  </div>
  <!-- wrapper -->


<script>
	$(function() {
		window.navigation.addEventListener("navigate", (event) => {	
	    	if (event.destination.url === 'about:blank') {
	    		event.preventDefault();
				return false;
	    	}
	    });
		
	    airbridge.setDeeplinks({
	    	buttonID: "deeplinkBtn",
	        deeplinks: {
	            android: "eroumdolbom://home",
	            ios: "https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom",
	            desktop: "https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom"
	        },
	        fallbacks: {
	            android: "google-play",
	            ios: "url",
	        },
	        redirect: true
	    });
	});
</script>