<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<main id="container">
<div class="main-visual">
	<div class="swiper">
		<div class="swiper-wrapper">
			
			<c:forEach var="resultList" items="${mainBannerList}" varStatus="status">
				<div class="swiper-slide">
					<c:if test="${resultList.linkTy ne 'N' }">
						<a href=" <c:choose><c:when test="${fn:contains(resultList.linkUrl, '?')}">${resultList.linkUrl}&</c:when><c:otherwise>${resultList.linkUrl}?</c:otherwise></c:choose>rdcntBanner=${resultList.bannerNo}" class="response" <c:if test="${resultList.linkTy eq 'S'}">target="_blank"</c:if>>
					</c:if>
					
					<%-- 
					<c:forEach var="fileList" items="${resultList.mobileFileList}" varStatus="stts">
						<img src="/comm/getFile?srvcId=BANNER&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy }&amp;fileNo=${fileList.fileNo }" class="mobile" alt="">
					</c:forEach>
					--%>

					<c:forEach var="fileList" items="${resultList.pcFileList}" varStatus="stts">
						<img src="/comm/getFile?srvcId=BANNER&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy }&amp;fileNo=${fileList.fileNo }" class="web" alt="" >
					</c:forEach>
						
					<c:if test="${resultList.linkTy ne 'N' }"></a></c:if>
				</div>
			</c:forEach>

			<!-- 이전소스 백업 -->
			<%--  <c:forEach var="resultList" items="${mainBannerList}" varStatus="status">
				<div class="swiper-slide">
					<c:if test="${resultList.linkTy ne 'N' }">
						<a href="${resultList.linkUrl}?rdcntBanner=${resultList.bannerNo}" <c:if test="${resultList.linkTy eq 'S'}">target="_blank"</c:if>>
					</c:if>
						<picture>
							<c:forEach var="fileList" items="${resultList.mobileFileList}" varStatus="stts">
								<source srcset="/comm/getFile?srvcId=BANNER&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy }&amp;fileNo=${fileList.fileNo }" media="(max-width: 768px)">
							</c:forEach>

							<c:forEach var="fileList" items="${resultList.pcFileList}" varStatus="stts">
								<source srcset="/comm/getFile?srvcId=BANNER&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy }&amp;fileNo=${fileList.fileNo }">
								<img src="/comm/getFile?srvcId=BANNER&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy }&amp;fileNo=${fileList.fileNo }" alt="">
							</c:forEach>
						</picture>
					<c:if test="${resultList.linkTy ne 'N' }"></a></c:if>
				</div>
			</c:forEach> --%>

		</div>
	</div>
	<c:if test="${fn:length(mainBannerList) ne 0}">
		<div class="swiper-control">
			<div class="swiper-control-container">
				<div class="swiper-button">
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-toggle"></div>
					<div class="swiper-button-next"></div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
	</c:if>
</div>

