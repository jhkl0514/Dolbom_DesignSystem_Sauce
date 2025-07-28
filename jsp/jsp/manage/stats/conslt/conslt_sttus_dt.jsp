<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
	<jsp:include page="./include/tab.jsp" />
	
	<form action="./dt" class="mt-7.5" id="searchFrm" name="searchFrm">
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
								<select name="srchRegDt" id="srchRegDt" class="form-control w-32">
									<option value="DAY"<c:if test="${param.srchRegDt eq 'DAY'}">selected=selected</c:if>>일별조회</option>
									<option value="MONTH" <c:if test="${param.srchRegDt eq 'MONTH'}">selected=selected</c:if>>월별조회</option>
									<option value="YEAR" <c:if test="${param.srchRegDt eq 'YEAR'}">selected=selected</c:if>>연별조회</option>
								</select>
								<input type="date" class="form-control w-39 calendar" id="srchBgngDt" name="srchBgngDt" value="${param.srchBgngDt}">
									<i>~</i>
								<input type="date" class="form-control w-39 calendar" id="srchEngDt" name="srchEndDt" value="${param.srchEndDt}">
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
						<!--th scope="row"><label for="srchConsltSttus">상담 진행 상태</label></th>
						<td>
                            <select name="srchConsltSttus" id="srchConsltSttus" class="form-control w-84">
                                <option value="">전체</option>
								<c:forEach items="${consltSttus}" var="item" varStatus="status">
									<option value="${item.key}" ${item.key eq param.srchConsltSttus ? 'selected' : ''}>${item.value}</option>
								</c:forEach>
                            </select>
						</td-->
					</tr> 
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group mt-5">
			<button type="submit" class="btn-primary large shadow w-52">검색</button>
		</div>
	</form>

	<div class="mt-13 text-right mb-2">
		<!--button type="submit" class="btn-primary" id="btn-excel">엑셀 다운로드</button-->
	</div>

	<p class="text-title2 mt-13">조회결과</p>
	<div class="scroll-table">
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
                <col class="min-w-25">
                <col class="min-w-25">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">최초신청일</th>
					<th scope="col">총합계</th>
					<th scope="col">신청첩수</th>
					<th scope="col">기관배정완료</th>
					<th scope="col">진행중</th>
					<th scope="col">상담완료</th>
					<th scope="col">상담자부재</th>
					<th scope="col">재상담 신청접수</th>
					<th scope="col">재배정 완료</th>
					<th scope="col">취소(상담자)</th>
					<th scope="col">취소(THKC)</th>
					<th scope="col">취소(장기요양기관)</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty resultList}">
					<tr>
						<td class="noresult" colspan="12">검색조건을 만족하는 결과가 없습니다.</td>
					</tr>
				</c:if>

				<c:forEach var="result" items="${resultList}">
					<tr>
						<td>${result.regDtKind}</td>
						<td class="text-right"><fmt:formatNumber value="${result.csAllcnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs01cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs02cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs05cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs06cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs10cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs07cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs08cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs03cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs09cnt}" pattern="###,###" /></td>
						<td class="text-right"><fmt:formatNumber value="${result.cs04cnt}" pattern="###,###" /></td>
					</tr>
				</c:forEach>


			</tbody>
		</table>
	</div>
</div>
<script>
$(function(){

});
</script>