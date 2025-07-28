<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />
<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>

<style>

</style>
<script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function() {
	    const phoneInput = document.getElementById('phone');
	
	    if (phoneInput) {
	        phoneInput.addEventListener('input', function() {
	            let phoneValue = phoneInput.value.replace(/\D/g, '');
	
	            if (phoneValue.length <= 3) {
	                phoneInput.value = phoneValue;
	            } else if (phoneValue.length <= 7) {
	                phoneInput.value = phoneValue.slice(0, 3) + '-' + phoneValue.slice(3);
	            } else {
	                phoneInput.value = phoneValue.slice(0, 3) + '-' + phoneValue.slice(3, 7) + '-' + phoneValue.slice(7, 11);
	            }
	        });
	    }
	});
	
	function fn_dlvyInfoAdd(){
		const dlvyCnt = ${dlvyCnt};
		if(dlvyCnt > 15){
			showAlertPopup('배송지는 15개까지 등록할 수 있어요.<br>다른 배송지를 삭제한 후 시도해주세요.');
	        return false;
		} else {
			resetModal(); // 모달 초기화
			$('#modal_fullsreen_shippingReg').modal('open');
		}
	}
	
	function fn_dlvyInfoModify(flag, dlvyMngNo, bassYn){
		var flagName = '';
		
		if(flag === 'D'){
			flagName = "삭제";
			
			var data = {
					"dlvyMngNo" : dlvyMngNo
					, "flag" : flag
					, "bassYn" : bassYn
					, mustCallbackJs : true
				}
	        
	       	callPostAjaxIfFailOnlyMsg(
	  			'/matching/shop/order/shopOrderDlvyModify.json', 
	  			data,
	  			function(result) {
	  				if(result.success == undefined || !result.success){
	  					if (result.isLogin === false) {
			    			location.href = '/matching/kakao/login';
			    			return false;
			    		} else{
		  					showAlertPopup('배송지 '+ flagName +' 실패되었습니다. 관리자에게 문의 바랍니다.');
		  					location.reload();
		  					return false;
			    		}
	  				} else{
	  					$('#dlvy-' + dlvyMngNo).next('.h16').addBack().remove();
	  					
	  					if(result.dlvyCnt === 0){
	  						
	  						// 주문서화면 > 배송지 정보 초기화
		  					$('#divyContainerByOrderForm').empty();
		  					
		  					// 배송지리스트 초기화
		  					$('#dlvyListContainer').empty();
		  					$('#dlvyListContainer').removeClass('modal-content pad_20_20_40');
		  					$('#dlvyListContainer').addClass('modal-content align_center');
	                        
		  					// 배송지리스트 추가 버튼 초기화/배송지 등록 기본배송지 설정 체크박스 초기화
							$('#dlvyInsertBtn').empty();
							$('#bassDlvyCheck').empty();
		  					
		  					const dlvyListContainerHtml = "<div class=\"modal-content align_center\">"
		  							+ "<div class=\"center\">"
		  							+ "<img src=\"/html/page/app/matching/assets/src/images/08etc/deli_default.svg\" class=\"w120\" alt=\"배송지를 등록해주세요\">"
		  							+ "<div class=\"h12\"></div>"
		  							+ "<div class=\"font_sblb\">배송지를 등록해주세요</div>"
		  							+ "<div class=\"h04\"></div>"
		  							+ "<p class=\"color_t_s font_sbmr\">"
		  							+ "등록된 배송지가 없어요." + "</p>"
		  							+ "<div class=\"h32\"></div>"
		  							+ "<a class=\"modal-close waves-effect btn btn-middle btn_primary w180 modal-trigger\" onclick=\"fn_dlvyInfoAdd();\">배송지 추가</a>"
		  							+ "</div>"
		  							+ "</div>"
		  							+ "</div>"
								
							document.querySelector('#dlvyListContainer').innerHTML = dlvyListContainerHtml;
	  						
	  						const orderBassDlvyHtml = "<input type=\"hidden\" id=\"dlvy-hiddenMngNo\" name=\"dlvyMngNo\" value=\"\">"
	  							+ "<div class=\"box_order_list padH24W20 radius16 center\">"
	  							+ "<div class=\"color_t_s font_sbmr\">배송지를 등록해주세요.</div>"
	  							+ "<div class=\"h16\"></div>"
	  							+ "<a class=\"waves-effect btn btn-middle btn_primary w120 modal-trigger\" href=\"#modal_fullsreen_shippingReg\">"
	  							+ "배송지 추가"
	  							+ "</a>"
	  							+ "</div>";
								
							document.querySelector('#divyContainerByOrderForm').innerHTML = orderBassDlvyHtml;
	  						
							updateOrderButtonStatus();
	  						resetModal();
	  					}
	  					
	  				}
	  			}
	  		);
			
		} else if(flag === 'S'){
			flagName = "선택";
			
	        const mblTelnoElement = document.getElementById('dlvy-mblTelno');
	        const addrElement = document.getElementById('dlvy-addr');
	        const nameElement = document.getElementById('dlvy-name');
	        
	        const badgeElement = document.getElementById('badge-default');
	        const hiddenMngNoElement = document.getElementById('dlvy-hiddenMngNo');
	        
	        if (mblTelnoElement && addrElement) {
			    const deliveryElement = document.getElementById('dlvy-'+dlvyMngNo);
			    const newPhone = deliveryElement.querySelector('span').getAttribute('data-phone');
			    const addr = deliveryElement.querySelector('span').getAttribute('data-addr');
			    const daddr = deliveryElement.querySelector('span').getAttribute('data-daddr');
			    const zip = deliveryElement.querySelector('span').getAttribute('data-zip');
			    const name = deliveryElement.querySelector('span').getAttribute('data-name');
				
			    var recipientsNm = '${recipientsNm}';
			    
			    if (recipientsNm.trim() === name.trim()) {
			        document.getElementById('diffDlvy').style.display = 'none';
			    } else {
			        document.getElementById('diffDlvy').style.display = 'block';
			    }
			    
			    const newAddr = addr+ " "+ daddr + " [" + zip + "]";
			    
	            mblTelnoElement.textContent = newPhone;
	            addrElement.innerHTML = newAddr;
	            nameElement.innerHTML = name;
	            
	            if (bassYn !== 'Y') {
	                if (badgeElement) {
	                    badgeElement.remove();
	                }
	            } else {
	                if (!badgeElement) {
	                    const newBadgeElement = document.createElement('div');
	                    newBadgeElement.id = 'badge-default';
	                    newBadgeElement.className = 'badge_greenLight';
	                    newBadgeElement.textContent = '기본 배송지';
	                    nameElement.parentNode.insertBefore(newBadgeElement, nameElement.nextSibling);
	                } else {
	                    badgeElement.innerHTML = '<div class="badge_greenLight">기본 배송지</div>';
	                }
	            }

	            if (hiddenMngNoElement) {
	                hiddenMngNoElement.value = dlvyMngNo;
	            }

	            $('#modal_fullsreen_shippingList').modal('close');
	        }
		    
		}
		
	}
	
	
	async function fn_dlvyInsert(){
		
		const isChecked = $('#chk_defaultShipping').is(':checked');
		var bassDlvyYn = '';
     	if(isChecked){
     		bassDlvyYn = 'Y';
     	} else {
     		bassDlvyYn = 'N';
     	}
     	
	    const recipientNm = document.getElementById('recipientNm').value.trim();
	    const phone = document.getElementById('phone').value.trim();
	    const address = document.getElementById('address').value.trim();
	    const detailAddress = document.getElementById('detailAddress').value.trim();
	    
	    const latitude = document.getElementById('latitude').value.trim();
	    const longitude = document.getElementById('longitude').value.trim();
	    const hcode = document.getElementById('hcode').value.trim();
	    const zoneno = document.getElementById('zoneno').value.trim();
	    
	    if (!recipientNm) {
	    	showAlertPopup('이름을 확인해주세요');
	        return false;
	    }

	    const phonePattern = /^010-\d{4}-\d{4}$/;
	    if (!phonePattern.test(phone)) {
	    	showAlertPopup('번호를 확인해주세요');
	        return false;
	    }

	    if (!address) {
	    	showAlertPopup('주소를 입력해주세요');
	        return false;
	    }

	    if (!detailAddress) {
	    	showAlertPopup('상세주소를 입력해주세요');
	        return false;
	    }
	    
	    var recipientsNo = '${recipientsNo}';
		var data = {
				"recipientsNo" : recipientsNo
				, "recipientNm" : recipientNm
				, "phone" : phone
				, "address" : address
				, "detailAddress" : detailAddress
				, "latitude" : latitude
				, "longitude" : longitude
				, "hcode" : hcode
				, "zoneno" : zoneno
				, "bassDlvyYn" : bassDlvyYn
				, mustCallbackJs : true
			}
		
      	callPostAjaxIfFailOnlyMsg(
			'/matching/shop/order/shopOrderDlvyInsert.json', 
			data,
			function(result) {
				if(result.success == undefined || !result.success){
					if (result.isLogin === false) {
		    			location.href = '/matching/kakao/login';
		    			return false;
		    		} else{
		    			showAlertPopup('배송지 등록 실패되었습니다. 관리자에게 문의 바랍니다.');
						return false;
		    		}
				} else{
					
					$('#modal_fullsreen_shippingReg').modal('close');
					window.history.back();
					
					if(result.bassDlvy === 'Y'){
						
						const orderBassDlvyHtml = "<div class=\"box_order_list padH24W20 radius16\">" 
							+ "<div class=\"d-flex align-items-center gap08\">" 
							+ "    <div class=\"font_sbmb\" id=\"dlvy-name\">"+result.dlvy.dlvyNm+"</div>" 
							+ "    <div id=\"badge-default\" class=\"badge_greenLight\">기본 배송지</div>"
							+ "</div>"
							+ "<div class=\"h08\"></div>"
							+ "<span id=\"dlvy-mblTelno\" class=\"font_sbsr\">"+result.dlvy.mblTelno+"</span>"
							+ "<p id=\"dlvy-addr\" class=\"font_sbsr marT4\">"
							+ result.dlvy.addr + " " + result.dlvy.daddr + " ["+ result.dlvy.zip + "]"
							+ "</p>"
							+ "<input type=\"hidden\" id=\"dlvy-hiddenMngNo\" name=\"dlvyMngNo\" value=" + result.dlvy.dlvyMngNo +">"
							+ "		<div class=\"h16\"></div>"
							+ "		<a class=\"input_basic fake_select broad_evt modal-trigger\" data-code=\"DLVY010\" href=\"#modal_shipping_msg\">"
							+ "			배송 전 미리 연락해주세요." + "</a>"
							+ "		<div class=\"evt_msgTextarea\" style=\"display: none;\">"
							+ "			<div class=\"relative marT8\">"
							+ "				<textarea rows=\"3\" class=\"input_basic textBox\" maxlength=\"20\" style=\"height:110px !important;\"></textarea>"
							+ "				<div class=\"textLengthWrap\">"
							+ "					<span class=\"textCount\">0</span>"
							+ "					<span class=\"textTotal\">/20</span>"
							+ "				</div>"			
							+ "			</div>"			
							+ "		</div>"
							+ "</div>"
							
						document.querySelector('#divyContainerByOrderForm').innerHTML = orderBassDlvyHtml;
							
						const dlvyListBtnHtml = "<a class=\"waves-effect btn btn_cancel modal-trigger\" href=\"#modal_fullsreen_shippingList\">배송지 목록</a>";
						document.querySelector('#dlvyListBtn').innerHTML = dlvyListBtnHtml;
						
						const dlvyInsertBtnHtml = "<div class=\"btn_area d-flex\">"
							+"<a class=\"waves-effect btn btn-large w100p btn_cancel modal-trigger\" onclick=\"fn_dlvyInfoAdd();\">배송지 추가</a>"
							+"</div>"
							+"</div>";
						document.querySelector('#dlvyInsertBtn').innerHTML = dlvyInsertBtnHtml;
						
						const bassDlvyCheckHtml = "<input type=\"checkbox\" id=\"chk_defaultShipping\" name=\"chk_defaultShipping\" class=\"chk02\">"
													+ "<label for=\"chk_defaultShipping\" class=\"color_tp_s font_sbsr\">기본 배송지로 설정</label>";
						document.querySelector('#bassDlvyCheck').innerHTML = bassDlvyCheckHtml;
						
						$('#dlvyListContainer').empty();
						$('#dlvyListContainer').removeClass('modal-content align_center');
	  					$('#dlvyListContainer').addClass('modal-content pad_20_20_40');
	  					
					}
					
					// 리스트 html 랜더링
					refreshDlvyList(result.dlvyList);
					updateOrderButtonStatus();
				}
			}
		);
		
	}
	
	function resetModal() {
	    const modal = $('#modal_fullsreen_shippingReg');

	    modal.find('input[type="text"], input[type="tel"], textarea').val('');
	    modal.find('input[type="checkbox"]').prop('checked', false);
	    modal.find('#address').val('').prop('disabled', true);
	    modal.find('#detailAddress').val('');
	    modal.find('input[type="hidden"]').val('');
	    modal.find('#addressSearchContainer').hide();
	    modal.find('#addressInsertForm').show();
	}
	
	function refreshDlvyList(dlvyList){
		
		$('#dlvyListContainer').empty();
		
	    dlvyList.filter(item => item.bassDlvyYn === 'Y').forEach(item => {
	        const html = createDlvyHtml(item, true);
	        $('#dlvyListContainer').append(html);
	    });

	    dlvyList.filter(item => item.bassDlvyYn !== 'Y').forEach(item => {
	        const html = createDlvyHtml(item, false);
	        $('#dlvyListContainer').append(html);
	    });

	    $('#dlvyListContainer').append('<div class="h16"></div>');
		
	}
	
	function createDlvyHtml(item, isDefault) {
	    let html = "<div class=\"box_order_list padH24W20 radius16\" id=\"dlvy-" + item.dlvyMngNo + "\">"
	        + "<div class=\"align_between_center\">"
	        + "    <div class=\"d-flex align-items-center gap08\">"
	        + "        <div class=\"font_sbmb\">" + item.dlvyNm + "</div>";
	
	    if (isDefault) {
	        html += "        <div class=\"badge_greenLight\">기본 배송지</div>";
	    }
	
	    const selectValue = isDefault ? 'Y' : 'N';
	    html += "    </div>"
	        + "    <a class=\"waves-effect btn btn_primary w72\" onclick=\"fn_dlvyInfoModify('S', " + item.dlvyMngNo + ", '" + selectValue + "');\">선택</a>"
	        + "</div>"
	        + "<div class=\"h08\"></div>"
	        + "<span class=\"font_sbsr\" data-phone=\"" + item.mblTelno + "\""
	        + "      data-addr=\"" + item.addr + "\" data-daddr=\"" + item.daddr + "\""
	        + "      data-zip=\"" + item.zip + "\" data-name=\"" + item.dlvyNm + "\">"
	        + item.mblTelno
	        + "</span>"
	        + "<p class=\"font_sbsr marT4\">"
	        + item.addr + " " + item.daddr + " [" + item.zip + "]"
	        + "</p>"
	        + "<div class=\"h16\"></div>"
	        + "<div class=\"d-flex gap08\">"
	        + "    <a class=\"waves-effect btn btn_cancel btn_white_bder w72\""
	        + "       onclick=\"fn_dlvyInfoModify('D', " + item.dlvyMngNo + ", '" + selectValue + "');\">삭제</a>"
	        + "</div>"
	        + "</div>"
	        + "<div class=\"h16\"></div>";
	
	    return html;
	}
