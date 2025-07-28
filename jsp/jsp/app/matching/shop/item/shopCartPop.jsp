<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	form#orderForm{
		height:100%;
		max-height:100%;
	}
</style>
<script type="text/javascript">
	window.addEventListener('load', function() {
	    if (sessionStorage.getItem('refreshPage')) {
	        sessionStorage.removeItem('refreshPage');
	        window.location.reload();
	    }
	});
	
	
	var recipientsNo = '${mbrRecipientsLongtermInfoVO.recipientsNo}';
	var cartTotalCnt = ${cartTotalCnt};
	
	$(function(){
		
		//open
        $('.cart_modal').modal('open');
		
        if(cartTotalCnt > 0){
        	//modal_header내용을 modal-content안에 이동
            $('.cart_modal .modal_header').prependTo($('.cart_modal .modal-content'));
        }
		
	    //옵션셀렉트
	    $('.order_chip li').click(function(){
	        $(this).parent('.order_chip').find('li').removeClass('active');
	        $(this).addClass('active');
	    });

	    //더 보기 버튼토글
	    $('.toggle_btn_area .evt_detailBtn').on('click', function() {
	        if($(this).parent('.toggle_btn_area').hasClass('active')==true){
	            $(this).parent('.toggle_btn_area').removeClass('active');
	            $('.evt_title').text('더 보기');
	
	        }
	        else{
	            $(this).parent('.toggle_btn_area').addClass('active');
	            $('.evt_title').text('접기');
	            
	        }
	    });
	
	});


    ////////////////////////////////
    //장바구니 팝업
    $(function(){

        //disabled 일때
        $('.cart_obj_area').each(function(){
            if($(this).find('.cart_chk_area :checkbox').is(':disabled')==true){
                $(this).addClass('disabled');
            }
            else{
                $(this).removeClass('disabled');
            }
        });
        
     	// 체크박스 전체를 체크 상태로 설정 (페이지 로드 시)
        $('.cart_chk_area :checkbox:not(:disabled)').prop('checked', true);

        carLengthChk();
        
        if(cartTotalCnt != 0){
        	calculateTotalQuantity();
    	    calculateTotalPrice();
        }

        $('#cart_chk_total').on('click', function() {
            if($(this).is(':checked')==true){
                $('.cart_chk_area :checkbox:not(:disabled)').prop('checked', true);
                carLengthChk();		
            } else{
                $('.cart_chk_area :checkbox:not(:disabled)').prop('checked', false);	
                carLengthChk();
            }
            
            calculateTotalQuantity();
            calculateTotalPrice();
            
        });

        $(".cart_chk_area :checkbox").click(function() {

            var total = $(".cart_chk_area :checkbox").length;
            var checked = $(".cart_chk_area :checkbox:checked").length;
            
            if (checked > 0) {
                $('#orderButton').removeClass('disabled');
                $('#selectedDelBtn').removeClass('disabled');
            } else {
            	$('#orderButton').addClass('disabled');
            	$('#selectedDelBtn').addClass('disabled');
            }
            
            $('.num_total').text(total);
            $('.num_chk').text(checked);	

            if(total != checked) $("#cart_chk_total").prop("checked", false);
            else $("#cart_chk_total").prop("checked", true); 
            
            // 체크박스 변경 시 총 금액 및 수량 재계산
            calculateTotalQuantity();
            calculateTotalPrice();

        });

    });
    
  	//장바구니 체크박스
    function carLengthChk(){
        var total = $(".cart_chk_area :checkbox").length;
        var checked = $(".cart_chk_area :checkbox:checked").length;
        
        if (checked > 0) {
            $('#orderButton').removeClass('disabled');
            $('#selectedDelBtn').removeClass('disabled');
        } else {
        	$('#orderButton').addClass('disabled');
        	$('#orderButton').parent().removeAttr('onclick');
        	$('#selectedDelBtn').addClass('disabled');
        }
        
        $('.num_total').text(total);
        $('.num_chk').text(checked);
    };
    
    
   	let totalQuantity = 0;
   	let totalPrice = 0;
   	
	if(cartTotalCnt != 0){
   		
		if (cartTotalCnt !== 0) {
		    document.addEventListener('DOMContentLoaded', function() {
		        calculateTotalQuantity();
		        calculateTotalPrice();

		        function updateExpectedAmount(quantityInput, priceElement, unitPrice) {
		            const quantity = parseInt(quantityInput.value, 10);
		            if (!isNaN(quantity)) {
		                const expectedAmount = Math.round((quantity * unitPrice) / 10) * 10;
		                priceElement.textContent = expectedAmount.toLocaleString() + '원';
		            }
		        }
		        
		        document.querySelectorAll('.order_quantity').forEach(function(orderQuantity) {
		        	const minusButton = orderQuantity.querySelector('.minus');
		        	
		        	const quantityInput = orderQuantity.querySelector('.num.input_noClass');
		            const priceElement = orderQuantity.parentNode.querySelector('.price');
		            const hiddenInput = orderQuantity.parentNode.querySelector('input[name^="items"][name$=".currentQuantity"]');
		            
		            const unitPrice = parseInt(priceElement.textContent.replace(/[^\d]/g, ''), 10) / parseInt(quantityInput.value, 10);
					
	                if (parseInt(quantityInput.value, 10) === 1) {
	                    minusButton.classList.add('disa');
	                }
		         
		            orderQuantity.querySelector('.minus').addEventListener('click', function() {
		            	let currentQuantity = parseInt(quantityInput.value, 10);
		            	
		                if (!isNaN(currentQuantity) && currentQuantity > 1) {
		                    quantityInput.value = currentQuantity - 1;
		                    updateExpectedAmount(quantityInput, priceElement, unitPrice);
		                    hiddenInput.value = quantityInput.value;
		                    calculateTotalQuantity();
		                    calculateTotalPrice();
		                }
		                
		             	// 수량이 1일 때 - 버튼 비활성화
	                    if (parseInt(quantityInput.value, 10) === 1) {
	                        minusButton.classList.add('disa');
	                    }
		                
		                if (parseInt(quantityInput.value, 10) === 0) {
		                    minusButton.classList.add('disa');
		                    
		                    const orderQuantity = quantityInput.closest('.cart_obj_area');
		                    
		                    if (orderQuantity) {
		                        const checkbox = orderQuantity.querySelector('input[type="checkbox"]');
		                        if (checkbox) {
		                            checkbox.checked = false;
		                        }
		                    }

		                    carLengthChk();
		                    $("#cart_chk_total").prop("checked", false);
		                }
		            });
				
		            orderQuantity.querySelector('.plus').addEventListener('click', function() {
		                let currentQuantity = parseInt(quantityInput.value, 10);
		                if (!isNaN(currentQuantity) && currentQuantity >= 0) {
		                    quantityInput.value = currentQuantity + 1;
		                    updateExpectedAmount(quantityInput, priceElement, unitPrice);
		                    hiddenInput.value = quantityInput.value;
		                    calculateTotalQuantity();
		                    calculateTotalPrice();
		                }
		                
		                if (parseInt(quantityInput.value, 10) > 1) {
		                    minusButton.classList.remove('disa');
		                }
		            });

		            quantityInput.addEventListener('change', function() {
		                updateExpectedAmount(quantityInput, priceElement, unitPrice);
		                hiddenInput.value = quantityInput.value;
		                calculateTotalQuantity();
		                calculateTotalPrice();
		                
		             	// 수량이 1일 때 - 버튼 비활성화
	                    if (parseInt(quantityInput.value, 10) <= 1) {
	                        minusButton.classList.add('disa');
	                    } else {
	                        minusButton.classList.remove('disa');
	                    }
		            });
		        });


		    });
		}
   		
   	}
	
	
	// 총 수량 계산
	function calculateTotalQuantity() {
	    totalQuantity = 0;
	    const checkedItems = document.querySelectorAll('.cart_chk_area input[type="checkbox"]:checked');
	    checkedItems.forEach(function(checkbox) {
	        const quantityInput = checkbox.closest('.cart_obj_area').querySelector('.input_noClass');
	        const value = parseInt(quantityInput.value, 10);
	        if (!isNaN(value)) {
	            totalQuantity += value;
	        }
	    });
	    document.querySelector('#totalQuantityDisplay').textContent = totalQuantity + "개";
	}

	// 총 예상금액 계산
	function calculateTotalPrice() {
	    totalPrice = 0;
	    const checkedItems = document.querySelectorAll('.cart_chk_area input[type="checkbox"]:checked');
	    checkedItems.forEach(function(checkbox) {
	        const quantityInput = checkbox.closest('.cart_obj_area').querySelector('.input_noClass');
	        const priceElement = checkbox.closest('.cart_obj_area').querySelector('.price');
	        
	        const unitPrice = parseInt(priceElement.textContent.replace(/[^\d]/g, ''), 10);
	        const quantity = parseInt(quantityInput.value, 10);
			
	        if (!isNaN(quantity) && !isNaN(unitPrice)) {
	            totalPrice += unitPrice;
	        }
	    });

	    totalPrice = Math.round(totalPrice / 10) * 10;
	    document.querySelector('#totalPriceDisplay').textContent = totalPrice.toLocaleString() + '원';
	}
	
	
    
   	async function fn_deleteShopCartItems(itId = null, ioNo = null) {
   	   	
   		var delAlertShowYn = '';
		if(itId === null){
			delAlertShowYn = 'Y';
		}
		
   		const selectedItems = [];
   	    if (itId && ioNo) {
   	        selectedItems.push({ itId: itId, ioNo: ioNo });
   	    } else {
   	        $(".cart_chk_area :checkbox:checked").each(function() {
   	            const itemId = $(this).data('itid');
   	            const ioNo = $(this).data('ionumber');
   	            selectedItems.push({ itId: itemId, ioNo: ioNo });
   	        });
   	    }

   	    if (selectedItems.length === 0) {
   	        showAlertPopup('삭제할 항목을 선택하세요.');
   	        return;
   	    }
		
   	    const data = {
   	        "items": selectedItems,
   	        "recipientsNo": recipientsNo
   	    };
   	    
   	    if(delAlertShowYn === 'Y'){
   	    	const answer = await showConfirmPopup('선택된 상품을 삭제 하시겠어요?', '');
   	        if (answer === 'confirm') {
   	            cartItemsDeleteAction(data);
   	        }
   	    } else {
   	    	cartItemsDeleteAction(data);
   	    }

   	}
   	
   	function cartItemsDeleteAction(data) {
   	    callPostAjaxIfFailOnlyMsg(
   	        '/matching/shop/order/deleteShopCartItems.json',
   	        data,
   	        function(result) {
   	            if (result.success == undefined || !result.success) {
   	                if (result.isLogin === false) {
   	                    location.href = '/matching/kakao/login';
   	                    return false;
   	                } else {
   	                    showAlertPopup('선택된 상품 삭제가 실패되었습니다. 관리자에게 문의 바랍니다.');
   	                    location.reload();
   	                }
   	            } else {
   	                setTimeout(function() {
   	                    location.reload();
   	                }, 1000);
   	            }
   	        }
   	    );
   	}

	
    <%-- 주문서작성 action --%>
    async function fn_OrderCheck(){
  		
    	let canProceed = true;
    	
    	let totalSum = 0;
		const selectedItems = [];
	 	const quantityByCaId = {};
	 	
	    $(".cart_chk_area :checkbox:checked").each(function() {
	    	const index = $(this).data('index');
	        const itemId = $(this).data('itid');
	        const ioNo = $(this).data('ionumber');
	        const ioQuantity = $(this).data('quantity');
	        const ioUnitPrice = $(this).data('unitprice');
	        const ioCaId = $(this).data('caid');
	        const ablecnt = $(this).data('ablecnt');
			
	        const currentQuantity = $('#shopCart_'+itemId+'_'+ioNo+' .num.input_noClass').val();
	        
	        const itemTotal = currentQuantity * ioUnitPrice;
            totalSum += itemTotal;
            
            if(currentQuantity === '0'){
            	canProceed = false;
            }
            
	        if (!quantityByCaId[ioCaId]) {
	            quantityByCaId[ioCaId] = {
	                index: index, // 카테고리 인덱스
	                ablecnt : ablecnt,
	                currentQuantity: 0
	            };
	        }
	     
	        quantityByCaId[ioCaId].currentQuantity += Number(currentQuantity);
	        
	        selectedItems.push({
	            itId: itemId,
	            ioNo: ioNo,
	            ioQuantity: currentQuantity,
	            ioCaId: ioCaId,
	            ablecnt: ablecnt,
	            currentQuantity : Number(currentQuantity)
	        });
	    });
	    
	    if(canProceed == false){
	    	showAlertPopup2('주문이 불가능해요', '주문 가능한 수량은 1개 이상입니다.');
	    	return false;
	    }
	    
		if(canProceed){
			var data = {
					"items" : selectedItems
					, "recipientsNo" : recipientsNo
					, "totalSum" : totalSum
					, "selfBndRt" : '${selfBndRt}'
					, mustCallbackJs : true
				}
				
	      	callPostAjaxIfFailOnlyMsg(
				'/matching/shop/order/checkOrderVaildation.json', 
				data,
				function(result) {
					if(result.success == undefined || !result.success){
						if (result.isLogin === false) {
			    			location.href = '/matching/kakao/login';
			    			return false;
			    		} else{
						    fn_showPopConnecting(result.failReason, result.errorMessage);
			    		}
					} else{
						fn_OrderAction();
						return false;
					}
				}
			);
			
		}
		
    	return false;
    }
    
    async function fn_OrderAction(){
    	
    	document.getElementById('orderForm').submit();
		return false;    	
    }
	
	async function fn_showPopConnecting(failReason, errorMessage){
  		
  		var popText1 = '';
  		var popText2 = '';
  		var connectUrl = '';
  		
  		if(failReason === 'fullSoldOut'){
  			await showAlertPopup2('주문이 불가능해요', '모든 상품이 품절되어, 주문이 불가능합니다. 다른 상품을 주문해주세요.');
			location.reload();
			return false;
  		} else if(failReason === 'partialSoldOut'){
  			await showAlertPopup('품절된 상품이 있어요<br>상품을 다시 확인해주세요');
			location.reload();
			return false;
  		} else if (failReason === 'notToDt'){
  			await showAlertPopup2('인정유효기간이 지났어요', '장기요양기관에 문의해주세요.');
			location.reload();
			return false;
  		} else if (failReason === 'notRemainAmt'){
  			await showAlertPopup2('장기요양급여가 부족해요', '남은 장기요양급여가 상품의 급여가보다 부족해서 구매할 수 없어요.');
			location.reload();
			return false;
  		} else if (failReason === 'notSelfBndRt'){
  			await showAlertPopup2('금액을 다시 불러올게요', '본인부담률이 변경되어 가격을 다시 불러 올게요.<br>최종 금액은 꼭 장기요양기관을 통해 확인해주세요.');
			location.reload();
			return false;
  		} else if (failReason === 'notAbleCnt'){
  			await showAlertPopup2('수량을 확인해주세요.'
  					, '<div class="color_tp_s font_sbmr">수량 변경이 필요한 복지용구가 있어요. 아래 내용을 확인해주세요.</div>'
  						+'<div class="h16"></div>'
  						+'<div class="bder_box_01 back_FAFAFA padH12W16 color_tp_s font_sbsr scrollBox heightAuto" style="max-height:200px;">'
  						+errorMessage
  						+'</div>'
  					);
			
  		    const quantityByCaId = {};

  		    $(".cart_chk_area :checkbox:checked").each(function() {
  		        const index = $(this).data('index');
  		        const itemId = $(this).data('itid');
  		        const ioNo = $(this).data('ionumber');
  		        const currentQuantity = $('#shopCart_' + itemId + '_' + ioNo + ' .num.input_noClass').val();
  		        const ioCaId = $(this).data('caid');
  		        const ablecnt = $(this).data('ablecnt');

  		        if (!quantityByCaId[ioCaId]) {
  		            quantityByCaId[ioCaId] = {
  		                index: index,
  		                ablecnt: ablecnt,
  		                currentQuantity: 0
  		            };
  		        }
  		        quantityByCaId[ioCaId].currentQuantity += Number(currentQuantity);
  		    });

  		    for (const caId in quantityByCaId) {
  		        const category = quantityByCaId[caId];
  		        const index = category.index;
  		        const ablecnt = category.ablecnt;
  		        const currentQuantity = category.currentQuantity;

  		        if (currentQuantity > ablecnt) {
  		            $('#dangerText_' + index).text('구매가능 ' + ablecnt + '개'); 
  		            $('#dangerBox_' + index).addClass('danger');
  		        } else {
  		            $('#dangerText_' + index).text(''); 
  		            $('#dangerBox_' + index).removeClass('danger');
  		        }
  		    }
  		    
			return false;
  		}
  		
  		if(failReason === 'conslt') {
  			popText1 = '진행중인 상담이 있어요';
  			popText2 = '상담 완료 후 주문이 가능해요.';
  			connectUrl = '/matching/membership/conslt/detail?consltNo='+errorMessage; // 마이페이지 > 상담 내역
  			
  		} else if(failReason === 'orderBplcY') {
  			popText1 = '진행중인 주문이 있어요';
  			popText2 = '주문건 완료 후 다시 신청 가능해요. <br>'
  						+ '빠른 신청을 원하시면 연결된 장기요양기관에 문의해주세요.';
  			connectUrl =  '/matching/shop/order/detail?ordMCd='+errorMessage+'&openModal=true';// 마이페이지 > 해당 주문 상세 > 사업소 정보 버튼 노출
  			
  		} else if(failReason === 'orderBplcN') {
  			popText1 = '진행중인 주문이 있어요';
  			popText2 = '주문건 완료 후 다시 신청 가능해요. <br>'
  						+ '곧 장기요양기관이 배정될 예정이니 해당 장기요양기관에 문의해주세요.';
  			connectUrl = '/matching/shop/order/list?recipientsNo='+recipientsNo; // 마이페이지 > 주문 내역
  		}
  		
  		
    	var answer = await showConfirmPopup(popText1, popText2, '보러가기');
    	if(answer === 'confirm') {
        	setTimeout(function() {
        		location.href = connectUrl;            
            }, 1000);
        	return false;
        } else {
        	return false;
        }
    }

    
