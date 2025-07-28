<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="icube.common.util.DateUtil" %>
<%@ page import="java.lang.Math" %>

<style>
	.modal_cart_area ~ #toast-container{bottom: 116px;}
</style>

<div class="wrapper">
    <header>
        <nav class="top">
            <a class="btn_back waves-effect" onclick="backBtnEvent();">
                <span class="icon"></span>
                <span class="txt">놓친 복지용구 받기</span>
            </a>
            <div class="d-flex">
                <div class="icon_area waves-effect" onclick="location.href = '/matching/shop/item/shopCartPop?recipientsNo=' + ${recipient.recipientsNo}">
                    <div class="icon_cart i_cart">
                        <span id="cartItemCnt" class="num"></span>
                    </div>
                </div>
                <div class="icon_area waves-effect">
                    <div class="icon_btn i_home" onclick="location.href='/matching/main/service';"></div>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="relative default noPad">
            <div class="back_F5F5F5 padH24W20">
                <div class="card radius08 modal-trigger" href="#modal_remainPrice">
                    <div class="card-content pad_24_20_20">
                        <div class="font_sbsr">어르신 요양정보</div>
                        <div class="conv_price"><fmt:formatNumber value="${longtermInfo.remainAmt}" pattern="###,###"/>원</div>
                        <div class="color_t_t font_ssr marT4">${DateUtil.formatDate(recipient.longtermSearchedLastDt, "yyyy.MM.dd HH:mm")} 업데이트</div>
                    </div>
                </div>
            </div>
            <c:if test="${!empty careItems && !careItems.isEmpty()}">
                <div class="pad_32_20_16">
                    <div class="font_shm">놓친 복지용구를 받을 수 있어요</div>
                </div>
            </c:if>
            <div>
                <c:choose>
                    <c:when test="${empty careItems || careItems.isEmpty()}">
                        <div class="center">
                            <div class="h40"></div>
                            <div class="h32"></div>
                            <div class="center">
                                <img src="/html/page/app/matching/assets/src/images/08etc/icon_no_docu.svg" alt="복지용구 없음">
                                <div class="h16"></div>
                                <div class="color_t_s font_sbsr">받을 수 있는 복지용구가 없어요</div>
                            </div>
                            <div class="h32"></div>
                            <div class="h40"></div>
                        </div>

                        <div class="h12 back_F7F7F7"></div>
                    </c:when>
                    <c:otherwise>
                        <table id="categoryTable" class="table_bordered evtScr">
                            <colgroup>
                                <col class="w50p">
                                <col>
                            </colgroup>
                            <tbody>
                            <c:forEach items="${itemGrps}" step="2" varStatus="status">
                                <tr>
                                    <td class="relative">
                                        <a href="#${itemGrps[status.index].itemGrpCd}" class="scrollspy_btn"></a>
                                        <span class="align_between_center font_sbsr">
                                    <span>${itemGrps[status.index].itemGrpNm}</span>
                                    <span id="ableCntInTable_${status.index}"
                                          data-category="${itemGrps[status.index].itemGrpCd}"
                                          class="color_t_t"></span>
                                </span>
                                    </td>
                                    <td class="relative">
                                        <c:if test="${status.index + 1 < itemGrps.size()}">
                                            <a href="#${itemGrps[status.index + 1].itemGrpCd}" class="scrollspy_btn"></a>
                                            <span class="align_between_center font_sbsr">
                                        <span>${itemGrps[status.index + 1].itemGrpNm}</span>
                                        <span id="ableCntInTable_${status.index + 1}"
                                              data-category="${itemGrps[status.index + 1].itemGrpCd}"
                                              class="color_t_t"></span>
                                    </span>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div id="topCategoriesBar" class="orderFlxNav">
                            <ul class="tabs_wd">
                                <c:forEach var="itemGrp" items="${itemGrps}">
                                    <li class="tab"><a href="#${itemGrp.itemGrpCd}">${itemGrp.itemGrpNm}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="h08"></div>
                        <div id="allItemsContainer" class="orderListArea">
                            <c:forEach var="itemGrp" items="${itemGrps}">
                                <div id="${itemGrp.itemGrpCd}" class="orderListItem scrollspy">
                                    <div class="title">
                                        <span class="titleName">${itemGrp.itemGrpNm}</span>
                                        <span class="numBuy"></span>
                                    </div>
                                    <div class="itemList">
                                        <c:forEach var="item" items="${careItems.get(itemGrp.itemGrpCd)}" end="1">
                                            <div class="item" onclick='moveToItemDetail("${item.itId}")'>
                                                <div class="itemImgArea">
                                                    <span class="iconCart" onclick='addItemToCart("${itemGrp.itemGrpCd}","${item.caId}","${item.itId}", "${itemGrp.itemGrpNm}", "${item.itName}", event)'></span>
                                                    <c:choose>
                                                        <c:when test="${empty item.itImg1 || item.itImg1 eq ''}">
                                                            <div class="no_Thumb_Img">
                                                                <img
                                                                        src="/html/page/app/matching/assets/src/images/04icon/back_trans.png"
                                                                        alt="order_img">
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img
                                                                    src="${careHostUrl}/data/item/${item.itImg1}"
                                                                    alt="order_img">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="ctnArea">
                                                    <div class="itemName line_clamp_2">${item.itName}</div>
                                                    <div>
                                                <span class="sale">
                                                    <c:choose>
                                                        <c:when test="${longtermInfo.selfBndRt eq Math.floor(longtermInfo.selfBndRt)}">
                                                            ${100 - longtermInfo.selfBndRt.intValue()}%
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${100 - longtermInfo.selfBndRt}%
                                                        </c:otherwise>
                                                    </c:choose>
                                                </span>
                                                        <span class="price"><fmt:formatNumber value="${Math.round(item.itCustPrice * longtermInfo.selfBndRt / 1000) * 10}" pattern="###,###"/>원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <!-- 모든 카테고리의 상품은 한 개 이상이라고 가정함 -->
                                    <c:if test="${careItems.get(itemGrp.itemGrpCd).size() > 2}">
                                        <div class="h32"></div>
                                        <a class="waves-effect btn btn-middle btn_cancel w100p align_center gap08"
                                           onclick="location.href='/matching/shop/item/list?caId=${careItems.get(itemGrp.itemGrpCd).get(0).caId}'">
                                            <span class="color_tp_s font_sbss">더 보기</span>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                                <path fill-rule="evenodd" clip-rule="evenodd"
                                                      d="M5.52864 3.52827C5.78899 3.26792 6.2111 3.26792 6.47145 3.52827L10.4714 7.52827C10.7318 7.78862 10.7318 8.21073 10.4714 8.47108L6.47145 12.4711C6.2111 12.7314 5.78899 12.7314 5.52864 12.4711C5.26829 12.2107 5.26829 11.7886 5.52864 11.5283L9.05723 7.99967L5.52864 4.47108C5.26829 4.21073 5.26829 3.78862 5.52864 3.52827Z"
                                                      fill="#333333"/>
                                            </svg>
                                        </a>
                                    </c:if>
                                </div>
                                <div class="h12 back_F7F7F7"></div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                
                <div class="pad_24_20_20">
                    <div class="font_sblb">유의사항</div>
                    <div class="h16"></div>
                    <ul class="list_dept1 gray_dot">
                        <li class="color_t_s font_sbsr">장기요양정보 조회 시점에 따라 정보가 다를 수 있어요.</li>
                    </ul>
                    <div class="h80"></div>
                </div>
            </div>
        </section>
    </main>
