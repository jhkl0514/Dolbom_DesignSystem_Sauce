<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.common.util.DateUtil"%>
<%@ page import="icube.common.values.ConsltAbleType"%>
<%@ page import="icube.manage.consult.biz.MbrConsltResultMemoUtil"%>


		    <!-- plugin -->
		    <link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.css">
		    <script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>

			
			<link rel="stylesheet" href="/html/core/script/free-jqgrid/css/ui.jqgrid.min.css">
			<link rel="stylesheet" href="/html/core/style/jqgrid.css">

			<script type="text/javascript" src="/html/core/script/free-jqgrid/jquery.jqgrid.src.js"></script>


			<script src="/html/core/script/hangjungdong2407.js"></script>

			<script src="/html/core/script/JsHouse2309PopupJqgrid.js"></script>

			<script src="/html/page/admin/assets/script/_mng/bplc/JsHouseMngBplcModal.js"></script>
    
			<!-- page content -->
            <div id="page-content">
                <p class="mb-7">인정등급테스트 후 1:1상담 신청한 내역을 확인하는 페이지입니다.</p>
				<c:set var="pageParam" value="menuNo=${param.menuNo}&curPage=${param.curPage}&cntPerPage=${param.cntPerPage}&srchRegBgng=${param.srchRegBgng}&srchRegEnd=${param.srchRegEnd}&srchMbrNm=${param.srchMbrNm}&srchMbrTelno=${param.srchMbrTelno}&srchConsltSttus=${param.srchConsltSttus}&srchPREV_PATH=${param.srchPREV_PATH}" />
                <form:form action="./action?${pageParam}" method="post" id="frmView" name="frmView" modelAttribute="mbrConsltVO" onsubmit="return submitEvent();">
				<form:hidden path="consltNo" />
				<form:hidden path="consltSttus" />
                    <fieldset>
                        <legend class="text-title2">상담내역</legend>
                        <table class="table-detail">
                            <colgroup>
                                <col class="w-43">
                                <col>
                                <col class="w-43">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">수급자 성명</th>
                                    <td>${mbrConsltVO.mbrNm}
										<c:if test="${mbrRecipientsVO != null && mbrRecipientsVO.verificationYn eq 'Y'}">
                                    		(위임완료)
                                    	</c:if>
									</td>
                                    <th scope="row">수급자와의 관계</th>
                                    <td>${MBR_RELATION_CD_FOR_ADMIN[mbrConsltVO.relationCd]}</td>
                                </tr>
                                <tr>
                                    <th scope="row">회원코드</th>
                                    <td>${mbrConsltVO.regUniqueId} ( ${ mbrVO.mbrNm } )</td>
                                    <th scope="row">상담유형</th>
                                    <td>${prevPath[mbrConsltVO.prevPath]}</td>
                                </tr>
                                <tr>
                                    <th scope="row">성별</th>
                                    <td>${genderCode[mbrConsltVO.gender]}</td>
                                    <th scope="row">상담유형 상세</th>
                                    <td>
                                    	<button type="button" class="btn-primary" onclick="viewConsltDetailModal('${mbrConsltVO.prevPath}');">상세보기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">생년월일</th>
                                    <td>
										<c:choose>  
                                            <c:when test="${mbrConsltVO.brdt != null}">${DateUtil.formatDate(mbrConsltVO.getBrdt(), "yyyy/MM/dd")}</c:when> 
											<c:when test="${not empty mbrConsltVO.over65Yn}">${over65YnMap[mbrConsltVO.over65Yn]}</c:when> 
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <th scope="row">장기요양인정번호</th>
                                    <td>
                                        <c:choose>  
											<c:when test="${mbrRecipientsVO != null && mbrRecipientsVO.longtermConfirmYn eq 'Y' && mbrConsltVO.rcperRcognNo eq mbrRecipientsVO.rcperRcognNo}">L${mbrConsltVO.rcperRcognNo}(유효)</c:when> 
                                            <c:when test="${not empty mbrConsltVO.rcperRcognNo}">L${mbrConsltVO.rcperRcognNo}</c:when> 
                                            <c:otherwise>없음</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">상담받을 연락처</th>
                                    <td>${mbrConsltVO.mbrTelno}</td>
                                    <th scope="row">상담신청일시</th>
                                    <td>
										<c:choose>  
                                            <c:when test="${existSttsCS07}"><fmt:formatDate value="${mbrConsltChgHistCS07VO.regDt}" pattern="yyyy-MM-dd HH:mm" /></c:when> 
                                            <c:otherwise><fmt:formatDate value="${mbrConsltVO.regDt}" pattern="yyyy-MM-dd HH:mm" /></c:otherwise>
                                        </c:choose>
										
									</td>
                                </tr>
                                <tr>
                                    <th scope="row">실거주지 주소</th>
                                    <td>${mbrConsltVO.zip}&nbsp;${mbrConsltVO.addr}&nbsp;${mbrConsltVO.daddr}</td>
									<th scope="row">상담진행상태</th>
									<td>
										<c:choose>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS01'}"><span class="text-red1">상담 신청 접수</span></c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS02'}">상담 기관 배정 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS03'}">상담 취소<br>(상담자)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS04'}">상담 취소<br>(상담기관)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS09'}">상담 취소<br>(THKC)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS05'}">상담 진행 중</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS06'}">상담 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS07'}"><span class="text-red1">재상담 신청 접수</span></c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS08'}">상담 기관 재배정 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS10'}">상담자 부재</c:when>
										</c:choose>
									</td>
                                </tr>
                                <tr>
                                    <th scope="row" rowspan="2">장기요양기관 지정</th>
                                    <td rowspan="2">
                                    	<input type="hidden" id="bplcUniqueId" name="bplcUniqueId" value="">
                                    	<input type="hidden" id="bplcId" name="bplcId" value="">
                                    	<input type="hidden" id="bplcNm" name="bplcNm" value="">
                                    	<input type="hidden" id="consltmbrNm" name="consltmbrNm" value="${mbrConsltVO.mbrNm}">
                                        <input type="hidden" id="regMbrNm" name="regMbrNm" value="${mbrVO.mbrNm}">
                                    	<input type="hidden" id="consltMbrTelno" name="consltMbrTelno" value="${mbrConsltVO.mbrTelno}">
                                    	<input type="hidden" id="regUniqueId" name="regUniqueId" value="${mbrConsltVO.getRegUniqueId()}">
                                        <input type="hidden" id="originConsltBplcUniqueId" name="originConsltBplcUniqueId" value="${consltBplcUniqueId}">
                                    	<input type="hidden" id="chgHistListSize" name="chgHistListSize" value="${chgHistList.size()}">
                                    	<input type="hidden" id="originConsltSttus" name="originConsltSttus" value="${mbrConsltVO.consltSttus}">
                                        <input type="hidden" id="recipientsNo" name="recipientsNo" value="${mbrConsltVO.recipientsNo}">
                                        
										<!-- 진행(CS05)전 상태이면 사업소 수정가능하게 해야함 -->

										<c:if test="${(mbrConsltVO.consltSttus eq 'CS01' || mbrConsltVO.consltSttus eq 'CS07') || mbrConsltVO.consltSttus eq 'CS02' || mbrConsltVO.consltSttus eq 'CS04' }">
                                        <button type="button" class="btn-primary shadow f_srchBplc">선택</button>
                                        </c:if>

                                        <ul class="mt-2 space-y-1 bplcLi">
                                        	<c:forEach items="${consltAssignmentList}" var="resultList" varStatus="status">
	                                            <li <c:if test="${resultList.reject}">style="opacity: 0.5;"</c:if>>
	                                            	${resultList.consltCnt}차 상담 사업소<c:if test="${resultList.reject}">(상담 거부)</c:if> : ${resultList.bplcNm} (${resultList.bplcPicTelno}
	                                            	/ <img src="/html/page/members/assets/images/ico-mypage-recommend.svg" style="display: inline; margin-top: -2px; margin-right: 3px; height: 13px;">${resultList.rcmdCnt})
	                                            	, <fmt:formatDate value="${resultList.regDt}" pattern="yyyy-MM-dd HH:mm:ss" />
	                                            </li>
                                        	</c:forEach>
                                        </ul>
                                    </td>
									<th scope="row">전체 상담 횟수</th>
									<td >${notCanceledConsltCnt}</td>
                                </tr>
								<tr>
									<th scope="row">매칭 방식 구분</th>
									<td>${isAutoAssigned ? "이력(자동)" : "운영자(수동)"}</td>
								</tr>
                                <tr>
                                    <th scope="row">탈퇴여부</th>
                                    <td>
                                        <c:choose>  
                                            <c:when test="${mbrVO.mberSttus eq 'EXIT'}">${MBER_STTUS[mbrVO.mberSttus]}</c:when> 
                                            <c:otherwise>-</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <th scope="row">재상담/취소/거부 사유</th>
                                    <td>
                                    	<div class="flex items-center gap-4">
											<c:if test="${existSttsCS07}">
												<button type="button" class="btn-primary shadow" data-bs-toggle="modal" data-bs-target="#modal3">재상담 신청 사유 확인</button>
											</c:if>
	                                        <c:if test="${(!empty bplcRejectChgList && bplcRejectChgList.size() > 0)}">
	                                        	<button type="button" class="btn-primary shadow" data-bs-toggle="modal" data-bs-target="#modal5">상담 거부 사유 확인</button>
	                                        </c:if>
											<c:if test="${mbrConsltVO.consltSttus eq 'CS03' || mbrConsltVO.consltSttus eq 'CS09'}">
	                                        	<button type="button" class="btn-primary shadow" data-bs-toggle="modal" data-bs-target="#modal6">상담 취소 사유 확인</button>
	                                        </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>

					<fieldset class="mt-5">
						<legend class="text-title2">수급자 매칭정보</legend>
						<table class="table-detail">
							<colgroup>
								<col class="w-43">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">매칭 기관</th>
									<td>
										${not empty matchingBplcNm ? matchingBplcNm : "-"}
										<button type="button" class="btn-primary shadow ml-4" data-bs-toggle="modal" data-bs-target="#modal-matching-bplc-hist">이력 확인</button>
										<c:if test="${not empty matchingBplcNm}">
											<button type="button" class="btn-primary shadow ml-4" onclick="handleMatchingBplcDeleteClick()">매칭 삭제</button>
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					
                    <div class="btn-group right mt-5">
						<c:if test="${!empty mngAuthrtMenuVO && mngAuthrtMenuVO.delYn eq 'Y'}">
							<button type="button" class="btn-danger large shadow float-left mb-3  btn delete consult" id="delConslt" name="delConslt"  consltNo="${mbrConsltVO.consltNo}" onclick="fn_deleteConsult_call('${mbrConsltVO.consltNo}')">삭제</button>
						</c:if>
						
                    	<c:if test="${fn:length(consltResultListCalced) > 0}">
                        	<button type="button" class="btn-primary large shadow float-left" data-bs-toggle="modal" data-bs-target="#modal4">멤버스 상담 내역 확인</button>
                        </c:if>
                        
                        <c:if test="${mbrConsltVO.consltSttus ne 'CS03' && mbrConsltVO.consltSttus ne 'CS04' && mbrConsltVO.consltSttus ne 'CS06' && mbrConsltVO.consltSttus ne 'CS09' }">
                        	<button type="button" class="btn-danger large shadow" data-bs-toggle="modal" data-bs-target="#modal1">상담취소</button>
                        </c:if>
                        <c:if test="${mbrConsltVO.consltSttus eq 'CS01' || mbrConsltVO.consltSttus eq 'CS02' || mbrConsltVO.consltSttus eq 'CS07' }">
	                        <button type="submit" class="btn-success large shadow">저장</button>
                        </c:if>
                        <c:if test="${mbrConsltVO.consltSttus ne 'CS06'}">
                        	<button type="button" class="btn-warning large shadow" data-bs-toggle="modal" data-bs-target="#modal-consulting-info">정보수정</button>
                        </c:if>
                        <a href="./list?${pageParam}" class="btn-secondary large shadow btn list">목록</a>
                    </div>

					<%--
                    <fieldset class="mt-13">
                        <legend class="text-title2">상담내용(관리자 메모)</legend>
                        <table class="table-detail">
                            <colgroup>
                                <col class="w-43">
                                <col>
  	                          </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">상담진행상태</th>
                                    <td>
                                    	<c:choose>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS01'}"><span class="text-red1">상담 신청 접수</span></c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS02'}">상담 기관 배정 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS03'}">상담 취소<br>(상담자)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS09'}">상담 취소<br>(THKC)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS04'}">상담 취소<br>(상담기관)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS05'}">상담 진행 중</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS06'}">상담 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS07'}"><span class="text-red1">재상담 신청 접수</span></c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS08'}">상담 기관 재배정 완료</c:when>
										</c:choose>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="mngMemo" class="require">상담내용</label></th>
                                    <td>
                                    	<textarea id="mngMemo" name="mngMemo" class="form-control w-full" title="메모" cols="30" rows="5">${mbrConsltVO.mngMemo }</textarea>
                                    </td>
                                </tr>
                                <c:if test="${!empty mbrConsltVO.mngrUniqueId}">
                                <tr>
                                    <th scope="row">등록일</th>
                                    <td>${mbrConsltVO.mngrNm}(${mbrConsltVO.mngrId}) / <fmt:formatDate value="${mbrConsltVO.memoMdfcnDt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </fieldset>
                    --%>
                </form:form>
                

				<fieldset class="mt-15">                                                                                                
				    <legend class="text-title2">상담기록 및 진행상태 변경 내역</legend>                                                                 
				    <table class="table-detail">
				        <colgroup>
				            <col class="w-full">
				            <col>
				        </colgroup>
				        <tbody>                               
				            <tr>  
				                <!-- <th scope="row"><label for="form-item1">내역</label></th> -->
				                <td>
				                    <textarea name="" id="form-item1" cols="30" rows="5" class="w-full p-3" readonly>${historyText}</textarea>
				                </td>                      
				            </tr>                                
				        </tbody>
				    </table>
				</fieldset>

				<fieldset class="mt-5">                                                                        
				    <legend class="text-title2">상담기록</legend>
				    <div class="btn-group right mx-2">
				        <button class="small shadow btn-primary f_saveMngMemo">저장</button>
				    </div>                        
				    <table class="table-detail">
				        <colgroup>
				            <col class="w-43">
				            <col>
				        </colgroup>
				        <tbody>                               
				            <tr>
				                <th scope="row"><label for="form-item1">상담기록 작성</label></th>
				                <td>
				                	<textarea name="" id="mngMemo" cols="30" rows="5" class="form-control w-full"></textarea>
				                </td>
				            </tr>                                
				        </tbody>
				    </table>
				</fieldset>
				
				<fieldset class="mt-5">                        
                    <legend class="text-title2">상담진행상태 변경</legend>
                    <div class="btn-group right mx-2">
                        <button class="small shadow btn-primary f_changeConsltSttus">저장</button>
                    </div>
                    <table class="table-detail">
                        <colgroup>
                            <col class="w-43">
                            <col>
                        </colgroup>
                        <table class="table-detail">
                            <colgroup>
                                <col class="w-43">
                                <col>
                                <col class="w-43">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">현재</th>
                                    <td class="currentSttus">
                                    	<c:choose>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS01'}"><span class="text-red1">상담 신청 접수</span></c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS02'}">상담 기관 배정 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS03'}">상담 취소<br>(상담자)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS09'}">상담 취소<br>(THKC)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS04'}">상담 취소<br>(상담기관)</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS05'}">상담 진행 중</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS06'}">상담 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS07'}"><span class="text-red1">재상담 신청 접수</span></c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS08'}">상담 기관 재배정 완료</c:when>
											<c:when test="${mbrConsltVO.consltSttus eq 'CS10'}">상담자 부재</c:when>
										</c:choose>
                                    </td>
                                    <th scope="row">변경</th>
                                    <td>
                                        <select name="chgSttusSelect" id="chgSttusSelect" class="form-control w-50">
                                            <option value="">선택</option>
                                            <option value="CS01">상담 신청 접수</option>
                                            <option value="CS02">상담 기관 배정 완료</option>
                                            <option value="CS03">상담 취소 (상담자)</option>
                                            <option value="CS09">상담 취소 (THKC)</option>
                                            <option value="CS04">상담 취소 (상담기관)</option>
                                            <option value="CS05">상담 진행 중</option>
                                            <option value="CS06">상담 완료</option>
                                            <option value="CS07">재상담 신청 접수</option>
                                            <option value="CS08">상담 기관 재배정 완료</option>
											<option value="CS10">상담자 부재</option>
                                        </select>
                                    </td>
                                </tr>                                   
                            </tbody>
                        </table>
                        <table class="table-detail">
                            <colgroup>
                                <col class="w-43">
                                <col>
                            </colgroup>
                            <tbody>                               
                                                            
                            </tbody>
                        </table>                         
                    </table>
                </fieldset>  


                <!-- 상담 취소 사유 -->
                <div class="modal fade" id="modal1" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <form class="modal-content" id="modalCancl" name="modalCancl" method="post">
                            <div class="modal-header">
                                <p>상담 취소 사유 입력</p>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                            </div>
                            <fieldset class="modal-body">
                                <label>상담 취소 사유를 입력해 주세요</label>
                                <p class="text-red1">※ 상담 취소 시 재상담 신청 접수가 불가합니다.</p>
                                <textarea name="canclResn" id="canclResn" cols="30" rows="5" class="form-control w-full mt-4"></textarea>
                            </fieldset>
                            <div class="modal-footer">
                                <button type="button" class="btn large btn-primary w-36 f_saveCanclResn">저장하기</button>
                                <button type="button" class="btn large btn-secondary w-36" data-bs-dismiss="modal" aria-label="close">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- //상담 취소 사유 -->

                <!-- 사업소 선택 -->
				<c:import url="/_mng/members/bplc/modalBplcSearch2409" />
				

				<!-- 매칭 기관 이력 확인 -->
				<%@include file="./modal/matchingBplcHist.jsp"%>

				<!-- 재상담 신청 사유 확인  -->
                <div class="modal fade" id="modal3" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <p>재상담 신청 사유 확인
                                </p>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div class="modal-body">
                                <p>재상담 신청 사유를 확인 하세요</p>
                                <table class="table-detail mt-5">
                                    <colgroup>
                                        <col class="w-43">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    	<c:forEach items="${mbrConsltVO.consltResultList}" var="resultList" varStatus="status">
											<c:if test="${!empty resultList.reconsltResn}">
												<tr>
													<th scope="row">
														${status.index+1}차 상담 사업소
														<p class="mt-2 font-bold">(${resultList.bplcNm})</p>
													</th>
													<td>${resultList.reconsltResn}</td>
												</tr>
											</c:if>
                                        
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //재상담 신청 사유 확인  -->

                <!-- 멤버스 상담 내역 확인 -->
                <div class="modal fade" id="modal4" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <p>사업소 상담 내역 확인</p>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div class="modal-body">
                            	<div class="coun_accodian_area">

									<c:forEach items="${consltResultListCalced}" var="itemContainer" varStatus="itemContainerStatus">
										<div class="coun_title">${itemContainer[0].consltBplcPosition}차 상담 사업소 : ${itemContainer[0].bplcNm}</div>
										<div class="coun_table">
											<c:forEach items="${itemContainer}" var="itemone" varStatus="itemoneStatus">
												<dl class="<c:if test='${itemContainerStatus.index == 0 && itemoneStatus.index == 0}'>active</c:if>">
													<dt>${DateUtil.formatDate(itemone.regDt, "yyyy-MM-dd HH:mm")}</dt>
													<dd>
														<span class="txt" style="word-break: break-all">${itemone.memo != null && !itemone.memo.isEmpty() ? itemone.memo : "-"}</span>
														<c:if test='${MbrConsltResultMemoUtil.isMemoLong(itemone)}'><div class="arrow"></div></c:if>
													</dd>
												</dl>
											</c:forEach>
										</div>
										
									</c:forEach>
            
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn large btn-primary w-36" data-bs-dismiss="modal" aria-label="close">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //멤버스 상담 내역 확인 -->
                
                <!-- 상담 거부 사유 확인 -->
                <div class="modal fade" id="modal5" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <p>상담 거부 사유 확인</p>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div class="modal-body">
                                <p>상담 거부 사유를 확인하세요</p>
                                <table class="table-detail mt-5">
                                    <colgroup>
                                        <col class="w-43">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    	<c:forEach items="${bplcRejectChgList}" var="resultList" varStatus="status">
	                                        <tr>
	                                            <th scope="row">
	                                                ${status.index+1}차 거부 사업소
	                                                <p class="mt-2 font-bold">(${resultList. bplcNm})</p>
	                                            </th>
	                                            <td>
	                                            	${resultList.resn}
	                                            </td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //상담 거부 사유 확인  -->
				
                <!-- 상담 취소 사유 확인 -->
                <div class="modal fade" id="modal6" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <p>상담 취소 사유 확인</p>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                            </div>
                            <div class="modal-body">
                                <p>상담 취소 사유를 확인하세요</p>
                                <table class="table-detail mt-5">
                                    <colgroup>
                                        <col class="w-43">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    	<tr>
											<th scope="row">
												<p class="mt-2 font-bold">
													취소사유
													<c:if test="${mbrConsltVO.consltSttus eq 'CS03'}">
														<br>(상담자)
													</c:if>
													<c:if test="${mbrConsltVO.consltSttus eq 'CS09'}">
														<br>(THKC)	
													</c:if>
													
												</p>
											</th>
											<td>
												${mbrConsltVO.getCanclResn()}
											</td>
										</tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //상담 취소 사유 확인  -->
                
                <!-- 등급테스트결과 모달 -->
				<c:choose>
					<c:when test="${mbrConsltVO.prevPath == 'equip_ctgry'}"><%@include file="./modal/welfareEquipModal.jsp"%></c:when>
					<c:when test="${mbrConsltVO.prevPath == 'test'}"><%@include file="./modal/testResultModal.jsp"%></c:when>
					<c:when test="${mbrConsltVO.prevPath == 'simple_test'}"><%@include file="./modal/simpleTestResultModal.jsp"%></c:when>
					<c:when test="${mbrConsltVO.prevPath == 'care'}"><%@include file="./modal/careResultModal.jsp"%></c:when>
					<c:when test="${mbrConsltVO.prevPath == 'weltool_info'}"><%@include file="./modal/weltoolInfoModal.jsp"%></c:when>
				</c:choose>
               	
               	<!-- 상담 정보 수정 모달 -->
               	<%@include file="./modal/updateConsltModal.jsp"%>

            </div>
            <!-- //page content -->

			<div id="CONSLT_STTUS" class="disNone" style="display:none">
				${CONSLT_STTUS}
			</div>
			<div id="prevPathJson" class="disNone" style="display:none">
				${prevPathJson}
			</div>
