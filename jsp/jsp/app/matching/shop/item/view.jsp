<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품상세</title>
    
    <!-- swiper -->
    <link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />
    <style>
        .order_detail_Swiper{margin: 0 -20px;}
        .order_detail_Swiper .swiper-slide{
            line-height: 0;display: flex;justify-content: center; align-items: center;
        
            &:before{
                position: absolute;
                display: block;
                content: '';
                top:0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.05);
            }
        
        }
        .order_detail_Swiper .swiper-slide img{width: 100%;}
        .order_detail_Swiper .swiper-pagination-fraction{
            width:auto;
            display: flex;
            top: 12px;
            left: 12px;
            bottom: initial;
            padding: 2px 10px;
            border-radius: 4px;;
            background: rgba(51, 51, 51, 0.40);
            color:#fff;
        }

        .order_detail_Swiper .swiper-pagination-fraction .swiper-pagination-current{
            font-weight: 700;
        }
        .order_detail_Swiper .swiper-pagination-fraction .swiper-pagination-total{
            font-weight: 300;
        }

        /* toast */
        #toast-container{bottom: 74px;}

        /* 더보기 누르기전 상세이미지 보이는 세로영역 */
        .order_detail_more:has(> .toggle_btn_area){
            height:400px;
        }
        
        .order_quantity .plus.disa {
        	background-image: url(/html/page/app/matching/assets/src/images/04icon/icon_plus_disa.svg);
    	}
		
		.responsive-iframe-wrapper {
	        position: relative;
	        width: 100%;
	        padding-bottom: 56.25%; /* 16:9 비율 */
	        height: 0;
	        overflow: hidden;
	    }
	
	    .responsive-iframe-wrapper iframe {
	        position: absolute;
	        top: 0;
	        left: 0;
	        width: 100%;
	        height: 100%;
	        border: 0;
	    }
	    
	    .disa {
		    pointer-events: none; /* 클릭 차단 */
		}
	</style>

    <script type="text/javascript">
    
    const jsCommon = new JsCommon();
    
    var recipientsNo = '${mbrRecipientsLongtermInfoVO.recipientsNo}';
	var category = '${mainCategoryName}';
	var itName = '${itemDetailInfo[0].itName}';
	var itId = '${itemDetailInfo[0].itId}';
	var mbrUniqueId = '${mbrUniqueId}';
    
    //2개 이상되면 나오는 토스트
    var toast_order_over2 = function(){M.toast({
        html: '${ableQty}개까지만 추가 가능해요.'
    })};

    $(function(){
    	
        //옵션셀렉트
        $('.order_chip li').click(function(){
            $(this).parent('.order_chip').find('li').removeClass('active');
            $(this).addClass('active');
        });


        $('.order_quantity .num').each(function(){
        	
	        //수량 0일때 마이너스(-)버튼 비활성화 초기화
            var currentVal = parseInt($(this).val());
            if(currentVal == 1){
                $(this).parent('.order_quantity').find('.minus').addClass('disa');
            }
            
          	//구매가능 수량이 0개일 때 + 버튼 비활성화
            if(${ableQty} <= 0){
            	$(this).parent('.order_quantity').find('.plus').addClass('disa');
            }
        });
        
        //수량 + 버튼
        $('.order_quantity .plus').click(function(){

            var thisNum = $(this).parent('.order_quantity').find('.num');
            var currentVal = parseInt(thisNum.val());

            if (currentVal >= ${ableQty}){ //수량 2이상이면 toast 출력
            	if($(this).parent('.order_quantity').find('.plus').hasClass('disa') === false){
            		toast_order_over2();
            		$(this).parent('.order_quantity').find('.plus').addClass('disa');
                    return false;
            	}
            } else if (currentVal >= 0) {
                thisNum.val(++currentVal);
                $('.evt_BtnShop').removeClass('disabled');  // 수량이 증가할 때 disabled 제거
                $(this).parent('.order_quantity').find('.minus').removeClass('disa');
            }
        });

        //수량 - 버튼
        $('.order_quantity .minus').click(function(){

            var thisNum = $(this).parent('.order_quantity').find('.num');
            var currentVal = parseInt(thisNum.val());
            if (currentVal > 1) {  // 수량이 2 이상일 때 감소 가능
                thisNum.val(--currentVal);
                $(this).parent('.order_quantity').find('.plus').removeClass('disa');
                $('.evt_BtnShop').removeClass('disabled');  // 수량이 1이 아니므로 disabled 제거
                
                if (currentVal == 1) {
                    $(this).addClass('disa'); // 수량이 1일 때 - 버튼 비활성화
                }
            }
        });

        // input 직접 입력 시
        $('.order_quantity .num').on('input', function() {
            var currentVal = parseInt($(this).val());

            if(currentVal < 1){
            	$(this).val(1);
            	currentVal = 1;
            }
            
            if (currentVal >= ${ableQty}){
                toast_order_over2();
                $(this).parent('.order_quantity').find('.plus').addClass('disa');
                $(this).parent('.order_quantity').find('.minus').removeClass('disa');
                $(this).val(${ableQty});
                
                return false;
            }
            else if (currentVal > 1) {
            	$(this).parent('.order_quantity').find('.plus').removeClass('disa');
            	$(this).parent('.order_quantity').find('.minus').removeClass('disa');
                $('.evt_BtnShop').removeClass('disabled');
            } else if (currentVal == 1) {
                $(this).parent('.order_quantity').find('.plus').removeClass('disa');
                $(this).parent('.order_quantity').find('.minus').addClass('disa');  // 1일 때 - 버튼 비활성화
                $('.evt_BtnShop').removeClass('disabled');
            } else {
            	$(this).parent('.order_quantity').find('.plus').addClass('disa');
            	$(this).parent('.order_quantity').find('.minus').addClass('disa');
                $('.evt_BtnShop').addClass('disabled');
            }
        });

        //더 보기 버튼토글
        $('.toggle_btn_area').on('click', function() {
            if($(this).hasClass('active')==true){
                $(this).removeClass('active');
                $('.evt_title').text('더 보기');
            }
            else{
                $(this).addClass('active');
                $('.evt_title').text('접기');
            }
        });
        
      	//상품상세 페이지 조회 에어브릿지 이벤트 전송
      	fn_SendAirBridgeEventShopItemView(itId, category, itName, mbrUniqueId, recipientsNo);

    });
    
    // 옵션 상세 io_no 값 확인
    function fn_findOptionIoNo(selectedOption){
    	var optionsData = JSON.parse('${itemOptionJson}');
    	for (var i = 0; i < optionsData.length; i++) {
            if (optionsData[i].io_id === selectedOption) {
                return optionsData[i].io_no;
            }
        }
        return null;
    }
    
    async function fn_AddItemToCartFromView(itId, itCustPrice){
    	
    	const remainAmt = ${remainAmt};
    	const cartTotalPrice = ${cartTotalPrice};
    	
    	var optionArray = [];
        var selectedOption = "";
        var selectedIoNo = "";

        $('.order_chip li.active').each(function() {
            var type = $(this).data('type'); // 옵션 종류
            var value = $(this).text().trim(); // 선택된 값
            var ioNo = $(this).data('io-no'); // io_no

            optionArray.push({
                "title": type,
                "value": value
            });

            if (selectedOption) {
                selectedOption += "|";
            }
            selectedOption += value;

            // 첫 번째 io_no를 기본으로 설정
            if (!selectedIoNo) {
                selectedIoNo = ioNo;
            }
        });

        // io_no 조회
        var foundIoNo = fn_findOptionIoNo(selectedOption);
        if (foundIoNo) {
            selectedIoNo = foundIoNo;
        }
        
        var quantity = $('.num.input_noClass').val(); // 수량
        var caId = '${caId}';
        
        var apDtFrDt = '${mbrRecipientsLongtermInfoVO.apDtFrDt}';
    	var apDtToDt = '${mbrRecipientsLongtermInfoVO.apDtToDt}';
    	var rcgtEdaFrDt = '${mbrRecipientsLongtermInfoVO.rcgtEdaFrDt}';
    	var rcgtEdaToDt = '${mbrRecipientsLongtermInfoVO.rcgtEdaToDt}';

    	var today = jsCommon.fn_getToday().replace(/-/g, "");
		if(apDtFrDt > today || today > apDtToDt || rcgtEdaFrDt > today || today > rcgtEdaToDt) {
    		showToastMsg('인정유효기간을 확인해주세요.');
    		return false;
    	}
    	
        if(remainAmt-cartTotalPrice>itCustPrice === false){
        	showToastMsg('급여가 부족해서 장바구니에 담을 수 없어요.');
    		return false;
        }
        
    	var data = {"itId" : itId
    			, "caId" : caId
				, "recipientsNo" : recipientsNo
				, "selectedIoNo" : selectedIoNo
				, "quantity" : quantity
				, "selectedOption" : selectedOption
				, "optionArray" : JSON.stringify(optionArray)
				, mustCallbackJs : true
		};
		
    	callPostAjaxIfFailOnlyMsg(
			'/matching/shop/order/addItemToCart.json', 
			data,
			function(result) {
				if(result.success == undefined || !result.success){
					if(result.message != null){
						showToastMsg(result.message);
					} else {
						showToastMsg('장바구니 담기에 실패했습니다. 관리자에게 문의해 주세요.');
					}
				} else{
					
					setTimeout(function() {
			    		// 에어브릿지 이벤트 추가(장바구니담기 - 상품상세)
						fn_SendAirbridgeEventAddItemToCart(itId, selectedOption, "view", category, itName, mbrUniqueId, recipientsNo);
					}, 100);
					
					setTimeout(function() {
						fn_showPopConnecting(caId);
					}, 100);
				}
			}
		);
	    
    }
    
    async function fn_showPopConnecting(caId){
    	var answer = await showConfirmPopup('장바구니에 담았어요', '', '장바구니 가기', '다른상품 보기');
    	if(answer === 'confirm') {
        	<%-- 장바구니가기 > 장바구니페이지로 이동 --%>
        	setTimeout(function() {
                location.href = '/matching/shop/item/shopCartPop?recipientsNo='+recipientsNo;
            }, 1000);
        	return false;
        } else {
        	<%-- 다른상품 보기 > 놓친 복지용구 받기 설명페이지로 이동 --%>
        	setTimeout(function() {
                location.href = '/matching/welfareinfo/using/view?recipientsNo=' + recipientsNo;
            }, 1000);
        	return false;
        }
    }
    
    function openShopCartPop(){
    	location.href = '/matching/shop/item/shopCartPop?recipientsNo='+recipientsNo;
    	return false;
    }
    
    
    document.addEventListener("DOMContentLoaded", function() {
        const iframes = document.querySelectorAll("#product-details iframe");
        iframes.forEach(iframe => {
            const wrapper = document.createElement("div");
            wrapper.classList.add("responsive-iframe-wrapper");
            iframe.parentNode.insertBefore(wrapper, iframe);
            wrapper.appendChild(iframe);
            
            const spacer = document.createElement("p");
            spacer.style.marginBottom = "8px";
            wrapper.insertAdjacentElement("afterend", spacer);
        });
        
        const moreButton = document.getElementById("moreButton");
        if (!moreButton) {
            console.error("#moreButton 요소를 찾을 수 없습니다.");
            return;
        }
        
        moreButton.addEventListener("click", function () {
        	// 더보기 버튼 클릭 시 유튜브 영상 재생
            const iframes = document.querySelectorAll("#product-details iframe");
            iframes.forEach(iframe => {
                const wrapper = iframe.parentElement;
                const originalSrc = iframe.src;

                const newSrc = originalSrc.includes('autoplay=1') 
                    ? originalSrc 
                    : originalSrc + (originalSrc.includes('?') ? '&' : '?') + 'autoplay=1&mute=1';

                const newIframe = document.createElement('iframe');
                newIframe.src = newSrc;
                newIframe.width = iframe.width;
                newIframe.height = iframe.height;
                newIframe.title = iframe.title;
                newIframe.frameBorder = iframe.frameBorder;
                newIframe.allow = iframe.allow;
                newIframe.allowFullscreen = iframe.allowFullscreen;

                wrapper.replaceChild(newIframe, iframe);
            });
        });
        
    });
    
