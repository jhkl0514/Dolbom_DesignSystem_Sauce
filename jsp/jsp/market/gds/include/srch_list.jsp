<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
검색
 --%>
                <c:if test="${!isSrchPage}">
                <div class="grid gap-x-5 grid-cols-2 gap-y-8 mt-5 mb-13 md:grid-cols-3 md:gap-y-12" >
                	<c:if test="${empty listVO.listObject}">
					<p class="box-result is-large col-span-2 md:col-span-3">상품 검색 결과가 없습니다.</p>
                    </c:if>
                </c:if>

				<c:if test="${isSrchPage}">
            	<div class="flex items-center justify-between mb-2.5 text-[0.8125rem] font-medium md:mb-5 md:text-sm">
	                <p>총 <strong class="text-danger">${listVO.totalCount}</strong>개의 상품이 있습니다.</p>
	                <select id="srchOrdr" name="srchOrdr" class="form-control form-small w-28 bg-neutral-100 md:w-42">
	                    <option value="SORT_NO" ${srchOrdr eq 'SORT_NO' || empty srchOrdr?'selected="selected"':'' }>신상품 순</option>
	                    <option value="PC_ASC" ${srchOrdr eq 'PC_ASC'?'selected="selected"':'' }>낮은가격 순</option>
	                    <option value="PC_DESC" ${srchOrdr eq 'PC_DESC'?'selected="selected"':'' }>높은가격 순</option>
	                </select>
	            </div>

	            <c:if test="${empty listVO.listObject}">
		            <div class="box-result is-large">
		                <p>검색하신
		                	<c:choose>
		                		<c:when test="${!empty param.srchKwd}"><strong class="text-[#1D45D5]">${fn:split(param.srchKwd,'?')[0]}</strong></c:when>
		                		<c:when test="${!empty param.srchNonKwd}"><strong class="text-[#1D45D5]">${fn:split(param.srchNonKwd,'?')[0]}</strong></c:when>
		                	</c:choose>
		                	 에 대한 상품검색 결과가 없습니다.</p>
		            </div>
	            </c:if>

            	<div class="grid grid-cols-2 gap-x-3 gap-y-6 mt-2.5 md:grid-cols-3 md:gap-x-4 md:gap-y-13 md:mt-4 lg:grid-cols-4 lg:gap-x-5 lg:gap-y-20 lg:mt-5">
				</c:if>
                	<input type="hidden" name="params" value=""/>
                	<c:forEach items="${listVO.listObject}" var="resultList" varStatus="status">
					<c:set var="pageParam" value="curPage=${listVO.curPage}${!empty(listVO.urlParam)? '&amp;' : ''}${listVO.urlParam}" />

                    <a href="${_marketPath}/gds/${resultList.ctgryNo}/${resultList.gdsCd}"  class="product-item" data-up-ctgry="${resultList.upCtgryNo}" data-ctgry-no="${resultList.ctgryNo}" data-gds-cd="${resultList.gdsCd}">
                        <div class="item-thumb">
                            <c:choose>
								<c:when test="${!empty resultList.thumbnailFile }">
							<img src="/comm/getImage?srvcId=GDS&amp;upNo=${resultList.thumbnailFile.upNo }&amp;fileTy=${resultList.thumbnailFile.fileTy }&amp;fileNo=${resultList.thumbnailFile.fileNo }&amp;thumbYn=Y" alt="">
								</c:when>
								<%-- <c:otherwise>
							<img src="/html/page/market/assets/images/noimg.jpg" alt="">
								</c:otherwise> --%>
							</c:choose>
                        </div>
                        <div class="item-content">
                            <div class="label">
								<c:if test="${resultList.gdsTy ne 'N'}"> <%--급여제품만--%>
                                <!-- <span class="label-primary">
                                    <span>급여가</span><i></i>
                                </span> -->
								</c:if>
								<c:if test="${!empty resultList.gdsTag}">
									<c:forEach items="${resultList.gdsTag}" var="tag">
								<span class="${tag eq 'A'?'label-outline-danger':'label-outline-primary' }">
                                    <span>${_gdsTagCode[tag]}</span><i></i>
                                </span>
                                	</c:forEach>
                                </c:if>
                            </div>
                            <div class="name">
                                <small>${resultList.ctgryNm }</small>
                                <strong>${resultList.gdsNm }</strong>
                            </div>
                            <div class="cost">
                                <dl <c:if test="${resultList.dscntRt > 0 && _mbrSession.recipterYn eq 'N'}"> style="color : rgb(153 153 153/var(--tw-text-opacity));"</c:if>>
                                    <dt>판매가</dt>
                                    <dd <c:if test="${resultList.dscntRt > 0}">style="text-decoration : line-through;"</c:if>><fmt:formatNumber value="${resultList.pc}" pattern="###,###" /><small>원</small></dd>
                                </dl>
                                <c:if test="${resultList.dscntRt > 0}">
	                                <dl>
	                                    <dt>할인가</dt>
	                                    <dd><fmt:formatNumber value="${resultList.dscntPc}" pattern="###,###" /><small>원</small></dd>
	                                </dl>
                                </c:if>

                                <%-- 본인 부담금 출력 시 대여는 똑같이 주석 처리 --%>

                            	<%-- <c:choose>
                            		<c:when test="${(resultList.gdsTy eq 'R' || resultList.gdsTy eq 'L') && _mbrSession.prtcrRecipterYn eq 'Y'}"> 급여(판매)제품
                            	<dl class="discount">
                                    <dt>${resultList.gdsTy eq 'R'?'본인부담금':'대여가(월)'}</dt>
                                    <dd>
                                    	<c:choose>
                                    		<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 15 }">
                                    	<fmt:formatNumber value="${resultList.bnefPc15}" pattern="###,###" /><small>원</small>
                                    		</c:when>
                                    		<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 9 }">
                                    	<fmt:formatNumber value="${resultList.bnefPc9}" pattern="###,###" /><small>원</small>
                                    		</c:when>
                                    		<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 6 }">
                                    	<fmt:formatNumber value="${resultList.bnefPc6}" pattern="###,###" /><small>원</small>
                                    		</c:when>
                                    		<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 0 }">
                                    	0<small>원</small>
                                    		</c:when>
                                    	</c:choose>
                                    </dd>
                                </dl>
                            		</c:when>
                            		급여(대여)제품

                            		<c:when test="${resultList.gdsTy eq 'L' && _mbrSession.prtcrRecipterYn eq 'Y'}">
								<dl class="discount">
                                    <dt>대여가(월)</dt>
                                    <dd>
                                    	<fmt:formatNumber value="${resultList.lendPc}" pattern="###,###" /><small>원</small>
                                    </dd>
                                </dl>
                            		</c:when>

                            	</c:choose> --%>
                            </div>
                        </div>
                        <div class="item-layer">
                            <div class="mx-auto mb-2.5">
                                <!-- <button type="button" class="btn btn-compare f_compare" data-gds-no="${resultList.gdsNo}" data-gds-cd="${resultList.gdsCd}" data-ctgry-no="${resultList.ctgryNo}" data-gds-file="${resultList.thumbnailFile.fileNo}" data-bs-toggle="tooltip" title="상품 비교 추가">상품 비교 추가</button> -->
                                <c:if test="${_mbrSession.loginCheck}">
                                	<button type="button" class="btn btn-love f_wish ${resultList.wishYn>0?'is-active':'' }" data-gds-no="${resultList.gdsNo}" data-wish-yn="${resultList.wishYn>0?'Y':'N'}" data-bs-toggle="tooltip" title="관심상품 등록">관심상품 등록</button>
	                                <button type="button" class="btn btn-cart f_cart" data-gds-no="${resultList.gdsNo}" data-bs-toggle="tooltip" title="장바구니 담기">장바구니 담기</button>
                                </c:if>
                            </div>
                            <c:if test="${!empty resultList.wrhsYmdNtcn}">
                            <p class="soldout">${resultList.wrhsYmdNtcn}</p>
                            </c:if>
                        </div>
                    </a>
                    </c:forEach>
                </div>
                <div class="pagination">
                	<front:jsPaging listVO="${listVO}" targetObject="gds-pager" />
                </div>