<c:forEach var="gdsMainList" items="${mainMngList}" >
<c:if test="${gdsMainList.themaTy eq 'G' && gdsMainList.sortNo eq 1}">
<div class="main-product">
	<h2 class="title">
		<c:forEach var="fileList" items="${gdsMainList.fileList}">
			<img src="/comm/getFile?srvcId=MAIN&amp;upNo=${fileList.upNo }&amp;fileTy=ATTACH&amp;fileNo=${fileList.fileNo }" alt="">
		 </c:forEach>
		${gdsMainList.sj}
	</h2>
	<div class="swiper">
		<div class="swiper-wrapper">

			<c:forEach var="resultList" items="${gdsMainList.gdsList}">
				<div class="swiper-slide">
					<a href="${_marketPath}/gds/${resultList.gdsInfo.ctgryNo}/${resultList.gdsInfo.gdsCd}?rdcntMain=${resultList.mainNo}" class="product-item">
						<div class="item-thumb">
							<c:set var="fileList" value="${resultList.gdsInfo.thumbnailFile}" />
							<img src="/comm/getFile?srvcId=GDS&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy}&amp;fileNo=${fileList.fileNo }" alt="">
						</div>
						<div class="item-content">
							<div class="name">
								<small>${resultList.gdsCtgry.ctgryNm}</small>
								<strong>${resultList.gdsInfo.gdsNm}</strong>
							</div>
							<div class="cost">
								<dl <c:if test="${resultList.gdsInfo.dscntRt > 0}">class="hypen"</c:if>>
									<dt>판매가</dt>
									<dd>
										<fmt:formatNumber value="${resultList.gdsInfo.pc}" pattern="###,###" />
										<small>원</small>
									</dd>
								</dl>
								<c:if test="${resultList.gdsInfo.dscntRt > 0}">
									<dl>
										<dt>할인가</dt>
										<dd>
											<fmt:formatNumber value="${resultList.gdsInfo.dscntPc}" pattern="###,###" />
											<small>원</small>
										</dd>
									</dl>
								</c:if>
							</div>
						</div>
						<div class="item-layer">
							<div class="mx-auto mb-2.5">
								<c:if test="${_mbrSession.loginCheck}">
                                	<button type="button" class="btn btn-love f_wish ${resultList.gdsInfo.wishYn>0?'is-active':'' }" data-gds-no="${resultList.gdsInfo.gdsNo}" data-wish-yn="${resultList.gdsInfo.wishYn>0?'Y':'N'}" data-bs-toggle="tooltip" title="관심상품 등록">관심상품 등록</button>
                                	<button type="button" class="btn btn-cart f_cart" data-gds-no="${resultList.gdsNo}" data-bs-toggle="tooltip" title="장바구니 담기">장바구니 담기</button>
                                </c:if>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>
	<div class="swiper-button-prev"></div>
	<div class="swiper-button-next"></div>
</div>
</c:if>
</c:forEach>

<aside class="main-banner grid grid-cols-1 gap-3 md:grid-cols-2 md:gap-4 lg:gap-5">
	<c:forEach var="resultList" items="${mainMngList}" varStatus="status">
		<c:if test="${resultList.themaTy eq 'H' }">
		<a href="${resultList.linkUrl}?rdcntMain=${resultList.mainNo}" class="block overflow-hidden rounded-md">
			<picture>
			<c:forEach var="fileList" items="${resultList.halfFileList}">
				<source srcset="/comm/getFile?srvcId=MAIN&amp;upNo=${fileList.upNo }&amp;fileTy=HALF&amp;fileNo=${fileList.fileNo }">
				<img src="/comm/getFile?srvcId=MAIN&amp;upNo=${fileList.upNo }&amp;fileTy=HALF&amp;fileNo=${fileList.fileNo }" alt=""> <!-- pc url --> </picture>
			</c:forEach>
            </picture>
		</a>
		</c:if>
	</c:forEach>
</aside>

