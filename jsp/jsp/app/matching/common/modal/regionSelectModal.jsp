<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- 지역선택 팝업 -->
		
		<!-- new -->
        <!-- 시/도 modal -->
        <div id="region_select_sido_modal" class="bottom-sheet_handle">
            <div class="sheet-overlay"></div>
            <div class="content">
                <div class="drag_handle_area drag-icon">
                    <span class="drag_handle"></span>
                </div>
                <div class="modal_header">
                    <h4 class="modal_title">
                        <div class="breadCb">
                            <span class="dept01 active">시/도</span>
                            <span class="dept02">시/군/구</span>
                        </div>
                    </h4>
                    <div class="close_x close_modal"></div>
                </div>
                <div class="modal-content">


                    <div class="h16"></div>

                    <ul title="region01" class="chip_area" id="ulSido">
    
                        <li class="show-modal region02_btn_evt close_modal">서울특별시</li>
    
    
                    </ul>
    
    

                </div>

            </div>
        </div>
        <!-- mr1_modal -->

		<!-- new -->
        <!-- 시/군/구 modal -->
        <div id="region_select_sigugun_modal" class="bottom-sheet_handle">
            <div class="sheet-overlay"></div>
            <div class="content">
                <div class="drag_handle_area drag-icon">
                    <span class="drag_handle"></span>
                </div>
                <div class="modal_header">
                    <h4 class="modal_title">
                        <div class="breadCb">
                            <span class="dept01 selected">서울특별시</span>
                            <span class="dept02 active">시/군/구</span>
                        </div>
                    </h4>
                    <div class="close_x close_modal"></div>
                </div>
                <div class="modal-content">


                    <div class="h16"></div>

                    <ul title="region02" class="chip_area ulSigugun" id="ulSigugun">

                        <li class="close_modal">강남구</li>
    
                    </ul>
    
    

                </div>

            </div>
        </div>
        <!-- mr2_modal -->

		
	<script>
		
		// kind (region_sido, region_sigugun)
		// function fn_popup_selected(alert_val, popKind, popup_param, data, extra){
		// }

		var _var_region_select_enable_sigungu = false;
		// 시/도 셋팅
		function fn_region_select_sido_init() {
			var template = '';
			for(var i = 0; i < hangjungdong.sido.length; i++) {
				template += '<li code="' + hangjungdong.sido[i].sido + '">' + hangjungdong.sido[i].codeNm + '</li>';
			}
			$('#region_select_sido_modal #ulSido').html(template);

			$('#region_select_sido_modal #ulSido li').click(fn_region_select_sido_click);

		}

		// 시/군/구 셋팅
		function fn_region_select_sigugun_init(sidoCode, sigugunText) {
			_var_region_select_enable_sigungu = true;

	    	var sidoArray = hangjungdong.sido.filter(f => f.sido === sidoCode);
			if (sidoArray != undefined && sidoArray.length > 0){
				$("#region_select_sigugun_modal .modal_header .breadCb .dept01").html(sidoArray[0].codeNm)
			}

			var sigugunArray = hangjungdong.sigugun.filter(f => f.sido === sidoCode);
			var template = '';
			
			var selectedSigugunIdx = 0;
			for(var i = 0; i < sigugunArray.length; i++) {
				if (sigugunText != undefined && sigugunText.length > 0){
					if (sigugunArray[i].codeNm == sigugunText) selectedSigugunIdx = i;
				}
				template += '<li class="waves-effect modal-close" code="' + sigugunArray[i].sido + '" sigugun="' + sigugunArray[i].sigugun + '" zipcode="'+sigugunArray[i].code+'" latitude="'+sigugunArray[i].latitude+'" longitude="'+sigugunArray[i].longitude+'" >' + sigugunArray[i].codeNm + '</li>';
			}
			$('#region_select_sigugun_modal #ulSigugun').html(template);

			$('#region_select_sigugun_modal #ulSigugun li').click(fn_region_select_sigugun_click);
			$('#region_select_sigugun_modal #ulSigugun li')[selectedSigugunIdx].click();
		}
	
		// 시/도 셋팅
		function fn_region_select_sido_click() {
			//셀렉트박스 텍스트 변경
			var code = $(this).attr('code');

			if (code == undefined || code.length < 1){
				return;
			}

            var thisTxt = $(this).text();
			
			
			// 시/군/구 셋팅
			fn_region_select_sigugun_init(code);
			

            $('#region_select_sigugun_modal .dept01').text(thisTxt);

			//버튼 활성화 클래스변경
            $(this).parent('.chip_area').find('li').removeClass('active');
            $(this).addClass('active');


			fn_popup_selected('selected', 'region_sido', {}, {code, name:thisTxt});

			var nextBtnCssSelector = $(this).attr("nextBtnCssSelector")
			if (nextBtnCssSelector == undefined || nextBtnCssSelector.length > 0){
				nextBtnCssSelector = ".region_select_sigugun_modal_btn_evt";
			}
			if ($(nextBtnCssSelector).length > 0){
				$(nextBtnCssSelector)[0].click();
			}
		}

		function fn_region_select_sigugun_click(){
			
            var thisTxt = $(this).text();
			var code = $(this).attr('code');
			var sigugun = $(this).attr('sigugun');
			var zipcode = $(this).attr('zipcode');
			var latitude = $(this).attr('latitude');
			var longitude = $(this).attr('longitude');
             
          	//버튼 활성화 클래스변경
            $(this).parent('.chip_area').find('li').removeClass('active');
            $(this).addClass('active');
            

			fn_popup_selected('selected', 'region_sigugun', {}, {code, sigugun, zipcode, longitude, latitude, name:thisTxt});

            hideBottomSheet();
		}

		// Function to handle modal button click
		const regionSelectModalHandleModalButtonClick = (e) => {
		    const btn = e.currentTarget;
		    const modalId = btn.classList.contains("region_select_sido_modal_btn_evt") ? "#region_select_sido_modal" : /*시도 선택*/
		                    btn.classList.contains("region_select_sigugun_modal_btn_evt") ? "#region_select_sigugun_modal" : /*시군구 선택*/
							null;

			if (modalId=="#region_select_sigugun_modal" && !_var_region_select_enable_sigungu){
				return;
			}
		    if (modalId) {
		        const targetSheet = document.querySelector(modalId);
		        hideBottomSheet();
		        showBottomSheet(targetSheet);
		    }
		};

		// Add event listeners to all show-modal buttons
		const regionSelectModalAddShowModalListeners = () => {
		    const allShowModalBtns = document.querySelectorAll(".show-modal");
		    allShowModalBtns.forEach(btn => {
		        btn.addEventListener("click", regionSelectModalHandleModalButtonClick);
		    });
		};

		$(function(){
			fn_region_select_sido_init();

		});
	</script>