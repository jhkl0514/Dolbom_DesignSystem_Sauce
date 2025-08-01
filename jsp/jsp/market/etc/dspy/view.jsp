<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<main id="container">
	<jsp:include page="../../layout/page_header.jsp" >
		<jsp:param value="이로움ON 기획전" name="pageTitle"/>
	</jsp:include>

	<div id="page-container">
		<div id="page-content">
			<div class="event-slogan">
				<picture class="name">
				<source srcset="/html/page/market/assets/images/txt-event-eroum-mobile.svg" media="(max-width: 768px)">
				<source srcset="/html/page/market/assets/images/txt-event-eroum.svg">
				<img src="/html/page/market/assets/images/txt-event-eroum.svg" alt="" /> </picture>
				<img src="/html/page/market/assets/images/img-shopbag.png" alt="" class="bags">
				<p class="desc">
					즐거움이 함께하는 <br> 이로움ON 기획전
				</p>
			</div>

			<div class="board-detail is-event mt-8 md:mt-18">
				<div class="detail-header">
					<div class="name">
						<strong>${dspyVO.planngDspyNm }</strong><small><fmt:formatDate value="${dspyVO.bgngDt}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${dspyVO.endDt}" pattern="yyyy-MM-dd" /></small>
					</div>
				</div>

				<div class="detail-body">
					<div class="mx-4 mt-11 md:mt-15 md:mx-6">
						<p>${fn:replace(dspyVO.cn, newLineChar, "<br/>")}</p>
					</div>
				</div>

				<c:forEach var="item" items="${dspyGrpList}" varStatus="status">
					<div class="event-title">
						<small>eroum market</small> <strong>${item.grpNm}</strong>
					</div>

					<div class="grid grid-cols-2 gap-x-5 gap-y-12 mt-8.5 md:grid-cols-3 md:gap-x-6 md:gap-y-19 md:mt-12">

						<c:forEach var="gdsList" items="${item.grpGdsList}" varStatus="stts">
							<div class="product-item">
								<a href="${_marketPath}/gds/${gdsList.ctgryNo}/${gdsList.gdsCd}">
									<div class="item-thumb">
										<img src="/comm/getImage?srvcId=GDS&amp;upNo=${gdsList.thumbnailFile.upNo}&amp;fileTy=${gdsList.thumbnailFile.fileTy}&amp;fileNo=${gdsList.thumbnailFile.fileNo}&amp;thumbYn=Y" />
									</div>
								</a>
								<a href="${_marketPath}/gds/${gdsList.ctgryNo}/${gdsList.gdsCd}" class="item-content">
									<%--  
									<div class="label">
										<span class="label-primary"> <span>급여가</span> <i></i>
										</span> <span class="label-outline-primary"> <span>직배송</span> <i></i>
										</span> <span class="label-outline-primary"> <span>설치</span> <i></i> <c:if test="${gdsList.soldoutYn eq 'Y' }"></span> <span class="label-outline-danger"> <span>일시품절</span> <i></i> </c:if>
										</span>
									</div>
									--%>
									<div class="name">
										<small>${gdsList.ctgryNm}</small> <strong>${gdsList.gdsNm}</strong>
									</div>
									<div class="cost">
										<dl <c:if test="${gdsList.dscntRt > 0}">class="hypen"</c:if>>
											<dt>판매가</dt>
											<dd>
												<fmt:formatNumber value="${gdsList.pc}" pattern="###,###" />
												<small>원</small>
											</dd>
										</dl>
										<c:if test="${gdsList.dscntRt > 0}">
											<dl>
												<dt>할인가</dt>
												<dd>
													<fmt:formatNumber value="${gdsList.dscntPc}" pattern="###,###" />
													<small>원</small>
												</dd>
											</dl>
										</c:if>
									</div>
									<div class="item-layer">
										<div class="mx-auto mb-2.5">
											<c:if test="${_mbrSession.loginCheck}">
			                                	<button type="button" class="btn btn-love f_wish ${gdsList.wishYn>0?'is-active':'' }" data-gds-no="${gdsList.gdsNo}" data-wish-yn="${gdsList.wishYn>0?'Y':'N'}" data-bs-toggle="tooltip" title="관심상품 등록">관심상품 등록</button>
			                                	<button type="button" class="btn btn-cart f_cart" data-gds-no="${gdsList.gdsNo}" data-bs-toggle="tooltip" title="장바구니 담기">장바구니 담기</button>
			                                </c:if>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</c:forEach>

				<a href="./list?curPage=${param.curPage}" class="detail-golist">목록으로</a>
			</div>
		</div>
	</div>
</main>

<div id="cart-div"></div>


<script>
	//카트담기 모달
	$(document).on("click", ".f_cart", function(e){
		e.stopPropagation();
	    e.preventDefault();
	
		let gdsNo = $(this).data("gdsNo");
	
		$("#cart-div").load("${_marketPath}/gds/optnModal",
			{gdsNo : gdsNo}, function(){
				$("#optnModal").modal('show');
		});
	});
</script>