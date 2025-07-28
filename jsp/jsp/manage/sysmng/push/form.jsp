<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
	<form method="post">

		<p class="text-title2">[매칭앱 푸시알림관리] 등록 (&nbsp;<sup class="badge-require"></sup>&nbsp;&nbsp;는 필수입력사항입니다.)</p>
		<table class="table-detail">
			<colgroup>
				<col class="w-43">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><label for="form-item1">발송대상 <sup class="badge-require"></sup></label></th>
					<td>
						<div class="form-check-group">
							<c:forEach var="sendTargetMap" items="${sendTarget}" varStatus="status">
								<div class="form-check">
									<input type="radio" value="${sendTargetMap.key}" id="sendTarget${status.index}" name="sendTarget" class="form-check-input">
									<label class="form-check-label" for="sendTarget${status.index}">${sendTargetMap.value}</label>
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr id="selectTesterTr">
					<th scope="row">테스터 선택 <sup class="badge-require"></sup></th>
					<td>
						<input id="srchName" name="srchName" class="form-control w-40" type="text" value="" autocomplete="off" placeHolder="회원이름 입력">
						<button type="button" class="btn-primary shadow" onclick="seachTester();">검색</button>
						<select name="selectTester" id="selectTester" class="form-control w-60">
                         	<option value="">선택</option>
                        </select>
					</td>
				</tr>
				<tr>
					<th scope="row">발송방법 <sup class="badge-require"></sup></th>
					<td>
						<div class="form-check-group">
							<c:forEach var="sendTypeMap" items="${sendType}" varStatus="status">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="sendType" id="sendType${status.index}" value="${sendTypeMap.key}" checked>
									<label class="form-check-label" for="sendType${status.index}">${sendTypeMap.value}</label>
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
				<tr>
                    <th scope="row"><label for="title" class="require">제목</label></th>
                    <td>
                    	<input id="title" name="title" class="form-control w-90" type="text" value="" maxlength="50" autocomplete="off">
                    </td>
                </tr>
				<tr>
					<th scope="row"><label for="body">내용 <sup class="badge-require"></sup></label></th>
					<td>
						<textarea id="body" name="body" class="form-control w-full" rows="4" cols="30"></textarea>
					</td>
				</tr>
				<tr>
                    <th scope="row"><label for="url">앱링크</label></th>
                    <td>
                    	<input id="url" name="url" class="form-control w-90" type="text" value="" maxlength="50" autocomplete="off">
                    </td>
                </tr>
			</tbody>
		</table>
		<p>
			※ [발송대상] 광고성 선택 시 마케팅 동의한 회원에게만 전송됩니다.</br>
			※ [발송방법] 국내 정보통신망법에 의거하여 야간 시간(오후 8시 50분 ~ 오전 7시 59분)에는 푸시 즉시 발송을 비롯한 예약 발송 설정이 불가합니다.</br>
			※ [내용] 줄바꿈을 사용하면 메시지에 그대로 표시됩니다. 최대 1500바이트까지 작성하실 수 있으며, 알림 상태바에서는 200바이트까지만 표시됩니다.</br>
			※ [내용] 광고성 푸시알림 전송 시 “(광고)”와 “수신거부: 전체메뉴>설정>알림설정” 내용을 필히 작성바랍니다.</br>
		</p>
		

		<c:set var="pageParam" value="curPage=${param.curPage}&amp;cntPerPage=${param.cntPerPage}&amp;sortBy=${param.sortBy}&amp;srchRegYmdBgng=${param.srchRegYmdBgng}&amp;srchRegYmdEnd=${param.srchRegYmdEnd}&&amp;srchRgtrId=${param.srchRgtrId}&amp;srchRgtr=${param.srchRgtr}&amp;srchQestnCn=${param.srchQestnCn}&amp;srchUseYn=${param.srchUseYn}&amp;srchUseYn=${param.srchUseYn}" />
		<div class="btn-group right mt-8">
			<button type="button" class="btn-primary large shadow" onclick="saveSchedulePush();">저장</button>
			<a href="./list?${pageParam}" class="btn-secondary large shadow">목록</a>
		</div>
	</form>
</div>



<script src="/html/core/script/matchingAjaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
<script>
	//테스터 조회 로직
	function seachTester() {
		var srchMbrNm = $('#srchName').val();
		
		if (srchMbrNm == undefined || srchMbrNm.length < 2){
			alert("테스터 이름을 2자 이상 입력해 주세요")
			return;
		}
		callPostAjaxIfFailOnlyMsg(
			'/_mng/sysmng/push/searchTester.json',
			{ srchMbrNm },
			function(result) {
				//테스터 선택박스 그리기
				var selectTesterTemplate = '';
				for (var i = 0; i<result.pushMbrList.length; i++) {
					var pushMbr = result.pushMbrList[i];
					selectTesterTemplate  += '<option value="' + pushMbr.uniqueId + '">' + pushMbr.mbrNm + '(' + pushMbr.uniqueId + ')</option>'
				}
				$('#selectTester').html(selectTesterTemplate);
			}
		);
	}
	
	//저장 버튼 클릭
	function saveSchedulePush() {
		var targetCode = $('input[name=sendTarget]:checked').val();
		if (!targetCode) {
			alert('발송대상을 입력하세요');
			return;
		}
		//테스트인 경우 발송대상이 있는지 확인
		var testerUniqueId = '';
		if (targetCode === '001') {
			testerUniqueId = $('#selectTester option:selected')[0].value;
			
			if (!testerUniqueId) {
				alert('테스터를 선택하세요');
				return;
			}
		}
	
		var typeCode = $('input[name=sendType]:checked').val();
		var title = $('#title').val();
		var body = $('#body').val();
		var url = $('#url').val();
		
		if (!typeCode) {
			alert('발송방법을 입력하세요');
			return;
		}
		//즉시 발송인경우 현재 시간으로 야간시간 발송검사(20:50 ~ 07:59에는 발송 불가)
		if (typeCode === 'ST01') {
			var now = new Date();
			var checkTime = Number(now.getHours().toString() + now.getMinutes().toString().padStart(2, "0"));
			if (checkTime <= 759 || checkTime >= 2050) {
				alert('야간시간에는 발송이 불가합니다');
				return;
			}
		}
		
		if (!title) {
			alert('제목을 입력하세요');
			return;
		}
		if (!body) {
			alert('내용을 입력하세요');
			return;
		}
		
		var requestJson = {
			sendTarget: targetCode,
			sendType: typeCode,
			title: title,
			body: body,
		};
		if (url) {
			requestJson.url = url;
		}
		if (testerUniqueId) {
			requestJson.testerUniqueId = testerUniqueId;
		}
		
		//알림 스케줄 등록
		if (confirm('신중하게 등록바랍니다. 정말 저장하시겠습니까?')) {
			callPostAjaxIfFailOnlyMsg(
				'/_mng/sysmng/push/registSchedule.json',
				requestJson,
				function(result) {
				}
			);
			
			location.href = '/_mng/sysmng/push/list';
		}
	}
	
	
	$(function(){
		var testTarget =  $('input[name=sendTarget]')[0];
		testTarget.checked = true;
		
		//최초 로딩 시 테스터 리스트 조회
		//seachTester();
		
		//발송대상 변경 이벤트
		$("input[name='sendTarget']").change(function(){
			var targetCode = $('input[name=sendTarget]:checked').val();
			
			if (targetCode === '001') {
				$('#selectTesterTr').css('display', 'table-row');
			} else {
				$('#selectTesterTr').css('display', 'none');
			}
		});
	})
</script>