</script>

<!-- 배송지 목록 Modal fullsreen -->
<div id="modal_fullsreen_shippingList" class="modal fullscreen">
    <div class="modal_header">
        <h4 class="modal_title">배송지 목록</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>

		<c:choose>
			<c:when test="${empty dlvyList}">
				<div id="dlvyListContainer" class="modal-content align_center">
					<div class="modal-content align_center">
			            <div class="center">
			                <img src="/html/page/app/matching/assets/src/images/08etc/deli_default.svg" class="w120"
			                    alt="배송지를 등록해주세요">
			                <div class="h12"></div>
			                <div class="font_sblb">배송지를 등록해주세요</div>
			                <div class="h04"></div>
			                <p class="color_t_s font_sbmr">
			                    등록된 배송지가 없어요.
			                </p>
			                <div class="h32"></div>
			                <a class="modal-close waves-effect btn btn-middle btn_primary w180 modal-trigger" onclick="fn_dlvyInfoAdd();">배송지 추가</a>
			            </div>
			        </div>
		        </div>
			</c:when>
			<c:otherwise>
				<div class="modal-content pad_20_20_40" id="dlvyListContainer">
				<c:forEach var="dlvyList" items="${dlvyList}" varStatus="status">
			        <div class="box_order_list padH24W20 radius16" id="dlvy-${dlvyList.dlvyMngNo}">
				        <div class="align_between_center">
	                        <div class="d-flex align-items-center gap08">
	                            <div class="font_sbmb">${dlvyList.nm}</div>
	                            <c:if test="${dlvyList.bassDlvyYn eq 'Y'}"> <div class="badge_greenLight">기본 배송지</div> </c:if>
	                        </div>
	                        <a class="waves-effect btn btn_primary w72" onclick="fn_dlvyInfoModify('S', ${dlvyList.dlvyMngNo}, '${dlvyList.bassDlvyYn}');">선택</a>
	                    </div>
			            <div class="h08"></div>
			            <span class="font_sbsr" data-phone="${dlvyList.mblTelno}"
				              data-addr="${dlvyList.addr}" 
				              data-daddr="${dlvyList.daddr}" 
				              data-zip="${dlvyList.zip}"
				              data-name="${dlvyList.nm}">
				            ${dlvyList.mblTelno}
				        </span>
			            <p class="font_sbsr marT4">
			                ${dlvyList.addr}&nbsp;${dlvyList.daddr}&nbsp;[${dlvyList.zip}]
			            </p>
			
			            <div class="h16"></div>
			            <div class="d-flex gap08">
			                <a class="waves-effect btn btn_cancel btn_white_bder w72" onclick="fn_dlvyInfoModify('D', ${dlvyList.dlvyMngNo}, '${dlvyList.bassDlvyYn}');">삭제</a>
			                <%-- 추후 개발 예정
			                <a class="waves-effect btn btn_cancel btn_white_bder w72">수정</a>
			                --%>
			            </div>
			        </div>
					<div class="h16"></div>
				</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	
		<div class="modal-footer" id="dlvyInsertBtn">
			<c:if test="${!empty dlvyList}">
		    <div class="btn_area d-flex">
		    	<a class="waves-effect btn btn-large w100p btn_cancel modal-trigger" onclick="fn_dlvyInfoAdd();">배송지 추가</a>
		    </div>
		    </c:if>
		</div>
