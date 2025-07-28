<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />
<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>

<style>

</style>
<script type="text/javascript">

$(function () {
    $('#modal_fullsreen_orderCancel').modal();

    // 타이핑 제한
    $('.textBox').on('input propertychange keyup', function (e) {
        let content = $(this).val();
        
        // 글자수 세기
        if (content.length == 0 || content == '') {
            $('.textCount').text('0');
        } else {
            $('.textCount').text(content.length);
        }
        
        // 글자수 제한
        if (content.length > 20) {
            // 20자 부터는 타이핑 되지 않도록
            $(this).val(content.substring(0, 20));
            $('.textCount').text('20'); // 글자수 표시를 20으로 고정
        }
    });


    //줄 제한
    $('.textBox').keydown(function(){
        var rows = $('.textBox').val().split('\n').length;
        var maxRows = 2;
        if( rows > maxRows){
            modifiedText = $('.textBox').val().split("\n").slice(0, maxRows);
            $('.textBox').val(modifiedText.join("\n"));
        }
    });


    //[직접 입력할께요] 선택시 textarea 표시
    $('.evt_msgTextarea').hide();

    //[직접 입력할께요] 선택시 textarea 표시
    $('.broad_area li').click(function () {

        if ($(this).hasClass('evt_orderSelfMsg')) {

            if ($(this).hasClass('active')) {
                $('.evt_msgTextarea').show();
                setTimeout(function () {
                    $('.evt_msgTextarea textarea').focus(); // 포커스에 약간의 딜레이 추가
                }, 100);
            }
        } else {
            // evt_orderSelfMsg가 아닌 다른 li를 클릭하면 textarea 숨김
            $('.evt_msgTextarea').hide();
        }
    });

});

function fn_orderCancel(){
	
	var selectedElement = $('.broad_area li.active');
    var cancelType = selectedElement.data('value');
    var cancelResn;

    if (cancelType === 'ETC') {
        cancelResn = $('.evt_msgTextarea .textBox').val();
    } else {
        cancelResn = selectedElement.text().trim();
    }
    
    if(cancelType == null || cancelType == ''){
    	showAlertPopup('주문취소 사유를 선택해주세요');
    	return false;
    }
    
	const recipientsNo = ${detail.recipientsNo};
	var ordMCd = '${detail.ordMCd}';
	var ordMId = '${detail.ordMId}';
	
	var data = {
			"recipientsNo" : recipientsNo
			, "ordMCd" : ordMCd
			, "ordMId" : ordMId
			, "cancelType" : cancelType
			, "cancelResn" : cancelResn
	}
	
	const orderItems = []; // 주문할 아이템 배열
	$('.order_list_db').each(function() {
        const itId = $(this).data('it-id');
        const itName = $(this).data('it-name');
        const itPrice = $(this).data('it-price');
        const ioNo = $(this).data('io-no');
        const ioId  = $(this).data('io-id');
        const ioQty = $(this).data('io-qty');
        const caName = $(this).data('category-name');
        
        if(itId != undefined){
        	 orderItems.push({
             	itId: itId,
             	itName: itName,
             	itPrice: itPrice,
             	ioNo: ioNo,
             	ioId : ioId,
             	ioQty : ioQty,
             	caName : caName
             });
        }
       
    });
	
	callPostAjaxIfFailOnlyMsg(
	       '/matching/shop/order/orderCancelByMbr.json', 
	       data,
	       function(result) {
	    	   showToastMsg('주문이 취소되었어요');
	    	   
	    		// 에어브릿지 이벤트 전송 (주문 취소)
	    		fn_SendAirbridgeEventOrderCancel(orderItems, ordMCd, cancelResn, recipientsNo, '${mbrUniqueId}');
	    		
	           	setTimeout(function() {
	            	location.reload();
	           	}, 1000);
	       });
}
	
