<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <div class="wrapper align_center">

    <header>

    </header>

    <div class="center">
        <dotlottie-player src="/html/page/app/matching/assets/lottie/complete.lottie" background="transparent" speed="1" style="width: 100%; height: 120px;" autoplay></dotlottie-player>
        
        <div class="h12"></div>
        
        <p class="color_t_p font_shm"></p>
    </div>

  </div>
  <!-- wrapper -->
  
  
  <script>
  	$(function() {
  		//메세지 넣기 html로
  		var msgHtml = '${msg}';
  		var decoded = $("<div/>").html(msgHtml).text();
  		$('.color_t_p').html(decoded);
  		
  		setTimeout(function() {
  			location.replace(decodeURI('${redirectUrl}').replaceAll("&amp;", "&"));
  		}, 2500);
  	})
  </script>