<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
	<form action="./list" method="get" id="searchFrm" name="searchFrm">
		<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
		<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />
		<fieldset>
			<legend class="text-title2">탈퇴회원 검색</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="search-item1">가입일</label></th>
						<td colspan="3">
							<div class="form-group">
								<input type="date" class="form-control w-39 calendar" id="srchJoinBgng" name="srchJoinBgng" value="${param.srchJoinBgng}">
								<i>~</i>
								<input type="date" class="form-control w-39 calendar" id="srchJoinEnd" name="srchJoinEnd" value="${param.srchJoinEnd}">
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('0'); return false;">초기화</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('1'); return false;">오늘</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('2'); return false;">7일</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('3'); return false;">15일</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('4'); return false;">1개월</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="srchWhdwlBgng">탈퇴일</label></th>
						<td colspan="3">
							<div class="form-group">
								<input type="date" class="form-control w-39 calendar" id="srchWhdwlBgng" name="srchWhdwlBgng" value="${param.srchWhdwlBgng}">
								<i>~</i>
								<input type="date" class="form-control w-39 calendar" id="srchWhdwlEnd" name="srchWhdwlEnd" value="${param.srchWhdwlEnd}">
								<button type="button" class="btn shadow" onclick="f_srchWhdwlSet('0'); return false;">초기화</button>
								<button type="button" class="btn shadow" onclick="f_srchWhdwlSet('1'); return false;">오늘</button>
								<button type="button" class="btn shadow" onclick="f_srchWhdwlSet('2'); return false;">7일</button>
								<button type="button" class="btn shadow" onclick="f_srchWhdwlSet('3'); return false;">15일</button>
								<button type="button" class="btn shadow" onclick="f_srchWhdwlSet('4'); return false;">1개월</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="srchId">회원코드</label></th>
						<td><input type="text" class="form-control w-84" id="srchUniqueId" name=srchUniqueId value="${param.srchUniqueId}"></td>
						<th scope="row" style="display: none;"><label for="srchName">회원이름</label></th>
						<td style="display: none;"><input type="text" class="form-control w-84" id="srchMbrNm" name="srchMbrNm" value="${param.srchMbrNm}"></td>
					</tr>
					<tr>
						<th scope="row"><label for="search-item4">탈퇴유형</label></th>
						<td colspan="3">
							<div class="form-check-group">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="srchWhdwlTy" id="srchWhdwlTy" value="" checked>
									<label class="form-check-label" for="srchWhdwlTy">전체</label>
								</div>
								<c:forEach var="ty" items="${exitTyCode}" varStatus="status">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="srchWhdwlTy" id="srchWhdwlTy${status.index }" value="${ty.key }" <c:if test="${param.srchWhdwlTy eq ty.key }">checked="checked"</c:if>>
										<label class="form-check-label" for="srchWhdwlTy${status.index }">${ty.value }</label>
									</div>
								</c:forEach>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="srchWhdwlResn">탈퇴사유</label></th>
						<td colspan="3">
							<select name="srchWhdwlResn" class="form-control w-100" id="srchWhdwlResn">
								<option value="">전체</option>
								<c:forEach var="norResn" items="${norResnCode}" varStatus="status">
									<option value="${norResn.key }"<c:if test="${param.srchWhdwlResn eq norResn.key }">selected="selected"</c:if>>${norResn.value }</option>
								</c:forEach>
								<c:forEach var="authResn" items="${authResnCode}" varStatus="status">
									<option value="${authResn.key }"<c:if test="${param.srchWhdwlResn eq authResn.key }">selected="selected"</c:if>>${authResn.value }</option>
								</c:forEach>
							</select></td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group mt-5">
			<button type="submit" class="btn-primary large shadow w-52">검색</button>
		</div>
		<p class="text-right">
			<button type="button" class="btn-primary btn-excel">엑셀 다운로드</button>
		</p>

	</form>

	<p class="text-title2 mt-13">탈퇴회원 목록</p>
	<table class="table-list">
		<colgroup>
			<col class="w-20">
			<col class="w-[18%]">
			<col class="w-[18%]">
			<col class="w-44">
			<col class="w-44">
			<col class="w-30">
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">회원코드</th>
				<th scope="col">회원이름</th>
				<th scope="col">가입일</th>
				<th scope="col">탈퇴일</th>
				<th scope="col">탈퇴유형</th>
				<th scope="col">탈퇴사유</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="resultList" items="${listVO.listObject}" varStatus="status">
				<tr>
					<td>${listVO.startNo - status.index }</td>
					<td>${resultList.uniqueId}</td>
					<td>${resultList.mbrNm }</td>
					<td><fmt:formatDate value="${resultList.joinDt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td><fmt:formatDate value="${resultList.whdwlDt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${exitTyCode[resultList.whdwlTy]}</td>
					<td>
						<c:choose>
							<c:when test=""></c:when>
							<c:when test="${resultList.whdwlTy eq 'AUTHEXIT' && resultList.whdwlEtc eq null}">${authResnCode[resultList.whdwlResn]}</c:when>
							<c:when test="${resultList.whdwlTy eq 'AUTHEXIT' && resultList.whdwlEtc ne null}">${resultList.whdwlEtc}</c:when>
							<c:when test="${resultList.whdwlTy eq 'NORMAL' && resultList.whdwlResn ne 'ETC'}">${norResnCode[resultList.whdwlResn]}</c:when>
							<c:when test="${resultList.whdwlTy eq 'NORMAL' && resultList.whdwlResn eq 'ETC'}">${resultList.whdwlEtc}</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			<c:if test="${empty listVO.listObject}">
				<tr>
					<td class="noresult" colspan="7">검색조건을 만족하는 결과가 없습니다.</td>
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
function f_srchJoinSet(ty){
  	//srchJoinBgng, srchJoinEnd
	$("#srchJoinEnd").val(f_getToday());
  	if(ty == "0"){//초기화
  		$("#srchJoinBgng").val('');
  		$("#srchJoinEnd").val('');
  	}else if(ty == "1"){//오늘
   		$("#srchJoinBgng").val(f_getToday());
	}else if(ty == "2"){//일주일
		$("#srchJoinBgng").val(f_getDate(-7));
	}else if(ty == "3"){//15일
		$("#srchJoinBgng").val(f_getDate(-15));
	}else if(ty == "4"){//한달
		$("#srchJoinBgng").val(f_getDate(-30));
	}
}

function f_srchWhdwlSet(ty){
	$("#srchWhdwlEnd").val(f_getToday());
	if(ty == "0"){
		$("#srchWhdwlEnd").val('');
		$("#srchWhdwlBgng").val('');
	}else if(ty == "1"){//오늘
   		$("#srchWhdwlBgng").val(f_getToday());
	}else if(ty == "2"){//일주일
		$("#srchWhdwlBgng").val(f_getDate(-7));
	}else if(ty == "3"){//15일
		$("#srchWhdwlBgng").val(f_getDate(-15));
	}else if(ty == "4"){//한달
		$("#srchWhdwlBgng").val(f_getDate(-30));
	}
}


$(function(){

	<%-- 엑셀 다운로드 --%>
	const jsExcelDownload = new JsExeclDownLoad();
	const excelFileSubject = "탈퇴_회원목록_";

	$(".btn-excel").on("click", function(){
		//$("#searchFrm").attr("action","excel").submit();
		//$("#searchFrm").attr("action","list");
		downloadExcel();
	});
	
	async function downloadExcel() {
		const data = new FormData(document.getElementById("searchFrm"));
		jsCallApi.call_api_post_json_formData(window, "/_mng/mbr/exit/excel.json", excelDownloadCallback, data);
		
	}

	async function excelDownloadCallback(result, fail, data, param){
		if (result == undefined){
			alert("엑셀 다운로드 중 문제가 발생했습니다. 개발자에게 문의하세요.")
			return;
		}
		
		try {
			const excelFile = await jsExcelDownload.createExcelFile(result);
			await jsExcelDownload.download(excelFile, excelFileSubject);
		} catch (err) {
			alert("파일 생성 중 문제가 발생했습니다. 개발자에게 문의하세요.");
		}
	}
});
</script>
