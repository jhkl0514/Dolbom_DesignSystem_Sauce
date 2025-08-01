<%@page import="javax.servlet.annotation.WebServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="/html/page/admin/assets/script/_mng/mbr/JsHouseMngMbrDetail.js"></script>

<div id="page-content">
<%@include file="./include/header.jsp"%>

	<table class="table-detail mt-13">
		<colgroup>
			<col class="w-43">
			<col>
			<col class="w-43">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" rowspan="3">총 적립 포인트</th>
				<td rowspan="3"><fmt:formatNumber value="${pointMap.addPoint}" pattern="###,###" /> P</td>
				<th scope="row">총 차감 포인트</th>
				<td><fmt:formatNumber value="${pointMap.usePoint + pointMap.extPoint}" pattern="###,###" /> P</td>
			</tr>
			<tr>
				<th scope="row">총 소멸 포인트</th>
				<td><fmt:formatNumber value="${pointMap.extPoint}" pattern="###,###" /> P</td>
			</tr>
			<tr>
				<th scope="row">현재 잔여 포인트</th>
				<td><fmt:formatNumber value="${pointMap.ownPoint}" pattern="###,###" /> P</td>
			</tr>
		</tbody>
	</table>

	<form action="./point" class="mt-13" id="searchFrm" name="searchFrm" method="get">
	<input type="hidden" id="cntPerPage" name="cntPerPage" value="${param.cntPerPage}"  />
		<fieldset>
			<legend class="text-title2">포인트 검색</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="search-item5-1">발생기간</label></th>
						<td colspan="4">
							<div class="form-group">
								<input type="date" class="form-control w-39 calendar" id="srchBgngDt" name="srchBgngDt" value="${param.srchBgngDt}">
								<i>~</i>
								 <input type="date" class="form-control w-39 calendar" id="srchEndDt" name="srchEndDt" value="${param.srchEndDt}">
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('1'); return false;">오늘</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('2'); return false;">7일</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('3'); return false;">15일</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('4'); return false;">1개월</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="search-item5-2">구분</label></th>
						<td colspan="3">
							<select name="srchPointSe" id="srchPointSe" class="form-control w-84">
								<option value="">전체</option>
								<c:forEach var="pointSe" items="${pointSeCode}">
									<option value="${pointSe.key}"<c:if test="${pointSe.key eq param.srchPointSe}">selected="selected"</c:if>>${pointSe.value}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="srchPointCn">내용</label></th>
						<td colspan="3">
							<select name="srchPointCn" id="srchPointCn" class="form-control w-84">
								<option value="">전체</option>
								<c:forEach var="pointCn" items="${pointCnCode}">
									<option value="${pointCn.key}" <c:if test="${pointCn.key eq param.srchPointCn}">selected="selected"</c:if>>${pointCn.value}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="srchMngrMemo">관리자 메모</label></th>
						<td><input type="text" class="form-control w-84" id="srchMngrMemo" name="srchMngrMemo" value="${param.srchMngrMemo}"></td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group mt-5">
			<button type="submit" class="btn-primary large shadow w-52">검색</button>
		</div>
	</form>

	<p class="text-title2 mt-13">포인트 내역</p>
	<table class="table-list">
		<colgroup>
				<col class="min-w-23">
				<col class="min-w-23">
				<col class="min-w-42">
				<col class="min-w-55">
				<col class="min-w-75">
				<col class="min-w-40">
				<col class="min-w-23">
				<col class="min-w-23">
				<col class="min-w-23">
				<col class="min-w-23">
				<col class="min-w-42">
				<col class="min-w-25">
			</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">구분</th>
				<th scope="col">발생일</th>
				<th scope="col">내용</th>
				<th scope="col">메모</th>
				<th scope="col">주문번호</th>
				<th scope="col">적립</th>
				<th scope="col">사용</th>
				<th scope="col">소멸</th>
				<th scope="col">잔여</th>
				<th scope="col">유효기간</th>
				<th scope="col">처리자명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="resultList" items="${listVO.listObject}" varStatus="status">
			<tr>
				<td>${listVO.startNo - status.index}</td>
				<td>${pointSeCode[resultList.pointSe]}</td>
				<td><fmt:formatDate value="${resultList.regDt}" pattern="yyyy-MM-dd" /><br><fmt:formatDate value="${resultList.regDt}" pattern="HH:mm:ss" />
				</td>
				<td>${pointCnCode[resultList.pointCn]}</td>
				<td>${empty resultList.mngrMemo ? '-' : resultList.mngrMemo}</td>
					<td>
						<c:if test="${empty resultList.ordrCd}">${empty resultList.ordrCd ? '-' : resultList.ordrCd}</c:if> <c:if test="${!empty resultList.ordrCd}">
							<a href="./ordr?mbrOrdrCd=${resultList.ordrCd}" class="btn shadow">${empty resultList.ordrCd ? '-' : resultList.ordrCd}</a>
						</c:if>
					</td>
				<td class="font-serif text-right"><fmt:formatNumber value="${resultList.pointSe eq 'A' ? resultList.point : 0}" pattern="###,###" /></td>
				<td class="font-serif text-right"><fmt:formatNumber value="${resultList.pointSe eq 'M'? resultList.point : 0}" pattern="###,###" /></td>
				<td class="font-serif text-right"><fmt:formatNumber value="${resultList.pointSe eq 'E'? resultList.point : 0}" pattern="###,###" /></td>
				<td class="font-serif text-right"><fmt:formatNumber value="${resultList.pointAcmtl}" pattern="###,###" /></td>
				<td>	<fmt:formatDate value="${resultList.fmtDt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${resultList.rgtr}</td>
			</tr>
			</c:forEach>
			<c:if test="${empty listVO.listObject}">
				<tr>
					<td class="noresult" colspan="13">검색조건을 만족하는 결과가 없습니다.</td>
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
</div>

<script>
	var ctlMaster;
	$(document).ready(function(){
		ctlMaster = new JsHouseMngMbrPoint();
		ctlMaster.fn_searched_data(`<%= request.getParameter("searched_data") != null ? request.getParameter("searched_data") : "" %>`);
		ctlMaster.fn_page_init();
	});

function f_srchJoinSet(ty){
  	//srchJoinBgng, srchJoinEnd
	$("#srchEndDt").val(f_getToday());
	if(ty == "1"){//오늘
   		$("#srchBgngDt").val(f_getToday());
	}else if(ty == "2"){//일주일
		$("#srchBgngDt").val(f_getDate(-7));
	}else if(ty == "3"){//15일
		$("#srchBgngDt").val(f_getDate(-15));
	}else if(ty == "4"){//한달
		$("#srchBgngDt").val(f_getDate(-30));
	}
}
</script>