<c:forEach var="gdsMainList" items="${mainMngList}" >
<c:if test="${gdsMainList.themaTy eq 'G' && gdsMainList.sortNo eq 2}">
<div class="main-product">
	<h2 class="title">
		<c:forEach var="fileList" items="${gdsMainList.fileList}">
			<img src="/comm/getFile?srvcId=MAIN&amp;upNo=${fileList.upNo }&amp;fileTy=ATTACH&amp;fileNo=${fileList.fileNo }" alt="">
		 </c:forEach>
		${gdsMainList.sj}
	</h2>
	<div class="swiper">
		<div class="swiper-wrapper">

			<c:forEach var="resultList" items="${gdsMainList.gdsList}">
				<div class="swiper-slide">
					<a href="${_marketPath}/gds/${resultList.gdsInfo.ctgryNo}/${resultList.gdsInfo.gdsCd}?rdcntMain=${resultList.mainNo}" class="product-item">
						<div class="item-thumb">
							<c:set var="fileList" value="${resultList.gdsInfo.thumbnailFile}" />
							<img src="/comm/getFile?srvcId=GDS&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy}&amp;fileNo=${fileList.fileNo }" alt="">
						</div>
						<div class="item-content">
							<div class="name">
								<small>${resultList.gdsCtgry.ctgryNm}</small>
								<strong>${resultList.gdsInfo.gdsNm}</strong>
							</div>
							<div class="cost">
								<dl <c:if test="${resultList.gdsInfo.dscntRt > 0}">class="hypen"</c:if>>
									<dt>판매가</dt>
									<dd>
										<fmt:formatNumber value="${resultList.gdsInfo.pc}" pattern="###,###" />
										<small>원</small>
									</dd>
								</dl>
								<c:if test="${resultList.gdsInfo.dscntRt > 0}">
									<dl>
										<dt>할인가</dt>
										<dd>
											<fmt:formatNumber value="${resultList.gdsInfo.dscntPc}" pattern="###,###" />
											<small>원</small>
										</dd>
									</dl>
								</c:if>
							</div>
						</div>
						<div class="item-layer">
							<div class="mx-auto mb-2.5">
								<c:if test="${_mbrSession.loginCheck}">
                                	<button type="button" class="btn btn-love f_wish ${resultList.gdsInfo.wishYn>0?'is-active':'' }" data-gds-no="${resultList.gdsInfo.gdsNo}" data-wish-yn="${resultList.gdsInfo.wishYn>0?'Y':'N'}" data-bs-toggle="tooltip" title="관심상품 등록">관심상품 등록</button>
                                	<button type="button" class="btn btn-cart f_cart" data-gds-no="${resultList.gdsNo}" data-bs-toggle="tooltip" title="장바구니 담기">장바구니 담기</button>
                                </c:if>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>
	<div class="swiper-button-prev"></div>
	<div class="swiper-button-next"></div>
</div>
</c:if>
</c:forEach>

<aside class="main-banner">
	<c:forEach var="resultList" items="${mainMngList}" varStatus="status">
		<c:if test="${resultList.themaTy eq 'B'}">
			<a href="${resultList.linkUrl}?rdcntMain=${resultList.mainNo}" class="block overflow-hidden rounded-md">
				<picture>
					<c:forEach var="mobileFileList" items="${resultList.mobileImgFileList}">
						<source srcset="/comm/getFile?srvcId=MAIN&amp;upNo=${mobileFileList.upNo }&amp;fileTy=MOBILE&amp;fileNo=${mobileFileList.fileNo }" media="(max-width: 768px)">
					</c:forEach>

					<c:forEach var="pcFileList" items="${resultList.pcImgFileList}">
						<source srcset="/comm/getFile?srvcId=MAIN&amp;upNo=${pcFileList.upNo }&amp;fileTy=PC&amp;fileNo=${pcFileList.fileNo }">
						<img src="/comm/getFile?srvcId=MAIN&amp;upNo=${pcFileList.upNo }&amp;fileTy=PC&amp;fileNo=${pcFileList.fileNo }" alt=""> <!-- pc url -->
					</c:forEach>
				</picture>
			</a>
		</c:if>
	</c:forEach>
</aside>

