<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%-- 서비스내용 상세 --%>
	<c:if test="${resultCode eq 'SUCCESS'}">
	<c:set var="colorNumber"><%-- 카테고리 선택안했을 경우 default --%>
	<c:choose>
		<c:when test="${fn:contains(bokjiVO.categoryList, '주거')}">1</c:when>
		<c:when test="${fn:contains(bokjiVO.categoryList, '문화')}">2</c:when>
		<c:when test="${fn:contains(bokjiVO.categoryList, '보건')}">3</c:when>
		<c:when test="${fn:contains(bokjiVO.categoryList, '고용')}">4</c:when>
		<c:when test="${fn:contains(bokjiVO.categoryList, '교육')}">5</c:when>
		<c:when test="${fn:contains(bokjiVO.categoryList, '상담')}">6</c:when>
		<c:when test="${fn:contains(bokjiVO.categoryList, '보호')}">8</c:when>
		<c:when test="${fn:contains(bokjiVO.categoryList, '지원금품') || fn:contains(categoryList, '지원금품-지원금')}">7</c:when>
	</c:choose>
	</c:set>

	<!-- 컨텐츠 상세 is-color클래스는 목록과 동일 -->
    <div class="modal fade is-color${colorNumber}" id="modal-detail" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <p class="text-title"><img src="/html/core/images/img-brand-logo.svg" alt="eroum"></p>
                    <button data-bs-dismiss="modal">모달 닫기</button>
                </div>
                <div class="modal-body">
                	<c:if test="${empty bokjiVO}">
                	데이터 호출에 실패하였습니다.
                	</c:if>
                	<c:if test="${!empty bokjiVO}">
                    <div class="modal-detail-title">${bokjiVO.benefitName}</div>
                    <div class="modal-detail-content">
                        <a href="#" class="share f_clip" data-bokji-id="${bokjiVO.bokjiId}">공유하기 <i></i></a>
                        <table>
                            <colgroup>
                                <col class="w-14">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">분류</th>
                                    <td>
                                    	<c:forEach items="${bokjiVO.categoryList}" var="cate" varStatus="s">
                                        <span class="label">${cate}</span>
                                        </c:forEach>
                                    </td>
                                </tr>
                                <c:if test="${!empty bokjiVO.entitledCondition}">
                                <tr>
                                    <th scope="row">지원조건</th>
                                    <td>${bokjiVO.entitledCondition}</td>
                                </tr>
                                </c:if>
                                <c:if test="${!empty bokjiVO.applyMethod}">
                                <tr>
                                    <th scope="row">지원방법</th>
                                    <td>${bokjiVO.applyMethod}</td>
                                </tr>
                                </c:if>
                                <c:if test="${!empty   bokjiVO.endDate}">
                                <tr>
                                    <th scope="row">지원기간</th>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${!empty bokjiVO.dueDate}">
                                    	${bokjiVO.dueDate}<br>
                                        (${bokjiVO.beginDate} ~ ${bokjiVO.endDate})
                                    		</c:when>
                                    		<c:otherwise>
                                        ${bokjiVO.beginDate} ~ ${bokjiVO.endDate}
                                    		</c:otherwise>
                                    	</c:choose>
                                    </td>
                                </tr>
                                </c:if>
                                <c:if test="${!empty bokjiVO.requiredDocuments}">
                                <tr>
                                    <th scope="row">필요서류</th>
                                    <td>
                                        ${bokjiVO.requiredDocuments}
                                    </td>
                                </tr>
                                </c:if>
                                <c:if test="${!empty bokjiVO.totalSupportAmount}">
                                <tr>
                                    <th scope="row">지원금</th>
                                    <td>${bokjiVO.totalSupportAmount}</td>
                                </tr>
                                </c:if>
                                <tr>
                                    <th scope="row">내용</th>
                                    <td>
                                        <div class="content">
                                            ${bokjiVO.supportContent}
                                        </div>
                                    </td>
                                </tr>
                                <c:if test="${!empty bokjiVO.bokjiResource}">
                                <tr>
                                    <th scope="row">출처</th>
                                    <td>
                                    	<c:choose>
                                    		<c:when test="${!empty bokjiVO.refUrl}">
                                    	<a href="${bokjiVO.refUrl}" target="_blank" class="home">${bokjiVO.bokjiResource}</a>
                                    		</c:when>
                                    		<c:otherwise>
                                    	${bokjiVO.bokjiResource}
                                    		</c:otherwise>
                                    	</c:choose>
                                    </td>
                                </tr>
                                </c:if>
                                <tr>
                                    <th scope="row">기관명</th>
                                    <td>${bokjiVO.provider.institutionName }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${bokjiVO.availableKeyword}">
                    <!-- 
                    <div class="modal-banner">
                    	<a href="${_marketPath}/index" target="_blank">
                        <img src="/html/page/planner/assets/images/dummy/img-dummy-banner.png" alt="">
                        </a>
                    </div>
                    -->
                    </c:if>

                    </c:if>

                </div>
                <div class="modal-footer">
                	<c:if test="${!empty bokjiVO.refUrl}">
                    <a href="${bokjiVO.refUrl}" target="_blank" class="btn btn-request">자세한 신청방법 보기</a>
                    </c:if>
                    <a href="#" class="btn btn-share sm:hidden f_clip" data-bokji-id="${bokjiVO.bokjiId}">공유하기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- //컨텐츠 상세 is-color클래스는 목록과 동일 -->
    <script>
    $(function(){
    	$("#modal-detail").modal("show");
    });
    </script>
    </c:if>
    <c:if test="${resultCode eq 'LOGIN'}">
    <div><input type="hidden" id="bokjiId" name="bokjiId" value="${bokjiId}"></div>
    <script>
    $(function(){
    	//alert("로그인이 필요한 컨텐츠 입니다.");
    	$(".f_login:eq(0)").trigger('click');
    });
    </script>
    </c:if>