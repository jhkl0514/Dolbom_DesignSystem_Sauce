<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


	<link rel="stylesheet" href="/html/core/script/free-jqgrid/css/ui.jqgrid.min.css">
	<link rel="stylesheet" href="/html/core/style/jqgrid.css">

	<script type="text/javascript" src="/html/core/script/free-jqgrid/jquery.jqgrid.src.js"></script>


	<script src="/html/core/script/JsHouse2309PopupJqgrid.js"></script>

	<script src="/html/page/admin/assets/script/_mng/shop/JsHouseMngListSearch.js"></script>
	<script src="/html/page/admin/assets/script/_mng/shop/order/JsHouseMngShopOrderList.js"></script>

	<script>
		var jsHouseMngShopOrderList = undefined;
	</script>

	<div id="page-content">
		<form id="searchFrm" name="searchFrm">
			<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
			<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />
			<input type="hidden" name="menuNo" id="menuNo" value="${param.menuNo}" />
			<fieldset>
				<legend class="text-title2">검색</legend>
				<table class="table-detail">
					<colgroup>
						<col class="w-43">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="search-item1">주문요청일</label></th>
							<td>
								<div class="form-group">
									<input type="date" class="form-control w-39 calendar" id="srchBgngDt"
										name="srchBgngDt" value="${param.srchBgngDt}">
									<i>~</i>
									<input type="date" class="form-control w-39 calendar" id="srchEndDt"
										name="srchEndDt" value="${param.srchEndDt}">&nbsp;
									<button type="button" class="btn shadow"
										onclick="jsHouseMngShopOrderList.fn_srchDaySet('day', 0); return false;">오늘</button>
									<button type="button" class="btn shadow"
										onclick="jsHouseMngShopOrderList.fn_srchDaySet('day', -7); return false;">7일</button>
									<button type="button" class="btn shadow"
										onclick="jsHouseMngShopOrderList.fn_srchDaySet('day', -15); return false;">15일</button>
									<button type="button" class="btn shadow"
										onclick="jsHouseMngShopOrderList.fn_srchDaySet('day', -30); return false;">1개월</button>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="srchCd">검색어</label></th>
							<td>
								<div class="form-group w-84">

									<select name="srchKind" id="srchKind" class="form-control w-40">
										<option value="">전체</option>
										<option value="mbr_id">회원코드</option>
										<option value="recipients_nm">수급자성명</option>
										<option value="ord_m_cd">주문서번호</option>
										<option value="mbl_telno">휴대폰번호</option>
									</select>
									<input type="text" class="form-control flex-1" name="srchValue" id="srchValue">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="srchOrdStautsCd">주문상태</label></th>
							<td>
								<select name="srchOrdStautsCd" id="srchOrdStautsCd" class="form-control w-84">
									<option value="">전체</option>
									<c:forEach var="itemOne" items="${shopOrderStatusMap}" varStatus="status">
										<option value="${itemOne.key}">${itemOne.value}</option>
									</c:forEach>
									
								</select>

								<div class="form-check mr-4">
									<input type="checkbox" class="form-check-input" name="chkExceptCancel" id="chkExceptCancel" value="Y">
									<label class="form-check-label" for="chkExceptCancel">취소제외</label>
								</div>
							</td>

						</tr>
						<tr>
							<th scope="row"><label for="srchBplcMatchingYn">사업소 배정여부</label></th>
							<td>
								<div class="form-check-group srchBplcMatchingYn">

									<div class="form-check">
										<input class="form-check-input" type="radio" name="srchBplcMatchingYn"
											id="srchBplcMatchingYn" value="" <c:if
											test="${param.srchBplcMatchingYn == null or param.srchBplcMatchingYn == '' }">checked="checked"
										</c:if>>
										<label class="form-check-label" for="srchBplcMatchingYn">전체</label>
									</div>
									<c:forEach var="itemOne" items="${bplcMatchingYnMap}" varStatus="status">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="srchBplcMatchingYn"
												id="srchBplcMatchingYn${status.index}" value="${itemOne.key}" <c:if
												test="${itemOne.key eq param.srchBplcMatchingYn }">checked="checked"
											</c:if> />
											<label class="form-check-label"
												for="srchBplcMatchingYn${status.index}">${itemOne.value}</label>
										</div>
									</c:forEach>
								</div>
							</td>

						</tr>
					</tbody>
				</table>
			</fieldset>

			<div class="btn-group mt-5">
				<button type="button" class="btn-primary large shadow w-52 btn search">검색</button>
			</div>
		</form>

		<div class="mt-13 flex items-end gap-1.5">
			<p class="text-title2 mr-auto">수급자 주문요청목록</p>
			<button type="button" class="btn-primary mb-3 btn send biztalk inprogress">진행요청 알림톡 발송</button>
			<button type="button" class="btn-primary mb-3 btn send biztalk confirm">확인요청 알림톡 발송</button>
			<button type="button" class="btn-primary mb-3 btn excel">엑셀 다운로드</button>
			<%-- <button type="button" class="btn-secondary mb-3" id="delConslt" name="delConslt">선택 삭제</button> --%>
		</div>
		<div class="flex items-end gap-1.5 table-jqgrid">
			<table id="grdMaster" width="98%"></table>
			<div id="grdPager"></div>
		</div>

		<script>

			$(function () {
				var param = jsCommon.fn_queryString_toMap('${pageParam}')

				jsHouseMngShopOrderList = new JsHouseMngShopOrderList(this, "#page-content", param);
				jsHouseMngShopOrderList.fn_init();
			});
		</script>