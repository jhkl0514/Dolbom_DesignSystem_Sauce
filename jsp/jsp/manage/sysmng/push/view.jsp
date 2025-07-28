<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
	<form method="post">

		<p class="text-title2">상세정보</p>
		<table class="table-detail">
			<colgroup>
				<col class="w-43">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="form-item1">발송대상</label></th>
					<td>${sendTarget[schedulePushVO.sendTarget]}</td>
				</tr>
				<tr>
					<th scope="row">발송방법</th>
					<td>${sendType[schedulePushVO.sendType]}</td>
				</tr>
				<tr>
                    <th scope="row"><label for="title">제목</label></th>
                    <td>${schedulePushVO.title}</td>
                </tr>
				<tr>
					<th scope="row"><label for="body">내용</label></th>
					<td>${schedulePushVO.body}</td>
				</tr>
				<tr>
                    <th scope="row"><label for="url">앱링크</label></th>
                    <td>${schedulePushVO.url}</td>
                </tr>
                <tr>
                    <th scope="row"><label>최근등록수정일시</label></th>
                    <td>
                    	<c:choose>
                        	<c:when test="${!empty schedulePushVO.mdfcnDt}">
                        		<fmt:formatDate value="${schedulePushVO.mdfcnDt}" pattern="yyyy-MM-dd HH:mm:ss"/>(${schedulePushVO.mdfcnId})
                        	</c:when>
                        	<c:otherwise>
                        		<fmt:formatDate value="${schedulePushVO.regDt}" pattern="yyyy-MM-dd HH:mm:ss"/>(${schedulePushVO.regId})
                        	</c:otherwise>
                       	</c:choose>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label>발송여부</label></th>
                    <td>${sendStatus[schedulePushVO.sendStatus]} (${schedulePushVO.successCtn}/${schedulePushVO.totalCtn})</td>
                </tr>
			</tbody>
		</table>

		<c:set var="pageParam" value="curPage=${param.curPage}&amp;cntPerPage=${param.cntPerPage}&amp;sortBy=${param.sortBy}&amp;srchRegYmdBgng=${param.srchRegYmdBgng}&amp;srchRegYmdEnd=${param.srchRegYmdEnd}&&amp;srchRgtrId=${param.srchRgtrId}&amp;srchRgtr=${param.srchRgtr}&amp;srchQestnCn=${param.srchQestnCn}&amp;srchUseYn=${param.srchUseYn}&amp;srchUseYn=${param.srchUseYn}" />
		<div class="btn-group right mt-8">
			<button type="button" class="btn-danger large shadow" onclick="removeSchedule();">완전삭제</button>
			<a href="./list?${pageParam}" class="btn-secondary large shadow">목록</a>
		</div>
	</form>
</div>



<script src="/html/core/script/matchingAjaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
<script>
	//스케줄 삭제
	function removeSchedule() {
		var scheduleNoArrStr = '${schedulePushVO.scheduleNo}'; 
		
		if (confirm('에약일시가 1시간 이상 남은 경우만 삭제가 가능합니다. 정말 삭제하시겠습니까?')) {
			callPostAjaxIfFailOnlyMsg(
				'/_mng/sysmng/push/removeSchedule.json',
				{scheduleNoArrStr},
				function(result) {
					alert('삭제가 완료되었습니다');
					location.href = '/_mng/sysmng/push/list';
				}
			);
		}          	
	}

	$(function(){
		
	})
</script>