</div>

<div id="modal_remainPrice" class="modal bottom-sheet modal_om_select">
    <div class="modal_header">
        <h4 class="modal_title">어르신 요양정보</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content">
        <div class="h04"></div>
        <hr>
        <div class="h20"></div>
        <table class="table_basic small">
            <colgroup>
                <col style="width:140px;">
                <col>
            </colgroup>
            <tbody>
            <tr>
                <th><span class="color_tp_s font_sbmr">장기요양급여</span></th>
                <td class="l_right"><span class="font_sbmr"><fmt:formatNumber value="${longtermInfo.remainAmt}" pattern="###,###"/>원</span></td>
            </tr>
            <tr>
                <th><span class="color_tp_s font_sbmr">본인 부담률</span></th>
                <td class="l_right"><span class="font_sbmr"><fmt:formatNumber value="${longtermInfo.selfBndRt}" pattern="#" />%</span></td>
            </tr>
            <tr>
                <th><span class="color_tp_s font_sbmr">인정 유효기간</span></th>
                <td class="l_right"><span
                        class="font_sbmr">${DateUtil.formatDate(longtermInfo.rcgtEdaFrDt, "yyyy.MM.dd")}~${DateUtil.formatDate(longtermInfo.rcgtEdaToDt, "yyyy.MM.dd")}</span></td>
            </tr>
            <tr>
                <th><span class="color_tp_s font_sbmr">적용기간</span></th>
                <td class="l_right"><span
                        class="font_sbmr">${DateUtil.formatDate(longtermInfo.apDtFrDt, "yyyy.MM.dd")}~${DateUtil.formatDate(longtermInfo.apDtToDt, "yyyy.MM.dd")}</span></td>
            </tr>
            </tbody>
        </table>
        <div class="h20"></div>
    </div>