<script>
	// constructor(container, cssSelector, popName, popStep, popUrl, dataUrl, popOptions) {
	var jsHouseMngBplcModal = null
	



function submitEvent() {
	var currentSttus = document.getElementsByClassName('currentSttus')[0].innerText;
	
	if (currentSttus === '상담 기관 배정 완료') {
		return confirm('사업소를 변경할 경우 기존사업소 상담 정보는 삭제됩니다. 진행하시겠습니까?');	
	} 
	
	return true;
}

function fn_popup_selected(alert_val, popName, popup_param, data, extra){
	console.log(alert_val, popName, popup_param, data)
	if (alert_val !== 'confirm'){
		return;
	}	

	if (popName == "JsHouseMngBplcModal" && data != null){
		f_modalBplcSearch_callback(data.uniqueId, data.bplcId, data.bplcNm, data.picTelno, data.rcmdCnt);
	}
}

function f_modalBplcSearch_callback(bplcUniqueId, bplcId, bplcNm, telno, rcmdCnt){

	if($("#bplcUniqueId").val() != ""){ //선택된게 있으면 지움
		$(".bplcLi li:first").remove();
	}

	$("#bplcUniqueId").val(bplcUniqueId);
	$("#bplcId").val(bplcId);
	$("#bplcNm").val(bplcNm);
	

	<c:if test="${fn:length(mbrConsltVO.consltResultList) > 0}"><%--등록된 데이터o--%>
		<c:if test="${mbrConsltVO.consltSttus eq 'CS02' || mbrConsltVO.consltSttus eq 'CS08'}"> <%--CS02 or CS08 배정진행중 --%>
			$("#consltSttus").val("${mbrConsltVO.consltSttus}");
			$(".bplcLi li:first").remove();
		</c:if>
		<c:if test="${mbrConsltVO.consltSttus eq 'CS07'}"><%--CS07 재접수--%>
			$("#consltSttus").val("CS08");
		</c:if>
		<c:if test="${mbrConsltVO.consltSttus eq 'CS04'}"><%-- 사업소에서 거부해서 재배정하는경우--%>
			$("#consltSttus").val("CS08");
		</c:if>
	</c:if>
	<c:if test="${empty mbrConsltVO.consltResultList}"><%--등록된 데이터x--%>
		$("#consltSttus").val("CS02"); //최초면 CS02 추가면 CS08
	</c:if>
	<c:if test="${!empty mbrConsltVO.consltResultList && mbrConsltVO.consltSttus eq 'CS01'}"><%-- 상담거부 후 배정인 경우 --%>
		$("#consltSttus").val("CS02");
	</c:if>


	let liCnt = $(".bplcLi li").length;
	$(".bplcLi").prepend("<li>(배정중) 상담 사업소 : "+ bplcNm +" ("+ telno +" / <img src='/html/page/members/assets/images/ico-mypage-recommend.svg' style='display: inline; margin-top: -2px; margin-right: 3px; height: 13px;'>"+ rcmdCnt +")</li>");
}

