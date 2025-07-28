<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
	<form action="./list" method="get" id="searchFrm" name="searchFrm">
		<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
		<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />
		<input type="hidden" name="menuNo" id="menuNo" value="${param.menuNo}" />
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
						<th scope="row"><label for="search-item1">등록일</label></th>
						<td colspan="3">
							<div class="form-group">
								<input type="date" class="form-control w-39 calendar" id="srchRegBgng" name="srchRegBgng" value="${param.srchRegBgng}">
								<i>~</i>
								<input type="date" class="form-control w-39 calendar" id="srchRegEnd" name="srchRegEnd" value="${param.srchRegEnd}">&nbsp;
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('1'); return false;">오늘</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('2'); return false;">7일</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('3'); return false;">15일</button>
								<button type="button" class="btn shadow" onclick="f_srchJoinSet('4'); return false;">1개월</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="srchCd">검색어</label></th>
						<td>
							<div class="form-group w-84">

								<select name="srchCd" id="srchCd" class="form-control w-40">
									<!--option value="" ${empty param.srchCd?'selected':'' }>전체</option-->
									<c:forEach items="${FindCdList}" var="item" varStatus="status">
									<option value="${item.key}" ${item.key eq param.srchCd ? 'selected' : ''}>${item.value}</option>
									</c:forEach>
								</select>
								<input type="text" class="form-control flex-1" name="srchText" id="srchText" value="${param.srchText}">
							</div>
						</td>
						<th scope="row"><label for="srchCd">유효한 인정번호</label></th>
						<td>
							${htmlDrawMap.get("htmlRcperrcognConfirmYn")}
						</td>
					</tr>
					<tr>
                        <th scope="row"><label for="srchPREV_PATH">상담유형</label></th>
                        <td>
                            <select name="srchPREV_PATH" id="srchPREV_PATH" class="form-control w-84">
                                <option value="">전체</option>
								<c:forEach items="${allConsltType}" var="type" varStatus="status">
									<option value="${type}" ${type eq param.srchPREV_PATH ? 'selected' : ''}>
										<c:choose>
											<c:when test="${type == 'equip_ctgry'}">복지용구상담-관심복지용구</c:when>
											<c:when test="${type == 'test'}">인정등급상담 상세(제거예정)</c:when>
											<c:when test="${type == 'simple_test'}">인정등급상담 간편</c:when>
											<c:when test="${type == 'care'}">재가센터상담-어르신돌봄</c:when>
											<c:when test="${type == 'weltool_info'}">요양정보(복지용구)</c:when>
											<c:otherwise>정의되지 않은 상담 유형</c:otherwise>
										</c:choose>
									</option>
								</c:forEach>
                            </select>
                        </td>
						<th scope="row"><label for="srchCd">최초상담</label></th>
						<td>
							${htmlDrawMap.get("htmlFirstConsult")}
						</td>
                    </tr>
					<tr>
                        <th scope="row"><label for="srchConsltSttus">상담 진행 상태</label></th>
                        <td>
                            <select name="srchConsltSttus" id="srchConsltSttus" class="form-control w-84">
                                <option value="">선택</option>
                                <option value="CS01" ${param.srchConsltSttus eq 'CS01'?'selected="selected"':''}>상담 신청 접수</option>
                                <option value="CS02" ${param.srchConsltSttus eq 'CS02'?'selected="selected"':''}>상담 기관 배정 완료</option>
                                <option value="CS03" ${param.srchConsltSttus eq 'CS03'?'selected="selected"':''}>상담 취소 (상담자)</option>
                                <option value="CS09" ${param.srchConsltSttus eq 'CS09'?'selected="selected"':''}>상담 취소 (THKC)</option>
                                <option value="CS04" ${param.srchConsltSttus eq 'CS04'?'selected="selected"':''}>상담 취소 (상담기관)</option>
                                <option value="CS05" ${param.srchConsltSttus eq 'CS05'?'selected="selected"':''}>상담 진행 중</option>
                                <option value="CS06" ${param.srchConsltSttus eq 'CS06'?'selected="selected"':''}>상담 완료</option>
                                <option value="CS07" ${param.srchConsltSttus eq 'CS07'?'selected="selected"':''}>재상담 신청 접수</option>
                                <option value="CS08" ${param.srchConsltSttus eq 'CS08'?'selected="selected"':''}>상담 기관 재배정 완료</option>
								<option value="CS10" ${param.srchConsltSttus eq 'CS10'?'selected="selected"':''}>상담자 부재</option>
                            </select>
                        </td>
						<th scope="row"><label for="srchCd">매칭방식 구분</label></th>
						<td>
							${htmlDrawMap.get("htmlConsltAutoTy")}
						</td>
                    </tr>
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group mt-5">
			<button type="submit" class="btn-primary large shadow w-52">검색</button>
		</div>
	</form>

	<div class="mt-13 flex items-end gap-1.5">
        <p class="text-title2 mr-auto">수급자 상담목록</p>
        <button type="button" class="btn-primary mb-3 btn-excel">엑셀 다운로드</button>
        <%-- <button type="button" class="btn-secondary mb-3" id="delConslt" name="delConslt">선택 삭제</button> --%>
    </div>
    <div class="scroll-table">

	<table class="table-list">
		<colgroup>
			<col class="min-w-12 w-12">
			<col class="min-w-18 w-22">
			<col class="min-w-22 w-28">
			<col>
			<col class="min-w-25 w-30">
			<col class="min-w-15 w-30">
			<col class="min-w-22 w-50">
			<col class="min-w-30 w-30">
			<col class="min-w-30 w-30">
			<col class="min-w-22 w-28">
			<col class="min-w-22 w-28">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">
					<div class="form-check">
						<input type="checkbox" name="conslt_check" id="checkAll" value="" class="form-check-input"/>
					</div>
				</th>
				<th scope="col">번호</th>
				<th scope="col">상담진행상태</th>
				<th scope="col">사업소배정 (배정일시)</th>
				<th scope="col">수급자 성명</th>
				
				<th scope="col">상담받을 연락처</th>
				<th scope="col">실거주지주소</th>
				<th scope="col">상담유형</th>
				<th scope="col">상담신청경로</th>
				<th scope="col">최근상담 신청일</th>
				<th scope="col">회원이름<br>(회원코드)</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="resultList" items="${listVO.listObject}" varStatus="status">
		<c:set var="pageParam" value="consltNo=${resultList.consltNo}&amp;menuNo=${param.menuNo}&amp;curPage=${listVO.curPage}&amp;cntPerPage=${param.cntPerPage}&amp;srchRegBgng=${param.srchRegBgng}&amp;srchRegEnd=${param.srchRegEnd}&amp;srchMbrNm=${param.srchMbrNm}&amp;srchMbrTelno=${param.srchMbrTelno}&amp;srchConsltSttus=${param.srchConsltSttus}&amp;srchPREV_PATH=${param.srchPREV_PATH}" />
			<tr>
				<td>
					<div class="form-check">
						<input type="checkbox" name="check_child" value="${resultList.consltNo}" class="form-check-input" />
					</div>
				</td>
				<td>${listVO.startNo - status.index }</td>
				<td>
					<c:choose>
						<c:when test="${resultList.consltSttus eq 'CS01'}"><span class="text-red1">상담 신청 접수</span></c:when>
						<c:when test="${resultList.consltSttus eq 'CS02'}">상담 기관 배정 완료</c:when>
						<c:when test="${resultList.consltSttus eq 'CS03'}">상담 취소<br>(상담자)</c:when>
						<c:when test="${resultList.consltSttus eq 'CS09'}">상담 취소<br>(THKC)</c:when>
						<c:when test="${resultList.consltSttus eq 'CS04'}">상담 취소<br>(상담기관)</c:when>
						<c:when test="${resultList.consltSttus eq 'CS05'}">상담 진행 중</c:when>
						<c:when test="${resultList.consltSttus eq 'CS06'}">상담 완료</c:when>
						<c:when test="${resultList.consltSttus eq 'CS07'}"><span class="text-red1">재상담 신청 접수</span></c:when>
						<c:when test="${resultList.consltSttus eq 'CS08'}">상담 기관 재배정 완료</c:when>
						<c:when test="${resultList.consltSttus eq 'CS10'}">상담자 부재</c:when>
					</c:choose>

				</td>
				<td>
					<c:if test="${resultList.consltSttus ne 'CS01'}">
					<c:forEach items="${resultList.consltResultList}" var="consltResult" varStatus="status2">
					${status2.index+1}차 : ${consltResult.bplcNm } (<fmt:formatDate value="${consltResult.regDt }" pattern="yyyy-MM-dd HH:mm" />)<br>
					</c:forEach>
					</c:if>
					<c:if test="${resultList.consltSttus eq 'CS01' || empty resultList.consltSttus}">
					-
					</c:if>
				</td>
				<td><a href="./view?${pageParam}" class="btn shadow w-full">${resultList.mbrNm}</a></td>
				
				<td>${resultList.mbrTelno}</td>
				
				
				<td>${resultList.zip}&nbsp;${resultList.addr}&nbsp;${resultList.daddr}</td>
				
				<td>
					<c:choose>
						<c:when test="${resultList.prevPath == 'equip_ctgry'}">복지용구상담</c:when>
						<c:when test="${resultList.prevPath == 'test'}">인정등급상담 상세</c:when>
						<c:when test="${resultList.prevPath == 'simple_test'}">인정등급상담 간편</c:when>
						<c:when test="${resultList.prevPath == 'care'}">재가센터상담</c:when>
						<c:when test="${resultList.prevPath == 'weltool_info'}">요양정보(복지용구)</c:when>
						<c:otherwise>정의되지 않은 상담 유형</c:otherwise>
					</c:choose>
				</td>
				<td>${consltCours[resultList.consltCours]}</td>
				<td>
					<c:choose>
						<c:when test="${resultList.consltSttus eq 'CS07' || resultList.consltSttus eq 'CS08'}">
							<fmt:formatDate value="${resultList.reConsltDt }" pattern="yyyy-MM-dd" />
						</c:when>
						<c:otherwise><fmt:formatDate value="${resultList.regDt }" pattern="yyyy-MM-dd" /></c:otherwise>
					</c:choose>
				</td>
				<td>
					<a href="/_mng/mbr/${resultList.regUniqueId }/view" target="_blank" class="btn shadow w-full" style="height:auto;">
						${resultList.rgtr} <br> (${resultList.regUniqueId}) 
					</a>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${empty listVO.listObject}">
			<tr>
				<td class="noresult" colspan="11">검색조건을 만족하는 결과가 없습니다.</td>
			</tr>
		</c:if>
		</tbody>
	</table>

	</div>

	<div class="pagination mt-7">
		<mngr:mngrPaging listVO="${listVO}" />
			<div class="sorting2">
				<label for="countPerPage">출력</label>
				 <select name="countPerPage" id="countPerPage" class="form-control">
					<option value="10" ${listVO.cntPerPage eq '10' ? 'selected' : '' }>10개</option>
					<option value="20" ${listVO.cntPerPage eq '20' ? 'selected' : '' }>20개</option>
					<option value="30" ${listVO.cntPerPage eq '30' ? 'selected' : '' }>30개</option>
				</select>
			</div>

			<div class="counter">
				총 <strong>${listVO.totalCount}</strong>건, <strong>${listVO.curPage}</strong>/${listVO.totalPage} 페이지
			</div>
		</div>

