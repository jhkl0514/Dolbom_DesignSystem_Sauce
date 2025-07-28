<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<style>
		.bder_danger {
			border: 2px solid #E53935 !important;
		}
	</style>
	<!-- bottom_sheet.js -->
	<script src="/html/page/app/matching/assets/src/js/custom/script_bottom_sheet.js?v=<spring:eval expression="@version['assets.version']"/>" defer type="text/javascript" ></script>

	<div class="wrapper">

		<!-- 상단 뒤로가기 버튼 추가 -->
	    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
	        <jsp:param value="어르신 상담 정보 수정" name="addTitle" />
	    </jsp:include>
	    
	    
	    <main>
            <section class="default">

                <form action="">

                    <label class="input_label">상담받을 연락처</label>
                    <input id="inputMobile" type="tel" class="input_basic keycontrol phonenumber bder_danger" value="${curRecipientInfo.tel}" placeholder="010-1234-5678">
					<div id="mobileErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>
		
                    <div class="h32"></div>

                    <label class="input_label c_757575">서비스받을 지역</label>
                    <div class="d-flex gap08 area_sido">
                        <div class="fg1">
                            <a id="aTagSido" class="input_basic fake_select show-modal region_select_sido_modal_btn_evt bder_danger <c:if test="${empty curRecipientInfo.sido}">color_disable</c:if>" >${!empty curRecipientInfo.sido ? curRecipientInfo.sido : '시/도'}</a>
                        </div>
                        <div class="fg1">
                            <a id="aTagSigugun" class="input_basic fake_select show-modal region_select_sigugun_modal_btn_evt bder_danger <c:if test="${empty curRecipientInfo.sigugun}">color_disable</c:if>" >${!empty curRecipientInfo.sigugun ? curRecipientInfo.sigugun : '시/군/구'}</a>
                        </div>
                    </div>
                    <div id="areaErrorMsg" class="vaild_txt error">유효성 체크 텍스트입니다. Help message</div>

					
					<div class="h32"></div>

					<label class="input_label">어르신 연세</label>
					<!-- 활성 -->
					<ul class="chip_area c02 noPad over65Yn">
						<li value="Y" class="inputOver65Yn <c:if test="${curRecipientInfo.over65Yn eq 'Y'}">active</c:if>">65세 이상</li>
						<li value="N" class="inputOver65Yn <c:if test="${curRecipientInfo.over65Yn eq 'N'}">active</c:if>">65세 이하</li>
					</ul>

					<div id="over65YnErrorMsg" class="vaild_txt error disNone">어르신 연세를 선택하여 주십시오.</div>
                </form>

                <div class="h32"></div>

                <div class="card-panel default">과거 신청한 상담 정보는 변경되지 않아요</div>

            </section>
        </main>


        <footer class="page-footer">

            <div class="relative">
                <a class="waves-effect btn-large btn_primary w100p" onclick="clickUpdateRecipient();">수정하기</a>
            </div>

        </footer>
	    
		<script src="/html/core/script/hangjungdong2407.js?v=<spring:eval expression="@version['assets.version']"/>" type="text/javascript" ></script>
		<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/regionSelectModal.jsp" />
	    
	</div>
	<!-- wrapper -->
	
	<script>
		var _jsCommon;
		var recipientsNo = '${curRecipientInfo.recipientsNo}';
		var sidoCode = '';    //선택된 시/도 코드값
		var sigugunCode = ''; //선택된 시/군/구 코드값
		var sido = '${curRecipientInfo.sido}';  //수급자의 선택 시도
	
		var phonechk = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		var zip = '';	// 우편번호
		var lat = '';	// 위도
		var lot = '';	// 경도
		
		function fn_popup_selected(alert_val, popKind, popup_param, data, extra){
			
			if (popKind == "region_sido"){
				$(".area_sido .region_select_sido_modal_btn_evt").text(data.name).addClass('bder_valid');
				$(".area_sido .region_select_sido_modal_btn_evt").removeClass('bder_danger');
            	$(".area_sido .region_select_sido_modal_btn_evt").removeClass('color_disable');
				$(".area_sido .region_select_sigugun_modal_btn_evt ").html('시/군/구');
				$("#areaErrorMsg").addClass('disNone');
				
			} else if (popKind == "region_sigugun"){
				
				$(".area_sido .region_select_sigugun_modal_btn_evt").text(data.name).addClass('bder_valid');
				$(".area_sido .region_select_sigugun_modal_btn_evt").removeClass('bder_danger');
				$(".area_sido .region_select_sigugun_modal_btn_evt").removeClass('color_disable');

				$("#areaErrorMsg").addClass('disNone');
				
				zip = data.zip;
				lat = data.lat;
				lot = data.lot;
			}
			

		}
		
		// UI초기화
		function initialize() {
			var inputMobile = $('#inputMobile');
			var aTagSido = $('#aTagSido');
			var aTagSigugun = $('#aTagSigugun');
			
			inputMobile.removeClass('bder_danger');
			aTagSido.removeClass('bder_danger');
			aTagSigugun.removeClass('bder_danger');
			
			var mobileErrorMsg = $('#mobileErrorMsg');
			var areaErrorMsg = $('#areaErrorMsg');
			mobileErrorMsg.addClass('disNone');
			areaErrorMsg.addClass('disNone');
		}
		
		// 유효성 검사
		function validation() {
			var isValid = true;
			var inputMobile = $('#inputMobile');
			var aTagSido = $('#aTagSido');
			var aTagSigugun = $('#aTagSigugun');
			
			var mobileErrorMsg = $('#mobileErrorMsg');
			var areaErrorMsg = $('#areaErrorMsg');
			
			//번호
			var mobile = inputMobile.val();
			if (!mobile || !phonechk.test(mobile)) {
				inputMobile.addClass('bder_danger');
				mobileErrorMsg.text('번호를 확인해주세요');
				mobileErrorMsg.removeClass('disNone');
				isValid = false;
			} else {
				inputMobile.removeClass('bder_danger');
				mobileErrorMsg.addClass('disNone');
			}
			
			//지역
			var areaValid = true;
			var sido = aTagSido.text();
			var sigugun = aTagSigugun.text();
			if (!sido || sido == '시/도') {
				aTagSido.addClass('bder_danger');
				areaValid = false;
			} else {
				aTagSido.removeClass('bder_danger');
			}
			if (!sigugun || sigugun == '시/군/구') {
				aTagSigugun.addClass('bder_danger');
				areaValid = false;
			} else {
				aTagSigugun.removeClass('bder_danger');
			}
			
			if (!areaValid) {
				areaErrorMsg.text('지역을 선택하세요');
				areaErrorMsg.removeClass('disNone');
				isValid = false;
			} else {
				areaErrorMsg.addClass('disNone');
			}

			var inputOver65Yn = $('.chip_area.over65Yn .inputOver65Yn');
			var over65YnErrorMsg = $('#over65YnErrorMsg');

			var over65Yn = $(".over65Yn .active").attr("value");
			if (!over65Yn) {
				inputOver65Yn.addClass('bder_danger');
				over65YnErrorMsg.removeClass('disNone');
				isValid = false;
			} else {
				inputOver65Yn.removeClass('bder_danger');
				over65YnErrorMsg.addClass('disNone');
			}
			
			return isValid;
		}
		
		//수정하기 버튼 클릭 이벤트
		async function clickUpdateRecipient() {
			var valid = validation();
			if (!valid) {
				return;
			}
			
			var answer = await showConfirmPopup('정말 수정하시겠어요?', '정확한 정보를 입력하셔야 필요한 정보를 받을 수 있어요');
			if (answer === 'confirm') {
				var inputMobile = $('#inputMobile');
				var aTagSido = $('#aTagSido');
				var aTagSigugun = $('#aTagSigugun');
				
				var tel = inputMobile.val();
				var sido = aTagSido.text();
				var sigugun = aTagSigugun.text();
				if (sido === '시/도') {
					sido = null;
				}
				if (sigugun === '시/군/구') {
					sigugun = null;
				}

				if (sido != null && sigugun != null && zip == ''){
					
					var item = findHangjungdong(sido, sigugun);

					if (item != null){
						zip = item.code;
						lat = item.latitude;
						lot = item.longitude;
					}
					
				}
				
				callPostAjaxIfFailOnlyMsg(
	        		'/matching/membership/recipients/updateMbrRecipient.json',
	        		{
	        			recipientsNo : Number(recipientsNo),
	        			updateType : 'conslt',
	        			tel,
	        			sido,
	        			sigugun,
	        			zip,
	        			lat,
	        			lot,
						over65Yn : $(".over65Yn .active").attr("value")
	        		},
	        		function(result) {
	        			backBtnEvent();
	        		}
	     		);
			}
		}
		

		//시도 지역선택 입력폼에 내용없으면(=지역 color_disable) 입력폼 valid 상태
		$('[class*="_btn_evt"]').each(function(){

			//비활성문자(color_disable) 없으면 폼에 내용있는 상태(bder_valid)로 변환
			if ($(this).children('span').hasClass('color_disable') != true) {

				$(this).addClass('bder_valid');

			}

        });


		
		$(function() {
			_jsCommon = new JsCommon();
            _jsCommon.fn_keycontrol();
            
            // UI초기화
            initialize();
			

			$('.inputOver65Yn').click(function(event) {
            	$('.inputOver65Yn').removeClass('active');
            	$(event.target).addClass('active');

				$('.inputOver65Yn').removeClass('bder_danger');
				$('#over65YnErrorMsg').addClass('disNone');
            });

			if ("${curRecipientInfo.verificationYn}" == 'Y'){
				$('.inputOver65Yn').addClass("disabled");
			}
			
	        
			var sidoArray = hangjungdong.sido.filter(f => f.codeNm === "${curRecipientInfo.sido}");
			
			if (sidoArray != undefined && sidoArray.length > 0){
				fn_region_select_sigugun_init(sidoArray[0].sido, "${curRecipientInfo.sigugun}");
			}
			regionSelectModalAddShowModalListeners();
		});
	</script>
