<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
    <header>
        <nav class="top">
            <div class="btn_back">
                <div class="txt">
                    <span class="txtEvt"></span>
                    <c:if test="${ _matMbrSession.loginCheck && fn:length(mbrRecipientsList) > 1 }">
                        <div class="top_dropdown_area">
                            <a class="top_dropdown_btn modal-trigger" href="#modal_om_select"></a>
                        </div>
                    </c:if>
                    <span class="color_tp_s font_sbls marL4">님을 위한 복지용구</span>
                </div>
            </div>
            <c:if test="${ _matMbrSession.loginCheck }">
                <div id="cartBtn" class="icon_area waves-effect">
                    <div class="icon_cart i_cart">
                        <span id="cartItemCnt" class="num">12</span>
                    </div>
                </div>
            </c:if>
        </nav>
    </header>

    <main>
        <section class="relative default noPad">
            <div class="wel_scroll_area">
                <div class="btn_accord_area">
                    <div class="btn_accord">
                        <span></span>
                    </div>
                </div>
                <div class="wel_scroll">
                    <div class="chip_area02">
                        <c:forEach varStatus="status" items="${categoryHeaders}" var="item">
                            <a data-category="${item.categoryId}" data-category-id="${item.careCategoryId}">${item.name}</a>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="back_dim"></div>

            <div class="wel_detail_card_area">
                <c:forEach items="${categoryCards}" var="categoryCard">
                    <div id="${categoryCard.careCategoryId}" data-category="${categoryCard.categoryId}" data-category-id="${categoryCard.careCategoryId}" class="card wel_detail_card" >
                        <div class="youtube_area disNone" data-youtube-src="${categoryCard.youtubeUrl}"></div>
                        <img class="img_area" src="${categoryCard.imageUrl}" width="100%">

                        <div class="card-content">
                            <div class="title_area">
                                <div>
                                    <c:choose>
                                        <c:when test="${not empty categoryCard.categoryDetailName}">
                                            <div class="color_t_s font_ssr">${categoryCard.categoryName}</div>
                                            <h4 class="title">${categoryCard.categoryDetailName}</h4>
                                        </c:when>
                                        <c:otherwise>
                                            <h4 class="title">${categoryCard.categoryName}</h4>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="waves-effect btn_share">공유하기</div>
                            </div>

                            <div class="h20"></div>

                            <div class="font_sbms">${categoryCard.description}</div>

                            <div class="tag_area02">
                                <c:forEach items="${categoryCard.tags}" var="tag">
                                    <span class="tag">${tag}</span>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="card-action">
                            <a class="waves-effect btn btn-large btn_primary w100p">주문요청</a>
                        </div>
                    </div>
                </c:forEach>
                
                <div class="h75"></div>
            </div>
        </section>
    </main>

    <jsp:include page="/WEB-INF/jsp/app/matching/common/bottomNavigation.jsp">
        <jsp:param value="welfare" name="menuName" />
    </jsp:include>

    <jsp:include page="/WEB-INF/jsp/app/matching/main/share/bottomSheet.jsp">
        <jsp:param value="공유하기" name="title" />
    </jsp:include>
</div>

<!-- 어르신 선택 모달 -->
<c:if test="${ _matMbrSession.loginCheck }">
	<div id="modal_om_select" class="modal bottom-sheet modal_om_select">
		<div class="modal_header">
			<h4 class="modal_title">어르신을 선택해주세요</h4>
			<div class="close_x modal-close waves-effect"></div>
		</div>
		<div class="modal-content">
			<div class="scrollBox heightAuto" style="max-height: 50vh;">
				<ul class="broad_area om_select">
					<c:forEach var="recipientInfo" items="${mbrRecipientsList}" varStatus="status">
						<li class="modal-close<c:if test="${ recipientInfo.mainYn eq 'Y' }"> active</c:if>" onclick="changeMainRecipient(Number('${recipientInfo.recipientsNo}'))">
							<div class="img_flower fl_0${status.index + 1}"></div>
							<span>${recipientInfo.recipientsNm}</span>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="h20"></div>
		</div>
	</div>
</c:if>
	