<script>
function f_srchJoinSet(ty){
	$("#srchRegEnd").val(f_getToday());
	if(ty == "1"){//오늘
   		$("#srchRegBgng").val(f_getToday());
	}else if(ty == "2"){//일주일
		$("#srchRegBgng").val(f_getDate(-7));
	}else if(ty == "3"){//15일
		$("#srchRegBgng").val(f_getDate(-15));
	}else if(ty == "4"){//한달
		$("#srchRegBgng").val(f_getDate(-30));
	}
}

$(function(){
	let arrDelConslt = [];

	// 전체 선택
	$("#checkAll").on("click",function(){
		let checkFlag = false;
		arrDelConslt = [];

		if($(this).is(":checked")){
			checkFlag = true;

			$("input[name='check_child']").each(function(){
				arrDelConslt.push($(this).val());
			});
		}
		$("input[name='check_child']").prop("checked",checkFlag);
		console.log(arrDelConslt);
	});

	$("input[name='check_child']").on("click",function(){
		let total = $("input[name='check_child']").length;
		let checkCnt = $("input[name='check_child']:checked").length;

		if(total == checkCnt){
			$("#checkAll").prop("checked",true);
		}else{
			$("#checkAll").prop("checked",false);
		}

		if($(this).is(":checked")){
			arrDelConslt.push($(this).val());
		}else{
			arrDelConslt = arrDelConslt.filter((element) => element !== $(this).val());
		}
		console.log(arrDelConslt);
	});

	$("#delConslt").on("click",function(){
		$.ajax({
			type : "post",
			url  : "/_mng/consult/recipter/delConslt.json",
			data : {arrDelConslt : arrDelConslt},
			dataType : 'json'
		})
		.done(function(data) {
			if(data.result){
				alert("삭제되었습니다.");
			}else{
				alert("1:1 상담 삭제 도중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
			}
			location.reload();
		})
		.fail(function(data, status, err) {
			console.log("ERROR : " + err);
		});
	});

	<%-- 엑셀 다운로드 --%>
	const jsExcelDownload = new JsExeclDownLoad();
	const excelFileSubject = "수급자_상담목록_";

	$(".btn-excel").on("click", async function(){
        var jsPopupExcelPwd = new JsPopupExcelPwd(this, '', 'jsPopupExcelPwd', 1, {});
		const asyncConfirm = await jsPopupExcelPwd.fn_show_popup({})
		if (asyncConfirm != "confirm") return;
        downloadExcel();
	});

	async function downloadExcel() {
		const data = new FormData(document.getElementById("searchFrm"));
		jsCallApi.call_api_post_json_formData(window, "/_mng/consult/recipter/excel.json", excelDownloadCallback, data);
		
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