<c:forEach var="gdsMainList" items="${mainMngList}" >
<c:if test="${gdsMainList.themaTy eq 'G' && gdsMainList.sortNo eq 3}">
<div class="main-product">
	<h2 class="title">
		<c:forEach var="fileList" items="${gdsMainList.fileList}">
			<img src="/comm/getFile?srvcId=MAIN&amp;upNo=${fileList.upNo }&amp;fileTy=ATTACH&amp;fileNo=${fileList.fileNo }" alt="">
		 </c:forEach>
		${gdsMainList.sj}
	</h2>
	<div class="swiper">
		<div class="swiper-wrapper">

			<c:forEach var="resultList" items="${gdsMainList.gdsList}">
				<div class="swiper-slide">
					<a href="${_marketPath}/gds/${resultList.gdsInfo.ctgryNo}/${resultList.gdsInfo.gdsCd}?rdcntMain=${resultList.mainNo}" class="product-item">
						<div class="item-thumb">
							<c:set var="fileList" value="${resultList.gdsInfo.thumbnailFile}" />
							<img src="/comm/getFile?srvcId=GDS&amp;upNo=${fileList.upNo }&amp;fileTy=${fileList.fileTy}&amp;fileNo=${fileList.fileNo }" alt="">
						</div>
						<div class="item-content">
							<div class="name">
								<small>${resultList.gdsCtgry.ctgryNm}</small>
								<strong>${resultList.gdsInfo.gdsNm}</strong>
							</div>
							<div class="cost">
								<dl <c:if test="${resultList.gdsInfo.dscntRt > 0}">class="hypen"</c:if>>
									<dt>판매가</dt>
									<dd>
										<fmt:formatNumber value="${resultList.gdsInfo.pc}" pattern="###,###" />
										<small>원</small>
									</dd>
								</dl>
								<c:if test="${resultList.gdsInfo.dscntRt > 0}">
									<dl>
										<dt>할인가</dt>
										<dd>
											<fmt:formatNumber value="${resultList.gdsInfo.dscntPc}" pattern="###,###" />
											<small>원</small>
										</dd>
									</dl>
								</c:if>
							</div>
						</div>
						<div class="item-layer">
							<div class="mx-auto mb-2.5">
								<c:if test="${_mbrSession.loginCheck}">
	                               	<button type="button" class="btn btn-love f_wish ${resultList.gdsInfo.wishYn>0?'is-active':'' }" data-gds-no="${resultList.gdsInfo.gdsNo}" data-wish-yn="${resultList.gdsInfo.wishYn>0?'Y':'N'}" data-bs-toggle="tooltip" title="관심상품 등록">관심상품 등록</button>
	                               	<button type="button" class="btn btn-cart f_cart" data-gds-no="${resultList.gdsNo}" data-bs-toggle="tooltip" title="장바구니 담기">장바구니 담기</button>
                            	</c:if>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>
	<div class="swiper-button-prev"></div>
	<div class="swiper-button-next"></div>
</div>
</c:if>
</c:forEach>

</main>

<div id="cart-div"></div>


<script>
window.addEventListener('DOMContentLoaded', (e) => {
	//모바일 체크 처리
	var isMobile = /Mobi/i.test(window.navigator.userAgent);
	if (isMobile) {
		var imgs = $('.swiper-wrapper img.web');
		for(var i = 0; i < imgs.length; i++) {
			var src = $(imgs[i]).attr('src');
			src = src.replace('fileTy=PC', 'fileTy=MOBILE');
			$(imgs[i]).attr('src', src);
			
			$(imgs[i]).removeClass('web');
			$(imgs[i]).addClass('mobile');
		}
	}
	
	
    var visual = new Swiper('.main-visual .swiper', {
        loop: true,
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 1000,
        autoplay: {
            delay: 6000,
            disableOnInteraction: false,
        },
        pagination: {
            el: '.main-visual .swiper-pagination',
            type: 'fraction',
        },
        navigation: {
            nextEl: '.main-visual .swiper-button-next',
            prevEl: '.main-visual .swiper-button-prev',
        },
    });

    $(".swiper-button-toggle").click(function() {
        if($(this).hasClass('is-pause')) {
            $(this).removeClass('is-pause');
            visual.autoplay.start();
        } else {
            $(this).addClass('is-pause');
            visual.autoplay.stop();
        }
    });

    [].slice.call(document.querySelectorAll('.main-product')).forEach((el) => {
        new Swiper(el.querySelector('.swiper'), {
            loop: true,
            slidesPerView: 'auto',
            spaceBetween: 10,
            navigation: {
                nextEl: el.querySelector('.swiper-button-next'),
                prevEl: el.querySelector('.swiper-button-prev')
            },
            breakpoints: {
                768: {
                    slidesPerView: 'auto',
                    spaceBetween: 15,
                },
                1280: {
                    slidesPerView: 4,
                    spaceBetween: 20,
                }
            }
        });
    });

	// 카트담기 모달
	$(document).on("click", ".f_cart", function(e){
		e.stopPropagation();
        e.preventDefault();

		let gdsNo = $(this).data("gdsNo");

		$("#cart-div").load("${_marketPath}/gds/optnModal",
			{gdsNo : gdsNo}, function(){
    			$("#optnModal").modal('show');
		});
	});
});
</script>