</div>


<!-- 배송지 등록 Modal fullsreen -->
<div id="modal_fullsreen_shippingReg" class="modal fullscreen">
    <div class="modal_header">
        <h4 class="modal_title">배송지 등록</h4>
        <div id="insertModalClose" class="close_x modal-close waves-effect"></div>
    </div>
    <!-- 주소 검색 UI를 위한 div -->
	<div id="addressSearchContainer" style="display:none;">
      	<div id="addressSearch" style="width:100%; height:100%"></div>
  	</div>
  	<div id="addressInsertForm">
    <div class="modal-content pad_20_20_40">
        <div class="font_sblb">배송지 등록 후 주문요청해주세요</div>
        <div class="h32"></div>
        
        <!-- 받는분 필드 -->
        <label class="input_label" for="recipientNm">받는분</label>
        <input type="text" id="recipientNm" name="recipientNm" class="input_basic" placeholder="어르신 이름">
        <div class="h32"></div>

        <!-- 받는분 연락처 필드 -->
        <label class="input_label" for="phone">받는분 연락처</label>
        <input type="tel" id="phone" name="phone" class="input_basic" placeholder="010-1234-5678">
        <div class="h32"></div>

        <!-- 주소 필드 -->
        <label class="input_label" for="address">주소</label>
        <div class="flex_input_btn">
            <input type="text" id="address" name="address" class="input_basic" disabled>
            <a class="waves-effect btn-large btn_primary btn_white" id="searchAddressBtn">검색</a>
        </div>

        <!-- 상세 주소 필드 -->
        <input type="text" id="detailAddress" name="detailAddress" class="input_basic marT8" placeholder="상세 주소">
        <div class="h32"></div>
		
        <!-- 기본 배송지 체크박스  -->
        <div id="bassDlvyCheck">
	        <c:if test="${bassDlvyVO ne null}">
	        	<input type="checkbox" id="chk_defaultShipping" name="chk_defaultShipping" class="chk02">
	        	<label for="chk_defaultShipping" class="color_tp_s font_sbsr">기본 배송지로 설정</label>
	        </c:if>
        </div>
        
         <!-- 위도, 경도, 행정동 코드 필드 (숨김 처리) -->
        <input type="hidden" id="hcode" name="hcode">
        <input type="hidden" id="latitude" name="latitude">
        <input type="hidden" id="longitude" name="longitude">
        <input type="hidden" id="hcode" name="hcode">
        <input type="hidden" id="zoneno" name="zoneno">
        
    </div>
    <div class="modal-footer">
        <div class="btn_area d-flex">
            <a class="waves-effect btn btn-large w100p btn_primary" onclick="fn_dlvyInsert();">저장</a>
        </div>
    </div>
    </div>
