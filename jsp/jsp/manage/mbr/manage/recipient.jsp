<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
	<%@include file="./include/header.jsp"%>

	<link rel="stylesheet" href="/html/core/script/free-jqgrid/css/ui.jqgrid.min.css">
	<link rel="stylesheet" href="/html/core/style/jqgrid.css">

	<script type="text/javascript" src="/html/core/script/free-jqgrid/jquery.jqgrid.src.js"></script>


	<script src="/html/core/script/JsHouse2309PopupJqgrid.js"></script>

	<script src="/html/page/admin/assets/script/_mng/shop/JsHouseMngListSearch.js"></script>
	<script src="/html/page/admin/assets/script/_mng/mbr/JsHouseMngRecentConsultList.js"></script>

	<div class="text-right mt-6">
		<button type="button" class="btn shadow" id="sendPw">임시비밀번호 발송</button>
	</div>

	<form:form action="./action" class="mt-2" modelAttribute="mbrVO" method="post" id="mbrViewFrm" name="mbrViewFrm">
		<fieldset>
			<legend class="text-title2">등록 수급자</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">수급자선택</th>
						<td colspan="3">
							<c:forEach var="mbrRecipient" items="${mbrVO.mbrRecipientsList}" varStatus="status">
								<div class="form-check">
									<input type="radio" value="${mbrRecipient.recipientsNo}" id="radioRecipient${status.index}" name="radioRecipient" class="form-check-input" <c:if test="${status.index == 0}">checked</c:if> onchange="changeRecipient();">
									<label class="form-check-label" for="radioRecipient${status.index}">${mbrRelationCd[mbrRecipient.relationCd]}(${mbrRecipient.recipientsNm})</label>
								</div>
								&nbsp;
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>	
	
		<fieldset class="mt-13">
			<legend class="text-title2">수급자 기본정보</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">수급자성명</th>
						<td id="recipientsNm"></td>

						<th scope="row">등록수급자ID</th>
						<td id="recipientsNo"></td>
					</tr>
					<tr>
						<th scope="row">수급자와의 관계</th>
						<td id="relationText"></td>

						<th scope="row">장기요양인정번호 유무</th>
						<td id="recipientsYn"></td>
					</tr>
					<tr>
						<th scope="row">상담받을 연락처</th>
						<td id="tel"></td>

						<th scope="row">실거주지 주소</th>
						<td id="address"></td>
					</tr>
					<tr>
						<th scope="row">생년월일</th>
						<td id="brdt"></td>

						<th scope="row">최초등록일시</th>
						<td id="regDt"></td>
					</tr>
					<tr>
						<th scope="row">성별</th>
						<td id="gender"></td>

						<th scope="row">최초수정일시</th>
						<td id="mdfcnDt"></td>
					</tr>
					<tr>
						<th scope="row">대표설정여부</th>
						<td id="mainYn"></td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<fieldset class="mt-13">
			<legend class="text-title2">수급자 매칭정보</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">매칭 기관</th>
						<td id="matchingBplcNm">
							<button type="button" class="btn-primary shadow ml-4" data-bs-toggle="modal" data-bs-target="#modal-matching-bplc-hist">이력 확인</button>
							<button id="matchingBplcDeleteBtn" type="button" class="btn-primary shadow ml-4" onclick="handleMatchingBplcDeleteClick()">매칭 삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		
		<!--fieldset class="mt-13">
			<legend class="text-title2">수급자 상담정보</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">상담신청경로</th>
						<td id="prevPath"></td>

						<th scope="row">최근상담진행상태</th>
						<td id="recentConsltSttus"></td>
					</tr>
					<tr>
						<th scope="row">최근상담신청일시</th>
						<td colspan="3" id="recentConsltRegDt"></td>
					</tr>
				</tbody>
			</table>
		</fieldset-->
		<fieldset class="mt-13">
			<legend class="text-title2">수급자 상담내역</legend>
			<div class="table-jqgrid">
				<table id="grdMaster" width="98%"></table>
				<div id="grdPager"></div>
			</div>
		</fieldset>

		<fieldset class="mt-13">
			<legend class="text-title2">인정등급예상테스트 정보</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">테스트결과저장여부</th>
						<td id="testResultYn"></td>

						<th scope="row">최근테스트결과일시</th>
						<td id="testRegDt"></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
		
		<fieldset class="mt-13">
			<legend class="text-title2">관리 정보</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">해당 수급자 삭제</th>
						<td>
							<button type="button" class="btn shadow" id="deleteRecipient">해당 수급자 삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group mt-8">
			<a href="/_mng/mbr/list" class="btn-primary large shadow w-52">목록</a>
		</div>
	</form:form>

	<!-- 매칭 기관 이력 확인 -->
	<%@include file="../../consult/recipter/modal/matchingBplcHist.jsp"%>
</div>