</script>

<!-- 장바구니 Modal fullsreen -->
<div id="modal_fullsreen" class="modal fullscreen cart_modal">

<c:set var="name" value="${recipientsNm}" />
<c:if test="${fn:length(recipientsNm) > 10}">
    <c:set var="name" value="${fn:substring(recipientsNm, 0, 10)}..." />
</c:if>

<div class="modal_header">
    <h4 class="modal_title">${name} 님의 장바구니</h4>
   	<div class="close_x modal-close waves-effect" onclick="backBtnEvent();"></div>
</div>

<c:choose>
<c:when test="${cartTotalCnt eq 0}">

	<div class="modal-content align_center">
        <div class="center">
            <img src="/html/page/app/matching/assets/src/images/08etc/cart_default.svg" class="w120"
                    alt="화면을 불러오지 못했어요">
                <div class="h12"></div>
                
                <p class="font_sblb">
                    장바구니에 담긴 상품이 없어요.
                </p>
                <div class="h04"></div>
                <p class="color_t_s font_sbmr">
                    놓치고 있는 복지용구를 바로 구매하세요
                </p>
                <div class="h32"></div>
            <a class="waves-effect btn btn-middle btn_primary w180" onclick="location.href='/matching/welfareinfo/using/view?mbrUniqueId=${mbrUniqueId}&recipientsNo=${recipientsNo}';">놓친 복지용구 받기</a>
        </div>
    </div>