//수급자 요양정보 조회
function getRecipientInfo(recipientsNo) {
	// 요양정보 조회 API 호출
	jsCallApi.call_api_post_json(window, "/_mng/mbr/recipients/getInfo.json", "getRecipientInfoCallback", {recipientsNo});
}
//수급자 요양정보 조회 콜백
function getRecipientInfoCallback(result, errorResult, data, param) {
	if (errorResult == null) {
		var data = result;
		if(data.success) {
			var recipientInfo = data.recipientInfo;
			
			//수급자 요양정보
			$('#mss-rcperRcognNo').text(recipientInfo.rcperRcognNo);
			if (recipientInfo.ltcRcgtGradeCd) {
				$('#mss-ltcRcgtGradeCd').text(recipientInfo.ltcRcgtGradeCd + '등급');	
			} else {
				$('#mss-ltcRcgtGradeCd').text('');	
			}
			$('#mss-rcgtEdaDt').text(recipientInfo.rcgtEdaDt);
			$('#mss-penPayRate').text(recipientInfo.penPayRate);
			$('#mss-bgngApdt').text(recipientInfo.bgngApdt);
			$('#mss-remindAmt').text(comma(Number(recipientInfo.remindAmt)) + '원');
			$('#mss-useAmt').text(comma(Number(recipientInfo.useAmt)) + '원');
			$('#mss-searchDt').text(recipientInfo.searchDt);
			
			$('#modal-simple-search').modal('show');
		}else{
			alert(data.msg);
		}
	} else {
		alert('서버와 연결이 좋지 않습니다.');
	}
}