<script>
	var jsHouseMngRecentConsultList = null;

	//수급자 정보 조회
	function getRecipientInfo(recipientsNo) {
		jsHouseMngRecentConsultList.fn_search_recipient(recipientsNo);
		
		$.ajax({
			type : "post",
			url  : "/_mng/mbr/recipients/getInfo.json",
			data : {
				recipientsNo
			},
			dataType : 'json'
		})
		.done(function(data) {
			if(data.success) {
				var recipientInfo = data.recipientInfo;
				
				//수급자 기본정보
				$('#recipientsNm').text(recipientInfo.recipientsNm + (recipientInfo.verificationYn == "Y" ?" (위임완료)":""));
				$('#recipientsNo').text(recipientInfo.recipientsNo);
				$('#relationText').text(recipientInfo.relationText);
				$('#recipientsYn').text(recipientInfo.rcperRcognNo != undefined && recipientInfo.verificationYn == 'Y' && recipientInfo.longtermConfirmYn == 'Y' ? "유": "무");
				$('#tel').text(recipientInfo.tel);
				$('#address').text(recipientInfo.address);
				$('#brdt').text((recipientInfo.verificationYn == "Y" ? recipientInfo.brdt: recipientInfo.over65YnNm) );
				$('#regDt').text(recipientInfo.regDt);
				$('#gender').text(recipientInfo.gender);
				$('#mdfcnDt').text(recipientInfo.mdfcnDt);
				$('#mainYn').text(recipientInfo.mainYn);

				//수급자 매칭정보
				$('#matchingBplcNm').contents().first()[0].textContent = recipientInfo.matchingBplcNm || '-';
				if (recipientInfo.matchingBplcNm) {
					$('#matchingBplcDeleteBtn').removeClass('hidden');
				} else {
					$('#matchingBplcDeleteBtn').addClass('hidden');
				}
				
				//수급자 상담정보
				$('#prevPath').text(recipientInfo.prevPath);
				$('#recentConsltSttus').text(recipientInfo.recentConsltSttus);
				$('#recentConsltRegDt').text(recipientInfo.recentConsltRegDt);
				
				//인정등급예상테스트 정보
				$('#testResultYn').text(recipientInfo.testResultYn);
				$('#testRegDt').text(recipientInfo.testRegDt);

				fetchAndRenderMatchingBplcHist('${mbrVO.uniqueId}', recipientInfo.recipientsNo);
			}else{
				alert(data.msg);
			}
		})
		.fail(function(data, status, err) {
			alert('서버와 연결이 좋지 않습니다');
		});
	}

	
	//수급자 선택 이벤트
	function changeRecipient() {
		var recipientNo = $('input[name=radioRecipient]:checked').val();
		getRecipientInfo(Number(recipientNo));
	}

	function handleMatchingBplcDeleteClick() {
		const recipientsNo = Number($('input[name=radioRecipient]:checked').val());
		if (confirm('매칭된 사업소를 삭제하시겠습니까?')) {
			$.ajax({
				type : "post",
				url  : "/_mng/mbr/recipients/deleteMatchingBplc.json",
				data : { recipientsNo },
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
	
	$(function() {
		var recipientsNo = '${recipientsNo}' == ''? '${mbrVO.mbrRecipientsList[0].recipientsNo}' : '${recipientsNo}';
		jsHouseMngRecentConsultList = new JsHouseMngRecentConsultList(this, "#page-content #mbrViewFrm");
		if (recipientsNo){
			jsHouseMngRecentConsultList.fn_post_data({"mbrUniqueId":"${mbrVO.uniqueId}", "recipientsNo":recipientsNo});
			jsHouseMngRecentConsultList.fn_init();
		}

		var srchRecipientsNo = '${recipientsNo}';
		var firstRecipientNo = '${mbrVO.mbrRecipientsList[0].recipientsNo}';
		
		//조회할 수급자가 있으면
		if (srchRecipientsNo) {
			//radio 버튼 체크처리
			var inputs = $('input[name=radioRecipient]');
			for(var i = 0; i < inputs.length; i++) {
				if (inputs[i].value === srchRecipientsNo) {
					$('input[name=radioRecipient]')[i].checked = true;
				}
			}
				
			getRecipientInfo(Number(srchRecipientsNo));
		}
		//로딩시 첫번째 수급자 바로조회
		else if (firstRecipientNo) {
			getRecipientInfo(Number(firstRecipientNo));
		}

		fetchAndRenderMatchingBplcHist('${mbrVO.uniqueId}', srchRecipientsNo);
		
		//수급자 삭제
		$('#deleteRecipient').click(function() {
			var recipientNo = $('input[name=radioRecipient]:checked').val();
			if (!recipientNo) {
				alert('수급자를 선택하세요');
				return;
			}
			
			if (confirm('수급자를 삭제한 후에는 복구가 불가합니다. 정말 삭제하시겠습니까?')) {
				$.ajax({
					type : "post",
					url  : "/_mng/mbr/recipients/remove.json",
					data : {
						recipientsNo: Number(recipientNo)
					},
					dataType : 'json'
				})
				.done(function(data) {
					if(data.success) {
						alert('수급자 삭제가 완료되었습니다');
						location.href = './recipient';
					}else{
						alert(data.msg);
					}
				})
				.fail(function(data, status, err) {
					alert('서버와 연결이 좋지 않습니다');
				});
			}
		});
	});
</script>