<script>
    const defaultCategoryOrder = parseJavaList("${defaultCategoryOrder}");
    
    const recipients = new Proxy(
		{
			mainRecipientNo: null,
			info: createRecipientsInfoMap()
		},
		{
			get(target, prop) {
				if (prop === 'main') return target.info.get(target.mainRecipientNo);
				return target.get(prop);
			},
			set(target, prop, value) {
				if (prop === 'mainRecipientNo') {
					target.mainRecipientNo = target.info.has(value) ? value : null;
                    updateHeaderRecipientName();
                    updateCartBtn();
                    updateCtgryChipsOrder();
                    updateCtgryActionBtns();
                    updateCtgryCardsOrder();
					return true;
				}
				return false;
			}
		}
	)

	function createRecipientsInfoMap() {
		const result = new Map();
		<c:forEach items="${mbrRecipientsList}" var="recipient">
			result.set(Number("${recipient.recipientsNo}"), {
				recipientNo: Number("${recipient.recipientsNo}"),
				name: "${recipient.recipientsNm}",
				isLongtermConfirmed: "${recipient.longtermConfirmYn}" === "Y",
				isLongtermSearched: "${recipient.longtermSearchedYn}" === "Y",
                cartItemCnt: Number("${cartItemCnt.getRecipientCartItemCnt(recipient.recipientsNo)}"),
                availableCategories: parseJavaList("${purchasableCategoriesByRecipient.get(recipient.recipientsNo)}")
			});
		</c:forEach>
		return result;
	}

    function parseJavaList(listString) {
        return listString.replace(/[\[\]\s]/g, '').split(',');
    }

    function updateHeaderRecipientName() {
        const recipientNm = recipients.main ? recipients.main.name : '어르신';
        $('.txtEvt').text(recipientNm);
    }

    function updateCartBtn() {
        const mainRecipient = recipients.main;
        const $cartBtn = $('#cartBtn');
        if (!mainRecipient || !mainRecipient.isLongtermConfirmed) {
            $cartBtn.hide();
            return;
        }
        $cartBtn.show();
        $cartBtn.click(function() {
            location.href = '/matching/shop/item/shopCartPop?recipientsNo=' + mainRecipient.recipientNo;
        });
        const $cartItemCntBadge = $('#cartItemCnt');
        if (mainRecipient.cartItemCnt === 0) {
            $cartItemCntBadge.hide();
        } else {
            $cartItemCntBadge.text(mainRecipient.cartItemCnt);
            $cartItemCntBadge.show();
        }
    }

    function updateCtgryChipsOrder() {
        const $chipsContainer = $('.chip_area02');
        $chipsContainer.children('a')
            .sort(compareCategoryOrder)
            .appendTo('.chip_area02');
    }

    function updateCtgryActionBtns() {
        const mainRecipient = recipients.main;
        if (!mainRecipient) {
            $('.wel_detail_card .card-action').hide();
            return;
        }
        const availableCategories = mainRecipient.availableCategories;
        $('.wel_detail_card .card-action').each(function() {
            const category = $(this).closest('.wel_detail_card').data('category');
            if (availableCategories.includes(category)) $(this).show();
            else $(this).hide();
        });
    }

    function updateCtgryCardsOrder() {
        const $cardsContainer = $('.wel_detail_card_area');
        $cardsContainer.children('.wel_detail_card')
            .sort(compareCategoryOrder)
            .appendTo('.wel_detail_card_area');
        $cardsContainer.children(':not(.wel_detail_card)')
            .appendTo('.wel_detail_card_area');
    }
    
    function compareCategoryOrder(chipOrCard1, chipOrCard2) {
        if (!recipients.main) return 0;
        const availableCategories = recipients.main.availableCategories;
        const category1 = $(chipOrCard1).data('category');
        const category2 = $(chipOrCard2).data('category');
        const categoryId1 = $(chipOrCard1).data('category-id').toString();
        const categoryId2 = $(chipOrCard2).data('category-id').toString();
        
        if (availableCategories.includes(category1) && !availableCategories.includes(category2)) return -1;
        if (!availableCategories.includes(category1) && availableCategories.includes(category2)) return 1;
        return defaultCategoryOrder.indexOf(categoryId1) - defaultCategoryOrder.indexOf(categoryId2);
    }

    function changeMainRecipient(recipientsNo) {
		if (!recipients.main || recipients.main.recipientNo === recipientsNo) return
		callPostAjaxIfFailOnlyMsg(
			'/matching/membership/recipients/update/main.json',
			{ recipientsNo, isMatching: 'Y' },
			function() {
				recipients.mainRecipientNo = recipientsNo;
				showToastMsg('어르신이 선택되었어요');
                $('#modal_om_select').modal('close');
			}
		);
	}

    $(function () {
        //백버튼 클릭 시 서비스메인으로 이동
        backBtnEvent = function() {
            location.href='/matching/main/service';
        }

        $("body").addClass("back_gray");
        setupCtgryAccordion();
        setupCtgryChips();
        setupCtgryCards();
        setupCtgryCardArea();

        recipients.mainRecipientNo = Number("${mainRecipient.recipientsNo}");
    });
    
    function setupCtgryAccordion() {
        const setupCtgryAccordionToggle = function() {
            $('.btn_accord').on('click', function () {
                if ($(this).parents('.wel_scroll_area').hasClass('active') === true) {
                    $(this).parents('.wel_scroll_area').removeClass('active');
                } else {
                    $(this).parents('.wel_scroll_area').addClass('active');
                }
            });
        }
        const setupCtgryAccordionSize = function() {
            $(window).resize(resizeWelScroll);
            resizeWelScroll();
        }
        setupCtgryAccordionToggle();
        setupCtgryAccordionSize();
    }

    function resizeWelScroll() {
        const windowWidth = $(window).width();
        const chipAreaWidth = $('.chip_area02').width() + 30;

        if (chipAreaWidth > windowWidth) {
            $('.btn_accord_area').show();
            $('.wel_scroll').removeClass('no_scroll_area');
        } else {
            $('.btn_accord_area').hide();
            $('.wel_scroll').addClass('no_scroll_area');
        }
    }
    
    function setupCtgryChips() {
        const setupCtgryChipsHref = function() {
            $('.chip_area02 a').each(function () {
                $(this).attr('href', '#' + $(this).data('category-id'));
            });
        }
        const setupCtgryChipsClickListener = function() {
            $('.chip_area02 a').click(function () {
                if (!$(this).hasClass('active')) {
                    $('.chip_area02 a').removeClass('active');
                    $(this).addClass('active');
                }
                $('.wel_scroll_area').removeClass('active');

                const thisPosition = $(this).position().left;
                const welScroll = $('.wel_scroll');
                const thisSl = welScroll.scrollLeft();
                welScroll.animate({scrollLeft : thisPosition + thisSl - 30}, 300) ;
            });
        }

        setupCtgryChipsHref();
        setupCtgryChipsClickListener();
    }

    function setupCtgryCards() {
        const setupCtgryShareBtn = function() {
            $('.wel_detail_card_area .card.wel_detail_card .btn_share').on('click', function () {
                $('#modal_share').modal('open');
                return false;
            });
        }
        const setupCtgryCardsActionClickListener = function() {
            $('.wel_detail_card_area .card.wel_detail_card .card-action').on('click', async function () {
                const categoryId = $(this).closest('.wel_detail_card').data('category-id').toString();
                location.href = "/matching/shop/item/list?caId=" + categoryId.substring(0, 4);
            });
        }
        const setupYoutubeIframe = function() {
            $('.wel_detail_card_area .card.wel_detail_card .img_area').on('click', function () {
                const jobjYoutube = $(this).siblings('.youtube_area').first();
                const youtubeSrc = jobjYoutube.data("youtube-src");
                const youtubeIframe = '<iframe '
                +' src="'+ youtubeSrc +'"'
                +' title="YouTube video player" frameborder="0"'
                +' allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"'
                +' allowfullscreen>'
                +' </iframe>';

                jobjYoutube.removeClass("disNone");
                jobjYoutube.html(youtubeIframe);

                $(this).remove();
                return false;
            });
        }

        setupCtgryShareBtn();
        setupCtgryCardsActionClickListener();
        setupYoutubeIframe();
    }

    function setupCtgryCardArea() {
        const chipAreaScroll = function () {
            const thisPosition = $('.chip_area02 a.active').position().left;
            const welScroll = $('.wel_scroll');
            const thisSl = welScroll.scrollLeft();
            welScroll.scrollLeft(thisPosition + thisSl - 30);
        }
        const syncChipAndCard = function() {
            const $topCard = $('.wel_detail_card_area').children('.wel_detail_card').filter(function() {
                return $(this).position().top >= -240;
            }).first();

            $('.chip_area02 a').removeClass('active');
            $('.chip_area02 a[href="#' + $topCard.data('category-id') + '"]').addClass('active');
            chipAreaScroll();
        }
        const $CtgryCardArea = $('.wel_detail_card_area');
        $CtgryCardArea.scroll(syncChipAndCard);
        syncChipAndCard();
    }
</script>
