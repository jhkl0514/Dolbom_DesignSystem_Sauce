<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품목록</title>
    <style>
        .wel_scroll_area{position: relative;top:0;background-color: #fff;}
        .wel_scroll_area .btn_accord_area{background: linear-gradient(270deg, #ffffff 58.52%, rgba(255, 255, 255, 0.00) 99.11%);}
        .wel_scroll_area.active .wel_scroll{padding: 20px 50px 20px 16px;}

        .wel_scroll_area.fixed{position: fixed;top:56px;}

        .modal_cart_area ~ #toast-container{bottom: 116px;}
    </style>

    <script>
    	const jsCommon = new JsCommon();
   		var recipientsNo = '${mbrRecipientsLongtermInfoVO.recipientsNo}';
   		var category = '${mainCategoryNames}';
   		var mbrUniqueId = '${mbrUniqueId}';
   		
   		$(function () {
            //btn toggle
            $('.btn_accord').on('click', function () {
                if ($(this).parents('.wel_scroll_area').hasClass('active') == true) {
                    $(this).parents('.wel_scroll_area').removeClass('active');
                }
                else {
                    $(this).parents('.wel_scroll_area').addClass('active');
                }
            });
            
            //어르신 카테고리 필터
            //전체버튼
            $('.chip_area02 .totalAll').click(function(){
                $(this).addClass('active');
                $('.chip_area02 [class^="om_cate_"]').removeClass('active');
                $('.orderListItem [title^="om_cate_"]').fadeIn(100);
            });

            //각 버튼            
            $('.chip_area02 [class^="om_cate_"]').click(function(){
                //클라스 추출
                var thisClass = $(this).attr('class').substr(0,20);
                $('.chip_area02 [class^="om_cate_"]').removeClass('active');
                $('.orderListItem .item').fadeOut(0);
                $(this).addClass('active');
                $('.orderListItem [title='+ thisClass +']').fadeIn(100);
                $('.chip_area02 .totalAll').removeClass('active');
            });

            //전체버튼 포함한 모든 버튼
            $('.chip_area02 a').click(function(){
                if ($(this).hasClass('active') == true) {
                    //chip영역 닫음
                    $('.wel_scroll_area').removeClass('active');
                }
                else {
                    $('.chip_area02 a').removeClass('active');
                    $(this).addClass('active');
                    //chip영역 닫음
                    $('.wel_scroll_area').removeClass('active');
                }
                //버튼 클릭시 버튼영역 왼쪽으로 이동
                var thisPosition = $('.chip_area02 a.active').position().left;
                var thisSl = $('.wel_scroll').scrollLeft();
                $('.wel_scroll').animate({scrollLeft : thisPosition + thisSl - 30}, 300) ;

            });

            //태그필터가 한줄에 전부 표시되면 영역 버튼 숨기기 여부
            function resize_wel_scroll(){

                var windowWidth = $(window).width();
                var chip_Width = $('.chip_area02').width() + 30;

                if (chip_Width > windowWidth) {
                    $('.btn_accord_area').show();
                    $('.wel_scroll').removeClass('no_scroll_area');
                }
                else{
                    $('.btn_accord_area').hide();
                    $('.wel_scroll').addClass('no_scroll_area');
                }

            }

            resize_wel_scroll();

            //윈도우 사이즈에 따른 조정
            $(window).resize(function(){
                resize_wel_scroll();
            });

        });
   		
        async function fn_AddItemToCartFromList(itId, caId, itCustPrice, optionYn, itName) {
        	
        	event.stopPropagation(); // 부모 div의 onclick 이벤트를 막음
        	
        	const remainAmt = ${remainAmt};
        	const cartTotalPrice = ${cartTotalPrice};
        	
        	var ableQty = '${ableQty}';
        	var longTermCnt = '${longTermCnt}';
        	
        	var apDtFrDt = '${mbrRecipientsLongtermInfoVO.apDtFrDt}';
        	var apDtToDt = '${mbrRecipientsLongtermInfoVO.apDtToDt}';
        	var rcgtEdaFrDt = '${mbrRecipientsLongtermInfoVO.rcgtEdaFrDt}';
        	var rcgtEdaToDt = '${mbrRecipientsLongtermInfoVO.rcgtEdaToDt}';
        	
        	var today = jsCommon.fn_getToday().replace(/-/g, "");
        	
        	var data = { "itId" : itId
        				, "caId" : caId
						, "recipientsNo" : recipientsNo
						, mustCallbackJs : true
				};
        	
        	if(apDtFrDt > today || today > apDtToDt || rcgtEdaFrDt > today || today > rcgtEdaToDt) {
        		showToastMsg('인정유효기간을 확인해주세요.');
        		return false;
        	} 
        	
		    if(optionYn == 'Y'){
		    	showToastMsg('옵션 선택 후 장바구니에 담아주세요.');
		        setTimeout(function() {
		            location.href = '/matching/shop/item/view?itId=' + itId + "&recipientsNo=" + recipientsNo;
		        }, 1000);
		        
		    } else if (remainAmt-cartTotalPrice>itCustPrice === false){
				showToastMsg('급여가 부족해서 장바구니에 담을 수 없어요.');
        		return false;
		    	
		    } else if(longTermCnt == 0){
        		showToastMsg('구매 가능한 상품이 아니에요.');
        		return false;
        		
        	} else if(ableQty == 0){
        		var answer = await showConfirmPopup('구매가능 개수를 모두 담았어요'
        					, '구매가능한 다른 상품을 담거나 장바구니에서 주문요청해주세요.'
        					, '장바구니 가기'
        					, '다른상품 보기');
            	if(answer === 'confirm') {
                	setTimeout(function() {
                        location.href = '/matching/shop/item/shopCartPop?recipientsNo='+recipientsNo;
                    }, 1000);
                	return false;
                } else {
                	setTimeout(function() {
                        location.href = '/matching/welfareinfo/using/view?recipientsNo=' + recipientsNo;
                    }, 1000);
                	return false;
                }
            	
        	} else {
		    	
		    	callPostAjaxIfFailOnlyMsg(
					'/matching/shop/order/addItemToCart.json', 
					data,
					function(result) {
						if(result.success == undefined || !result.success){
							showToastMsg('이미 장바구니에 구매 가능한 개수를 모두 담았어요.');
							return false;
							
						} else {
							showToastMsg('장바구니에 담았어요.');
							
							setTimeout(function() {
					    		// 에어브릿지 이벤트 추가(장바구니담기 - 목록)
					    		fn_SendAirbridgeEventAddItemToCart(itId, '', "list", category, itName, mbrUniqueId, recipientsNo);
							}, 100);
							
							setTimeout(function() {
								location.reload();
					        }, 1000);
						}
					}
				);
		    }
		}
        
        function openShopCartPop(){
        	location.href = '/matching/shop/item/shopCartPop?recipientsNo='+recipientsNo;
        	return false;
        }
    </script>

</head>

	<body class="">
    <div class="wrapper">

        <header>
            <nav class="top">
                <a class="btn_back waves-effect" onclick="backBtnEvent()">
                    <span class="icon"></span>
                    <span class="txt">${mainCategoryNames}</span>
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

        <main>
            <section class="default padT0">
                <div class="marW-20 scroll_point">
				    <div class="wel_scroll_area" style="z-index: 0;">
				        <div class="wel_scroll padH12W20 heightAuto">
				            <div class="chip_area02">
				                <c:if test="${!empty categoryNames}">
				                    <a class="totalAll active">전체</a>
				                    <c:forEach var="entry" items="${categoryNames}" varStatus="status">
				                        <a class="om_cate_${entry.key}">${entry.value}</a>
				                    </c:forEach>
				                </c:if>
				            </div>
				        </div>
				    </div>
				</div>
				
				<div class="h12"></div>
                <div class="l_right color_tp_pp font_sbss">구매가능 : ${ableQty}개</div>
                
                <div class="marW-20 orderListItem pad_20_20_40">

                    <div class="itemList">

                    <!-- 카테고리별로 상품 출력 -->
					<c:forEach var="item" items="${categorizedItems}">
					    <c:if test="${!item.isItType1() && !item.isItType10() && !item.isItSoldout()}">
					        <div class="item" title="om_cate_${item.listCaId}">
					            <div class="itemImgArea" onclick="location.href='/matching/shop/item/view?itId=${item.itId}&recipientsNo=${mbrRecipientsLongtermInfoVO.recipientsNo}';">
					                <img src="${careHostUrl}/data/item/${item.itImg1}" alt="order_img">
					                <span class="iconCart" onclick="fn_AddItemToCartFromList('${item.itId}','${caId}','${item.itCustPrice}','${item.optionYn}', '${item.itName}')"></span>
					            </div>
					            <div class="ctnArea">
					                <div class="itemName"
					                     style="display: -webkit-box; 
					                            -webkit-line-clamp: 2; 
					                            -webkit-box-orient: vertical; 
					                            overflow: hidden; 
					                            text-overflow: ellipsis;">
					                    ${item.itName}
					                </div>
					                <div>
					                    <span class="sale"><fmt:formatNumber value="${100-selfBndRt}" type="number" pattern="#,###"/>%</span>
					                    <span class="price">
					                        <c:set var="roundedValue" value="${Math.round((item.itCustPrice * selfBndRt / 100) / 10) * 10}" />
					                        <fmt:formatNumber value="${roundedValue}" type="number" pattern="#,###"/>원
					                    </span>
					                </div>
					            </div>
					        </div>
					    </c:if>
					</c:forEach>

                    </div>
                    <!-- itemList -->

                </div>
                <!-- orderListItem -->

                <div class="marW-20 h12 back_F7F7F7"></div>
                <!-- 미끄럼방지 양말 끝-->

                <div class="marW-20 pad_24_20_20">
                    <div class="font_sblb">유의사항</div>
                    <div class="h16"></div>
                    <ul class="list_dept1 gray_dot">
                        <li class="color_t_s font_sbsr">장기요양정보 조회 시점에 따라 정보가 다를 수 있어요. </li>
                    </ul>
                    <div class="h80"></div>
                </div>
            </section>
        </main>


    </div>
    <!-- wrapper -->


	<c:if test="${remainAmt > 0 && cartTotalCnt > 0}">
	    <div class="modal_cart_area">
	        <div class="align_between_center">
	            <a class="btn_rounded flex_center gap04" onclick="openShopCartPop();">
	                <span class="i_cart_white"></span>
	                <span>장바구니</span>
	            </a>
	            <c:choose>
	            	<c:when test="${selfBndRt eq 0}">
	            		<div class="font_sbmb">남은 급여만큼 담으세요</div>
	            	</c:when>
	            	<c:otherwise>
	            		<div class="font_sbmb">총 <span class="color_tp_pp"><fmt:formatNumber value="${totalPriceBySelfBntRt}" type="number" pattern="#,###"/>원</span>만 부담하세요</div>
	            	</c:otherwise>
	            </c:choose>

	        </div>
	        <div class="h12"></div>
	        <c:set var="progressPercentage" value="${(cartTotalPrice / remainAmt) * 100}" />
	        <div class="progress thin">
	            <div class="progress-bar" style="width:${progressPercentage}%"></div>
	        </div>
	        <div class="h08"></div>
	        <div class="l_right">
	            <span class="color_t_s font_ssr">장바구니 주문요청 시 남은 급여: <fmt:formatNumber value="${remainAmt-cartTotalPrice}" type="number" pattern="#,###"/>원</span>
	        </div>
	    </div>
	</c:if>
</body>