</script>
</head>

	<body class="">
    <div class="wrapper">

        <header>
            <nav class="top">
                <a class="btn_back waves-effect" onclick="backBtnEvent()">
                    <span class="icon"></span>
                    <span class="txt">상품상세</span>
                </a>
                <div class="d-flex">
                    <div class="icon_area waves-effect">
                        <div class="icon_cart i_cart" onclick="openShopCartPop();">
                        	<%-- 장바구니 count --%>
                            <c:choose>
                            	<c:when test="${cartTotalCnt == 0}"></c:when>
                        		<c:when test="${cartTotalCnt < 100}">
		                            <span class="num">${cartTotalCnt}</span>
                        		</c:when>
                        		<c:otherwise>
                        			<span class="num _99">99+</span>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

		<c:forEach var="item" items="${itemDetailInfo}">
	        <main>
	            <section class="default padT0">
						<!-- Swiper -->
						<c:choose>
							<c:when test="${not empty item.itImgsList}">
								<div class="swiper order_detail_Swiper">
							        <div class="swiper-wrapper">
							            <c:forEach var="img" items="${item.itImgsList}">
							            	<!-- swiper-slide -->
							                <div class="swiper-slide">
							                    <img src="${careHostUrl}/data/item/${img}" alt="상품 이미지" />
							                </div>
							            </c:forEach>
							        </div>
							        <div class="swiper-pagination"></div>
							    </div>
							</c:when>
							<c:otherwise>
								<div class="swiper order_detail_Swiper">
							        <div class="swiper-wrapper">
							        	<div class="swiper-slide">
							                <div class="no_Thumb_Img">
							                    <img src="/html/page/app/matching/assets/src/images/04icon/back_trans.png" alt="thumb_img">
							                </div>
							            </div>
							        </div>
							        <div class="swiper-pagination"></div>
							    </div>
							</c:otherwise>
						</c:choose>
						
						<!-- order_detail_Swiper -->
		                <div class="OD_product marW-20">
		                    <div class="padH24W20">
		                        <div class="color_tp_s font_sbsr">${mainCategoryName}</div>
		                        <div class="h12"></div>
		                        <div class="font_shm" 
							     style="display: -webkit-box; 
							            -webkit-line-clamp: 2; 
							            -webkit-box-orient: vertical; 
							            overflow: hidden; 
							            text-overflow: ellipsis;">${item.itName}</div>
		                        <div class="h24"></div>
		                        <div class="color_t_s font_sbsr">예상 본인부담률(<fmt:formatNumber value="${selfBndRt}" type="number" maxFractionDigits="0"/>%)</div>
		                        <div class="h04"></div>
		                        <div class="d-flex gap04">
		                            <span class="color_danger font_shm"><fmt:formatNumber value="${100-selfBndRt}" type="number" pattern="#,###"/>%</span>
		                            <span class="font_shm">
										<fmt:formatNumber value="${salePrice}" type="number" pattern="#,###"/>원
		                            </span>
		                        </div>
		                        <div class="color_t_t font_sbmst">
		                        	<fmt:formatNumber value="${item.itCustPrice}" type="number" pattern="#,###"/>원
		                        </div>
		                        <div class="h24"></div>
		                        <hr>
		                        <div class="h24"></div>
		                        <div class="list_noti color_t_s font_sbsr">
		                            최종 결제금액 및 결제방법은 장기요양기관을 통해 확인해주세요. 장기요양기관의 주문 검토 과정에서, 본인부담률 등 총 예상 금액이 변동 될 수 있어요.
		                        </div>
		                        <c:if test="${item.itType6}">
		                        	<%-- 배송지연 문구 --%>
			                        <div class="list_noti color_t_s font_sbsr marT12">
			                            배송 지연 상품으로 배송이 조금 늦어질 수 있어요.
			                        </div>
		                        </c:if>
		                    </div>
		                </div>
		                <div class="marW-20 h12 back_F7F7F7"></div>
		
		                <div class="OD_product marW-20 pad_24_20_40">
		                   
						<c:if test="${item.optionYn eq 'Y'}">
						    <c:if test="${not empty optionList}">
						        <div class="font_sblb">옵션선택</div>
						        <div class="h16"></div>
						        
						        <c:forEach var="entry" items="${optionList}">
						            <c:set var="optionKey" value="${entry.key}" />
						            <c:set var="optionValues" value="${entry.value}" />
						            
						            <div class="color_t_s font_sbsr">${optionKey}</div>
						            <div class="h12"></div>
						            
						            <ul class="order_chip" data-type="${optionKey}">
						                <c:forEach var="optionValue" items="${optionValues}" varStatus="status">
						                    <li class="${status.first ? 'active' : ''}" 
						                        data-io-no="${optionMap[optionKey][optionValue]}" 
						                        data-type="${optionKey}">
						                        ${optionValue}
						                    </li>
						                </c:forEach>
						            </ul>
						            <div class="h20"></div>
						        </c:forEach>
						    </c:if>
						</c:if>
						
		                   
		                   <div class="h20"></div>
		                   <div class="color_t_s font_sbsr">수량</div>
		                   <div class="h12"></div>
		                   <div class="align_between_center">
		                        <div class="order_quantity">
								    <span class="minus ${item.itType1 || item.itType10 || item.itSoldout || (item.optionYn eq 'Y' && empty optionList) ? 'disa' : ''}"></span>
								    <input type="number" class="num input_noClass" value="1" onfocus="this.select()" readonly />
								    <span class="plus ${item.itType1 || item.itType10 || item.itSoldout || (item.optionYn eq 'Y' && empty optionList) ? 'disa' : ''}"></span>
								</div>
		                        <div class="d-flex align-items-center gap04">
		                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="13" viewBox="0 0 15 13" fill="none">
		                                <g clip-path="url(#clip0_7668_7015)">
		                                  <path d="M14.9204 4.60509C14.6677 5.40697 14.4147 6.20884 14.1624 7.01072C13.9923 7.55056 13.8242 8.0904 13.653 8.62987C13.415 9.37919 12.785 9.86121 11.9929 9.86459C10.1849 9.87285 8.37694 9.87323 6.56897 9.86459C5.7562 9.86046 5.12251 9.36192 4.89126 8.57768C4.29923 6.57299 3.70834 4.56792 3.11744 2.56323C3.0097 2.19721 2.84902 2.07557 2.46836 2.07557C2.03739 2.07557 1.60641 2.07632 1.17582 2.07557C0.801909 2.07407 0.53349 1.82405 0.531989 1.47867C0.530487 1.13217 0.796278 0.874633 1.17019 0.875384C1.70402 0.876135 2.24123 0.849481 2.77019 0.900912C3.47896 0.969988 3.96887 1.37581 4.20989 2.05004C4.33715 2.40631 4.43476 2.77346 4.53424 3.13873C4.56502 3.25248 4.61571 3.27989 4.72758 3.27951C7.69708 3.27614 10.6666 3.27951 13.6361 3.27463C14.0614 3.27388 14.4263 3.39251 14.6801 3.74127C14.7867 3.88805 14.8419 4.07238 14.9204 4.23981V4.60509Z" fill="#EE6002"/>
		                                  <path d="M6.93915 12.8689C6.83028 12.8299 6.71766 12.7991 6.61367 12.7503C6.08621 12.5018 5.81667 11.9109 5.97134 11.3538C6.13014 10.7813 6.65421 10.4269 7.2635 10.4798C7.79358 10.526 8.26547 10.9949 8.31578 11.5261C8.37322 12.1339 8.02071 12.6606 7.44858 12.8228C7.40015 12.8366 7.35247 12.8535 7.30442 12.8689H6.93915Z" fill="#EE6002"/>
		                                  <path d="M11.1547 12.8689C11.0488 12.834 10.9395 12.807 10.8378 12.7627C10.3047 12.5288 10.0179 11.9409 10.1606 11.3838C10.3119 10.7925 10.8344 10.428 11.4565 10.4794C12.0196 10.526 12.4708 11.0042 12.5197 11.6057C12.5643 12.1579 12.1679 12.694 11.6108 12.8344C11.5706 12.8445 11.5312 12.8577 11.4918 12.8693H11.1547V12.8689Z" fill="#EE6002"/>
		                                </g>
		                                <defs>
		                                  <clipPath id="clip0_7668_7015">
		                                    <rect width="14.3884" height="12" fill="white" transform="translate(0.531982 0.869141)"/>
		                                  </clipPath>
		                                </defs>
		                              </svg>
		                            <span class="color_tp_pp font_sbss">구매가능 : ${ableQty}개</span>
		                        </div>
		                   </div>
		                </div>
		
		
		                <div class="marW-20 h12 back_F7F7F7"></div>
		                <div class="marW-20">
		                    <div class="pad020">
		                        <div class="h24"></div>
		                        <div class="font_sblb">상품 설명</div>
		                        <div class="h16"></div>
		                    </div>
		
		                    <div class="order_detail_more">
		                    	<div id="product-details">${item.itExplan}</div>
		                        <div class="toggle_btn_area">
		                            <a class="btn-large btn_default large flex_center gap08 evt_detailBtn">
		                                <span class="evt_title color_tp_s font_sbms" id="moreButton">더 보기</span>
		                                <svg class="evt_arrow" xmlns="http://www.w3.org/2000/svg" width="25" height="24" viewBox="0 0 25 24" fill="none">
		                                    <path fill-rule="evenodd" clip-rule="evenodd"
		                                        d="M5.96967 8.46967C6.26256 8.17678 6.73744 8.17678 7.03033 8.46967L12.5 13.9393L17.9697 8.46967C18.2626 8.17678 18.7374 8.17678 19.0303 8.46967C19.3232 8.76256 19.3232 9.23744 19.0303 9.53033L13.0303 15.5303C12.7374 15.8232 12.2626 15.8232 11.9697 15.5303L5.96967 9.53033C5.67678 9.23744 5.67678 8.76256 5.96967 8.46967Z"
		                                        fill="#333333" />
		                                </svg>
		                            </a>
		                        </div>
		                    </div>
		                </div>
		
		                <div class="marW-20 h12 back_F7F7F7"></div>
		                <div class="marW-20 pad_24_20_20">
		                    <div class="font_sblb">주문 유의사항</div>
		                    <div class="h16"></div>
		                    <div class="font_sbss">정확한 정보는 장기요양 기관에 문의해주세요. </div>
		                    <ul class="list_dept1 gray_dot marT8">
		                        <li class="color_t_s font_sbsr">장기요양기관에서 검토 후, 주문 진행이 이루어져요. </li>
		                        <li class="color_t_s font_sbsr">장기요양기관에 본인부담금을 지불하셔야 주문이 가능해요.</li>
		                        <li class="color_t_s font_sbsr">최종결제금액 및 결제방법은 장기요양기관에서 확인해주세요.</li>
		                        <li class="color_t_s font_sbsr">복지용구 주문 시점이나, 어르신의 장기요양정보에 따라 주문정보가 다를 수 있어요. </li>
		                        <li class="color_t_s font_sbsr">교환/반품시, 장기요양기관에 문의해야해요. </li>
		                        <li class="color_t_s font_sbsr">주문취소는 [주문접수], [주문연결중]상태에서만 가능해요. 이후에는 장기요양기관에 직접 문의하여 취소해주세요.</li>
		                    </ul>
		                    <ul class="list_dept1 black_dot marT8">
		                        <li class="font_sbss">복지용구의 A/S는 장기요양기관에서 안내 할 책임이 있음을 알려드려요. </li>
		                    </ul>
		                    <div class="h20"></div>
		                </div>
					
	            </section>
	        </main>
	        <footer class="page-footer">
	            <div class="relative">
	            	<c:choose>
	            		<c:when test="${item.itType1 || item.itType10 || item.itSoldout}">
	            			<a class="btn-large btn_primary w100p disabled">품절된 상품이에요</a>
	            		</c:when>
	            		<c:when test="${item.optionYn eq 'Y' && empty optionList}">
	            			<a class="btn-large btn_primary w100p disabled">품절된 상품이에요</a>
	            		</c:when>
	            		<c:when test="${ableQty <= 0}">
	            			<a class="btn-large btn_primary w100p disabled">구매가 불가능해요</a>
	            		</c:when>
	            		<c:otherwise>
	                		<a class="waves-effect btn-large btn_primary w100p evt_BtnShop" onclick="fn_AddItemToCartFromView('${item.itId}','${item.itCustPrice}');">장바구니 담기</a>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	        </footer>
		</c:forEach>
    </div>
    <!-- wrapper -->
    <script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper(".order_detail_Swiper", {
            autoHeight: true,
            spaceBetween: 0,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                type: "fraction",
            },
        });
    </script>
</body>