</div>

<div id="amountNotiModal" class="modal_cart_area">
    <div class="align_between_center">
        <a class="btn_rounded flex_center gap04">
            <span class="i_cart_white"></span>
            <span>장바구니</span>
        </a>
        <c:choose>
            <c:when test="${longtermInfo.selfBndRt == 0.0}">
                <div class="font_sbmb">남은 급여만큼 담으세요</div>
            </c:when>
            <c:otherwise>
                <div class="font_sbmb">총 <span id="cartAmount" class="color_tp_pp">50,400,000원</span>만 부담하세요</div>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="h12"></div>
    <div class="progress thin">
        <div id="usedAmountProgress" class="progress-bar" style="width:40%"></div>
    </div>
    <div class="h08"></div>
    <div class="l_right">
        <span id="availableAmount" class="color_t_s font_ssr"></span>
    </div>
</div>

<script src="/html/core/script/JsCommon.js"></script>
<script src="/html/core/script/jsonUtil.js"></script>

<script>
    const jsCommon = new JsCommon();
    
    class Cart {
        constructor(cartItems) {
            this.items = cartItems;
        }

        get size() {
            return this.items.reduce((acc, item) => acc + item.quantity, 0);
        }

        get totalAmount() {
            return this.items.reduce((acc, item) => acc + item.quantity * item.unitPrice, 0);
        }
        
        get discountedTotalAmount() {
            const selfBndRt = Number('${longtermInfo.selfBndRt}');
            return this.items
                .map((item) => {
                    const discountedPrice = jsCommon.fn_calc_self_money(item.unitPrice, selfBndRt);
                    return {...item, discountedPrice}
                }).reduce((acc, item) => acc + item.quantity * item.discountedPrice, 0);
        }

        getCountOf(category) {
            return this.items
                .filter(item => category === caIdToCategoryMap[item.caId])
                .reduce((acc, cartItem) => acc + cartItem.quantity, 0);
        }

        updateCartItem(newCartItem) {
            const idx = this.items.findIndex(item => item.cartId === newCartItem.cartId);
            if (idx !== -1) this.items[idx] = newCartItem;
            else this.items.push(newCartItem);
            refreshAllUiWithCartItems();
        }
    }

    const items = JSON.parseSafely('${allCareItemListJson}', {});

    const caIdToCategoryMap = JSON.parseSafely('${caIdToCategoryMap}', {});

    const ableCnts = JSON.parseSafely('${ableCnts}', {});

    const cart = new Cart(JSON.parseSafely('${cartItemsJson}', []));

    function refreshAllUiWithCartItems() {
        refreshCartItemCnt();
        refreshCategoryTable();
        refreshAllCategoryAbleCnt();
        refreshAmountNotiModal();
    }

    function refreshCartItemCnt() {
        const $cartItemCntBadge = $('#cartItemCnt');
        cart.size ? $cartItemCntBadge.text(cart.size).show() : $cartItemCntBadge.hide();
    }

    function refreshCategoryTable() {
        $('[id^="ableCntInTable_"]').each(function () {
            const category = $(this).data('category');
            $(this).text(ableCnts[category] - cart.getCountOf(category));
        });
    }

    function refreshAllCategoryAbleCnt() {
        const updateAbleCnt = function (category, ableCnt) {
            if (!category) return;
            if (ableCnt < 0) return;
            $('#' + category + ' .numBuy').text('구매가능 : ' + ableCnt + '개');
        }

        Object.values(caIdToCategoryMap).forEach(category => {
            updateAbleCnt(category, ableCnts[category] - cart.getCountOf(category));
        });
    }

    function refreshAmountNotiModal() {
        const selfBndRt = Number('${longtermInfo.selfBndRt}');
        const $amountNotiModal = $('#amountNotiModal');
        if (!cart.size) {
            $amountNotiModal.hide();
            return;
        }
        $amountNotiModal.show();
        $('#cartAmount').text(new Intl.NumberFormat('en-US').format(cart.discountedTotalAmount) + '원');
        const remainAmt = Number('${longtermInfo.remainAmt}');
        $('#usedAmountProgress').css('width', cart.totalAmount / remainAmt * 100 + '%');
        $('#availableAmount').text('장바구니 주문요청 시 남은 급여: ' + new Intl.NumberFormat('en-US').format(remainAmt - cart.totalAmount) + '원');
    }
    
    function moveToItemDetail(itemId) {
        location.href = '/matching/shop/item/view?itId=' + itemId + '&recipientsNo=${param.recipientsNo}';
    }

    let isWaitingAddItemToCart = false;

    function addItemToCart(category, caId, itemId, itemGrpNm, itemName, event) {
        if (event) event.stopPropagation();
        
        if (isWaitingAddItemToCart) return;

        if (!category || !itemId) return;
        if (!items[itemId]) return;

        if (ableCnts[category] - cart.getCountOf(category) <= 0) {
            handleNotEnoughCategoryCount();
            return;
        }
        if (isNotEnoughRemainAmt(itemId)) {
            handleNotEnoughRemainAmt();
            return;
        }
        if (items[itemId].hasOption) {
            showToastMsg('옵션 선택 후 장바구니에 담아주세요.', function() { moveToItemDetail(itemId); });
            return;
        }
        isWaitingAddItemToCart = true;
        $.ajax({
            url: '/matching/shop/order/addItemToCart.json',
            type: 'POST',
            data: { 
                recipientsNo: ${param.recipientsNo},
                itId: itemId,
                caId: caId
            }
        }).done(function (result) {
            if (result.success) {
                cart.updateCartItem(result.data);
                showToastMsg('장바구니에 추가되었어요.');
                
                setTimeout(function() {
                	// 에어브릿지 이벤트 추가(장바구니담기 - 놓친 복지용구 받기)
					fn_SendAirbridgeEventAddItemToCart(itemId, '', "welfareinfo", itemGrpNm, itemName, '${mbrUniqueId}', ${param.recipientsNo});
				}, 100);
            } else {
                showToastMsg(result.message);
            }
        }).fail(function () {
            showToastMsg('현재 장바구니에 추가할 수 없어요.');
        }).always(function() {
            isWaitingAddItemToCart = false;
        });
    }

    async function handleNotEnoughCategoryCount() {
        const confirm = await showConfirmPopup(
            '구매가능 개수를 모두 담았어요',
            '구매가능한 다른 상품을 담거나 장바구니에서 주문요청해주세요.',
            '장바구니 가기',
            '다른상품 보기'
        )
        if (confirm === 'confirm') {
            location.href = '/matching/shop/item/shopCartPop?recipientsNo=${recipient.recipientsNo}';
        }
    }

    function isNotEnoughRemainAmt(itemId) {
        return Number('${longtermInfo.remainAmt}') - cart.totalAmount - items[itemId].itCustPrice < 0;
    }

    async function handleNotEnoughRemainAmt() {
        showToastMsg('급여가 부족해서 장바구니에 담을 수 없어요.');
    }

    $(function () {
        setupTopCategoriesBar();

        refreshAllUiWithCartItems();
    });

    function setupTopCategoriesBar() {
        const syncTopBarWithScroll = function () {
            const $allItemsContainer = $('#allItemsContainer');
            if (!$allItemsContainer.length) return;
            
            const windowScrollTop = $(window).scrollTop();
            const itemsContainerScrollPosition = $allItemsContainer.position().top - 60;
            const $topCategoriesBar = $('#topCategoriesBar');
            if (windowScrollTop >= itemsContainerScrollPosition) {
                $topCategoriesBar.addClass('active');
            } else {
                $topCategoriesBar.removeClass('active');
            }
        }
        const setupTopBarClickListener = function () {
            $('#topCategoriesBar .tabs_wd a').click(function () {
                adjustTabScrollPosition($(this), 300);
            });
        }
        const setupWindowScrollListener = function () {
            $(window).scroll(function () {
                syncTopBarWithScroll();
                $('#topCategoriesBar .tabs_wd a.active').each(function () {
                    adjustTabScrollPosition($(this));
                });
            });
        }
        const adjustTabScrollPosition = function ($tab, delay) {
            const tabPositionLeft = $tab.position().left;
            const $tabs = $('#topCategoriesBar .tabs_wd');
            const tabsScrollLeft = $tabs.scrollLeft();
            if (delay) {
                $tabs.animate({scrollLeft: tabPositionLeft + tabsScrollLeft - 30}, delay);
            } else {
                $tabs.scrollLeft(tabPositionLeft + tabsScrollLeft - 30);
            }
        }

        $('.scrollspy').scrollSpy({
            activeClass: 'active',
            scrollOffset: 96,
        });
        syncTopBarWithScroll();
        setupTopBarClickListener();
        setupWindowScrollListener();
    }
</script>