</div>
<!-- fullsreen end -->





<!-- 배송지 목록 내용 없을때 Modal fullsreen -->
<div id="modal_fullsreen_shippingList_no" class="modal fullscreen">
    <div class="modal_header">
        <h4 class="modal_title">배송지 목록</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content align_center">
        <div class="center">
            <img src="/html/page/app/matching/assets/src/images/08etc/page_default.svg" class="w150"
                alt="화면을 불러오지 못했어요">
            <div class="h12"></div>
            <p class="color_t_s font_sbmr">
                배송지를 추가해주세요
            </p>
            <div class="h20"></div>
            <a class="modal-close waves-effect btn btn-middle btn_primary w180 modal-trigger" href="#modal_fullsreen_shippingReg">배송지 추가</a>
        </div>
    </div>
    <!-- modal-content -->
</div>
<!-- fullsreen end -->

<script type="text/javascript">
document.getElementById('searchAddressBtn').addEventListener('click', function() {
	
	var addressInsertForm = document.getElementById('addressInsertForm');
    addressInsertForm.style.display = 'none';
    
    var addressSearchContainer = document.getElementById('addressSearchContainer');
    addressSearchContainer.style.display = 'block';
	
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            var jibunAddr = (data.autoJibunAddress && data.autoJibunAddress != "")?data.autoJibunAddress:data.jibunAddress;
			
            document.getElementById('address').value = roadAddr ? roadAddr : jibunAddr;
            document.getElementById('detailAddress').value = "";

			document.getElementById('hcode').value = data.bcode;
			document.getElementById('zoneno').value = data.zonecode;

            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch(roadAddr, function(result, status) {
				
                if (status === kakao.maps.services.Status.OK) {
                    var lat = result[0].y; // 위도
                    var lng = result[0].x; // 경도
                    
                    document.getElementById('latitude').value = lat;
                    document.getElementById('longitude').value = lng;
                    
                } else {
					geocoder.addressSearch(jibunAddr, function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var lat = result[0].y; // 위도
							var lng = result[0].x; // 경도
							
							document.getElementById('latitude').value = lat;
							document.getElementById('longitude').value = lng;
							
						}else{
							console.error('Geocoder 주소 검색 실패: ' + status);
						}
					});
                    
                }
            });
            
            addressSearchContainer.style.display = 'none';
            addressInsertForm.style.display = 'block';
        }
    }).embed(document.getElementById('addressSearch'));
    
    setTimeout(function checkLayer() {
        var addressSearch = document.getElementById('addressSearch');
        var daumLayer = addressSearch.querySelector('div');

        if (daumLayer) {
            daumLayer.style.width = '100%';
            daumLayer.style.height = 'calc(100vh - 120px)';
            
        } else {
            setTimeout(checkLayer, 100);
        }
    }, 100);
});
</script>
