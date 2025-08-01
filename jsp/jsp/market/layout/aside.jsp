<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- banner -->
<c:forEach var="banner" items="${_bannerList}">
	<aside id="banner" style="background-color : ${banner.color}">
		<div class="container">
			<picture>
			<c:forEach var="fileList" items="${banner.pcFileList }" end="1">
				<c:if test="${banner.linkTy ne 'N'}">
					<a href="${banner.linkUrl}?rdcntBanner=${banner.bannerNo}" <c:if test="${banner.linkTy eq 'S'}">target="_blank"</c:if>>
				</c:if>
				<%-- 
				<c:forEach var="mobileList" items="${banner.mobileFileList}" end="1">
					<soruce srcset="/comm/getFile?srvcId=BANNER&amp;upNo=${mobileList.upNo }&amp;fileTy=MOBILE&amp;fileNo=${mobileList.fileNo }" alt="">
				</c:forEach>
				<source srcset="/comm/getFile?srvcId=BANNER&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy }&amp;fileNo=${fileList.fileNo }">
				--%>
				<img src="/comm/getFile?srvcId=BANNER&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy}&amp;fileNo=${fileList.fileNo}" alt="">
				
				<c:if test="${banner.linkTy ne 'N'}">
					</a>
				</c:if>
			</picture>
			</c:forEach>
			<button type="button" data-banner-no="${banner.bannerNo}">
				<span class="sr-only">닫기</span>
			</button>
		</div>
	</aside>
</c:forEach>
<script>
	$('#banner button').on('click', function() {
		$('body').removeClass('is-banner');
	
		let bannerNo = $(this).data("bannerNo");
		$.cookie("topBanner",bannerNo,{expires:1, path:"/"});
	});
	
	$(function() {
		//모바일 체크 처리
    	var isMobile = /Mobi/i.test(window.navigator.userAgent);
    	if (isMobile) {
    		var imgs = $('#banner img');
    		for(var i = 0; i < imgs.length; i++) {
    			var src = $(imgs[i]).attr('src');
    			src = src.replace('fileTy=PC', 'fileTy=MOBILE');
    			$(imgs[i]).attr('src', src);
    		}
    	}
	})
</script>