</c:when>
<c:otherwise>


<form id="orderForm" action="/matching/shop/order/orderForm" method="POST">

<input type="hidden" name="recipientsNo" value="${recipientsNo}">
<input type="hidden" name="recipientsNm" value="${recipientsNm}">
<input type="hidden" name="rcperRcognNo" value="${rcperRcognNo}">
<input type="hidden" name="selfBndRt" value="${selfBndRt}">

<div class="modal-content noPad">
	<div class="cart_totalChkArea">
	    <div>
	        <input type="checkbox" name="" id="cart_chk_total" class="chk02_big" checked>
	        <label for="cart_chk_total" class="font_sbmr">
	            <span class="">전체선택</span><span class="evtCartChkNum">(<span class="num_chk"></span>/<span class="num_total"></span>)</span>
	        </label>
	    </div>
	    <a class="waves-effect btn btn-middle btn_cancel pad016" id="selectedDelBtn" onclick="fn_deleteShopCartItems();">선택삭제</a>
	</div>
	
	<c:set var="globalIndex" value="0" scope="page"/>
	
	<div id="cartContainer">
	<c:forEach var="categoryEntry" items="${categoryMap}" varStatus="loopStatus">
		<div class="padH24W20">
	    	<div class="align_between_center">
	       		<div class="font_sbms">${categoryEntry.key}</div>
	       		<div id="dangerText_${loopStatus.index}" class="color_t_danger font_sbss"></div>
	       	</div>
	       	<div class="h12"></div>
	       	<div id="dangerBox_${loopStatus.index}" class="bder_box_01 pad_16_12_20">
	       	
			<c:forEach var="item" items="${categoryEntry.value}" varStatus="status">
				
				<input type="hidden" name="items[${globalIndex}].itId" value="${item.itId}">
		        <input type="hidden" name="items[${globalIndex}].ioNo" value="${item.ioNo}">
		        <input type="hidden" name="items[${globalIndex}].quantity" value="${item.quantity}">
		        <input type="hidden" name="items[${globalIndex}].unitPrice" value="${item.unitPrice}">
		        <input type="hidden" name="items[${globalIndex}].caId" value="${item.caId}">
				
				<c:set var="globalIndex" value="${globalIndex + 1}" scope="page"/>
	          	
	          	<!-- cart_obj_area 카트목록 아이템-->
	           	<div class="cart_obj_area">
	               <div class="close_x p03" onclick="fn_deleteShopCartItems('${item.itId}','${item.ioNo}');"></div>
	               <div class="cart_chk_area">
	                   <input type="checkbox" name="checkbox_0${globalIndex}" 
                        	id="cart_chk_0${globalIndex}" 
                        	class="chk02_big"
                        	data-index="${loopStatus.index}"
                        	data-itid="${item.itId}" 
             					data-ionumber="${item.ioNo}" 
             					data-quantity="${item.quantity}" 
             					data-unitprice="${item.unitPrice}"
             					data-caid="${item.caId}"
             					data-ablecnt="${item.ableCnt}"
             					${item.careItemVO.itType10 || item.careItemVO.itType1 || item.careItemVO.itSoldout || item.optionSoldOut eq '1' ? 'disabled' : ''}>
                        <label for="cart_chk_0${globalIndex}"></label>
	               </div>
	               <div class="cart_obj_item">
	               		<div class="itemImgArea" 
						     <c:if test="${!(item.careItemVO.itType10 || item.careItemVO.itType1 || item.careItemVO.itSoldout || item.optionSoldOut eq '1')}">
						         onclick="location.href='/matching/shop/item/view?itId=${item.itId}&recipientsNo=${recipientsNo}';"
						     </c:if>>
						    <c:if test="${item.careItemVO.itType10 || item.careItemVO.itType1 || item.careItemVO.itSoldout || item.optionSoldOut eq '1'}">
						        <div class="outStock">품절</div>
						    </c:if>
						    <c:choose>
						        <c:when test="${not empty item.careItemVO.itImg1}">
						            <img src="${careHostUrl}/data/item/${item.careItemVO.itImg1}" alt="order_img">
						        </c:when>
						        <c:otherwise>
						            <div class="no_Thumb_Img">
						                <img src="/html/page/app/matching/assets/src/images/04icon/back_trans.png" alt="thumb_img">
						            </div>
						        </c:otherwise>
						    </c:choose>
						</div>
						<div class="ctnArea">
						    <c:choose>
							    <c:when test="${!(item.careItemVO.itType10 || item.careItemVO.itType1 || item.careItemVO.itSoldout || item.optionSoldOut eq '1')}">
							        <a href="/matching/shop/item/view?itId=${item.itId}&recipientsNo=${recipientsNo}">
							            <div class="title font_sbsr">${item.careItemVO.itName}</div>
							        </a>
							    </c:when>
							    <c:otherwise>
							        <div class="title font_sbsr">${item.careItemVO.itName}</div>
							    </c:otherwise>
							</c:choose>
						</div>
	
	                   <div class="ctnArea_bottom">
	                       	<c:if test="${item.ioNo ne 0}">
							    <div class="option_area breadcrumb_area">
							        <c:if test="${not empty item.optionsList}">
							            <c:choose>
							                <c:when test="${fn:length(item.optionsList) >= 2}">
							                    <c:forEach var="option" items="${item.optionsList}" varStatus="status">
							                        <c:if test="${status.index == 0}">
							                            <span>옵션 : ${option.value}</span>
							                        </c:if>
							                        <c:if test="${status.index > 0}">
							                            <span>${option.value}</span>
							                        </c:if>
							                    </c:forEach>
							                </c:when>
							
							                <c:when test="${fn:length(item.optionsList) == 1}">
							                    <c:forEach var="option" items="${item.optionsList}">
							                        <span>옵션 : ${option.value}</span>
							                    </c:forEach>
							                </c:when>
							            </c:choose>
							        </c:if>
							    </div>
							</c:if>
                            
	                       	<div class="align_between_center">
	                           <div class="order_quantity small_01" id="shopCart_${item.itId}_${item.ioNo}">
	                               <span class="minus" data-index="${globalIndex-1}"></span>
	                               <input type="number" class="num input_noClass" name="items[${globalIndex-1}].cartquantity" value="${item.quantity}" onfocus="this.select()" readonly></input>
	                               <input type="hidden" name="items[${globalIndex-1}].currentQuantity" value="${item.quantity}">
	                               <span class="plus" data-index="${globalIndex-1}"></span>
	                           </div>
	
	                           <div class="price_area">
	                               <span class="price font_sbsb"><fmt:formatNumber value="${item.sumPrice}" type="number" pattern="#,###"/>원</span>
	                           </div>
	                       	</div>
	                   </div>
	               </div>
	               <!-- cart_obj_item -->
	           </div>
	           <!-- cart_obj_area -->
	           </c:forEach>
	       </div>
	       <!-- bder_box_01 -->
	   </div>
	   <!-- padH24W20 -->
	   <div class="h12 back_F7F7F7"></div>
   </c:forEach>
   </div>
   
   <div class="padH24W20">
       <div class="list_noti_danger color_t_danger font_sbss">
           장바구니는 다음날 모두 사라지니, 필요한 상품을 한번에 주문해주세요. 주문요청시 배송완료 전까지 추가 주문이 어려워요.
       </div>
       <ul class="list_dept1 gray_dot marT12">
           <li class="color_t_s font_sbsr">최종 결제금액 및 결제방법은 장기요양기관을 통해 확인해주세요. </li>
           <li class="color_t_s font_sbsr marT12">장기요양기관의 주문 검토 과정에서, 본인부담률 등 총 예상 금액이 변동 될 수 있어요.</li>
       </ul>
   </div>
   <!-- padH24W20 -->
   <div class="h80"></div>
   <div class="h80"></div> 