//상담유형상세 상세보기 버튼 클릭 이벤트
function viewConsltDetailModal(consltType) {
	switch (consltType) {
		case 'equip_ctgry': $('#popup-welfare-detail').modal('show'); break;
		case 'test': $('#grade-test-result').modal('show'); break;
		case 'simple_test': $('#simple-test-result').modal('show'); break;
		case 'care': $('#simple-care-result').modal('show'); break;
		case 'weltool_info': $('#weltool-info').modal('show'); break;
		default: console.log("정의되지 않은 상담 유형은 모달을 띄울 수 없습니다");
	}
}

function handleMatchingBplcDeleteClick() {
	if (confirm('매칭된 사업소를 삭제하시겠습니까?')) {
		$.ajax({
			type : "post",
			url  : "/_mng/mbr/recipients/deleteMatchingBplc.json",
			data : {recipientsNo: "${mbrConsltVO.recipientsNo}"},
			dataType : 'json'
		})
		.done(function(data) {
			if(data.result){
				alert("매칭된 사업소가 삭제되었습니다.");
				location.reload();
			}else{
				alert("매칭된 사업소 삭제중 에러가 발생하였습니다.");
			}
		})
		.fail(function(data, status, err) {
			console.log("ERROR : " + err);
		});
	}
}

function toggleMemoLineBreak() {
	$("#modal4 .coun_accodian_area .coun_table dl").each(function (index, element) {
		const closestSpan = $(element).find("span")[0];
		// active 효과를 받으려면 <br> 태그를 \n로 바꿔야 함
		closestSpan.innerHTML = $(element).hasClass("active")
			? closestSpan.innerHTML.replace(/\n/g, "<br>")
			: closestSpan.innerHTML.replace(/<br>/g, "\n");
	})
}

