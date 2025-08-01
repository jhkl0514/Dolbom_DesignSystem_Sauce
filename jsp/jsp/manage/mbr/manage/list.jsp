<%@page import="javax.servlet.annotation.WebServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="icube.common.util.DateUtil"%>
<%@ page import="icube.common.util.StringUtil"%>


<script src="/html/page/admin/assets/script/_mng/mbr/JsHouseMngMbrList.js"></script>

<div id="page-content">
	<form action="./list" method="get" id="searchFrm" name="searchFrm">
		<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
		<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />
		<input type="hidden" name="grade" id="grade" value="" />
		<fieldset>
			<legend class="text-title2">회원 검색</legend>
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
                        <th scope="row"><label for="search-item1">검색어</label></th>
                        <td>
                            <div class="form-group w-84">
                                <select name="srchTarget" id="srchTarget" class="form-control w-40">
                                    <option value="srchUniqueIdWithLike" <c:if test="${param.srchTarget == 'srchUniqueIdWithLike'}">selected</c:if>>회원코드</option>
                                    <option value="srchAllKeyword" <c:if test="${param.srchTarget == 'srchAllKeyword'}">selected</c:if>>전체</option>
                                    <option value="srchLastTelnoOfMbl" <c:if test="${param.srchTarget == 'srchLastTelnoOfMbl'}">selected</c:if>>휴대폰번호</option>
                                    <option value="srchMbrId" <c:if test="${param.srchTarget == 'srchMbrId'}">selected</c:if>>이로움ID</option>
                                    <option value="srchMbrNm" <c:if test="${param.srchTarget == 'srchMbrNm'}">selected</c:if>>회원이름</option>
                                    <option value="srchRecipientsNm" <c:if test="${param.srchTarget == 'srchRecipientsNm'}">selected</c:if>>수급자성명</option>
                                    <option value="srchRcperRcognNo" <c:if test="${param.srchTarget == 'srchRcperRcognNo'}">selected</c:if>>요양인정번호</option>
                                </select>
                                <input type="text" class="form-control flex-1" name="srchText" id="srchText" value="${param.srchText}">
                            </div>
                        </td>
                    </tr>
					<tr>
						<th scope="row"><label for="srchGrade">회원등급</label></th>
						<td colspan="2">
							<div class="form-check-group w-full">
								<c:forEach var="grade" items="${grade}" varStatus="status">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="srchGrade${status.index}" id="srchGrade${status.index}" value="${grade.key}"<c:if test="${grade.key eq param.srchGrade0 || grade.key eq param.srchGrade1 || grade.key eq param.srchGrade2 || grade.key eq param.srchGrade3 || grade.key eq param.srchGrade4}">checked="checked"</c:if>>
										<label class="form-check-label" for="srchGrade${status.index}">${grade.value}</label>
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

		<p class="text-right">
			<button type="button" class="btn-primary btn-excel">엑셀 다운로드</button>
		</p>

	</form>

	<p class="text-title2 mt-13">회원 목록(기본리스트)</p>
	<table class="table-list">
		<colgroup>
			<col class="w-20">
			<col class="w-40">
			<col class="w-28">
			<col class="w-30">
			<col class="w-25">
			<col class="w-25">
			<col class="w-25">
			<col class="w-40">
			<col class="w-40">
			<col class="w-40">
			<col class="w-40">
			<col class="w-28">
			<col class="w-28">
			<col class="w-20">
			<col class="w-20">
			<col class="w-20">
			<col class="w-25">
			<col class="w-28">
			<col class="w-28">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">회원코드</th>
				<th scope="col">회원이름</th>
				<th scope="col">휴대폰번호</th>
				<th scope="col">정보수신</th>
				<th scope="col">등급테스트</th>
				<th scope="col">등록수급자수</th>
				<th scope="col">관계1</th>
				<th scope="col">관계2</th>
				<th scope="col">관계3</th>
				<th scope="col">관계4</th>
				<th scope="col">생년월일</th>
				<th scope="col">회원등급</th>
				<th scope="col">가입유형</th>
				<th scope="col">가입매체</th>
				<th scope="col">가입일</th>
				<th scope="col">수급자본인여부</th>
				<th scope="col">L번호등록수급자</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="resultList" items="${listVO.listObject}" varStatus="status">
		<c:set var="pageParam" value="curPage=${param.curPage}&amp;cntPerPage=${param.cntPerPage }&amp;srchMbrId=${param.srchMbrId}&amp;srchNm=${param.srchNm}&amp;srchLastTelnoOfMbl=${param.srchLastTelnoOfMbl}&amp;srchBrdt=${param.srchBrdt}" />
			<tr>
				<td>${listVO.startNo - status.index }</td>
				<td><a href="./${resultList.uniqueId}/view?${pageParam}" class="btn shadow w-full" style="padding-right: 0.5rem; padding-left: 0.5rem;">${resultList.uniqueId}</a></td>
				<td><a href="./${resultList.uniqueId}/view?${pageParam}" class="btn shadow w-full" style="padding-right: 0.5rem; padding-left: 0.5rem;">${resultList.mbrNm}</a></td>
				<td>${resultList.mblTelno}</td>
				<td>
					<c:set var="delimiter" value="" />
					<c:if test="${resultList.smsRcptnYn == 'Y'}">${mbrJoinRcptn2['SMS_RCPTN_YN']}<c:set var="delimiter" value="," /></c:if>
					<c:if test="${resultList.emlRcptnYn == 'Y'}">${delimiter}${mbrJoinRcptn2['EML_RCPTN_YN']}<c:set var="delimiter" value="," /></c:if>
					<c:if test="${resultList.telRecptnYn == 'Y'}">${delimiter}${mbrJoinRcptn2['TEL_RECPTN_YN']}<c:set var="delimiter" value="," /></c:if>
					<c:if test="${resultList.pushRecptnYn == 'Y'}">${delimiter}${mbrJoinRcptn2['PUSH_RECPTN_YN']}<c:set var="delimiter" value="," /></c:if>
					<c:if test="${resultList.eventRecptnYn == 'Y'}">${delimiter}${mbrJoinRcptn2['EVENT_RECPTN_YN']}</c:if>

					<c:if test="${delimiter == ''}">-</c:if>
				</td>
				<td>
					<c:if test="${resultList.existsTestYn > 0 || resultList.existsSimpleTestYn > 0 || resultList.existsSimpleCareYn > 0 }">Y</c:if>
					<c:if test="${resultList.existsTestYn == 0 && resultList.existsSimpleTestYn == 0  && resultList.existsSimpleCareYn == 0 }">-</c:if>
				</td>
				<td>${resultList.mbrRecipientsList.size()}</td>
				<td>
					<c:if test="${resultList.mbrRecipientsList.size() >= 1}">
						<a href="./${resultList.uniqueId}/recipient?recipientsNo=${resultList.mbrRecipientsList[0].recipientsNo}" class="btn shadow w-full" style="padding-right: 0.5rem; padding-left: 0.5rem;">
							${resultList.mbrRecipientsList[0].relationCd eq '100' ? '기타(친척등)' : mbrRelationCd[resultList.mbrRecipientsList[0].relationCd]}
							<br>(${StringUtil.maxLength10Shrink(resultList.mbrRecipientsList[0].recipientsNm)})
						</a>
					</c:if>
				</td>
				<td>
					<c:if test="${resultList.mbrRecipientsList.size() >= 2}">
						<a href="./${resultList.uniqueId}/recipient?recipientsNo=${resultList.mbrRecipientsList[1].recipientsNo}" class="btn shadow w-full" style="padding-right: 0.5rem; padding-left: 0.5rem;">
							${resultList.mbrRecipientsList[1].relationCd eq '100' ? '기타(친척등)' : mbrRelationCd[resultList.mbrRecipientsList[1].relationCd]}
							<br>(${StringUtil.maxLength10Shrink(resultList.mbrRecipientsList[1].recipientsNm)})
						</a>
					</c:if>
				</td>
				<td>
					<c:if test="${resultList.mbrRecipientsList.size() >= 3}">
						<a href="./${resultList.uniqueId}/recipient?recipientsNo=${resultList.mbrRecipientsList[2].recipientsNo}" class="btn shadow w-full" style="padding-right: 0.5rem; padding-left: 0.5rem;">
							${resultList.mbrRecipientsList[2].relationCd eq '100' ? '기타(친척등)' : mbrRelationCd[resultList.mbrRecipientsList[2].relationCd]}
							<br>(${StringUtil.maxLength10Shrink(resultList.mbrRecipientsList[2].recipientsNm)})
						</a>
					</c:if>
				</td>
				<td>
					<c:if test="${resultList.mbrRecipientsList.size() >= 4}">
						<a href="./${resultList.uniqueId}/recipient?recipientsNo=${resultList.mbrRecipientsList[3].recipientsNo}" class="btn shadow w-full" style="padding-right: 0.5rem; padding-left: 0.5rem;">
							${resultList.mbrRecipientsList[3].relationCd eq '100' ? '기타(친척등)' : mbrRelationCd[resultList.mbrRecipientsList[3].relationCd]}
							<br>(${StringUtil.maxLength10Shrink(resultList.mbrRecipientsList[3].recipientsNm)})
						</a>
					</c:if>
				</td>
				<td>
					<c:if test="${!empty resultList.getBrdt()}">
						${ StringUtil.birthMasking(DateUtil.formatDate(resultList.getBrdt(), "yyyy-MM-dd"))}
					</c:if>
					
				</td>
				<td class="cateVal${status.index}"><span class="badge-primary ml-2 gradeVal">${grade[resultList.mberGrade]}</span></td>
				<td>${resultList.joinTyList}</td>
				<td>${joinCours[resultList.joinCours]}</td>
				<td><fmt:formatDate value="${resultList.joinDt}" pattern="yyyy-MM-dd" /></td>
				<td>${(resultList.mbrRecipientsList.stream().filter(f -> f.relationCd == "007").count() > 0) ? "본인" : "-"}</td>
				<td>${resultList.mbrRecipientsList.stream().filter(f -> f.recipientsYn == "Y").count()}</td>
			</tr>
			</c:forEach>
			   <c:if test="${empty listVO.listObject}">
				<tr>
					<td class="noresult" colspan="18">검색조건을 만족하는 결과가 없습니다.</td>
				</tr>
				</c:if>
		</tbody>
	</table>

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
	var ctlMaster;
	$(document).ready(function(){
		ctlMaster = new JsHouseMngMbrList();
		ctlMaster.fn_searched_data(`<%= request.getParameter("searched_data") != null ? request.getParameter("searched_data") : "" %>`);
		ctlMaster.fn_page_init();
	});
	
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

	$(function(){
		var oObj = "${listVO.listObject}";
		var arrObj = oObj.split(",");
	
		for(var i=0; i<arrObj.length; i++){
			if($(".cateVal"+i).text() == ''){
				$(".cateVal"+i).remove();
			}
		}
	
		var gradeVal = [];
		for(var i=0; i<5; i++){
			if($("#srchGrade"+i).is(":checked") ){
				gradeVal.push($("#srchGrade"+i).val());
			}
		}
		$("#grade").attr("value",gradeVal);
		
		/*
	   	$(".btn-excel").on("click", function(){
            var jsPopupExcelPwd = new JsPopupExcelPwd(this, '', 'jsPopupExcelPwd', 1, {});
            async function fn_excel_down(){
                const asyncConfirm = await jsPopupExcelPwd.fn_show_popup({})
                if (asyncConfirm != "confirm"){
                    return;
                }
                
                $("#searchFrm").attr("action","excel").submit();
    			$("#searchFrm").attr("action","list");
            }
            fn_excel_down();
		});
		*/
		
		<%-- 엑셀 다운로드 --%>
		const jsExcelDownload = new JsExeclDownLoad();
		const excelFileSubject = "회원목록_";
		
		$(".btn-excel").on("click", async function(){
	        var jsPopupExcelPwd = new JsPopupExcelPwd(this, '', 'jsPopupExcelPwd', 1, {});
			const asyncConfirm = await jsPopupExcelPwd.fn_show_popup({})
			if (asyncConfirm != "confirm") return;
	        downloadExcel();
		});

		async function downloadExcel() {
			const data = new FormData(document.getElementById("searchFrm"));
			jsCallApi.call_api_post_json_formData(window, "/_mng/mbr/excel.json", excelDownloadCallback, data);
			
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