</div>
<!-- modal-content -->

<!-- 장바구니 하단팝업 -->
<div class="modal_cart_area pad_16_20_20">

    <div class="align_between_center">
        <div class="font_sbmr">
            총 <span class="font_sbmb" id="totalQuantityDisplay"></span> 예상 본인부담금
        </div>
        <div class="font_sbmb" id="totalPriceDisplay"></div>
    </div>

    <div class="h16"></div>
    <div class="btn_area d-flex" onclick="fn_OrderCheck();">
    	<a class="waves-effect btn btn-large w100p btn_primary" id="orderButton">주문요청</a>
    </div>

</div>

</form>
</c:otherwise>
</c:choose>


<!-- <div class="modal-footer modal_cart_area">
  <div class="btn_area d-flex">
    <a class="modal-close waves-effect btn btn-large w100p btn_primary">확인</a>
  </div>
</div> -->


</div>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	
    let itemsPerPage = 20;
    let allItems = document.querySelectorAll('#cartContainer > .padH24W20');
    let totalItems = allItems.length;
    for (let i = 0; i < totalItems; i++) {
        if (i < itemsPerPage) {
            allItems[i].style.display = 'block';
        } else {
            allItems[i].style.display = 'none';
        }
    }

    let cartContainer = document.getElementById('modal_fullsreen');
    cartContainer.addEventListener('scroll', function() {
        if (cartContainer.scrollTop + cartContainer.clientHeight >= cartContainer.scrollHeight - 100) {
            let displayedItems = document.querySelectorAll('#cartContainer > .padH24W20[style="display: block;"]');
            let startIndex = displayedItems.length;
            let endIndex = startIndex + itemsPerPage;

            for (let i = startIndex; i < endIndex && i < totalItems; i++) {
                allItems[i].style.display = 'block';
            }
        }
    });
});
</script>
  