$(function(){
	toggleMemoLineBreak();
	fetchAndRenderMatchingBplcHist('${mbrConsltVO.regUniqueId}', '${mbrConsltVO.recipientsNo}');

	if (jsHouseMngBplcModal == undefined){
		jsHouseMngBplcModal = new JsHouseMngBplcModal(window, "#bplcModal.modal", "JsHouseMngBplcModal", 1, "", "/_mng/members/bplc/bplcSearchList2409.json", {"consultAbleTypeAllNum":"${ConsltAbleType.CONSULT_ALL.getNum()}"});

		if ($("#CONSLT_STTUS").length > 0){
			jsHouseMngBplcModal.fn_set_consult_sttus($("#CONSLT_STTUS")[0].innerText)
		}
		if ($("#prevPathJson").length > 0){
			jsHouseMngBplcModal.fn_set_prevPathJson($("#prevPathJson")[0].innerText)
		}
		
		
	}
	

	$("#modal4 .coun_accodian_area .coun_table dl dd .arrow").on("click", function(){
		var jobjDl = $(this).closest("dl");

		if (jobjDl.hasClass("active")){
			jobjDl.removeClass("active");
		}else{
			$("#modal4 .coun_accodian_area .coun_table dl").removeClass("active");
			jobjDl.addClass("active");
		}
		toggleMemoLineBreak();
	});

	$(".f_srchBplc").on("click", function(){
		jsHouseMngBplcModal.fn_show_popup({
											"lat": "${mbrConsltVO.getZipLat()}"
											, "lot":"${mbrConsltVO.getZipLot()}"
											, "zipHCode":"${mbrConsltVO.getZipHCode()}"
											, "sidoNm":"${mbrConsltVO.getZip()}"
											, "sigugunNm":"${mbrConsltVO.getAddr()}"
											, "recipientsNo":"${mbrRecipientsVO.getRecipientsNo()}"
											, "recipientsLongtermConfirmYn":"${mbrRecipientsVO.getLongtermConfirmYn()}"
											, "mbrUniqueId":"${mbrRecipientsVO.getMbrUniqueId()}"
											, "matchingAbleTypeNum":"${matchingAbleTypeNum}"
											, "consltNo":$("#consltNo").val()
											
										});
	});

	$(".f_saveCanclResn").on("click", function(e){
		e.preventDefault();
		let params = {
				consltNo:$("#consltNo").val()
				, canclResn:$("#canclResn").val()
				, consltmbrNm:"${mbrConsltVO.mbrNm}"
				, consltMbrTelno:"${mbrConsltVO.mbrTelno}"
				};
		
		if($("#canclResn").val() === ""){
			alert("취소 사유를 입력해 주세요");
			$("#canclResn").focus();
		}else{
			$.ajax({
				type : "post",
				url  : "/_mng/consult/recipter/canclConslt.json",
				data : params,
				dataType : 'json'
			})
			.done(function(data) {
				if(data.result){
					alert("정상적으로 저장되었습니다.");
				}else{
					alert("상담 취소 처리중 에러가 발생하였습니다.");
				}
				location.reload();
			})
			.fail(function(data, status, err) {
				console.log("ERROR : " + err);
			});
		}
	});
	
	$('.f_saveMngMemo').on('click', function(e) {
		e.preventDefault();
		
		let params = {
			consltNo:$("#consltNo").val()
			, mngMemo:$("#mngMemo").val()
		};
		
		if (confirm('상담기록을 저장하시겠습니까?')) {
			$.ajax({
				type : "post",
				url  : "/_mng/consult/recipter/saveMemo.json",
				data : params,
				dataType : 'json'
			})
			.done(function(data) {
				if(data.result){
					alert("정상적으로 저장되었습니다.");
				}else{
					alert("상담 메모 저장중 에러가 발생하였습니다.");
				}
				location.reload();
			})
			.fail(function(data, status, err) {
				console.log("ERROR : " + err);
			});
		}
	});
	
	$('.f_changeConsltSttus').on('click', function(e) {
		e.preventDefault();
		
		var currentSttus = document.getElementsByClassName('currentSttus')[0].innerText;
		var selectedChgSttus = $('#chgSttusSelect option:selected').val();
		var selectedChgSttusText = $('#chgSttusSelect option:selected').text().trim();
		if (selectedChgSttusText === '선택') {
			alert('변경 상태를 선택하세요.');
			return;
		} else if (currentSttus === selectedChgSttusText) {
			alert('현재상태로 변경할 수 없습니다.');
			return;
		} 
		
		if (selectedChgSttusText === '상담 신청 접수') {
			alert('상담 신청 접수 상태로 변경할 수 없습니다. 사업소 변경을 원하시는 경우 상담 기관 배정 완료상태에서 진행하세요.');
			return;
		} else if (selectedChgSttusText === '재상담 신청 접수') {
			alert('재상담 신청 접수 상태로 변경할 수 없습니다. 사업소 변경을 원하시는 경우 완료처리 후 재상담을 진행하세요.');
			return;
		} else if (selectedChgSttusText === '상담 취소 (상담기관)') {
			if ((currentSttus === '상담 기관 배정 완료' || currentSttus === '상담 기관 재배정 완료' || currentSttus === '상담 진행 중') === false) {
				alert('상담이 종료되었거나 배정되지 않은 경우 상담 취소 (상담기관)를 할 수 없습니다.');
				return;
			}
		} else if (selectedChgSttusText === '상담자 부재') {
			if ((currentSttus !== '상담 진행 중')) {
				alert('상담자 부재 상태로 변경할 수 없습니다. 상담자 부재 상태로 변경을 원하시는 경우 상담 진행 중 상태에서 진행하세요.');
				return;
			}
		} 
		
		if (currentSttus === '상담자 부재') {
			if (selectedChgSttusText == "상담 신청 접수" || selectedChgSttusText == "재상담 신청 접수" || selectedChgSttusText == "상담 기관 배정 완료" || selectedChgSttusText == "상담 기관 재배정 완료" ) {
				alert('상담자 부재 상태 상태의 경우 상담 진행 중, 상담 완료, 상담 취소로만 변경이 가능합니다.');
				return;
			}
		}
		
		
		if (confirm('상담진행상태를 변경하시겠습니까?')) {
			let params = {
				consltNo:$("#consltNo").val(),
				changedSttus:selectedChgSttus,
			};
			
			$.ajax({
				type : "post",
				url  : "/_mng/consult/recipter/changeConsltSttus.json",
				data : params,
				dataType : 'json'
			})
			.done(function(data) {
				if(data.result){
					alert("정상적으로 변경되었습니다.");
				}else{
					alert("상담진행상태 변경중 에러가 발생하였습니다.");
				}
				location.reload();
			})
			.fail(function(data, status, err) {
				console.log("ERROR : " + err);
			});
		}
	});

});


//수급자 상담관리 삭제
function fn_deleteConsult_call(consltNo) {
	if (!confirm("상담을 삭제하시겠습니까?")){
		return;
	}
	jsCallApi.call_api_post_json(window, "/_mng/consult/recipter/delConslt.json", "fn_deleteConsult_cb", {arrDelConslt : [consltNo]});
}

function fn_deleteConsult_cb(result, fail, data, param) {
	alert("삭제 되었습니다.")

	$('.btn.list').get(0).click();
}
</script>