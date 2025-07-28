<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="modal fade" id="modal-consulting-info" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <p>상담 정보 수정</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                </div>
                <div class="modal-body">
                    <div class="text-subtitle mb-2">
						<div class="flex items-center gap-1">
							<i class="ico-alert2 size-sm"></i>
							수급자의 정보와 상담받을 연락처를 입력해주세요
						</div>
                    </div>
                    <table class="table-detail">
                        <caption class="hidden">상담정보확인 위한 수급자와의 관계(필수), 수급자성명(필수), 요양인정번호, 상담받을연락처(필수), 실거주지 주소(필수), 생년월일(필수),성별(필수), 상담유형 입력폼입니다 </caption>
                        <colgroup>
                            <col class="w-43">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr class="wrapRelation">
                                <th scope="row">
                                    <p>
                                        <label for="recipter">수급자와의 관계<sup class="text-danger text-base md:text-lg">*</sup></label>
                                    </p>
                                </th>
                                <td>
                                    <select name="relationSelect" id="info-relationSelect" class="form-control w-full lg:w-8/12" value="${mbrConsltVO.relationCd}">
                                        <option value="">관계 선택</option>
										<c:forEach var="relation" items="${MBR_RELATION_CD}" varStatus="status">
											<option value="${relation.key}" <c:if test="${mbrConsltVO.relationCd == relation.key}">selected</c:if>>${relation.value}</option>	
										</c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr class="wrapNm">
                                <th scope="row">
                                    <p>
                                        <label for="recipter">수급자 성명<sup class="text-danger text-base md:text-lg">*</sup></label>
                                    </p>
                                </th>
                                <td>
                                    <input type="text" class="form-control  lg:w-8/12" id="info-recipientsNm" name="info-recipientsNm" maxlength="50" value="${mbrConsltVO.mbrNm}" disabled>
                                </td>
                            </tr>
                            <tr class="wrapNo">
                                <th scope="row">
                                    <p>
                                        <label for="rcperRcognNo">요양인정번호</label>
                                    </p>
                                </th>
                                <td>
                                    <div class="flex flex-row gap-2.5 mb-1.5">
                                        <div class="form-check input-rcperRcognNo-yn">
                                            <input class="form-check-input" type="radio" name="info-rcperRcognNo-yn" id="info-rcperRcognNo-y" value="Y" onchange="changeRcperRcognNoYn();" <c:if test="${!empty mbrConsltVO.rcperRcognNo}">checked</c:if> disabled>
                                            <label class="form-check-label" for="info-rcperRcognNo-y">있음</label>
                                        </div>
                                        <div class="form-check input-rcperRcognNo-yn">
                                            <input class="form-check-input" type="radio" name="info-rcperRcognNo-yn" id="info-rcperRcognNo-n" value="N" onchange="changeRcperRcognNoYn();" <c:if test="${empty mbrConsltVO.rcperRcognNo}">checked</c:if> disabled>
                                            <label class="form-check-label" for="info-rcperRcognNo-n">없음</label>
                                        </div>
                                    </div>
                                    <div class="form-group w-full lg:w-8/12" id="input-rcperRcognNo" <c:if test="${empty mbrConsltVO.rcperRcognNo}">style="display:none;"</c:if>>
                                        <p class="px-1.5 font-serif text-[1.375rem] font-bold md:text-2xl">L</p>
                                        <input type="text" class="form-control " id="info-rcperRcognNo" name="info-rcperRcognNo" maxlength="13" value="${mbrConsltVO.rcperRcognNo}" readonly>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <p><label for="search-item6">상담받을 연락처<sup class="text-danger text-base md:text-lg">*</sup></label></p>
                                </th>
                                <td><input type="text" class="form-control w-full lg:w-8/12" id="info-tel" value="${mbrConsltVO.mbrTelno}"></td>
                            </tr> 
                            <tr>
                                <th scope="row">
                                    <p><label for="search-item6">실거주지 주소<sup class="text-danger text-base md:text-lg">*</sup></label></p>
                                </th>
                                <td>
                                    <fieldset  class="addr-select">
                                        <select name="sido" id="sido" class="form-control" onchange="setSigugun();">
                                        	<option value="">시/도</option>
                                        </select>
                                        <select name="sigugun" id="sigugun" class="form-control">
                                        	<option value="">시/군/구</option>
                                        </select>
                                    </fieldset>
                                </td>
                            </tr>
							<tr>
                                <th scope="row">
                                    <p><label for="search-item6">연세</label></p>
                                </th>
                                <td>
									<div class="flex flex-row gap-2.5 mb-1.5">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="over65Yn" id="over65-y" value="Y" <c:if test='${mbrRecipientsVO.verificationYn != null && mbrRecipientsVO.verificationYn.equals("Y")}'>disabled</c:if> <c:if test='${mbrConsltVO.over65Yn != null && mbrConsltVO.over65Yn.equals("Y")}'> checked</c:if>>
                                            <label class="form-check-label" for="over65-y">65세 이상</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="over65Yn" id="over65-n" value="N" <c:if test='${mbrRecipientsVO.verificationYn != null && mbrRecipientsVO.verificationYn.equals("Y")}'>disabled</c:if> <c:if test='${mbrConsltVO.over65Yn == null || mbrConsltVO.over65Yn.equals("N")}'> checked</c:if>>
                                            <label class="form-check-label" for="over65-n">65세 미만</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><p><label for="search-item4">생년월일</label></p></th>
                                <td><input type="text" class="form-control  lg:w-8/12" id="info-brdt" placeholder="1950/01/01" value="${fn:substring(mbrConsltVO.brdt,0,4)}/${fn:substring(mbrConsltVO.brdt,4,6)}/${fn:substring(mbrConsltVO.brdt,6,8)}" disabled></td>
                            </tr>
                            <tr>
                            	<th scope="row"><p><label for="search-item4">성별<sup class="text-danger text-base md:text-lg">*</sup></label></p></th>
                            	<td>
                            		<div class="flex flex-row gap-2.5 mb-1.5">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="info-gender" id="info-gender-m" value="M" <c:if test="${mbrConsltVO.gender == 'M'}">checked</c:if> disabled>
                                            <label class="form-check-label" for="info-gender-m">남성</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="info-gender" id="info-gender-w" value="W" <c:if test="${mbrConsltVO.gender == 'W'}">checked</c:if> disabled>
                                            <label class="form-check-label" for="info-gender-w">여성</label>
                                        </div>
                                    </div>
                            	</td>
                            </tr>
                            <tr>
                                <th scope="row"><p><label for="search-item4">상담유형</label></p></th>
                                <td>${prevPath[mbrConsltVO.prevPath]}</td>
                            </tr>
                        </tbody>
                    </table>
                    <ul class="list-style1 mt-2">
                        <li class="flex items-center gap-1"><i class="ico-alert2 size-sm"></i> 수급자는 성명 및 성별을 수정할 수 없습니다.</li>
                        <li class="flex items-center gap-1"><i class="ico-alert2 size-sm"></i> 요양인정번호는 수정할 수 없습니다. (‘없음' 상태에서 ‘있음'으로 수정 포함)</li>
                        <li class="flex items-center gap-1"><i class="ico-alert2 size-sm"></i> 생년월일의 경우 어르신위임이 완료된 경우에만 확인이 가능하며 수정이 불가합니다.</li>
                    </ul>
                </div>
                <div class="modal-footer md:w-3/4 mx-auto mt-4">
                    <button type="button" class="btn-primary large shadow" onclick="clickUpdateConsltBtn();">수정</button>
                    <button type="button" class="btn-secondary large" onclick="$('#modal-consulting-info').modal('hide');">취소</button>
                </div>
           </div>
        </div>
	</div>
	
	
	<script>
	
		//상담신청 모달창 띄우기(또는 진행중인 상담존재 모달에서 새롭게 진행하기 클릭)
		// function openNewConsltInfo(myRecipientInfo) {
		// 	$('#info-relationSelect').val(myRecipientInfo.relationCd);
		// 	$('#info-recipientsNm').val(myRecipientInfo.recipientsNm);
			
		// 	if(myRecipientInfo.rcperRcognNo) {
		// 		//L번호가 있는 경우 이름, L번호 수정 불가
		// 		$('#info-recipientsNm').prop('readonly', true);
				
		// 		$('.input-rcperRcognNo-yn').css('display', 'none');
		// 		$('#info-rcperRcognNo-y').prop('disabled', true);
		// 		$('#info-rcperRcognNo-n').prop('disabled', true);
				
		// 		$('#info-rcperRcognNo-y').prop('checked', true); 
		// 		$('#info-rcperRcognNo').val(myRecipientInfo.rcperRcognNo);
		// 		$('#input-rcperRcognNo').css('display', 'inline-flex');
		// 		$('#info-rcperRcognNo').prop('readonly', true);
		// 	} else {
		// 		$('#info-recipientsNm').prop('readonly', false);
				
		// 		$('.input-rcperRcognNo-yn').css('display', 'inline-block');
		// 		$('#info-rcperRcognNo-y').prop('disabled', false);
		// 		$('#info-rcperRcognNo-n').prop('disabled', false);
				
		// 		$('#info-rcperRcognNo-n').prop('checked', true);
		// 		$('#info-rcperRcognNo').val('');
		// 		$('#input-rcperRcognNo').css('display', 'none');
		// 	}
			
		// 	$('#info-tel').val(myRecipientInfo.tel);
			
		// 	if (myRecipientInfo.sido) {
		// 		var options = $('#sido option');
		// 		for(var i = 0; i < options.length; i++) {
		// 			if ($('#sido option')[i].text === myRecipientInfo.sido) {
		// 				$('#sido option')[i].selected = true;
		// 			}
		// 		}
		// 		setSigugun();
		// 	}
		// 	if (myRecipientInfo.sigugun) {
		// 		var options = $('#sigugun option');
		// 		for(var i = 0; i < options.length; i++) {
		// 			if ($('#sigugun option')[i].text === myRecipientInfo.sigugun) {
		// 				$('#sigugun option')[i].selected = true;
		// 			}
		// 		}
		// 		setDong();
		// 	}
		// 	if (myRecipientInfo.dong) {
		// 		var options = $('#dong option');
		// 		for(var i = 0; i < options.length; i++) {
		// 			if ($('#dong option')[i].text === myRecipientInfo.dong) {
		// 				$('#dong option')[i].selected = true;
		// 			}
		// 		}
		// 	}
			
		// 	if(myRecipientInfo.brdt) {
		// 		$('#info-brdt').val(myRecipientInfo.brdt.substring(0, 4) + '/' + myRecipientInfo.brdt.substring(4, 6) + '/' + myRecipientInfo.brdt.substring(6, 8));	
		// 	}else {
		// 		$('#info-brdt').val('');    			
		// 	}
			
		// 	if (myRecipientInfo.gender === 'M') {
		// 		$('#info-gender-m').prop('checked', true);
		// 	} else if (myRecipientInfo.gender === 'W') {
		// 		$('#info-gender-w').prop('checked', true);
		// 	} else {
		// 		$('#info-gender-m').prop('checked', false);
		// 		$('#info-gender-w').prop('checked', false);
		// 	}
			
			
		// 	$('#modal-consulting-info').modal('show');
		// }
		
	
		// 시/도 Select 박스 셋팅
		function initSido() {
			var template = '<option value="">시/도</option>';
			
			for(var i = 0; i < hangjungdong.sido.length; i++) {
				template += '<option value="' + hangjungdong.sido[i].sido + '">' + hangjungdong.sido[i].codeNm + '</option>';
			}
			
			$('#sido').html(template);
		}
		// 시/구/군 Select 박스 셋팅
		function setSigugun() {
			var sidoCode = $('#sido option:selected').val();
			
			if (sidoCode) {
				var sigugunArray = hangjungdong.sigugun.filter(f => f.sido === sidoCode);
				var template = '<option value="">시/군/구</option>';
				
				for(var i = 0; i < sigugunArray.length; i++) {
					template += '<option value="' + sigugunArray[i].sigugun + '">' + sigugunArray[i].codeNm + '</option>';
				}
				
				$('#sigugun').html(template);
			}
		}
	
		//상담신청정보 모달창안에 L번호 있음, 없음 체크로 readonly 처리
		function changeRcperRcognNoYn() {
			var checkedVal = $('input[name=info-rcperRcognNo-yn]:checked').val();
			if (checkedVal === 'Y') {
				$('#info-rcperRcognNo').prop('readonly', false);
				$('#input-rcperRcognNo').css('display', 'inline-flex');
			} else {
				$('#info-rcperRcognNo').prop('readonly', true);
				$('#input-rcperRcognNo').css('display', 'none');
			}
		}
		
		
		//상담정보수정 버튼 클릭
		var telchk = /^([0-9]{2,3})?-([0-9]{3,4})?-([0-9]{3,4})$/;
		function clickUpdateConsltBtn() {
			var relationCd = $('#info-relationSelect').val();
			var recipientsNm = $('#info-recipientsNm').val();
			var rcperRcognNoYn = $('input[name=info-rcperRcognNo-yn]:checked').val();
			var rcperRcognNo = $('#info-rcperRcognNo').val();
			var tel = $('#info-tel').val();
			var sidoCode = $('#sido option:selected').val();
			var sido = $('#sido option:selected').text();
			var sigugunCode = $('#sigugun option:selected').val();
			var sigugun = $('#sigugun option:selected').text();
			var gender = $('input[name=info-gender]:checked').val();
			var over65Yn = $('input[name=over65Yn]:checked').val();
			
			//필수항목 입력검사
			if (!relationCd) {
				alert('수급자와의 관계를 선택하세요');
				return;
			}
			if (!recipientsNm) {
				alert('수급자 성명을 입력하세요');
				return;
			}
			if (rcperRcognNoYn === 'Y' && !rcperRcognNo) {
				alert('요양인정번호를 입력하세요');
				return;
			}
			//요양번호 10자리 검사
			if (rcperRcognNoYn === 'Y' && rcperRcognNo.length != 10) {
				alert('요양인정번호 숫자 10자리를 입력하세요 (예: 1234567890)');
				return;
			}
			if (!tel) {
				alert('상담받을 연락처를 입력하세요');
				return;
			}
			if (!sidoCode || !sigugunCode) {
				alert('주소지를 선택해 주세요');
				return;
			}
			if (!gender) {
				alert('성별을 입력하세요');
				return;
			}
				
			//본인인지 체크
			if (relationCd === '007' && recipientsNm !== '${mbrVO.mbrNm}') {
				alert('수급자와의 관계를 확인해주세요');
				return;
			}
			//본인과 배우자는 한명만 등록
			var mbrRecipients = [
				<c:forEach var="recipientInfo" items="${mbrVO.mbrRecipientsList}">
					{
						recipientsNo: ${recipientInfo.recipientsNo}
						, relationCd: '${recipientInfo.relationCd}'
					},
				</c:forEach>
			];
			
			var meCount = mbrRecipients.filter(f => f.recipientsNo !== '${mbrConsltVO.recipientsNo}' && f.relationCd === '007').length; //내 수급자가 아닌 다른수급자도 본인인지 확인
			var spouseCount = mbrRecipients.filter(f => f.recipientsNo !== '${mbrConsltVO.recipientsNo}' && f.relationCd === '001').length; //내 수급자가 아닌 다른수급자도 배우자인지 확인
			if ((relationCd === '007' && meCount > 0) ||
				(relationCd === '001' && spouseCount > 0)) {
				alert('수급자와의 관계를 확인해주세요');
				return;
			}
			
			//연락처 형식 검사
			if (telchk.test(tel) === false) {
				alert('연락처 형식이 올바르지 않습니다 (예시: 010-0000-0000)');
				return;
			}
			
			if (rcperRcognNoYn === 'N') {
				rcperRcognNo = '';
			}
			
			//상담정보 수정 API 실행
			$.ajax({
				type : "post",
				url  : "/_mng/consult/recipter/updateMbrConslt.json",
				data : {
					consltNo : '${mbrConsltVO.consltNo}'
					, relationCd
					, mbrNm: recipientsNm
					, rcperRcognNo
					, mbrTelno: tel
					, zip: sido
					, addr: sigugun
					, gender
					, over65Yn
				},
				dataType : 'json'
			})
			.done(function(data) {
				if(data.success) {
					alert('상담정보가 수정되었습니다');
					$('#modal-consulting-info').modal('hide');
					location.reload();
				}else{
					alert(data.msg);
				}
			})
			.fail(function(data, status, err) {
				alert('서버와 연결이 좋지 않습니다.');
			});
		}
		
		
		$(function() {
			initSido();
			
			//상담정보에서 시/도, 시/군/구, 동 정보 매핑
			(function () {
				var sido = '${mbrConsltVO.zip}';
				var sigugun = '${mbrConsltVO.addr}';
				
				if (sido) {
					var options = $('#sido option');
					for(var i = 0; i < options.length; i++) {
						if ($('#sido option')[i].text === sido) {
							$('#sido option')[i].selected = true;
						}
					}
					setSigugun();
				}
				if (sigugun) {
					var options = $('#sigugun option');
					for(var i = 0; i < options.length; i++) {
						if ($('#sigugun option')[i].text === sigugun) {
							$('#sigugun option')[i].selected = true;
						}
					}
				}
			})();


			//연락처 형식 - 자동작성
	    	const telKeyInputRegex = /^(45|48|49|50|51|52|53|54|55|56|57|58|59)$/;
	    	$("#info-tel").keypress(function(e) {
	    		//숫자와 /만 입력받도록 추가
	    		if (!telKeyInputRegex.test(e.keyCode)) {
	    			return false;
	    		}
	    	});
	    	$("#info-tel").on("keydown",function(e){
	    		//백스페이스는 무시
	    		if (e.keyCode !== 8) {
	    			if($(this).val().length == 3){
	    				$(this).val($(this).val() + "-");
	    			}

	    			if($(this).val().length == 8){
	    				$(this).val($(this).val() + "-");
	    			}
	    			
	    			if($(this).val().length == 13){
	    				$(this).val($(this).val() + "-");
	    			}
	    		}
	    	});
	    	$("#info-tel").on("keyup",function(){
	    		if($(this).val().length > 13){
	    			$(this).val($(this).val().substr(0,13));
	    		}
	    	});
	    	
	    	
	    	//생년월일 형식 / 자동작성
	    	const brdtKeyInputRegex = /^(48|49|50|51|52|53|54|55|56|57|58|59|191)$/;
	    	$("#info-brdt").keypress(function(e) {
	    		//숫자와 /만 입력받도록 추가
	    		if (!brdtKeyInputRegex.test(e.keyCode)) {
	    			return false;
	    		}
	    	});
	    	$("#info-brdt").on("keydown",function(e){
	    		//백스페이스는 무시
	    		if (e.keyCode !== 8) {
	    			if($(this).val().length == 4){
	    				$(this).val($(this).val() + "/");
	    			}

	    			if($(this).val().length == 7){
	    				$(this).val($(this).val() + "/");
	    			}
	    		}
	    	});
	    	$("#info-brdt").on("keyup",function(){
	    		if($(this).val().length > 10){
	    			$(this).val($(this).val().substr(0,10));
	    		}
	    	});
		});
	</script>