<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	#tooltip .modal-dialog {
		max-width: 1000px; /* 기본 너비를 800px로 조정 */
		width: 90%; /* 화면 크기에 따라 반응형으로 설정 */
	}
	.modal-body ul {
		list-style-type: disc; /* 기본 리스트 스타일 */
		padding-left: 8px; /* 기본 들여쓰기 */
	}
	.modal-body ul ul {
		list-style-type: circle; /* 중첩 리스트는 빈 원형 */
		padding-left: 16px; /* 1단계 중첩 들여쓰기 */
	}
	.modal-body ul ul ul {
		list-style-type: square; /* 2단계 중첩 리스트는 네모 */
		padding-left: 24px; /* 2단계 중첩 들여쓰기 */
	}
	.modal-body ul ul ul ul {
		list-style-type: disc; /* 3단계 중첩 리스트는 다시 동그라미 */
		padding-left: 32px; /* 3단계 중첩 들여쓰기 */
	}
	.modal-body ul ul ul ul ul {
		list-style-type: circle; /* 4단계 중첩 리스트는 다시 빈 원형 */
		padding-left: 40px; /* 3단계 중첩 들여쓰기 */
	}
</style>

<div id="page-content">
	<jsp:include page="./include/tab.jsp" />

	<form action="./bplc" class="mt-7.5" id="searchFrm" name="searchFrm">
		<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
		<input type="hidden" name="sortBy" id="sortBy" value='${listVO.sortBy}' />
		<fieldset>
			<legend class="text-title2">검색</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="search-item1">조회기간</label></th>
						<td colspan="3">
							<div class="form-group">
								<input type="date" class="form-control w-39 calendar" id="srchBgngDt" name="srchBgngDt" value="${srchBgngDt}">
									<i>~</i>
								<input type="date" class="form-control w-39 calendar" id="srchEngDt" name="srchEndDt" value="${srchEndDt}">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="srchConsltCours">상담유입구분</label></th>
						<td>
							<select name="srchConsltCours" id="srchConsltCours" class="form-control w-84" for="srchCardCo">
								<option value="">전체</option>
                                <c:forEach items="${joinCours}" var="item" varStatus="status">
									<option value="${item.key}" ${item.key eq param.srchConsltCours ? 'selected' : ''}>${item.value}</option>
								</c:forEach>
							</select>
						</td>
						<th scope="row"><label for="srchPrevPath">상담유형</label></th>
						<td>
							<select name="srchPrevPath" id="srchPrevPath" class="form-control w-84" for="srchCardCo">
								<option value="">전체</option>
                                <c:forEach items="${prevPath}" var="item" varStatus="status">
									<option value="${item.key}" ${item.key eq param.srchPrevPath ? 'selected' : ''}>${item.value}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
                        <th scope="row"><label for="srchBplcNmOrId">기관명/ID 검색</label></th>
                        <td>
                            <input type="text" class="form-control flex-1" name="srchBplcNmOrId" id="srchBplcNmOrId" value="${param.srchBplcNmOrId}">
                        </td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group mt-5">
			<button type="submit" class="btn-primary large shadow w-52">검색</button>
		</div>
	</form>

	<p class="text-title2 mt-13">조회결과</p>
	<button type="button" class="mt-14" data-bs-toggle="modal" data-bs-target="#tooltip">
		<img src="/html/page/app/matching/assets/src/images/04icon/info_2.svg" alt="툴팁" />
	</button>

	<div class="pagination mt-7">
		<div class="sorting2">
			<label for="countPerPage">출력</label>
			<select name="countPerPage" id="countPerPage" class="form-control">
				<option value="10" ${listVO.cntPerPage eq '10' ? 'selected' : '' }>10개</option>
				<option value="20" ${listVO.cntPerPage eq '20' ? 'selected' : '' }>20개</option>
				<option value="30" ${listVO.cntPerPage eq '30' ? 'selected' : '' }>30개</option>
			</select>
			<label for="sortBySelector" class="ml-3">정렬</label>
			<select name="sortBySelector" id="sortBySelector" class="form-control">
				<option value="mngrMatchingCnt" ${listVO.sortBy eq 'mngrMatchingCnt' ? 'selected' : '' }>운영자(수동)</option>
				<option value="autoMatchingCnt" ${listVO.sortBy eq 'autoMatchingCnt' ? 'selected' : '' }>이력(자동)</option>
				<option value="totalCnt" ${listVO.sortBy eq 'totalCnt' ? 'selected' : '' }>합계</option>
				<option value="assignmentCnt" ${listVO.sortBy eq 'assignmentCnt' ? 'selected' : '' }>배정완료</option>
				<option value="inProgressCnt" ${listVO.sortBy eq 'inProgressCnt' ? 'selected' : '' }>상담진행중</option>
				<option value="completeCnt" ${listVO.sortBy eq 'completeCnt' ? 'selected' : '' }>상담완료</option>
				<option value="absenceCnt" ${listVO.sortBy eq 'absenceCnt' ? 'selected' : '' }>상담자 부재</option>
				<option value="cancelCnt" ${listVO.sortBy eq 'cancelCnt' ? 'selected' : '' }>상담취소(상담자/THKC)</option>
				<option value="cancelByBplcCnt" ${listVO.sortBy eq 'cancelByBplcCnt' ? 'selected' : '' }>상담 거부 횟수</option>
			</select>
		</div>
	</div>

	<div class="scroll-table mt-4">
		<table class="table-list">
			<colgroup>
				<col class="min-w-35 w-35">
				<col class="min-w-25">
				<col class="min-w-25">
				<col class="min-w-25">
				<col class="min-w-25">
				<col class="min-w-25">
				<col class="min-w-25">
				<col class="min-w-25">
				<col class="min-w-25">
				<col class="min-w-25">
                <col class="min-w-25">
			</colgroup>
			<thead>
				<tr>
					<th style="background-color: transparent;"></th>
					<th scope="col" colspan="3">매칭 횟수</th>
					<th scope="col" colspan="6">상담 결과</th>
				</tr>
				<tr>
					<th scope="col">장기요양기관명</th>
					<th scope="col">운영자(수동)</th>
					<th scope="col">이력(자동)</th>
					<th scope="col">합계</th>
					<th scope="col">배정완료</th>
					<th scope="col">상담진행중</th>
					<th scope="col">상담완료</th>
					<th scope="col">상담자 부재</th>
					<th scope="col">상담취소<br>(상담자/THKC)</th>
					<th scope="col">상담 거부 횟수</th>
					<th scope="col">상담 상세</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty listVO.listObject}">
					<tr>
						<td class="noresult" colspan="11">검색조건을 만족하는 결과가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="consltStats" items="${listVO.listObject}">
					<tr>
						<td>${consltStats.bplcNm}</td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.mngrMatchingCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.autoMatchingCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.totalCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.assignmentCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.inProgressCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.completeCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.absenceCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.cancelCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${consltStats.cancelByBplcCnt}" pattern="###,###" /></td>
						<td class="text-center">
							<a href="/_mng/consult/recipter/list" onclick="handleConsltListBtnClick(event, '${consltStats.bplcId}')" class="badge bg-gray2 border-gray2 py-1 px-2 inline-block" style="font-weight: bold;">
								<span class="inline-block pointer-events-none">목록 확인</span>
								<img src="/html/page/admin/assets/images/ico-navigate-out.svg" class="inline-block pointer-events-none" />
							</a>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${not empty totalSum}">
					<tr>
						<td>총 합계</td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.mngrMatchingCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.autoMatchingCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.totalCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.assignmentCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.inProgressCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.completeCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.absenceCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.cancelCnt}" pattern="###,###" /></td>
						<td class="text-center"><fmt:formatNumber value="${totalSum.cancelByBplcCnt}" pattern="###,###" /></td>
						<td class="text-center">
							<a href="/_mng/consult/recipter/list" onclick="handleConsltListBtnClick(event)" class="badge bg-gray2 border-gray2 py-1 px-2 inline-block" style="font-weight: bold;">
								<span class="inline-block pointer-events-none">목록 확인</span>
								<img src="/html/page/admin/assets/images/ico-navigate-out.svg" class="inline-block pointer-events-none" />
							</a>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>

	<div class="pagination mt-7">
		<mngr:mngrPaging listVO="${listVO}" />
	</div>
