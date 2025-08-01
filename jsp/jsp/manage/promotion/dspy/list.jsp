<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
            <div id="page-content">
                <form action="./list" method="get" id="searchFrm" name="searchFrm">

                <input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
           		<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />

                    <fieldset>
                        <legend class="text-title2">기획전 검색</legend>
                        <table class="table-detail">
                            <colgroup>
                                <col class="w-43">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><label for="search-item1">기간</label></th>
                                    <td>
                                        <div class="form-group w-84">
                                            <input type="date" class="form-control flex-1 calendar" name="srchBgngDt" value="${param.srchBgngDt}">
                                            <i>~</i>
                                            <input type="date" class="form-control flex-1 calendar" name="srchEndDt" value="${param.srchEndDt}">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="search-item2">기획전명</label></th>
                                    <td><input type="text" class="form-control w-84" id="search-item2" name="srchText" value="${param.srchText}"></td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="search-item3">상태</label></th>
                                    <td>
                                        <div class="form-check-group">
                                        	<div class="form-check">
                                                <input class="form-check-input" type="radio" name="srchYn" id="search-item3" value="" checked>
                                                <label class="form-check-label" for="search-item3">전체</label>
                                            </div>
                                            <c:forEach var="yn" items="${dspyYn}">
												<div class="form-check">
	                                            	<input type="radio" value="${yn.key}" id="${yn.key}" name="srchYn" class="form-check-input" <c:if test="${yn.key eq param.srchYn}">checked="checked"</c:if>>
	                                            	 <label class="form-check-label" for="${yn.key}">${yn.value}</label>
	                                            </div>
                                            </c:forEach>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>

                    <div class="btn-group mt-5">
                        <button type="submit" class="btn-primary large shadow w-52">검색</button>
                    </div>
                </form>

				<c:set var="pageParam" value="curPage=${listVO.curPage}${!empty(listVO.urlParam)? '&amp;' : ''}${listVO.urlParam}&srchBgngDt=${param.srchBgngDt}&srchEndDt=${param.srchEndDt}&srchText=${param.srchText}&srchYn=${param.srchYn}" />
                <p class="text-title2 mt-13">기획전 목록</p>
                <table class="table-list">
		<colgroup>
			<col class="w-25">
			<col class="w-50">
			<col class="w-20">
			<col class="w-50">
			<col class="w-35">
			<col class="w-25">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">기획전 명</th>
				<th scope="col">기획 상품 수</th>
				<th scope="col">노출기간</th>
				<th scope="col">등록일</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody>

                    	<c:forEach items="${listVO.listObject}" var="resultList" varStatus="status">
                        <tr>
		 				<td><c:out value="${listVO.startNo - status.index }"/></td>
								<td><a href="/_mng/promotion/dspy/form?planningDspyNo=${resultList.planngDspyNo}&${pageParam}"><c:out value="${resultList.planngDspyNm}"/></a></td>
								<td>${resultList.gdsCount}</td>
								<td>
									<fmt:formatDate value="${resultList.bgngDt}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${resultList.endDt}" pattern="yyyy-MM-dd" />
								</td>
								<td><fmt:formatDate value="${resultList.regDt}" pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${dspyYn[resultList.dspyYn]}"/></td>
						</tr>
                        </c:forEach>
                        <c:if test="${empty listVO.listObject}">
                        <tr>
                            <td class="noresult" colspan="6">검색조건을 만족하는 결과가 없습니다.</td>
                        </tr>
                        </c:if>
                    </tbody>
                </table>

    			<div class="pagination mt-7">
                    <mngr:mngrPaging listVO="${listVO}"/>

    				<div class="sorting2">
                        <label for="countPerPage">출력</label>
                        <select name="countPerPage" id="countPerPage" class="form-control">
                            <option value="10" ${listVO.cntPerPage eq '10' ? 'selected' : '' }>10개</option>
							<option value="20" ${listVO.cntPerPage eq '20' ? 'selected' : '' }>20개</option>
							<option value="30" ${listVO.cntPerPage eq '30' ? 'selected' : '' }>30개</option>
                        </select>
                    </div>

                    <div class="counter">총 <strong>${listVO.totalCount}</strong>건, <strong>${listVO.curPage}</strong>/${listVO.totalPage} 페이지</div>
                </div>


                <div class="btn-group right mt-8">
                    <a href="/_mng/promotion/dspy/form?${pageParam}" class="btn-primary large shadow">등록</a>
                </div>
            </div>

