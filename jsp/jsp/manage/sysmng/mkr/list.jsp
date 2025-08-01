<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="page-content">
	<form action="./list" method="get" id="searchFrm" name="searchFrm">
			<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
           	<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />
		<fieldset>
			<legend class="text-title2">제조사 검색</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="search-item1">제조사명</label></th>
						<td><input type="text" class="form-control w-84" id="srchText" name="srchText" value="${param.srchText }"></td>
					</tr>
					<tr>
						<th scope="row"><label for="search-item2">상태</label></th>
						<td>
							<div class="form-check-group">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="srchYn" id="search-item3" value="" checked>
									<label class="form-check-label" for="search-item3">전체</label>
								</div>
								<c:forEach var="yn" items="${useYnCode}">
									<div class="form-check">
										<input type="radio" value="${yn.key}" id="${yn.value}" name="srchYn" class="form-check-input" <c:if test="${yn.key eq param.srchYn}">checked="checked"</c:if>>
										<label class="form-check-label" for="${yn.value}">${yn.value}</label>
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

	<c:set var="pageParam" value="curPage=${listVO.curPage}&srchText=${param.srchText}&srchYn=${param.srchYn}&cntPerPage=${param.cntPerPage}&sortBy=${param.sortBy}" />
	<p class="text-title2 mt-13">제조사 목록</p>
	<table class="table-list">
		<colgroup>
			<col class="w-25">
			<col class="w-40">
			<col>
			<col class="w-50">
			<col class="w-30">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제조사코드</th>
				<th scope="col">제조사명</th>
				<th scope="col">등록일</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="result" items="${listVO.listObject}" varStatus="status">
				<tr>
					<td>${listVO.startNo - status.index }</td>
					<td>${result.mkrNo}</td>
					<td><a href="./form?mkrNo=${result.mkrNo }&${pageParam}">${result.mkrNm}</a></td>
					<td><fmt:formatDate value="${result.regDt }" pattern="yyyy-MM-dd HH:mm" /></td>
					<td>${useYn[result.useYn] }</td>
				</tr>
			</c:forEach>
			<c:if test="${empty listVO.listObject}">
				<tr>
					<td class="noresult" colspan="5">검색조건을 만족하는 결과가 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

	<div class="pagination mt-7">
		<mngr:mngrPaging listVO="${listVO}" />

		<div class="sorting2">
			<label for="countPerPage">출력</label> <select name="countPerPage" id="countPerPage" class="form-control">
				<option value="10" ${listVO.cntPerPage eq '10' ? 'selected' : '' }>10개</option>
				<option value="20" ${listVO.cntPerPage eq '20' ? 'selected' : '' }>20개</option>
				<option value="30" ${listVO.cntPerPage eq '30' ? 'selected' : '' }>30개</option>
			</select>
		</div>


		<div class="counter">
			총 <strong>${listVO.totalCount}</strong>건, <strong>${listVO.curPage}</strong>/${listVO.totalPage} 페이지
		</div>
	</div>

	<div class="btn-group right mt-8">
		<a href="./form?${pageParam}" class="btn-primary large shadow">등록</a>
	</div>
</div>