</div>

<div class="modal fade" id="tooltip" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<p>카운트 및 분류 정책</p>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
			</div>
			<div class="modal-body">
				<ul>
					<li>[매칭 횟수 > 운영자(수동)/이력(자동)] 카운트 및 분류 정책</li>
					<ul>
						<li>이력(자동): 상담 신청 시 기존 매칭된 기관으로 사업소가 시스템 자동 배정됨</li>
						<ul><li>‘상담 신청 접수’ 상태를 건너뛰고 바로 ‘상담 기관 배정 완료’ 상태로 접수됨</li></ul>
						<li>운영자(수동): ‘장기요양기관 지정’ 팝업에서 운영자가 사업소 지정 후 저장한 상태(=상담 기관 배정 완료)부터 ‘운영자(수동)’로 카운트</li>
						<li>특이사항</li>
						<ul>
							<li>상담 상세에서의 매칭 방식 노출 기준 변경</li>
							<ul>
								<li>최초 접수된 유형으로 표시되지만, 자동으로 들어왔다가 다시 운영자가 재배정하면 ‘운영자(수동)’으로 표시</li>
							</ul>
							<li>단건 상담이라도 매칭기관 배정이 변경될 때 마다 각각 매칭 카운트가 적용됨</li>
							<ul>
								<li>예시: 홍길동의 상담이 A사업소로 자동매칭됨 → 운영자가 admin에서 B사업소로 배정 변경함 → 운영자가 admin에서 C사업소로 배정 변경함<br>매칭 횟수 결과</li>
								<ul><li>A사업소: 이력(자동) +1, B사업소: 운영자(수동) +1, C사업소: 운영자(수동) +1</li></ul>
							</ul>
						</ul>
					</ul>
					<br>
					<li>상담 결과 > 상담취소(상담자/THKC): ‘상담 취소 (상담자)’ 상태값(=운영자가 상담 상태 변경할 때 선택한 값) + ‘상담 취소 (THKC)’ 상태값 카운트</li>
					<li>상담 결과 > 상담 거부 횟수: 기관에서 상담을 취소(=사업소가 ‘케어>수급자 상담관리’에서 ‘상담거부' 클릭)한 카운트 (상담이력에 ‘사업소(상담 거부)’로 저장된 값 기준)</li>
					<br>
					<li>상담 결과에 카운트되지 않는 케이스</li>
					<ul>
						<li>사업소가 케어 ‘수급자 상담관리’에서 상담거부 -> 운영자가 수동으로 다른 사업소 매칭 -> 돌봄에서 수급자가 상담을 취소</li>
						<li>단, 매칭 횟수는 유지</li>
					</ul>
					<br>
					<li>상담 상세 > 목록확인 버튼: 버튼 클릭 시 ‘고객상담 > 수급자 상담관리 페이지’로 이동</li>
					<ul><li>페이지 진입 시 이전 페이지의 검색 조건 (조회기간, 상담유형)과 해당 사업소로 검색한 결과를 출력</li></ul>
				</ul>
			</div>
		</div>
	</div>
</div>

<script>
function handleConsltListBtnClick(event, bplcId) {
	event.preventDefault();

	const queryString = createQueryStringFromParamMapWithoutBplcNmOrId() 
			+ '&srchCd=BPLC_CDNM&srchText=' 
			+ (bplcId || '${listVO.paramMap.get("srchBplcNmOrId")}');

	const baseUrl = $(event.target).attr('href');

	window.open(baseUrl + '?' + queryString);
}

function createQueryStringFromParamMapWithoutBplcNmOrId() {
	let queryString = '';
	if (${listVO.paramMap.containsKey("srchBgngDt")}) {
		queryString += 'srchRegBgng=${listVO.paramMap.get("srchBgngDt")}';
	}
	if (${listVO.paramMap.containsKey("srchEndDt")}) {
		if (queryString) queryString += '&';
		queryString += 'srchRegEnd=${listVO.paramMap.get("srchEndDt")}';
	}
	if (${listVO.paramMap.containsKey("srchPrevPath")}) {
		if (queryString) queryString += '&';
		queryString += 'srchPREV_PATH=${listVO.paramMap.get("srchPrevPath")}';
	}
	return queryString;
}
</script>