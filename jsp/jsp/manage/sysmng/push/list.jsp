<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


				<form id="searchFrm" name="searchFrm" method="get" action="./list">
				<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
				<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />

                    <fieldset>
                        <legend class="text-title2">매칭앱 푸시알림</legend>
                        <table class="table-detail">
                            <colgroup>
                                <col class="w-43">
                                <col>
                            </colgroup>
                            <tbody>
                            	<tr>
			                        <th scope="row"><label for="search-item1">최근등록수정일</label></th>
			                        <td colspan="3">
			                            <div class="form-group">
                                            <input type="date" class="form-control w-39 calendar" id="srchRegDtBgng" name="srchRegDtBgng" value="${param.srchRegDtBgng}">
			                                <i>~</i>
                                            <input type="date" class="form-control w-39 calendar" id="srchRegDtEnd" name="srchRegDtEnd" value="${param.srchRegDtEnd}">
		                                	<button type="button" class="btn shadow" onclick="f_srchJoinSet('0'); return false;">초기화</button>
											<button type="button" class="btn shadow" onclick="f_srchJoinSet('1'); return false;">오늘</button>
											<button type="button" class="btn shadow" onclick="f_srchJoinSet('2'); return false;">7일</button>
											<button type="button" class="btn shadow" onclick="f_srchJoinSet('3'); return false;">15일</button>
											<button type="button" class="btn shadow" onclick="f_srchJoinSet('4'); return false;">1개월</button>
			                            </div>
			                        </td>
			                    </tr>
			                    <tr>
                                <tr>
                                    <th scope="row"><label for="search-item1">키워드검색</label></th>
                                    <td>
                                        <div class="form-group w-84">
                                            <select name="srchTarget" id="srchTarget" class="form-control w-25">
                                                <option value="">전체</option>
                                                <option value="srchTitle" ${param.srchTarget eq 'srchTitle'?'selected="selected"':''}>제목</option>
                                                <option value="srchGrpId" ${param.srchTarget eq 'srchGrpId'?'selected="selected"':''}>푸시ID</option>
                                            </select>
                                            <input type="text" class="form-control flex-1" name="srchText" id="srchText" value="${param.srchText}">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><label for="search-item2">발송상태</label></th>
                                    <td>
                                        <select name="srchSendStatus" id="srchSendStatus" class="form-control w-84">
                                            <option value="">전체</option>
                                            <c:forEach var="item" items="${sendStatusMap}">
											<option value="${item.key}" ${item.key eq param.srchSendStatus ? ' selected=\"selected\"' : '' }>${item.value}</option>
											</c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </fieldset>

                    <div class="btn-group mt-5">
                        <button type="submit" class="btn-primary large shadow w-52">검색</button>
                    </div>
                </form>

				<p class="text-left">
					<button type="button" class="btn" onclick="removeSchedule();">선택삭제</button>
				</p>

                <p class="text-title2">관리자 목록</p>
                <table class="table-list">
                    <colgroup>
                    	<col class="w-15">
                        <col class="w-40">
                        <col class="w-25">
                        <col class="w-25">
                        <col class="w-44">
                        <col class="w-44">
                        <col class="w-25">
                        <col class="w-44">
                        <col class="w-25">
                    </colgroup>
                    <thead>
                        <tr>
                        	<th scope="col">선택</th>
                            <th scope="col">ID</th>
                            <th scope="col">발송대상</th>
                            <th scope="col">발송방법</th>
                            <th scope="col">발송일시</th>
                            <th scope="col">제목</th>
                            <th scope="col">발송상태</th>
                            <th scope="col">최근등록수정일시</th>
                            <th scope="col">관리자ID</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${listVO.listObject}" var="scheduleInfo" varStatus="status">
                    	<c:set var="pageParam" value="curPage=${listVO.curPage}${!empty(listVO.urlParam)? '&amp;' : ''}${listVO.urlParam}" />
                        <tr>
                        	<td>
			                    <div class="form-check">
			                        <input class="form-check-input"  type="checkbox" name="arrScheduleNo" value="${scheduleInfo.scheduleNo}">
			                    </div>
			                </td>
                            <td>
                            	<a href="./view?scheduleNo=${scheduleInfo.scheduleNo}" class="btn shadow w-full" style="padding-right: 0.5rem; padding-left: 0.5rem;">${scheduleInfo.grpId}</a>
                            </td>
                            <td>${sendTargetMap[scheduleInfo.sendTarget]}</td>
                            <td>${sendTypeMap[scheduleInfo.sendType]}</td>
                            <td><fmt:formatDate value="${scheduleInfo.sendDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${scheduleInfo.title}</td>
                            <td>${sendStatusMap[scheduleInfo.sendStatus]}</td>
                            <td>
                           	<c:choose>
                           		<c:when test="${!empty scheduleInfo.mdfcnDt}">
                           			<fmt:formatDate value="${scheduleInfo.mdfcnDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
                           		</c:when>
                           		<c:otherwise>
                           			<fmt:formatDate value="${scheduleInfo.regDt}" pattern="yyyy-MM-dd HH:mm:ss"/>
                           		</c:otherwise>
                           	</c:choose>
                            </td>
                            <td>${scheduleInfo.regId}</td>
                        </tr>
                        </c:forEach>
                        <c:if test="${empty listVO.listObject}">
                        <tr>
                            <td class="noresult" colspan="9">검색조건을 만족하는 결과가 없습니다.</td>
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
                    <a href="./form" class="btn-primary large shadow">등록</a>
                </div>


				<script src="/html/core/script/matchingAjaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
                <script>
	                function f_srchJoinSet(ty){
	        			$("#srchRegDtEnd").val(f_getToday());
	        			if(ty == "1"){//오늘
	        		   		$("#srchRegDtBgng").val(f_getToday());
	        			}else if(ty == "2"){//일주일
	        				$("#srchRegDtBgng").val(f_getDate(-7));
	        			}else if(ty == "3"){//15일
	        				$("#srchRegDtBgng").val(f_getDate(-15));
	        			}else if(ty == "4"){//한달
	        				$("#srchRegDtBgng").val(f_getDate(-30));
	        			}else if(ty == "0"){//초기화
	        				$("#srchRegDtBgng").val(null);
	        				$("#srchRegDtEnd").val(null);
	        			}
	        		}
	                
	                //스케줄 삭제
	                function removeSchedule() {
	                	var checkedSchedules = $('input[name=arrScheduleNo]:checked');
	                	
	                	var scheduleNoList = [];
	                	for (var i = 0; i < checkedSchedules.length; i++) {
	                		scheduleNoList.push($('input[name=arrScheduleNo]:checked')[i].value);
	                	}
	                	
	                	var scheduleNoArrStr = scheduleNoList.join(',');
	                	if (!scheduleNoArrStr) {
	                		alert('삭제할 푸시알림을 선택하세요');
	                		return;
	                	}
	                	
						if (confirm('에약일시가 1시간 이상 남은 경우만 삭제가 가능합니다. 정말 삭제하시겠습니까?')) {
							callPostAjaxIfFailOnlyMsg(
	            				'/_mng/sysmng/push/removeSchedule.json',
	            				{scheduleNoArrStr},
	            				function(result) {
	            					alert('삭제가 완료되었습니다');
	            					location.reload();
	            				}
	            			);
						}          	
	                }
	                
	                $(function(){
	                	// 출력 갯수
		                $("#countPerPage").on("change", function(){
							var cntperpage = $("#countPerPage option:selected").val();
							$("#cntPerPage").val(cntperpage);
							$("#searchFrm").submit();
						});
	                });
                </script>