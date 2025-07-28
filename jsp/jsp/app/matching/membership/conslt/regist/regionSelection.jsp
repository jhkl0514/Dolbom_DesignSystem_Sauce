<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!-- bottom_sheet.js -->
    <script src="/html/page/app/matching/assets/src/js/custom/script_bottom_sheet.js?v=<spring:eval expression="@version['assets.version']"/>" defer type="text/javascript" ></script>

	<div class="wrapper">
	
       	<!-- 상단 뒤로가기 버튼 추가 -->
		<jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp" />
        
        <main>
            <section class="intro">

                <h3 class="title">
                    어르신이 서비스 받을 지역을<br />확인해주세요
                </h3>

                <div class="h40"></div>

				<!-- new -->
                <div class="d-flex gap08 region_sel_area">
                    <div class="fg1">
                        <label class="input_label c_757575">시/도</label>
                        <a class="input_basic fake_select show-modal region_select_sido_modal_btn_evt" nextBtnCssSelector=".region_select_sigugun_modal_btn_evt">
							<c:if test="${empty mbrRecipientsVO.sido}"><span class="color_disable">시/도 선택</span></c:if>
							<c:if test="${not empty mbrRecipientsVO.sido}"><span class="">${mbrRecipientsVO.sido}</span></c:if>
						</a>
                    </div>
                    <div class="fg1">
                        <label class="input_label c_757575">시/군/구</label>
                        <a class="input_basic fake_select show-modal region_select_sigugun_modal_btn_evt">
							<c:if test="${empty mbrRecipientsVO.sigugun}"><span class="color_disable">지역</span></c:if>
							<c:if test="${not empty mbrRecipientsVO.sigugun}"><span class="">${mbrRecipientsVO.sigugun}</span></c:if>
						</a>
                    </div>
                </div>

            </section>
        </main>

        <footer class="page-footer">
            <div class="relative">
                <a id="nextBtn" class="waves-effect btn-large btn_primary w100p modal-trigger" onclick="clickNextBtn();" disabled>다음</a>
            </div>
        </footer>

		<script src="/html/core/script/hangjungdong2407.js?v=<spring:eval expression="@version['assets.version']"/>" type="text/javascript" ></script>
		<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/regionSelectModal.jsp" />


	</div>
	<!-- wrapper -->
	
    <jsp:include page="termsAgreeModal.jsp" />
	<jsp:include page="/WEB-INF/jsp/app/matching/common/checkExistInProgressConslt.jsp" />
	<jsp:include page="addMbrConslt.jsp" />
	<jsp:include page="thirdPartyOfferModal.jsp" />

	<script>
	
		var zip = '';	// 우편번호
		var lat = '';	// 위도
		var lot = '';	// 경도
		
		function fn_popup_selected(alert_val, popKind, popup_param, data, extra){
			
			if (popKind == "region_sido"){
				$(".region_sel_area .region_select_sido_modal_btn_evt").html(data.name);
				$(".region_sel_area .region_select_sido_modal_btn_evt").addClass("bder_valid");
				
				//시도를 선택하면 시군구를 초기화 시켜준다
				if ($(".region_sel_area .region_select_sigugun_modal_btn_evt span").length > 0){
					$(".region_sel_area .region_select_sigugun_modal_btn_evt span").html("지역")
					$(".region_sel_area .region_select_sigugun_modal_btn_evt span").addClass("color_disable")
				}else{
					$(".region_sel_area .region_select_sigugun_modal_btn_evt").html("지역")
				}
				$(".region_sel_area .region_select_sigugun_modal_btn_evt").removeClass("bder_valid")

				// 시도를 선택하면 시군구를 선택하기 전에 다음 버튼 비활성화
				$(".page-footer #nextBtn").attr("disabled", "true")

				
			} else if (popKind == "region_sigugun"){
				//다음 버튼 활성화
				$('#nextBtn').attr('disabled', false);
				$(".region_sel_area .region_select_sigugun_modal_btn_evt span").html(data.name);
				$(".region_sel_area .region_select_sigugun_modal_btn_evt span").removeClass("color_disable");
				$(".region_sel_area .region_select_sigugun_modal_btn_evt").addClass("bder_valid");
				
				zip = data.zipcode;
				lat = data.latitude;
				lot = data.longitude;
			}
			
		}

		//다음 버튼 클릭
		function clickNextBtn() {
			var sidoText = $('.region_select_sido_modal_btn_evt').text().trim();
			var sigugunText = $('.region_select_sigugun_modal_btn_evt').text().trim();
			
			if (sidoText === '지역' || sigugunText === '지역') {
				showToastMsg('지역을 선택하세요');
				return;
			}
			const jsCommon = new JsCommon();
			const qsMap = jsCommon.fn_queryString_toMap();
			if (${isAutoAssignBplcNull}) {
				$('#modal_terms_agree').modal('open');
				return;
			}
			qsMap['sidoText'] = sidoText;
			qsMap['sigugunText'] = sigugunText;
			const point = getPoint(sidoText, sigugunText);
			qsMap['zip'] = point.zipHCode;
			qsMap['lat'] = point.latitude;
			qsMap['lot'] = point.longitude;
			location.href = '/matching/membership/conslt/autoAssignBplc' + '?' + jsCommon.fn_queryString_fromMap(qsMap);
		}

		function getPoint(sidoText, sigugunText) {
			const sido = hangjungdong.sido.find(sido => sido.codeNm == sidoText);
			if (sido == null) return null;

			const sigugun = hangjungdong.sigugun
				.find(sigugun => sigugun.sido == sido.sido && sigugun.codeNm == sigugunText);
			if (sigugun == null) return null;

			const zipHCode = sido.sido + sigugun.sigugun + '00000';
			const latitude = sigugun.latitude;
			const longitude = sigugun.longitude;
			return { zipHCode, latitude, longitude };
		}
		
		//동의 버튼 클릭(상담 신청)
		function handleAgreeBtnClick() {
			var qsMap = (new JsCommon()).fn_queryString_toMap();

			var recipientsNo = qsMap.recipientsNo;
			var prevPath = qsMap.prevPath;
			var tel = qsMap.tel;
			var over65Yn = qsMap.over65Yn;
			var sidoText = $('.region_select_sido_modal_btn_evt').text().trim();
			var sigugunText = $('.region_select_sigugun_modal_btn_evt').text().trim();
			
			//어르신 정보에 수정했던 지역정보 동일하게 저장할 경우
			if (zip === null || zip === '' || lat === null || lat === '' || lot === null || lot === '') {
			    
			    var objSido = hangjungdong.sido.find(f => f.codeNm === sidoText);
		        var zipData = hangjungdong.sigugun.find(f => f.sido === objSido.sido && f.codeNm === sigugunText);
		        
		        zip = zipData.code;
		        lat = zipData.latitude;
		        lot = zipData.longitude;
			}

			addMbrConslt({
				prevPath,
				recipientsNo: Number(recipientsNo),
				tel,
				over65Yn,
				sido: sidoText,
				sigugun: sigugunText,
				zip: zip,
				lat: lat,
				lot: lot,
                willAutoMatching: false,
				recommendedBplcUniqueId: '${param.rejectBplcUniqueId}'
			});
		}

		
		$(function() {
			
			var sidoName = "${mbrRecipientsVO.getSido()}";

			var objSido = hangjungdong.sido.find(item => item.codeNm==sidoName)
			if (objSido != null){
				var sigugunName = "${mbrRecipientsVO.getSigugun()}";
				if (sigugunName != undefined && sigugunName.length > 0){
					$('#nextBtn').attr('disabled', false);
				}
			}
		});
	</script>


	// 추가 js
	<script>

		$(function () {

            //시도 지역선택 입력폼에 내용없으면(=지역 color_disable) 입력폼 valid 상태
            $('.region_sel_area [class*="show-modal region"]').each(function(){

                //비활성문자(color_disable) 없으면 폼에 내용있는 상태(bder_valid)로 변환
                if ($(this).children('span').hasClass('color_disable') != true) {

                	$(this).addClass('bder_valid');

                }

            });

		
		});
		

		$(function () {
			var sidoArray = hangjungdong.sido.filter(f => f.codeNm === "${mbrRecipientsVO.getSido()}");
			
			if (sidoArray != undefined && sidoArray.length > 0){
				fn_region_select_sigugun_init(sidoArray[0].sido, "${mbrRecipientsVO.getSigugun()}")
			}
			

			regionSelectModalAddShowModalListeners();
		});

	</script>
