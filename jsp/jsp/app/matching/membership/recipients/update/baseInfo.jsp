<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="icube.common.util.DateUtil"%>
<%@ page import="icube.common.util.StringUtil"%>

	<style>
		.bder_danger {
		    border: 2px solid #E53935 !important;
		}

        /* Hide the spin buttons in WebKit browsers */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Hide spin buttons in Firefox */
        input[type="number"] {
            -moz-appearance: textfield;
        }
	</style>

	<div class="wrapper">

		<!-- 상단 뒤로가기 버튼 추가 -->
	    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="어르신 기본 정보 수정" name="addTitle" />
	    </jsp:include>
	    
	    
	    <main>
            <section class="default">

                <form action="">

                    <label class="input_label">본인과의 가족관계</label>
                    <div id="divRelation" class="waves-effect input_basic list_link font_sbmr bder_valid " 
							originRelationCd='${curRecipientInfo.relationCd}' 
							<c:if test="${curRecipientInfo.relationCd eq '007' && curRecipientInfo.verificationYn eq 'Y'}"> disabled="true"</c:if>
							relationCd='${curRecipientInfo.relationCd}' onclick="fn_recipient_relation_click(this)">${relationCdMap[curRecipientInfo.relationCd]}</div>
					<div id="relationErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
                    <div class="h32"></div>

                    <label class="input_label">어르신 이름</label>
                    <input id="inputName" type="text" class="input_basic bder_danger keycontrol hangul" value="<c:if test="${relationCdMap[curRecipientInfo.relationCd] ne curRecipientInfo.recipientsNm}"> ${curRecipientInfo.recipientsNm} </c:if>" <c:if test="${curRecipientInfo.verificationYn eq 'Y'}"> disabled="true"</c:if>>
          			<div id="nameErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
          
                    <div class="h32"></div>
                    
                    <label class="input_label">어르신 성별</label>
                    <ul class="chip_area c02" style="padding-bottom: 0px;" <c:if test="${curRecipientInfo.verificationYn eq 'Y'}"> disabled="true"</c:if>>
	                    <li class="inputGender" value="M">남성</li>
	                    <li class="inputGender" value="W">여성</li>
	                </ul>

	                <div id="genderErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
          
                    <div class="h32"></div>

                    <label class="input_label">어르신 생년월일</label>
                    <input id="inputBrdt" type="text" class="input_basic keycontrol birthdt10_2nd bder_danger" 
						placeholder="1958.01.01"
						value="<c:if test="${!empty curRecipientInfo.brdt && fn:length(curRecipientInfo.brdt) >= 8}">
                         	${fn:substring(curRecipientInfo.brdt,0,4)}.${fn:substring(curRecipientInfo.brdt,4,6)}.${fn:substring(curRecipientInfo.brdt,6,8)}
                        </c:if>"
						<c:if test="${curRecipientInfo.verificationYn eq 'Y'}"> disabled="true"</c:if>
                     >
                     <div id="brdtErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
          
                    <div class="h32"></div>

                    <label class="input_label">요양인정번호</label>
                    
					<div class="flex_input_btn">
                        <input id="inputLno" type="text" inputmode="numeric" class="input_basic" maxlength="11" pattern="[0-9]*"
                               placeholder="L 없이 숫자 10자리 입력" oninput="handleLnoInput()"
                               value="${StringUtil.isNotEmpty(curRecipientInfo.rcperRcognNo) ? "L" += curRecipientInfo.rcperRcognNo : ''}"
                               <c:if test="${curRecipientInfo.longtermConfirmYn eq 'Y' || curRecipientInfo.verificationYn ne 'Y'}"> disabled="true"</c:if>>
                        <a id="buttonLnoSearch" class="waves-effect btn-large btn_white btn_primary btn longterm check <c:if test="${curRecipientInfo.verificationYn ne 'Y' || empty curRecipientInfo.rcperRcognNo || curRecipientInfo.rcperRcognNo.length() < 10}"> disabled </c:if> <c:if test="${curRecipientInfo.longtermConfirmYn eq 'Y' }"> disNone </c:if>">조회</a>
                    </div>
                    <div id="lnoErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>

                    <c:if test="${curRecipientInfo.verificationYn eq 'Y' && curRecipientInfo.longtermConfirmYn ne 'Y'}">
                        <div class="h40 lno-register-guide"></div>

                        <div class="d-flex align-items-center gap04 lno-register-guide">
                            <img class="w20" src="/html/page/app/matching/assets/src/images/04icon/finger_right.png">
                            <div class="font_sbmb">요양인정번호 확인방법</div>
                        </div>

                        <div class="h12 lno-register-guide"></div>

                        <div class="back_F5F5F5 pad_16_16_20 radius12 lno-register-guide">
                            <img src="/html/page/app/matching/assets/src/images/20medi_care/img_medi_care_guide.png" class="img_reset" alt="요양인정번호 확인방법">

                            <div class="h20"></div>

                            <ul class="welfase_step_area s02 no_line">
                                <li>
                                    <div class="font_sbmr">
                                        장기요양인정서를 준비해 주세요.
                                    </div>
                                </li>
                                <li>
                                    <div class="font_sbmr">
                                        인정번호에서 L 뒤에 나오는 <span class="font_sbmb color_t_danger_b">숫자 10자리만 입력</span>해주세요.
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <div class="h40 lno-register-guide"></div>

                        <div class="h12 marW-20 back_F7F7F7 lno-register-guide"></div>
                    </c:if>

                    <div class="h40"></div>

                    <div class="font_sblb">유의사항</div>

                    <div class="h16"></div>

                    <ul class="list_dept1 gray_dot">
                        <li class="color_t_s font_sbsr">어르신 이름, 성별, 생년월일을 수정하려면 어르신 위임이 필요해요. 어르신 위임 완료 후 어르신의 이름, 성별, 생년월일은 수정할 수 없어요.</li>
                        <li class="color_t_s font_sbsr">요양인정번호는 어르신 위임 완료 후 진행해주세요. 요양인정번호 조회 후 수정할 수 없어요.</li>
                    </ul>

                    <div class="h40"></div>

                </form>

            </section>
        </main>


        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p" onclick="clickUpdateRecipient();">수정하기</a>
            </div>

        </footer>

		<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/recipientRelationModal.jsp" />
		

	</div>
	<!-- wrapper -->
	
	
	<script>
		var _jsCommon;
		var mbrGender = '${mbrVO.gender}';
		var mbrNm = '${mbrVO.mbrNm}';
		var mbrBrdt = '${ DateUtil.formatDate(mbrVO.getBrdt(), "yyyy.MM.dd") }';
		var recipientsNo = '${curRecipientInfo.recipientsNo}';
		var relationCd = '${curRecipientInfo.relationCd}';
		
		var longtermConfirmAbleMinute = '${longtermConfirmAbleMinute}';
		var recipientsYn = '${curRecipientInfo.recipientsYn}';
		var verificationYn = '${curRecipientInfo.verificationYn}';
		var recipientGender = '${curRecipientInfo.gender}';
		var isSelectableGender = false;
		
		var namechk = /^[ㄱ-ㅎ|가-힣]+$/;
		var datechk = /^([1-2][0-9]{3})\.([0-1][0-9])\.([0-3][0-9])$/; // 날짜 정규식
		var lnochk = /^[0-9]{10}$/;
		
		function fn_recipient_relation_editable_disp(relationCd){
			if (relationCd == '007'){/*본인이면*/
				$("#inputName").attr("disabled", "disabled");
				$(".inputGender").addClass("disabled");
				$("#inputBrdt").attr("disabled", "disabled");

				$("#inputName").val(mbrNm);
				$(".inputGender[value!= "+mbrGender+"]").removeClass("active");
				$(".inputGender[value = "+mbrGender+"]").addClass("active");
				$("#inputBrdt").val(mbrBrdt);

			}else{
				if ("${curRecipientInfo.verificationYn}" != 'Y'){
					$(".inputGender").removeClass("disabled");
					$("#inputName").removeAttr("disabled");
					$("#inputBrdt").removeAttr("disabled");
				}
				
			}
		}

		async function fn_recipient_relation_click(obj){
			if ($(obj).attr("disabled") == 'disabled' || $(obj).hasClass("disabled")){
				return;
			}

			var popup = new JsMvpModalRecipientRelaction(window, '#modal_recipient_relation_view', 'modal_recipient_relation_view')

			var answer = await popup.fn_show_popup({relationCd : $(obj).attr('relationCd')});
			if (answer != 'confirm') { return }

			var relation = popup.fn_selected_value();

			if ("${curRecipientInfo.verificationYn}" == 'Y' && relation.relationCd == '007'){
				showAlertPopup('위임 동의한 어르신의 가족관계를 본인으로 변경할 수 없습니다.');
				return;
			}

			$("#divRelation").removeClass('bder_danger');
			$('#relationErrorMsg').addClass('disNone');
			
			if (relation.relationCd == '001' || relation.relationCd == '007'){
				/*배우자, 본인이면*/
				callPostAjaxIfFailOnlyMsg(
	        		'/matching/membership/recipients/update/check.json',
	        		{
						mbrUniqueId : "${mbrVO.getUniqueId()}",
	        			recipientsNo : Number(recipientsNo),
	        			relationCd : relation.relationCd
	        		},
	        		function(result) {
	        			$(obj).attr('relationCd', relation.relationCd);
						$(obj).html(relation.relationNm);

						fn_recipient_relation_editable_disp(relation.relationCd);
	        		}
	     		);
			}else {
				$(obj).attr('relationCd', relation.relationCd);
				$(obj).html(relation.relationNm);

				if ("${curRecipientInfo.verificationYn}" != 'Y' && relation.gender != undefined && relation.gender.length > 0){
					setGenderChange(relation.gender);
				}
				fn_recipient_relation_editable_disp(relation.relationCd);
			}
		}
		
		//UI 초기화
		function initialize() {
			var inputName = $('#inputName');
			var inputBrdt = $('#inputBrdt');
			var inputLno = $('#inputLno');

			$("#divRelation").removeClass('bder_danger');
			inputName.removeClass('bder_danger');
			inputBrdt.removeClass('bder_danger');
			inputLno.removeClass('bder_danger');

			
			
			var nameErrorMsg = $('#nameErrorMsg');
			var genderErrorMsg = $('#genderErrorMsg');
			var brdtErrorMsg = $('#brdtErrorMsg');
			var lnoErrorMsg = $('#lnoErrorMsg');
			var lnoHelpMsg = $('#lnoHelpMsg');
			nameErrorMsg.addClass('disNone');
			genderErrorMsg.addClass('disNone');
			brdtErrorMsg.addClass('disNone');
			lnoErrorMsg.addClass('disNone');
			lnoHelpMsg.removeClass('disNone');

			$('#relationErrorMsg').addClass('disNone');
		}
		
		//유효성 검사
		function validation() {
			var isValid = true;
			var inputName = $('#inputName');
			var inputGender = $('.inputGender');
			var inputBrdt = $('#inputBrdt');
			var inputLno = $('#inputLno');
			
			var nameErrorMsg = $('#nameErrorMsg');
			var genderErrorMsg = $('#genderErrorMsg');
			var brdtErrorMsg = $('#brdtErrorMsg');
			var lnoErrorMsg = $('#lnoErrorMsg');
			var lnoHelpMsg = $('#lnoHelpMsg');
			
			var relationCd = $('#divRelation').attr('relationCd');
			if (relationCd == undefined || relationCd.length < 1){
				$("#divRelation").addClass('bder_danger');

				$('#relationErrorMsg').text('본인과의 가족관계를 선택하여 주십시오');
				$('#relationErrorMsg').removeClass('disNone');
				
				isValid = false;
			}

			

			//이름
			var name = inputName.val();
			if (!name) {
				inputName.addClass('bder_danger');
				nameErrorMsg.text('이름을 입력해주세요');
				nameErrorMsg.removeClass('disNone');
				isValid = false;
			}
			else if (!namechk.test(name)) {
				inputName.addClass('bder_danger');
				nameErrorMsg.text('한글만 입력해주세요');
				nameErrorMsg.removeClass('disNone');
				isValid = false;
			} else {
				inputName.removeClass('bder_danger');
				nameErrorMsg.addClass('disNone');
			}
			
			//성별
			var gender = getGenderSelect();
			if (!gender) {
				inputGender.addClass('bder_danger');
				genderErrorMsg.text('성별을 확인해주세요');
				genderErrorMsg.removeClass('disNone');
				isValid = false;
			} else {
				inputGender.removeClass('bder_danger');
				genderErrorMsg.addClass('disNone');
			}
			
			//생년월일
			var brdt = inputBrdt.val();
			var today = new Date();
			var before10Years = today.getFullYear() - 10;
			if (!brdt || !datechk.test(brdt) || Number(brdt.substr(0, 4)) > before10Years) {
				inputBrdt.addClass('bder_danger');
				brdtErrorMsg.text('다시 확인해주세요');
				brdtErrorMsg.removeClass('disNone');
				isValid = false;
			} else {
				inputBrdt.removeClass('bder_danger');
				brdtErrorMsg.addClass('disNone');
			}
			
			//요양인정번호
			var lno = inputLno.val().replaceAll('L', '');
			if (lno && !lnochk.test(lno)) {
				inputLno.addClass('bder_danger');
				lnoErrorMsg.text('번호를 확인해주세요');
				lnoErrorMsg.removeClass('disNone');
				lnoHelpMsg.addClass('disNone');
				isValid = false;
			} else {
				inputLno.removeClass('bder_danger');
				lnoErrorMsg.addClass('disNone');
				lnoHelpMsg.removeClass('disNone');
			}
			return isValid;
		}
		
		//선택된 성별여부 가져오기
		function getGenderSelect() {
			var gender;
			//if (isSelectableGender) {
			//	gender = $('.inputGender.active').attr('value');
			//} else {
			//	gender = $('.inputGender.disabled').attr('value');
			//}
			gender = $('.inputGender.active').attr('value')

			return gender;
		}

		function setGenderChange(gender) {
			$('.inputGender[value!=' + gender + ']').removeClass('active');
			$('.inputGender[value=' + gender + ']').addClass('active');

			$('.inputGender').removeClass('bder_danger');
			$('#genderErrorMsg').addClass('disNone');
		}

        function handleLnoInput() {
            const $inputLno = $('#inputLno');
            $inputLno.val(fitLnoToPattern($inputLno.val()));
            if ($inputLno.val().length === 11) {
                $('#buttonLnoSearch').removeClass('disabled');
            } else {
                $('#buttonLnoSearch').addClass('disabled');
            }
        }

        function fitLnoToPattern(lno) {
            if (!lno) return '';
            if (lno.startsWith('L')) return lno.slice(0, 1) + lno.slice(1, 11).replace(/[^0-9]/g, '');
            return 'L' + lno.slice(0, 10).replace(/[^0-9]/g, '');
        }

		//수정하기 버튼 클릭 이벤트
		async function clickUpdateRecipient() {
			var valid = validation();
			if (!valid) {
				return;
			}
			
			var inputLno = $('#inputLno');
			var rcperRcognNo = inputLno.val().replaceAll('L', '');

			var relationCd = $("#divRelation").attr("relationCd");
			if (relationCd != '007' && $('#inputName').val() == "${mbrVO.mbrNm}") {
            	showAlertPopup('어르신 정보가 본인의 정보와 동일합니다. 어르신의 정보를 입력해 주세요.');
				return;
            }

			if (verificationYn != 'Y'){
				clickUpdateRecipientVerify(rcperRcognNo);
				return;
			}
			
			if (recipientsYn === 'Y' && !lnochk.test(rcperRcognNo)) {
				showAlertPopup('요양인정번호를 다시 입력해주세요');
				return;
			}
			
			var answer = await showConfirmPopup('정말 수정하시겠어요?', '정확한 정보를 입력하셔야 필요한 정보를 받을 수 있어요');
			if (answer === 'confirm') {
				var inputName = $('#inputName');
				var inputBrdt = $('#inputBrdt');
				
				var recipientsNm = inputName.val();
				var gender = getGenderSelect();
				var brdt = inputBrdt.val();
				
				callPostAjaxIfFailOnlyMsg(
	        		'/matching/membership/recipients/updateMbrRecipientBase.json',
	        		{
	        			recipientsNo : Number(recipientsNo),
	        			relationCd,
	        			rcperRcognNo,
	        		},
	        		function(result) {
	        			backBtnEvent();
	        		}
	     		);
			}
		}
		
		async function clickUpdateRecipientVerify(rcperRcognNo) {
			var answer = await showConfirmPopup('어르신 동의가 필요해요.', '정확한 서비스 이용을 위해 어르신의 동의가 필요해요. 어르신 위임을 진행해 주세요.', '위임하기');
			if (answer != 'confirm') {
				return;
			}

			var qsMap = {"type" : "recipientVerification"
						, "recipientsNo":recipientsNo
						, "recipientsNm" : $('#inputName').val()
						, "recipientsBrDt": $('#inputBrdt').val().replaceAll(".", "")
						, "recipientsGender": getGenderSelect()
						, "recipientsRelationCd": $("#divRelation").attr("relationCd")
					};

			location.href = "/matching/membership/info/identityRecipientMandate?" + _jsCommon.fn_queryString_fromMap(qsMap);;
		}

		$(function() {
			_jsCommon = new JsCommon();
            _jsCommon.fn_keycontrol();
            
            //UI 초기화
            initialize();
                        
            
            //본인일 때 이름, 생년월일 변경 불가
            if (relationCd === '007') {
            	var inputName = $('#inputName');
            	var inputBrdt = $('#inputBrdt');
            	
            	inputName.val('${mbrVO.mbrNm}');
            	<c:if test="${!empty mbrVO.brdt}">
           		inputBrdt.val('<fmt:formatDate value="${mbrVO.brdt}" pattern="yyyy.MM.dd"/>');
            	</c:if>
            	
            	inputName.attr('disabled', true);
            	inputBrdt.attr('disabled', true);

				$(".inputGender").addClass("disabled");

				if ("${curRecipientInfo.verificationYn}" == 'Y'){
					$("#divRelation").addClass("disabled");
				}
            }else{
				if ("${curRecipientInfo.verificationYn}" == 'Y'){
					$(".inputGender").addClass("disabled");
				}
			}
            
			//성별 선택
			if (recipientGender) {
				$('.inputGender[value!=' + recipientGender + ']').removeClass('active');
				$('.inputGender[value=' + recipientGender + ']').addClass('active');
			}
			$('.inputGender').click(function(event) {
            	$('.inputGender').removeClass('active');
            	$(event.target).addClass('active');

				$('.inputGender').removeClass('bder_danger');
				$('#genderErrorMsg').addClass('disNone');
            });
			
		});

		$('.btn.longterm.check').click(function(event) {
			fn_longterm_check_call();
		});

		var registrationReleaseTime;
		async function fn_longterm_check_call(){
			const recipientsNm = $('#inputName').val();
			const rcperRcognNo = $('#inputLno').val().replaceAll('L', '');

			if (!lnochk.test(rcperRcognNo)) {
				showAlertPopup('요양인정번호 확인 후 다시 시도해주세요.');
				return;
			}

			if (isNotReleaseRegistration()) {
				showNotReleaseRegistrationPopup();
				return;
			}
			callPostAjaxIfFailOnlyMsg(
				'/matching/membership/recipients/longerm/check.json',
				{
					mbrUniqueId : "${mbrVO.getUniqueId()}",
					recipientsNo : Number(recipientsNo),
					recipientsNm,
					rcperRcognNo,
					mustCallbackJs : true
				},
				handleLongtermCheckResult
			);
		}

		function isNotReleaseRegistration() {
			return registrationReleaseTime != undefined && registrationReleaseTime > Date.now();
		}

		function showNotReleaseRegistrationPopup() {
			const minutes = getMinutesUntilRegistrationRelease();
			showAlertPopup('요양인정번호 확인 후 다시 시도해주세요. (' + minutes + '분 후 다시 시도)');
		}

		function getMinutesUntilRegistrationRelease() {
			if (registrationReleaseTime == undefined) return 0;
			const now = new Date();
			const diffInMillis = registrationReleaseTime.getTime() - now.getTime();
			const diffInMinutes = Math.floor(diffInMillis / (1000 * 60));
			return diffInMinutes;
		}

		async function handleLongtermCheckResult(result) {
			if (result.wasTooManyTryToRegistLno == true) {
				refreshRegistrationReleaseTime(result.lastConfirmedTime);
				return;
			}
			if (hasError(result)) return;

			showToastMsg('정상적으로 조회되었어요');
			registrationReleaseTime = null;
			disableLongtermSearchAndGuideUi();
		}

		function refreshRegistrationReleaseTime(lastConfirmedTime) {
			const nextRegistrationReleaseTime = new Date(lastConfirmedTime);
			nextRegistrationReleaseTime.setMinutes(nextRegistrationReleaseTime.getMinutes() + 10);
			registrationReleaseTime = nextRegistrationReleaseTime;
		}

		function hasError(result) {
			return result.msg != undefined && result.msg.length > 0;
		}

		function disableLongtermSearchAndGuideUi() {
			$("#inputLno").attr("disabled", "disabled")
			$('#buttonLnoSearch').addClass("disNone");
            $('.lno-register-guide').addClass("disNone");
		}
	</script>