</script>
<!-- 주문취소 Modal fullsreen -->
<div id="modal_fullsreen_orderCancel" class="modal fullscreen">
    <div class="modal_header">
        <h4 class="modal_title">주문취소</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content noPad">
        <div class="pad20">
        	<c:forEach var="item" items="${detail.shopOrderItemList}">
            <div class="box_order_list">
                <div class="order_list_db" 
            			data-it-id="${item.careItemVO.itId}" 
            			data-io-no="${item.ioNo}" 
            			data-io-id="<c:forEach var='option' items='${item.optionsList}' varStatus='status'>${option.value}<c:if test='${!status.last}'>|</c:if></c:forEach>"
            			data-category-name="${item.longtermCategoryName}"
			            data-it-name="${item.itName}"
			            data-io-qty="${item.ordQuantity}"
			            data-it-price="${item.careItemVO.itCustPrice}">
                    <div class="img_area">
                        <img src="${careHostUrl}/data/item/${item.careItemVO.itImg1}" alt="">
                    </div>
                    <ul class="od_txt">
                        <li class="font_sbss">${item.longtermCategoryName}</li>
                        <li class="color_t_s font_ssr marT2">${item.itName}</li>
                        <li class="breadcrumb_area marB2">
							<c:if test="${not empty item.ioId}">
							
								<c:if test="${not empty item.optionsList}">
									<c:choose>
						                <c:when test="${fn:length(item.optionsList) >= 2}">
						                    <c:forEach var="option" items="${item.optionsList}" varStatus="status">
						                        <c:if test="${status.index == 0}">
						                            <span class="color_t_s font_ssr">${option.value}</span>
						                        </c:if>
						                        <c:if test="${status.index > 0}">
						                            <span class="color_t_s font_ssr">${option.value}</span>
						                        </c:if>
						                    </c:forEach>
						                </c:when>
						
						                <c:when test="${fn:length(item.optionsList) == 1}">
						                    <c:forEach var="option" items="${item.optionsList}">
						                        <span class="color_t_s font_ssr">${option.value}</span>
						                    </c:forEach>
						                </c:when>
						            </c:choose>
								</c:if>
							</c:if>
							<span class="color_t_s font_ssr">${item.ordQuantity}개</span>
						</li>
                    </ul>
                </div>
            </div>
            <div class="h12"></div>
            </c:forEach>
        </div>
        <div class="h12 back_F7F7F7"></div>
        <div class="padH24W20">
            <div class="font_sblb">취소 사유</div>
            <div class="h20"></div>
            <a class="input_basic fake_select broad_evt color_disable modal-trigger" href="#modal_shipping_msg">취소 사유를 선택해주세요</a>

            <div class="evt_msgTextarea">
                <div class="relative marT8">
                    <textarea rows="3" class="input_basic textBox" required="required" placeholder="" maxlength="20" style="height:110px !important;"></textarea>
                    <div class="textLengthWrap">
                        <span class="textCount">0</span>
                        <span class="textTotal">/20</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="h12 back_F7F7F7"></div>
        <div class="pad_24_20_40">
            <div class="font_sblb">취소 유의사항</div>
            <div class="h16"></div>
            <div class="font_sbss">정확한 정보는 장기요양 기관에 문의해주세요. </div>
            <ul class="list_dept1 gray_dot marT8">
                <li class="color_t_s font_sbsr">[주문접수], [주문연결중]상태인 경우 취소요청 즉시 취소완료돼요. 결제 진행 전 취소되어 환불할 금액이 없어요.</li>
            </ul>
        </div>

        <div class="h80"></div>
        
    </div>
    <!-- modal-content -->
    <div class="modal-footer">
        <div class="btn_area d-flex">
            <a class="waves-effect btn btn-large w100p btn_primary" onclick="fn_orderCancel();">주문취소</a>
        </div>
    </div>
</div>
<!-- fullsreen end -->


<!-- Modal modal_shipping_msg -->
<div id="modal_shipping_msg" class="modal bottom-sheet">
    <div class="modal_header">
        <h4 class="modal_title">취소 사유를 선택해주세요</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content">
        <ul class="broad_area">
            <li class="modal-close" data-value="SIMPLE_CHANGE">단순 변심</li>
            <li class="modal-close" data-value="SIZE_CHANGE">사이즈/색상 변경</li>
            <li class="modal-close" data-value="DELIVERY_CHANGE">배송지 변경</li>
            <li class="modal-close" data-value="RE_ORDER">재주문</li>
            <li class="modal-close evt_orderSelfMsg" data-value="ETC">직접 입력할게요</li>
        </ul>
        <div class="h20"></div>

    </div>
</div>
<!-- modal end -->
